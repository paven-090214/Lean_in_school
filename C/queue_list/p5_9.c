#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define MAX_QUEUE_SIZE 10

typedef struct {
    int job_num;
    char grade;
} element;

/*
    element타입의 구조체 생성
    int타입의 job_num
    char타입의 grade 
    존재
*/

element queue[MAX_QUEUE_SIZE]; //element타입의 [MAX_QUEUE_SIZE] 크기의 "queue"라는 이름의 큐 생성
int rear = -1; //int형 타입 rear 생성 후 -1로 초기화
int front = -1;//int형 타입 front타입 생성 후 -1로 초기화
void addq(element item);
element deleteq();

main()
{
    int i, job_num, out, gradeA = 0;
    element temp;//element타입의 "temp"의 이름을 가진 변수 생성

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

void addq(element item)//element타입 "item"이름으로 복사
{
    
    if (rear == MAX_QUEUE_SIZE - 1)
        printf("Queue is full!!");
    else
        queue[++rear] = item;//queue를 전위 연산자로 1을 더하고, 아이템 값을 삽입
}

element deleteq()
{
    if (front == rear)
        printf("Queue is Empty");
    else
        return queue[++front];//queue배열의 front를 전위연산자로 1 더하고 값을 리턴
}