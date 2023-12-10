#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define MAX_QUEUE_SIZE 10

typedef struct {
    int job_num;
    char grade;
} element;

element queue[MAX_QUEUE_SIZE];
int rear = -1;
int front = -1;
void addq(element item);
element deleteq();

void addq(element item)
{
    /* queue�� item�� ���� */
    if (rear == MAX_QUEUE_SIZE - 1)
        printf("Queue is full!!");
    else
        queue[++rear] = item;
}

element deleteq()
{
    /* queue�� �տ��� ���Ҹ� ���� */
    if (front == rear)
        printf("Queue is Empty");
    else
        return queue[++front];
}



main()
{
    int i, job_num, out, gradeA = 0;
    element temp;

    printf("���� �۾��� �۾� ����? ");
    scanf("%d", &job_num);

    printf("�۾���ȣ�� �۾����� �Է� : \n");
    for (i = 0; i < job_num; i++) {
        scanf("%d %c", &temp.job_num, &temp.grade);
        addq(temp);
    }

    printf(" \nfront = %d :: rear = %d \n \n", front, rear);

    for (i = 0; i < job_num; i++) {
        temp = deleteq();
        if (temp.grade == 'A') {
            printf("%d \t%c\n", temp.job_num, temp.grade);
            gradeA++;
        }
        else
            addq(temp);
    }

    printf("A ����� job�� %d���Դϴ�. \n", gradeA);
    printf(" \n \nfront = %d :: rear = %d \n \n", front, rear);
}

