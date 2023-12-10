#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#define MAX_STACK_SIZE 10

typedef struct {
    int key;
    char grade;
} element;
int top = -1;
element stack[MAX_STACK_SIZE];
void push(element data);
element pop();
void main()
{
    element data;
    int i, n, cond = 1;

    while (cond) {
        printf("데이터 입력 : ");
        scanf("%d %c", &data.key, &data.grade);
        if (data.key != 0) {
            push(data);
        }
        printf("스택에 데이터를 계속 입력하실래요?(1/0)");
        scanf("%d", &cond);
    }

    printf("스택에서 몇 개의 데이터가 필요하세요? ");
    scanf("%d", &n);

    printf("스택에서 삭제한 데이터 : \n");
    for (i = 0; i < n; i++) {
        data = pop();
        printf("%d\t%c\n", data.key, data.grade);
    }
}

void push(element item)
{
    if (top >= MAX_STACK_SIZE - 1)
        printf("Stack is overflow !!!\n");
    else {
        top++;
        stack[top] = item;
    }
}

element pop()
{
    if (top == -1) {
        printf("Stack is empty!!!");
        exit(1);
    }
    else return stack[top--];
}