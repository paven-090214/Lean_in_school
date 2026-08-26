import pygame
import sys

pygame.init()

screen_width, screen_height = 800, 600
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption('벽돌 부수기 게임')

BLACK = (0, 0, 0)
WHITE = (255,255,255)
BLUE = (0, 0, 255)
YELLOW = (255, 255, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)

lives = 3

COLOR_STYLE = [BLUE, YELLOW, (211,12,20), (20, 50, 100), (200, 200, 40)]


paddle_width, paddle_height = 100, 15
paddle_x, paddle_y = (screen_width - paddle_width) // 2, screen_height - 40
paddle_color = WHITE
paddle_speed = 15

block_color = BLUE
block_width, block_height = 75, 20
block_rows, block_columns = 5, 9
block_margin = 10

blocks = []
for row in range(block_rows):
    block_row = []
    for col in range(block_columns):
        block_x = col * (block_width + block_margin) + block_margin
        block_y = row * (block_height + block_margin) + block_margin
        block_rect = pygame.Rect(
            block_x,
            block_y,
            block_width,
            block_height
        )
        block_color = WHITE #COLOR_STYLE[row % len(COLOR_STYLE)]
        block_row.append((block_rect, block_color))
    blocks.append(block_row)

ball_color = (255, 255, 255)
ball_radius = 10
ball_x, ball_y = paddle_x / 2, paddle_y - ball_radius - 1
ball_speed_x, ball_speed_y = 4, -4

font = pygame.font.Font(None, 36)

lives_font_color = WHITE
font_color = WHITE
score_color = GREEN
score = 0
remain_blocks = block_rows * block_columns

background_color = BLACK
clock = pygame.time.Clock()
fps = 60

running = True

while (running):

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill(background_color)

    keys = pygame.key.get_pressed()

    if keys[pygame.K_LSHIFT]:
        paddle_speed = 30
    else :
        paddle_speed = 15

    if keys[pygame.K_LEFT]:
        paddle_x -= paddle_speed
        if paddle_x < 0:
            paddle_x = 0
    
    if keys[pygame.K_RIGHT]:
        paddle_x += paddle_speed
        if paddle_x > screen_width - paddle_width:
            paddle_x = screen_width - paddle_width

    pygame.draw.rect(
        screen,
        paddle_color,
        (paddle_x, paddle_y, paddle_width, paddle_height)
    )

    for row in blocks:
        for block_rect, block_color in row:
            pygame.draw.rect(
                screen,
                block_color,
                block_rect
            )

    ball_x += ball_speed_x
    ball_y += ball_speed_y
    
    if ball_x - ball_radius <= 0 or ball_x + ball_radius >= screen_width:
        ball_speed_x = -ball_speed_x
    
    if ball_y - ball_radius <= 0:
        ball_speed_y = - ball_speed_y

    if ball_y + ball_radius >= screen_height:
        lives -= 1
        if lives < 1:
            running = False
        elif lives == 1:
            ball_x = paddle_x + paddle_width / 2
            ball_y = paddle_y - ball_radius - 5
            lives_font_color = RED
        else :
            ball_x = paddle_x + paddle_width / 2
            ball_y = paddle_y - ball_radius - 5

    paddle_rect = pygame.Rect(
            paddle_x,
            paddle_y,
            paddle_width,
            paddle_height
        )

    if paddle_rect.colliderect(
        ball_x - ball_radius,
        ball_y - ball_radius,
        ball_radius * 2,
        ball_radius * 2
    ):
        ball_speed_y = - ball_speed_y
    
     # 8-7. block 충돌 처리
 # ----------------------------------------------
    for row in blocks:
        for block_rect, block_color in row:
            if block_rect.colliderect(
            ball_x - ball_radius,
            ball_y - ball_radius,
            ball_radius * 2,
            ball_radius * 2
            ):
                ball_speed_y = -ball_speed_y
                row.remove((block_rect, block_color))
                score += 50
                remain_blocks -= 1
                ball_speed_x *= 1.1
                ball_speed_y *= 1.1
                break

    
    pygame.draw.circle(
        screen,
        ball_color,
        (int(ball_x), int(ball_y)),
        ball_radius
    )

    score_text = font.render(
        f'Score: {score}',
        True,
        score_color
    )
    remain_text = font.render(
        f'Remain: {remain_blocks}',
        True,
        font_color
    )

    lives_text = font.render(
        f'lives: {lives}',
        True,
        lives_font_color
    )

    clear_text = font.render(
        f'CLEAR!',
        True,
        font_color
    )

    if remain_blocks == 0:
        screen.blit(clear_text, (screen_width / 2, 100))

    screen.blit(score_text, (20, 200))
    screen.blit(remain_text, (20, 240))
    screen.blit(lives_text, (20, 280))

    pygame.display.flip()
    clock.tick(fps)

pygame.quit()

sys.exit()