import pygame
import sys

pygame.init()

screen_width = 800
screen_height = 600
screen = pygame.display.set_mode(
    (screen_width, screen_height)
)
pygame.display.set_caption('벽돌 부수기 게임')

BLACK = 0, 0, 0
WHITE = 255, 255, 255
YELLOW = 255, 255, 0

background_color = BLACK

clock = pygame.time.Clock()
fps = 60
font = pygame.font.Font(None, 36)

font_color = WHITE
score = 0
lives = 3

class Paddle:
    def __init__(self):
        self.color = WHITE
        self.width, self.height = 100, 15
        self.x = (screen_width - self.width) / 2
        self.y = screen_height - 40
        self.speed = 15

    def draw(self):
        pygame.draw.rect(
            screen,
            self.color,
            (self.x, self.y, self.width, self.height),
        )

class Block:
    def __init__(self, x, y, width, height, color):
        self.color = color
        self.width, self.height = width, height
        self.x, self.y = x, y
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
            self.rect,
        )

class Ball:
    def __init__(self):
        self.color = WHITE
        self.radius = 10
        self.speed_x = 4
        self.speed_y = -4

    def reset_position(self, paddle):
        self.x = paddle.x + paddle.width / 2
        self.y = paddle.y - self.radius - 1
        self.speed_x = 4
        self.speed_y = -4

    def move(self, paddle, blocks, running):
        self.x += self.speed_x
        self.y += self.speed_y
        self.running = running

        ball_rect = pygame.Rect(
            self.x - self.radius,
            self.y - self.radius,
            self.radius * 2,
            self.radius * 2,
        )

        if self.x - self.radius <= 0 or self.x + self.radius >= screen_width:
            self.speed_x = - self.speed_x
        
        if self.y - self.radius <= 0:
            self.speed_y = - self.speed_y
        
        if self.y + self.radius >= screen_height:
            self.running = False
            print('GAME OVER')

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
                    
                    if self.y < block.rect.top or self.y > block.rect.bottom:
                        self.speed_y = - self.speed_y
                    
                    row.remove(block)

                    break

        return self.running, blocks
    
    def draw(self):
        pygame.draw.circle(
            screen,
            self.color,
            (int(self.x), int(self.y)),
            self.radius,
        )

class Game:
    def create_blocks(self):
        block_color = YELLOW
        block_width = 75
        block_height = 20
        block_rows, block_columns = 5, 9
        block_margin = 10

        blocks = []
        for row in range(block_rows):
            block_row = []
            for col in range(block_columns):
                block_x = block_margin + (block_margin + block_width) * col
                block_y = block_margin + (block_margin + block_height) * row
                block = Block(
                    block_x,
                    block_y,
                    block_width,
                    block_height,
                    block_color,
                )
                block_row.append(block)
            blocks.append(block_row)

        return blocks
    
    def draw_blocks(self, blocks):
        for row in blocks:
            for block in row:
                block.draw()
    
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
            
            keys = pygame.key.get_pressed()

            if keys[pygame.K_LEFT] and paddle.x > 0:
                paddle.x -= paddle.speed

            if keys[pygame.K_RIGHT] and paddle.x < screen_width - paddle.width:
                paddle.x += paddle.speed
            
            running, blocks = ball.move(paddle, blocks, running)
            screen.fill(background_color)
            paddle.draw()
            ball.draw()
            self.draw_blocks(blocks)

            pygame.display.flip()
            clock.tick(fps)
    
if __name__ == "__main__":
    game = Game()
    game.run()