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
    /* queue에 item을 삽입 */
    if (rear == MAX_QUEUE_SIZE - 1)
        printf("Queue is full!!");
    else
        queue[++rear] = item;
}

element deleteq()
{
    /* queue의 앞에서 원소를 삭제 */
    if (front == rear)
        printf("Queue is Empty");
    else
        return queue[++front];
}



main()
{
    int i, job_num, out, gradeA = 0;
    element temp;

    printf("오늘 작업한 작업 수는? ");
    scanf("%d", &job_num);

    printf("작업번호와 작업상태 입력 : \n");
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

    printf("A 등급인 job은 %d개입니다. \n", gradeA);
    printf(" \n \nfront = %d :: rear = %d \n \n", front, rear);
}

