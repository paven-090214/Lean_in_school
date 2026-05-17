# 아두이노 스케치
#include <Adafruit_LiquidCrystal.h>

Adafruit_LiquidCrystal lcd(0);

const int segA = 2;
const int segB = 3;
const int segC = 4;
const int segD = 5;
const int segE = 6;
const int segF = 7;
const int segG = 8;

const int segmentPins[7] = {
  segA, segB, segC, segD, segE, segF, segG
};

byte numbers[10][7] = {
  // A B C D E F G
  {0, 0, 0, 0, 0, 0, 1}, // 0
  {1, 0, 0, 1, 1, 1, 1}, // 1
  {0, 0, 1, 0, 0, 1, 0}, // 2
  {0, 0, 0, 0, 1, 1, 0}, // 3
  {1, 0, 0, 1, 1, 0, 0}, // 4
  {0, 1, 0, 0, 1, 0, 0}, // 5
  {0, 1, 0, 0, 0, 0, 0}, // 6
  {0, 0, 0, 1, 1, 1, 1}, // 7
  {0, 0, 0, 0, 0, 0, 0}, // 8
  {0, 0, 0, 0, 1, 0, 0}  // 9
};

const int ledPin = 9;
const int piezoPin = 10;

const int trigPin = 11;
const int echoPin = 12;

const int buttonPin = 13;

int score = 0;
bool gameRunning = false;

unsigned long startTime = 0;
const unsigned long gameTime = 30000; // 30초

const float goalDistance = 10.0;

const float releaseDistance = 15.0;

bool ballDetected = false;

void showNumber(int num) {
  num = num % 10;

  for (int i = 0; i < 7; i++) {
    digitalWrite(segmentPins[i], numbers[num][i]);
  }
}

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

void goalEffect() {
  digitalWrite(ledPin, HIGH);
  tone(piezoPin, 1000);
  delay(150);
  digitalWrite(ledPin, LOW);
  noTone(piezoPin);
}

void endEffect() {
  for (int i = 0; i < 3; i++) {
    digitalWrite(ledPin, HIGH);
    tone(piezoPin, 700);
    delay(200);

    digitalWrite(ledPin, LOW);
    noTone(piezoPin);
    delay(200);
  }
}

void setup() {
  lcd.begin(16, 2);

  for (int i = 0; i < 7; i++) {
    pinMode(segmentPins[i], OUTPUT);
    digitalWrite(segmentPins[i], HIGH);
  }

  pinMode(ledPin, OUTPUT);
  pinMode(piezoPin, OUTPUT);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  pinMode(buttonPin, INPUT_PULLUP);

  score = 0;
  showNumber(score);

  lcd.setCursor(0, 0);
  lcd.print("Basketball Game");

  lcd.setCursor(0, 1);
  lcd.print("Press Button");
}

void loop() {
  int buttonState = digitalRead(buttonPin);

  if (!gameRunning) {
    if (buttonState == LOW) {
      score = 0;
      showNumber(score);

      startTime = millis();
      ballDetected = false;
      gameRunning = true;

      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Game Start!");
      delay(500);
      lcd.clear();
    }

    return;
  }

  unsigned long currentTime = millis();
  unsigned long elapsedTime = currentTime - startTime;

  if (elapsedTime <= gameTime) {
    int remainingTime = (gameTime - elapsedTime) / 1000;
    float distance = getDistance();

    lcd.setCursor(0, 0);
    lcd.print("Time:");
    lcd.print(remainingTime);
    lcd.print(" sec     ");

    lcd.setCursor(0, 1);
    lcd.print("D:");
    lcd.print((int)distance);
    lcd.print(" cm       ");

    if (distance < goalDistance && ballDetected == false) {
      score++;
      showNumber(score);
      ballDetected = true;
      goalEffect();
    }

    if (distance > releaseDistance) {
      ballDetected = false;
    }
  }

  else {
    gameRunning = false;

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Game Over!");

    lcd.setCursor(0, 1);
    lcd.print("Final Score");

    endEffect();

    delay(3000);

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Basketball Game");

    lcd.setCursor(0, 1);
    lcd.print("Press Button");
  }
}
