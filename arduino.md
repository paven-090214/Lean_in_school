# 아두이노 스케치
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Servo.h>

// =====================
// LCD 설정
// =====================

LiquidCrystal_I2C lcd(0x27, 16, 2);

// =====================
// 서보모터 설정
// =====================

Servo gateServo;
const int servoPin = 10;

// 서보 각도
// 방향이 반대면 두 값을 서로 바꾸면 됨
const int OPEN_ANGLE = 0;     // 게임 시작: 공 내려오게 열기
const int BLOCK_ANGLE = 50;   // 게임 종료: 공 막기

// =====================
// 부저 설정
// =====================

const int buzzerPin = 9;

// =====================
// RGB LED 설정
// =====================

// RGB LED를 A0, A1, A2에 연결
const int redPin = A0;
const int greenPin = A1;
const int bluePin = A2;

// 공통 음극 RGB 기준
// 공통핀 -> GND
// 공통 양극 RGB면 true로 바꾸기
const bool RGB_COMMON_ANODE = false;

// =====================
// 세븐세그먼트 설정
// =====================

// 네가 확인한 실제 연결
// 2번 -> G
// 3번 -> F
// 4번 -> E
// 5번 -> D
// 6번 -> A
// 7번 -> B
// 8번 -> C

// 공통 음극 세븐세그먼트 기준
// COM -> GND
const bool SEG_COMMON_ANODE = false;

// A B C D E F G 순서로 재배열
const int segmentPins[7] = {
  6, 7, 8, 5, 4, 3, 2
};

// 숫자 데이터
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

// =====================
// 초음파 센서 / 버튼
// =====================

const int trigPin = 11;
const int echoPin = 12;
const int buttonPin = 13;

// =====================
// 게임 변수
// =====================

int score = 0;
bool gameRunning = false;

unsigned long startTime = 0;
const unsigned long gameTime = 5000; // 5초

const float goalDistance = 10.0;     // 이 거리보다 가까우면 득점
const float releaseDistance = 15.0;  // 이 거리보다 멀어지면 다시 감지 가능

bool ballDetected = false;

// =====================
// RGB LED 함수
// =====================

void writeRGBPin(int pin, bool on) {
  if (RGB_COMMON_ANODE) {
    digitalWrite(pin, on ? LOW : HIGH);
  } else {
    digitalWrite(pin, on ? HIGH : LOW);
  }
}

void setRGB(bool red, bool green, bool blue) {
  writeRGBPin(redPin, red);
  writeRGBPin(greenPin, green);
  writeRGBPin(bluePin, blue);
}

void rgbBlue() {
  setRGB(false, false, true);
}

void rgbRed() {
  setRGB(true, false, false);
}

void rgbOff() {
  setRGB(false, false, false);
}

// =====================
// 세븐세그먼트 함수
// =====================

void writeSegment(int pin, int state) {
  if (SEG_COMMON_ANODE) {
    digitalWrite(pin, state == 1 ? LOW : HIGH);
  } else {
    digitalWrite(pin, state == 1 ? HIGH : LOW);
  }
}

void showNumber(int num) {
  num = num % 10;

  for (int i = 0; i < 7; i++) {
    writeSegment(segmentPins[i], numbers[num][i]);
  }
}

// =====================
// 초음파 거리 측정 함수
// =====================

float getDistance() {
  long duration;
  float distance;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    return 999;
  }

  distance = duration * 0.034 / 2;
  return distance;
}

// =====================
// 부저 함수
// =====================

void endSound() {
  tone(buzzerPin, 1000);
  delay(500);
  noTone(buzzerPin);
}

// =====================
// setup
// =====================

void setup() {
  lcd.begin();
  lcd.backlight();

  gateServo.attach(servoPin);
  gateServo.write(BLOCK_ANGLE); // 처음에는 공 막기
  delay(500);

  pinMode(buzzerPin, OUTPUT);

  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);

  for (int i = 0; i < 7; i++) {
    pinMode(segmentPins[i], OUTPUT);
  }

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  pinMode(buttonPin, INPUT_PULLUP);

  score = 0;
  showNumber(score);

  // 대기 상태는 빨간색
  rgbRed();

  lcd.setCursor(0, 0);
  lcd.print("Basketball Game");

  lcd.setCursor(0, 1);
  lcd.print("Press Button");
}

// =====================
// loop
// =====================

void loop() {
  int buttonState = digitalRead(buttonPin);

  // =====================
  // 게임 시작 전
  // =====================
  if (gameRunning == false) {
    if (buttonState == LOW) {
      delay(200); // 버튼 흔들림 방지

      score = 0;
      showNumber(score);

      ballDetected = false;

      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Game Start!");

      lcd.setCursor(0, 1);
      lcd.print("Gate Open");

      // 시작하면 RGB 파란색
      rgbBlue();

      // 서보 열기
      gateServo.write(OPEN_ANGLE);
      delay(700);

      startTime = millis();
      gameRunning = true;

      lcd.clear();
    }

    return;
  }

  // =====================
  // 게임 진행 중
  // =====================

  unsigned long currentTime = millis();
  unsigned long elapsedTime = currentTime - startTime;

  if (elapsedTime <= gameTime) {
    float distance = getDistance();

    int remainingTime = (gameTime - elapsedTime + 999) / 1000;

    lcd.setCursor(0, 0);
    lcd.print("Time: ");
    lcd.print(remainingTime);
    lcd.print(" sec   ");

    lcd.setCursor(0, 1);
    lcd.print("D:");

    if (distance == 999) {
      lcd.print("No Signal   ");
    } else {
      lcd.print((int)distance);
      lcd.print(" cm       ");
    }

    // 득점 판정
    if (distance < goalDistance && ballDetected == false) {
      score++;
      showNumber(score);
      ballDetected = true;
    }

    // 공이 빠져나가면 다시 득점 가능
    if (distance > releaseDistance) {
      ballDetected = false;
    }

    delay(100);
  }

  // =====================
  // 게임 종료
  // =====================
  else {
    gameRunning = false;

    // 서보로 공 다시 막기
    gateServo.write(BLOCK_ANGLE);
    delay(500);

    // 종료하면 RGB 빨간색
    rgbRed();

    // 부저 한 번 울림
    endSound();

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Game Over!");

    lcd.setCursor(0, 1);
    lcd.print("Score: ");
    lcd.print(score);

    delay(3000);

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Basketball Game");

    lcd.setCursor(0, 1);
    lcd.print("Press Button");
  }
}
## 패널 샘플 코드

#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// LCD 주소: 0x27
// 안 되면 0x3F로 변경
LiquidCrystal_I2C lcd(0x27, 16, 2);

int count = 0;

void setup()
{
  // LCD 초기화
  lcd.begin();

  // 백라이트 켜기
  lcd.backlight();

  // 첫 화면 출력
  lcd.setCursor(0, 0);
  lcd.print("LCD Test");

  lcd.setCursor(0, 1);
  lcd.print("Ready");
}

void loop()
{
  delay(1000);

  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("Panel Working");

  lcd.setCursor(0, 1);
  lcd.print("Count: ");
  lcd.print(count);

  count++;
}

## 세븐세그먼트
### ppt기준 a = 2 ... g = 8

// false = 공통 음극, COM -> GND
// true  = 공통 양극, COM -> 5V
const bool COMMON_ANODE = false;

// 실제 연결 기준
// A B C D E F G 순서
const int segmentPins[7] = {
  6, 7, 8, 5, 4, 3, 2
};

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

## 버튼 LED 패널 실험 코드
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// LCD 주소 0x27, 16칸 2줄
LiquidCrystal_I2C lcd(0x27, 16, 2);

// 버튼 핀
const int buttonPin = 13;

bool counting = false;

void setup()
{
  lcd.begin();
  lcd.backlight();

  pinMode(buttonPin, INPUT_PULLUP);

  lcd.setCursor(0, 0);
  lcd.print("Countdown Test");

  lcd.setCursor(0, 1);
  lcd.print("Press Button");
}

void loop()
{
  int buttonState = digitalRead(buttonPin);

  // 버튼을 누르면 LOW
  if (buttonState == LOW && counting == false)
  {
    counting = true;

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Start!");

    delay(500);

    // 5초 카운트다운
    for (int i = 5; i >= 1; i--)
    {
      lcd.clear();

      lcd.setCursor(0, 0);
      lcd.print("Countdown");

      lcd.setCursor(0, 1);
      lcd.print(i);
      lcd.print(" sec");

      delay(1000);
    }

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Time Over!");

    lcd.setCursor(0, 1);
    lcd.print("Press Button");

    delay(1000);

    counting = false;
  }
}

