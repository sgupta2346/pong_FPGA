import pygame
import time

SCALE = 10
WIDTH, HEIGHT = 80, 40
WINDOW = (WIDTH*SCALE, HEIGHT*SCALE)

pygame.init()
screen = pygame.display.set_mode(WINDOW)
pygame.display.set_caption("Verilog Pong Simulation")
clock = pygame.time.Clock()

with open("log.txt") as f:
    lines = f.readlines()[1:]  

for line in lines:
    parts = line.strip().split()
    if len(parts) < 5:
        continue
    _, bx, by, p1y, p2y = map(int, parts)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            exit()

    screen.fill((0,0,0))
    pygame.draw.rect(screen, (255,255,255), (bx*SCALE, by*SCALE, SCALE, SCALE))
    pygame.draw.rect(screen, (0,255,0), (1*SCALE, p1y*SCALE, SCALE, 6*SCALE))
    pygame.draw.rect(screen, (0,0,255), ((WIDTH-2)*SCALE, p2y*SCALE, SCALE, 6*SCALE))
    pygame.display.flip()
    clock.tick(30) 
