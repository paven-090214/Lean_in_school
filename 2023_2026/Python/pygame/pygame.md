# PYGAME

## 1

```python
paddle_x >= 0
```

## 2
```python
ball_speed_x = - ball_speed_x
```

## 3

```python
running = False
```

## 4

```python
colliderect
```

## 5

```text
게임 루프 실행 속도를 조절한다.
```
 
## 6

```text
공의 반지름 * 2를 함으로 써 공의 지름만큼 충돌판정을 만든다.
```

## 7

```text
- 오른쪽 방향키를 눌렀는지 검사
- paddle_x 를 패들의 너비만큼 더하고, 이 값이 스크린의 우측으로 빠져나가지 않았는지 검사
- 1, 2 번이 참이라면 paddle_x의 위치를 += paddle_speed로 우측으로 이동시킨다.
```

## 8

```text
(800, 0)
(350, 560)
(0, 600)
(800, 600)
```

## 9

```python
ball_x = paddle_x + paddle_width / 2
```

## 10

```text
현재 화면에 채워주는 함수로, 화면을 최신 상태로 업데이트하여 유저에게 보여줄 수 있다.
```

## 11

```text
생성자이므로, 객체 생성시 초깃값 만들어줌.
```

## 12

```text
ball = Ball()클래스로 ball객체 생성
1. 메모리에 Ball객체가 생성된다.
3. __init() 메서드가 자동으로 호출된다.
4. 초기 속성을 갖는다.
2. 생성된 객체가 ball변수에 저장된다.
```

## 13

```python
reset_position(self, paddle)
```

## 14
5
```text
분리 목적 
- 패들, 공, 벽돌, 게임 진행 등 객체별 역할과 책임을 분리할 수 있다.
- 코드의 재사용성과 유지보수성을 향상할 수 있다.
- 새로운 기능을 추가할 때 기존 코드를 쉽게 확장할 수 있다.
- 
```

## 15

(200, 100)

## 16 

(200, 200)

## 17

10

## 18

```python
for row in blocks:
    for block in row:
        block.draw()
```