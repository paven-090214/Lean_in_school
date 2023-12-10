#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define MAX_QUEUE_SIZE 10

typedef struct {
    int job_num;
    char grade;
} element;

/*
    elementŸ���� ����ü ����
    intŸ���� job_num
    charŸ���� grade 
    ����
*/

element queue[MAX_QUEUE_SIZE]; //elementŸ���� [MAX_QUEUE_SIZE] ũ���� "queue"��� �̸��� ť ����
int rear = -1; //int�� Ÿ�� rear ���� �� -1�� �ʱ�ȭ
int front = -1;//int�� Ÿ�� frontŸ�� ���� �� -1�� �ʱ�ȭ
void addq(element item);
element deleteq();

main()
{
    int i, job_num, out, gradeA = 0;
    element temp;//elementŸ���� "temp"�� �̸��� ���� ���� ����

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

void addq(element item)//elementŸ�� "item"�̸����� ����
{
    
    if (rear == MAX_QUEUE_SIZE - 1)
        printf("Queue is full!!");
    else
        queue[++rear] = item;//queue�� ���� �����ڷ� 1�� ���ϰ�, ������ ���� ����
}

element deleteq()
{
    if (front == rear)
        printf("Queue is Empty");
    else
        return queue[++front];//queue�迭�� front�� ���������ڷ� 1 ���ϰ� ���� ����
}