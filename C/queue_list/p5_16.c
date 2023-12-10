#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define MAX_QUEUE_SIZE 7

typedef struct {
    int job_num;
    char grade;
} element;

element queue[MAX_QUEUE_SIZE];
// front와 rear -1부터 (MAX_QUEUE_SIZE-1) 까지 같은 값으로 초기화 가능
int rear = 0;
int front = 0;

void caddq(element item);
element cdeleteq();

main()
{
    int i, job_num, out, cond = 1;
    element temp;
    while (cond) {
        printf("완료한 작업 수는? ");
        scanf("%d", &job_num);

        printf("작업번호와 작업상태 입력 :\n");
        for (i = 0; i < job_num; i++) {
            scanf("%d %c", &temp.job_num, &temp.grade);
            caddq(temp);
        }
        printf("몇개의 작업을 출고하실래요? ");
        scanf("%d", &out);
        for (i = 0; i < out; i++) {
            temp = cdeleteq();
            printf("%d\t%c\n", temp.job_num, temp.grade);
        }
        printf("front = %d :: rear = %d\n", front, rear);
        printf("작업의 입출력을 계속하실래요(1/0)?");
        scanf("%d", &cond);
    }
}

void caddq(element item)
{
    int next_rear = (rear + 1) % MAX_QUEUE_SIZE;
	if (next_rear == front)
		printf("Queue is Full!!");
	else {
		rear = next_rear;
		queue[rear] = item;
	}
}

element cdeleteq()
{
	/* queue의 front 원소를 삭제하여 리턴함 */
    if (front == rear) {
        printf("Queue is empty!!!");
        exit(1);
    }
	else {
		front = (front + 1) % MAX_QUEUE_SIZE;
		return queue[front];
	}
}
