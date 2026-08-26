import pygame
import sys

pygame.init()

screen_width = 800
screen_height = 600
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption('벽돌 부수기 게임')

BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
YELLOW = (255, 255, 0)
RED = (255, 0, 0)
BLUE = (0, 0, 255)

background_color = BLACK
clock = pygame.time.Clock()
fps = 60

paddle_width = 100
paddle_height = 15
paddle_speed = 15
paddle_x = (screen_width / 2) - paddle_width
paddle_y = screen_height - 40
paddle_color = WHITE

block_width = 75
block_height = 20
block_rows = 5
block_columns = 9
block_margin = 10
block_color = YELLOW
block_color_list = [
    (255, 100, 20),
    (255, 165, 0),
    (55, 55, 20),
    (100, 255, 100),
    (50, 20, 50),
]

font = pygame.font.Font(None, 36)
font_color = WHITE
score = 0
life_font_color = WHITE
life = 3
remain_block = block_rows * block_columns

blocks = []
for row in range(block_rows):
    block_row = []
    for column in range(block_columns):
        block_x = block_margin + column * (block_width + block_margin)
        block_y = block_margin + row * (block_height + block_margin)
        block_rect = pygame.Rect(
            block_x,
            block_y,
            block_width,
            block_height,
        )
        block_row.append(block_rect)
    blocks.append(block_row)

ball_color = WHITE
ball_speed_x = 4
ball_speed_y = 4
ball_radius = 10
ball_x = paddle_x + paddle_width / 2
ball_y = paddle_y - 1 - ball_radius

running = True

while(running):
    """
    # LAB 1-3
    # 현재 시간 (밀리초)
    current_time = pygame.time.get_ticks()
    # 10초동안 검은색, 1초동안 빨간색
    if (current_time // 1000) % 10 == 0 and current_time >= 5000:
        background_color = RED
    else :
        background_color = BLACK
    """

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        if event.type == pygame.KEYDOWN:
            # LAB 1-3 - space 누르면 패들 중앙으로 이동
            if event.key == pygame.K_SPACE:
                paddle_x = (screen_width / 2) - paddle_width
            # LAB 1-4 키보드 입력을 받아 특정 키를 누르면 배경색이 바뀌도록 구현
            if event.key == pygame.K_p:
                background_color = BLUE
            if event.key == pygame.K_b:
                background_color = BLACK
            
    
    keys = pygame.key.get_pressed()

    # LAB 1-2 - Shift키 사용시 패들 속도 2배
    if keys[pygame.K_LSHIFT]:
        paddle_speed = 30
    else :
        paddle_speed = 15
    # LAB 1-4 paddle이 화면 밖으로 “완전히 나가는 것”은 방지
    if keys[pygame.K_LEFT] and paddle_x >= 0:
        paddle_x -= paddle_speed
        if paddle_x < 0:
            paddle_x = 0

    if keys[pygame.K_RIGHT] and paddle_x + paddle_width <= screen_width:
        paddle_x += paddle_speed
        if paddle_x + paddle_width >= screen_width:
            paddle_x = screen_width - paddle_width
    
    screen.fill(background_color)

    pygame.draw.rect(
        screen,
        paddle_color,
        (paddle_x, paddle_y, paddle_width, paddle_height)
    )

    color_num = 0
    for row in blocks:
        for block in row:
            # LAB 1-4 각 행마다 블록 색상이 다르게 출력되도록 구현
            pygame.draw.rect(
                screen,
                block_color_list[color_num],
                block
            )
        color_num += 1

    ball_x += ball_speed_x
    ball_y += ball_speed_y

    if ball_x - ball_radius <= 0:
        ball_speed_x = - ball_speed_x
    
    if ball_x + ball_radius >= screen_width:
        ball_speed_x = - ball_speed_x

    if ball_y - ball_radius <= 0:
        ball_speed_y = - ball_speed_y

    if ball_y + ball_radius >= screen_height:
        life -= 1
        if life <= 0:
            running = False
        # LAB 7-3 생명이 1 이하가 되면 글자 색상이 빨간색으로 변경되도록 구현
        elif life <= 1:
            life_font_color = RED
            ball_x = paddle_x + paddle_width / 2
            ball_y = paddle_y - 1 - ball_radius
            ball_speed_y = - ball_speed_y
        else :
            ball_x = paddle_x + paddle_width / 2
            ball_y = paddle_y - 1 - ball_radius
            ball_speed_y = - ball_speed_y
        
    paddle_rect = pygame.Rect(
        paddle_x,
        paddle_y,
        paddle_width,
        paddle_height,
    )

    if paddle_rect.colliderect(
        ball_x - ball_radius,
        ball_y - ball_radius,
        ball_radius * 2,
        ball_radius * 2,
    ):
        ball_speed_y = - ball_speed_y
        ball_speed_x = ball_speed_x * 1.1
        ball_speed_y = ball_speed_y * 1.1

    for row in blocks:
        for block in row:
            ball_rect = pygame.Rect(
                ball_x - ball_radius,
                ball_y - ball_radius,
                ball_radius * 2,
                ball_radius * 2,
            )
            # 블럭의 양옆에 닿았을 경우 x방향으로 튐
            if block.colliderect(ball_rect):
                hit_rect = block.clip(ball_rect)
                # 위/아래에서 닿으면 겹친 부분이 가로로 김
                if hit_rect.width > hit_rect.height:
                    ball_speed_y = - ball_speed_y
                else :
                    ball_speed_x = - ball_speed_x
                    
                row.remove(block)
                score += 10
                remain_block -= 1
                if remain_block == 0:
                    print('YOU WIN')
                    running = False
                break

    score_text = font.render(
        f'Score : {score}',
        True,
        font_color,
    )

    remain_text = font.render(
        f'Remain : {remain_block}',
        True,
        font_color,
    )

    life_text = font.render(
        f'Life : {life}',
        True,
        life_font_color,
    )

    screen.blit(score_text, (20, 200))
    screen.blit(remain_text, (20, 240))
    screen.blit(life_text, (20, 280))

    pygame.draw.circle(
        screen,
        ball_color,
        (int(ball_x), int(ball_y)),
        ball_radius,
    )

    pygame.display.flip()
    clock.tick(fps)

pygame.quit()
sys.exit()