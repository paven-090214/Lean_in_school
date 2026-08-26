## 라이브러리

```text
LiquidCrystal I2C by Frank de Brabander
```
## 코드

```c++
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <SoftwareSerial.h>
#include <Servo.h>

// =====================
// LCD 설정
// =====================
LiquidCrystal_I2C lcd(0x27, 16, 2);

// =====================
// 블루투스 HC-06
// HC-06 TXD -> Arduino A3
// HC-06 RXD -> Arduino D13
// =====================
SoftwareSerial BT(A3, 13);

// =====================
// 핀 설정
// =====================
const int buzzerPin = 9;
const int servoPin = 10;

const int trigPin = 11;
const int echoPin = 12;

// RGB LED 핀
const int rgbR = A0;
const int rgbG = A1;
const int rgbB = A2;

// 7세그먼트 핀
// 순서: A, B, C, D, E, F, G
const int segPins[7] = {6, 7, 8, 5, 4, 3, 2};

// =====================
// 7세그먼트 설정
// =====================
// 공통 캐소드 기준
// COM -> GND
// HIGH = 켜짐, LOW = 꺼짐
const bool SEG_COMMON_CATHODE = true;

// =====================
// RGB LED 설정
// =====================
// RGB LED가 공통 캐소드면 true
// 색이 반대로 나오면 false로 변경
const bool RGB_COMMON_CATHODE = true;

// =====================
// 서보모터
// =====================
Servo ballServo;

const int SERVO_BLOCK_ANGLE = 0;
const int SERVO_START_ANGLE = 40;

// =====================
// 게임 설정
// =====================
const unsigned long GAME_TIME = 30000;
const int TARGET_SCORE = 10;

int score = 0;

unsigned long gameStartTime = 0;
unsigned long lastLcdUpdate = 0;
unsigned long lastSensorCheck = 0;

const unsigned long LCD_UPDATE_INTERVAL = 200;
const unsigned long SENSOR_INTERVAL = 30;

// =====================
// 초음파 감지 기준
// =====================
// 공 없음 평균: 5~6cm
const int NORMAL_LOW = 4;
const int NORMAL_HIGH = 7;

// 공 감지 기준
const int DETECT_LOW = 3;
const int DETECT_HIGH = 8;

// 감지 안정화 기준
const int DETECT_COUNT_LIMIT = 1;
const int NORMAL_COUNT_LIMIT = 3;

bool scoreLocked = true;
int detectCount = 0;
int normalCount = 0;
int currentDistance = -1;

// =====================
// 게임 상태
// =====================
enum GameState {
  READY,
  PLAYING,
  CLEAR,
  FAIL
};

GameState gameState = READY;

// =====================
// 7세그먼트 숫자 패턴
// true = 해당 세그먼트 켜기
// 순서: A, B, C, D, E, F, G
// =====================
bool digitPatterns[10][7] = {
  {true,  true,  true,  true,  true,  true,  false}, // 0
  {false, true,  true,  false, false, false, false}, // 1
  {true,  true,  false, true,  true,  false, true }, // 2
  {true,  true,  true,  true,  false, false, true }, // 3
  {false, true,  true,  false, false, true,  true }, // 4
  {true,  false, true,  true,  false, true,  true }, // 5
  {true,  false, true,  true,  true,  true,  true }, // 6
  {true,  true,  true,  false, false, false, false}, // 7
  {true,  true,  true,  true,  true,  true,  true }, // 8
  {true,  true,  true,  true,  false, true,  true }  // 9
};

void setup() {
  Serial.begin(9600);
  BT.begin(9600);

  pinMode(buzzerPin, OUTPUT);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  pinMode(rgbR, OUTPUT);
  pinMode(rgbG, OUTPUT);
  pinMode(rgbB, OUTPUT);

  for (int i = 0; i < 7; i++) {
    pinMode(segPins[i], OUTPUT);
  }

  ballServo.attach(servoPin);
  ballServo.write(SERVO_BLOCK_ANGLE);

  lcd.init();
  lcd.backlight();

  displayScore(0);
  setRGB(false, false, false);

  showReadyScreen();

  Serial.println("Bluetooth Basketball Game Ready");
  Serial.println("Send 1 or s to start");
}

void loop() {
  checkBluetoothCommand();
  checkSerialCommand();

  if (gameState == PLAYING) {
    updateGameTimer();

    // 시간 초과로 CLEAR 또는 FAIL이 되면 아래 코드 실행 방지
    if (gameState != PLAYING) {
      return;
    }

    updateSensorScore();

    // 득점으로 CLEAR가 되면 LCD 거리 화면이 다시 덮어쓰지 않도록 방지
    if (gameState != PLAYING) {
      return;
    }

    updatePlayingLcd();
  }
}

// =====================
// 블루투스 명령 확인
// =====================
void checkBluetoothCommand() {
  while (BT.available()) {
    char cmd = BT.read();
    handleCommand(cmd);
  }
}

// =====================
// 시리얼 모니터 명령 확인
// =====================
void checkSerialCommand() {
  while (Serial.available()) {
    char cmd = Serial.read();
    handleCommand(cmd);
  }
}

void handleCommand(char cmd) {
  if (cmd == '1' || cmd == 's' || cmd == 'S') {
    if (gameState != PLAYING) {
      startGame();
    }
  }
}

// =====================
// 게임 시작
// =====================
void startGame() {
  score = 0;
  displayScore(score);

  detectCount = 0;
  normalCount = 0;

  // 시작 직후 바로 점수 올라가는 것 방지
  // 정상 거리로 3번 확인된 뒤 RDY 상태가 됨
  scoreLocked = true;

  currentDistance = -1;

  gameStartTime = millis();
  lastLcdUpdate = 0;
  lastSensorCheck = 0;

  gameState = PLAYING;

  ballServo.write(SERVO_START_ANGLE);

  setRGB(false, false, true);
  playStartSound();

  lcd.clear();
  printLine(0, "GAME START!");
  printLine(1, "Score:0");

  delay(500);
}

// =====================
// 게임 시간 확인
// =====================
void updateGameTimer() {
  unsigned long elapsed = millis() - gameStartTime;

  if (elapsed >= GAME_TIME) {
    if (score >= TARGET_SCORE) {
      clearGame();
    } else {
      failGame();
    }
  }
}

// =====================
// 초음파 센서 득점 처리
// =====================
void updateSensorScore() {
  if (millis() - lastSensorCheck < SENSOR_INTERVAL) {
    return;
  }

  lastSensorCheck = millis();

  int distance = getDistanceCm();
  currentDistance = distance;

  bool isDetected = false;
  bool isNormal = false;

  if (distance != -1) {
    // 공 감지: 3cm 이하 또는 8cm 이상
    if (distance <= DETECT_LOW || distance >= DETECT_HIGH) {
      isDetected = true;
    }

    // 공 없음 정상 상태: 4~7cm
    if (distance >= NORMAL_LOW && distance <= NORMAL_HIGH) {
      isNormal = true;
    }
  }

  Serial.print("Dist: ");
  Serial.print(distance);
  Serial.print(" cm, Score: ");
  Serial.print(score);
  Serial.print(", Locked: ");
  Serial.println(scoreLocked);

  // 점수 가능 상태일 때만 득점 처리
  if (scoreLocked == false) {
    if (isDetected == true) {
      detectCount++;

      if (detectCount >= DETECT_COUNT_LIMIT) {
        addScore();

        scoreLocked = true;
        detectCount = 0;
        normalCount = 0;
      }
    } else {
      detectCount = 0;
    }
  }

  // 점수가 올라간 뒤에는 정상 거리로 돌아와야 다시 득점 가능
  if (scoreLocked == true) {
    if (isNormal == true) {
      normalCount++;

      if (normalCount >= NORMAL_COUNT_LIMIT) {
        scoreLocked = false;
        normalCount = 0;
      }
    } else {
      normalCount = 0;
    }
  }
}

// =====================
// 점수 추가
// =====================
void addScore() {
  score++;

  playScoreSound();

  if (score >= TARGET_SCORE) {
    displayScore(9);
    clearGame();
    return;
  }

  displayScore(score);
}

// =====================
// 게임 클리어
// =====================
void clearGame() {
  gameState = CLEAR;

  ballServo.write(SERVO_BLOCK_ANGLE);

  setRGB(false, true, false);
  displayScore(9);

  lcd.clear();
  printLine(0, "GAME CLEAR!");
  printLine(1, "Score: 10");

  playClearSound();

  Serial.println("GAME CLEAR");
}

// =====================
// 게임 실패
// =====================
void failGame() {
  gameState = FAIL;

  ballServo.write(SERVO_BLOCK_ANGLE);

  setRGB(true, false, false);

  lcd.clear();
  printLine(0, "GAME FAIL");
  printLine(1, "Score: " + String(score));

  playFailSound();

  Serial.println("GAME FAIL");
}

// =====================
// 게임 중 LCD 업데이트
// =====================
void updatePlayingLcd() {
  if (millis() - lastLcdUpdate < LCD_UPDATE_INTERVAL) {
    return;
  }

  lastLcdUpdate = millis();

  unsigned long elapsed = millis() - gameStartTime;
  int remainTime = (GAME_TIME - elapsed) / 1000;

  if (remainTime < 0) {
    remainTime = 0;
  }

  String line0 = "Time:";
  line0 += remainTime;
  line0 += " Score:";
  line0 += score;

  String line1 = "D:";

  if (currentDistance == -1) {
    line1 += "--";
  } else {
    if (currentDistance < 10) {
      line1 += "0";
    }
    line1 += currentDistance;
  }

  line1 += "cm ";

  if (scoreLocked == true) {
    line1 += "LOCK";
  } else {
    line1 += "RDY";
  }

  printLine(0, line0);
  printLine(1, line1);
}

// =====================
// 대기 화면
// =====================
void showReadyScreen() {
  gameState = READY;

  lcd.clear();
  printLine(0, "BT Basketball");
  printLine(1, "BT: Send 1/s");

  setRGB(false, false, false);
}

// =====================
// 초음파 거리 측정
// =====================
int getDistanceCm() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 10000);

  if (duration == 0) {
    return -1;
  }

  int distance = duration * 0.0343 / 2;

  return distance;
}

// =====================
// 7세그먼트 표시
// 공통 캐소드 기준
// HIGH = 켜짐
// LOW = 꺼짐
// =====================
void displayScore(int num) {
  if (num < 0) {
    num = 0;
  }

  if (num > 9) {
    num = 9;
  }

  for (int i = 0; i < 7; i++) {
    bool segmentOn = digitPatterns[num][i];

    if (SEG_COMMON_CATHODE == true) {
      digitalWrite(segPins[i], segmentOn ? HIGH : LOW);
    } else {
      digitalWrite(segPins[i], segmentOn ? LOW : HIGH);
    }
  }
}

// =====================
// RGB LED 제어
// =====================
void setRGB(bool redOn, bool greenOn, bool blueOn) {
  if (RGB_COMMON_CATHODE == true) {
    digitalWrite(rgbR, redOn ? HIGH : LOW);
    digitalWrite(rgbG, greenOn ? HIGH : LOW);
    digitalWrite(rgbB, blueOn ? HIGH : LOW);
  } else {
    digitalWrite(rgbR, redOn ? LOW : HIGH);
    digitalWrite(rgbG, greenOn ? LOW : HIGH);
    digitalWrite(rgbB, blueOn ? LOW : HIGH);
  }
}

// =====================
// LCD 한 줄 출력
// =====================
void printLine(int row, String text) {
  lcd.setCursor(0, row);
  lcd.print("                ");
  lcd.setCursor(0, row);
  lcd.print(text);
}

// =====================
// 부저 효과음
// =====================
void playStartSound() {
  tone(buzzerPin, 1000, 150);
  delay(180);
  tone(buzzerPin, 1300, 150);
  delay(180);
  noTone(buzzerPin);
}

void playScoreSound() {
  tone(buzzerPin, 1800, 80);
  delay(90);
  noTone(buzzerPin);
}

void playClearSound() {
  tone(buzzerPin, 1200, 150);
  delay(180);
  tone(buzzerPin, 1500, 150);
  delay(180);
  tone(buzzerPin, 1800, 250);
  delay(280);
  noTone(buzzerPin);
}

void playFailSound() {
  tone(buzzerPin, 400, 500);
  delay(550);
  noTone(buzzerPin);
}
```

---

## 공 탐지 코드

```text
Now = 현재 거리
Min = 최근 2초 동안 가장 작았던 거리
Max = 최근 2초 동안 가장 컸던 거리
C = 정상 범위 4~7cm를 벗어난 횟수
```

```c++
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// LCD 주소: 안 나오면 0x3F로 변경
LiquidCrystal_I2C lcd(0x27, 16, 2);

// 초음파 센서 핀
const int trigPin = 11;
const int echoPin = 12;

// 현재 거리
int currentDistance = -1;

// 최근 2초 동안의 최소/최대 거리
int minDistance = 999;
int maxDistance = -1;

// 최근 2초 동안 정상 범위를 벗어난 횟수
int changeCount = 0;

// 샘플 수
int sampleCount = 0;

// 시간 관리
unsigned long lastLcdUpdate = 0;
unsigned long windowStartTime = 0;

// 현재 공이 없을 때 평균값이 5~6cm라고 했으므로
// 넉넉하게 4~7cm를 정상 범위로 봄
const int NORMAL_LOW = 4;
const int NORMAL_HIGH = 7;

void setup() {
  Serial.begin(115200);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("Ultrasonic");
  lcd.setCursor(0, 1);
  lcd.print("Min Max Test");

  delay(1000);
  lcd.clear();

  windowStartTime = millis();
}

void loop() {
  int distance = getDistanceCm();

  if (distance != -1) {
    currentDistance = distance;

    if (distance < minDistance) {
      minDistance = distance;
    }

    if (distance > maxDistance) {
      maxDistance = distance;
    }

    // 정상 범위 4~7cm를 벗어나면 변화가 있었다고 기록
    if (distance < NORMAL_LOW || distance > NORMAL_HIGH) {
      changeCount++;
    }

    sampleCount++;

    Serial.print("Now: ");
    Serial.print(distance);
    Serial.print(" cm, Min: ");
    Serial.print(minDistance);
    Serial.print(" cm, Max: ");
    Serial.print(maxDistance);
    Serial.print(" cm, Change: ");
    Serial.println(changeCount);
  } else {
    Serial.println("No signal");
  }

  // LCD는 너무 자주 갱신하지 않고 0.2초마다 갱신
  if (millis() - lastLcdUpdate >= 200) {
    lastLcdUpdate = millis();

    lcd.setCursor(0, 0);
    lcd.print("Now:");

    if (currentDistance == -1) {
      lcd.print("--");
    } else {
      if (currentDistance < 10) lcd.print("0");
      lcd.print(currentDistance);
    }

    lcd.print(" Min:");

    if (minDistance == 999) {
      lcd.print("--");
    } else {
      if (minDistance < 10) lcd.print("0");
      lcd.print(minDistance);
    }

    lcd.print(" ");

    lcd.setCursor(0, 1);
    lcd.print("Max:");

    if (maxDistance == -1) {
      lcd.print("--");
    } else {
      if (maxDistance < 10) lcd.print("0");
      lcd.print(maxDistance);
    }

    lcd.print(" C:");
    lcd.print(changeCount);
    lcd.print("   ");
  }

  // 2초마다 최근 기록 초기화
  if (millis() - windowStartTime >= 2000) {
    windowStartTime = millis();

    minDistance = 999;
    maxDistance = -1;
    changeCount = 0;
    sampleCount = 0;
  }

  delay(30);
}

int getDistanceCm() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // 너무 오래 기다리지 않게 timeout을 짧게 설정
  long duration = pulseIn(echoPin, HIGH, 10000);

  if (duration == 0) {
    return -1;
  }

  int distance = duration * 0.0343 / 2;

  return distance;
}
```

## 블루투스 연결

```text
AT
AT+NAME이름
AT+PIN번호
```

```c++
#include <SoftwareSerial.h>

// Arduino RX = A3, Arduino TX = D13
SoftwareSerial BT(A3, 13);

void setup() {
  Serial.begin(9600);
  BT.begin(9600);

  Serial.println("HC-06 Setting Mode");
  Serial.println("Type AT");
}

void loop() {
  // PC 시리얼 모니터 -> 블루투스 모듈
  if (Serial.available()) {
    char c = Serial.read();
    BT.write(c);
  }

  // 블루투스 모듈 -> PC 시리얼 모니터
  if (BT.available()) {
    char c = BT.read();
    Serial.write(c);
  }
}
```

## 세븐세그먼트

### 공통 양극

```c++
// true = 공통 양극, COM -> 5V
// false = 공통 음극, COM -> GND
const bool COMMON_ANODE = true;

// 실제 연결 기준
// A B C D E F G 순서
const int segmentPins[7] = {6, 7, 8, 5, 4, 3, 2};

// 숫자 모양 데이터
// A B C D E F G
// 1 = 켜짐, 0 = 꺼짐
byte numbers[10][7] = {
  {1, 1, 1, 1, 1, 1, 0}, // 0
  {0, 1, 1, 0, 0, 0, 0}, // 1
  {1, 1, 0, 1, 1, 0, 1}, // 2
  {1, 1, 1, 1, 0, 0, 1}, // 3
  {0, 1, 1, 0, 0, 1, 1}, // 4
  {1, 0, 1, 1, 0, 1, 1}, // 5
  {1, 0, 1, 1, 1, 1, 1}, // 6
  {1, 1, 1, 0, 0, 0, 0}, // 7
  {1, 1, 1, 1, 1, 1, 1}, // 8
  {1, 1, 1, 1, 0, 1, 1}  // 9
};

void writeSegment(int pin, int state) {
  if (COMMON_ANODE) {
    // 공통 양극: LOW가 켜짐
    digitalWrite(pin, state == 1 ? LOW : HIGH);
  } else {
    // 공통 음극: HIGH가 켜짐
    digitalWrite(pin, state == 1 ? HIGH : LOW);
  }
}

void showNumber(int num) {
  for (int i = 0; i < 7; i++) {
    writeSegment(segmentPins[i], numbers[num][i]);
  }
}

void setup() {
  for (int i = 0; i < 7; i++) {
    pinMode(segmentPins[i], OUTPUT);
  }
}

void loop() {
  for (int i = 0; i <= 9; i++) {
    showNumber(i);
    delay(1000);
  }
}
```

### 공통 음극

```c++
// false = 공통 음극, COM -> GND
// true = 공통 양극, COM -> 5V
const bool COMMON_ANODE = false;

// 실제 연결 기준
// A B C D E F G 순서
const int segmentPins[7] = {6, 7, 8, 5, 4, 3, 2};

// 숫자 모양 데이터
// A B C D E F G
// 1 = 켜짐, 0 = 꺼짐
byte numbers[10][7] = {
  {1, 1, 1, 1, 1, 1, 0}, // 0
  {0, 1, 1, 0, 0, 0, 0}, // 1
  {1, 1, 0, 1, 1, 0, 1}, // 2
  {1, 1, 1, 1, 0, 0, 1}, // 3
  {0, 1, 1, 0, 0, 1, 1}, // 4
  {1, 0, 1, 1, 0, 1, 1}, // 5
  {1, 0, 1, 1, 1, 1, 1}, // 6
  {1, 1, 1, 0, 0, 0, 0}, // 7
  {1, 1, 1, 1, 1, 1, 1}, // 8
  {1, 1, 1, 1, 0, 1, 1}  // 9
};

void writeSegment(int pin, int state) {
  if (COMMON_ANODE) {
    // 공통 양극: LOW가 켜짐
    digitalWrite(pin, state == 1 ? LOW : HIGH);
  } else {
    // 공통 음극: HIGH가 켜짐
    digitalWrite(pin, state == 1 ? HIGH : LOW);
  }
}

void showNumber(int num) {
  for (int i = 0; i < 7; i++) {
    writeSegment(segmentPins[i], numbers[num][i]);
  }
}

void setup() {
  for (int i = 0; i < 7; i++) {
    pinMode(segmentPins[i], OUTPUT);
  }
}

void loop() {
  for (int i = 0; i <= 9; i++) {
    showNumber(i);
    delay(1000);
  }
}
```

## LCD 패널

```c++
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// 주소가 안 맞으면 0x3F로 바꿔보기
LiquidCrystal_I2C lcd(0x27, 16, 2);

int count = 0;

void setup() {
  lcd.init();        // LCD 초기화
  lcd.backlight();   // 백라이트 켜기

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("LCD TEST");
  lcd.setCursor(0, 1);
  lcd.print("READY");
}

void loop() {
  delay(1000);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("COUNT");

  lcd.setCursor(0, 1);
  lcd.print(count);

  count++;
}
```

## AGENDT

### 요약

프로젝트: 블루투스 미니 농구 게임

입력:
- 블루투스 앱에서 1 또는 s 입력

출력:
- LCD: 게임 이름, 남은 시간, 결과
- 7세그먼트: 점수
- RGB LED: 게임 상태
- 부저: 효과음
- 서보모터: 공 출발/차단 장치 제어

센서:
- 초음파 센서로 공 통과 감지

현재 완성도:
- 하드웨어 제어는 대부분 완료
- 게임 흐름도 대부분 완료
- 남은 핵심 문제는 초음파 득점 판정 정확도

### 현재 핀 사용 정리

| 부품 | 아두이노 핀 | 역할 |
|---|---:|---|
| LCD I2C SDA | A4 | LCD 데이터 |
| LCD I2C SCL | A5 | LCD 클럭 |
| 블루투스 HC-06 TXD | A3 | 아두이노가 받는 핀, Arduino RX |
| 블루투스 HC-06 RXD | D13 | 아두이노가 보내는 핀, Arduino TX |
| 부저 | D9 | 시작음, 득점음, 실패음, 클리어음 |
| 서보모터 | D10 | 게임 시작 시 40도, 종료 시 0도 |
| 초음파 TRIG | D11 | 초음파 발사 |
| 초음파 ECHO | D12 | 초음파 반사 수신 |
| RGB LED R | A0 | 빨간색 |
| RGB LED G | A1 | 초록색 |
| RGB LED B | A2 | 파란색 |
| 7세그먼트 A | D6 | 점수 표시 |
| 7세그먼트 B | D7 | 점수 표시 |
| 7세그먼트 C | D8 | 점수 표시 |
| 7세그먼트 D | D5 | 점수 표시 |
| 7세그먼트 E | D4 | 점수 표시 |
| 7세그먼트 F | D3 | 점수 표시 |
| 7세그먼트 G | D2 | 점수 표시 |

## 프로젝트 개요

```text
블루투스 앱에서 1 또는 s 전송
→ 게임 시작
→ 서보모터가 0도에서 40도로 이동
→ 30초 타이머 시작
→ 공이 골대에 들어가면 초음파 센서 감지
→ 7세그먼트 점수 증가
→ 10점 달성 시 클리어
  - 세그먼트 0으로 초기화
  - LCD에 GAME CLEAR 표시
→ 30초 안에 10점 못 하면 실패

---상태 표시

게임 대기: LCD에 BT: Send 1
게임 중: RGB 파란색, LCD에 남은 시간
게임 클리어: RGB 초록색, 부저 멜로디, LCD GAME CLEAR
게임 실패: RGB 빨간색, 부저 울림, LCD GAME FAIL
```
