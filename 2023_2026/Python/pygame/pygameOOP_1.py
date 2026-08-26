import pygame
import sys

pygame.init()

screen_width = 800
screen_height = 600
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption('벽돌 부수기 게임')

BLACK = 0, 0, 0
WHITE = 255, 255, 255
YELLOW = 255, 255, 0
RED = 255, 0, 0
BLUE = 0, 0, 255

background_color = BLACK
clock = pygame.time.Clock()
fps = 60

class Paddle:
    def __init__(self):
        self.width = 100
        self.height = 15
        self.x = screen_width / 2 - self.width
        self.y = screen_height - 40
        self.color = WHITE
        self.speed = 15

    def move_left(self, keys):
        if keys[pygame.K_LEFT] and self.x >= 0:
            self.x -= self.speed

    def move_right(self, keys):
        if keys[pygame.K_RIGHT] and self.x + self.width <= screen_width:
            self.x += self.speed

    def draw(self):
        pygame.draw.rect(
            screen,
            self.color,
            (self.x, self.y, self.width, self.height)
        )
        
class Block:
    def __init__(self, x, y, width, height, color):
        self.score_value = 10
        self.color = color
        self.x, self.y = x, y
        self.width, self.height = width, height
        self.rect = pygame.Rect(
            self.x,
            self.y,
            self.width,
            self.height
        )
    
    def draw(self):
        pygame.draw.rect(
            screen,
            self.color,
            self.rect
        )

class Ball:
    def __init__(self):
        self.color = WHITE
        self.speed_x = 4
        self.speed_y = -4
        self.radius = 10

    def reset_position(self, paddle):
        self.x = paddle.x + paddle.width / 2
        self.y = paddle.y - self.radius - 1
        self.speed_x = 4
        self.speed_y = -4

    def check_wall_collision(self):
        if self.x - self.radius <= 0 or self.x + self.radius >= screen_width:
            self.speed_x = - self.speed_x
        
        if self.y - self.radius <= 0:
            self.speed_y = - self.speed_y

    def move(self, paddle, blocks, running, score, lives, block_remain):
        self.x += self.speed_x
        self.y += self.speed_y
        self.running = running

        self.check_wall_collision()
        
        ball_rect = pygame.Rect(
            self.x - self.radius,
            self.y - self.radius,
            self.radius * 2,
            self.radius * 2,
        )

        if self.y >= screen_height:
            lives -= 1
            self.reset_position(paddle)
            if lives <= 0:
                self.running = False
        paddle_rect = pygame.Rect(
            paddle.x,
            paddle.y,
            paddle.width,
            paddle.height,
        )

        if paddle_rect.colliderect(ball_rect):
            if self.x < paddle_rect.left or self.x > paddle_rect.right:
                self.speed_x = - self.speed_x
            self.speed_y = - self.speed_y

        for row in blocks:
            for block in row:
                if block.rect.colliderect(ball_rect):
                    if self.x < block.rect.left or self.x > block.rect.right:
                        self.speed_x = - self.speed_x
                    if self.y > block.rect.bottom or self.y < block.rect.top:
                        self.speed_y = - self.speed_y
                    score += block.score_value
                    block_remain -= 1
                    if block_remain <= 0:
                        print('YOU WIN')
                        self.running = False
                    row.remove(block)
                    break

        return self.running, blocks, score, lives, block_remain
    
    def draw(self):
        pygame.draw.circle(
            screen,
            self.color,
            (int(self.x), int(self.y)),
            self.radius
        )

class Game:

    def __init__(self):
        self.font_color = WHITE
        self.score = 0
        self.lives = 3
        self.font = pygame.font.Font(None, 36)
        
    def handle_input(self, paddle):
        keys = pygame.key.get_pressed()
        paddle.move_right(keys)
        paddle.move_left(keys)

    def create_blocks(self):
        block_color = YELLOW
        block_width = 75
        block_height = 20
        block_rows, block_columns = 5, 9
        block_margin = 10
        self.block_remain = block_rows * block_columns
    
        blocks = []
        for row in range(block_rows):
            block_row = []
            for column in range(block_columns):
                block_x = block_margin + column * (block_width + block_margin)
                block_y = block_margin + row * (block_height + block_margin)
                block = Block(
                    block_x,
                    block_y,
                    block_width,
                    block_height,
                    block_color
                )
                block_row.append(block)
            blocks.append(block_row)

        return blocks
    
    def draw_blocks(self, blocks):
        for row in blocks:
            for block in row:
                block.draw()

    def text(self):
        score_text = self.font.render(
            f'Score : {self.score}',
            True,
            self.font_color
        )

        lives_text = self.font.render(
            f'life : {self.lives}',
            True,
            self.font_color
        )

        remain_text = self.font.render(
        f'Remain : {self.block_remain}',
        True,
        self.font_color
        )

        screen.blit(score_text, (20, 200))
        screen.blit(remain_text,(20, 240))
        screen.blit(lives_text,(20, 280))
    
    def run(self):
        paddle = Paddle()
        ball = Ball()
        ball.reset_position(paddle)
        blocks = self.create_blocks()
        running = True

        while(running):
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False
                    return running
            self.handle_input(paddle)



            running, blocks, self.score, self.lives, self.block_remain = ball.move(
                paddle, 
                blocks, 
                running, 
                self.score,
                self.lives,
                self.block_remain
            )

            screen.fill(background_color)
            paddle.draw()
            ball.draw()
            self.draw_blocks(blocks)
            self.text()

            pygame.display.flip()
            clock.tick(fps)

if __name__ == '__main__':
    game = Game()
    game.run()