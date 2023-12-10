#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

typedef struct {//구조체 생성
	int job_num;
	char grade;
} element;

typedef struct node {//element, next변수
	element qdata;
	struct node* next;
} QueueNode;

QueueNode * rear = NULL, *front = NULL;
void addqlist(element item);
element deleteqlist();
void printlist();

main()
{
    int i, job_num, gradeA = 0;
    element temp;

    printf("오늘 작업한 작업 수는? ");
    scanf("%d", &job_num);

    printf("작업번호와 작업상태 입력 :\n");
    for (i = 0; i < job_num; i++) {
        scanf("%d %c", &temp.job_num, &temp.grade);//
        addqlist(temp);
    }

    printf("\n 연결 큐 안의 데이터 = \n");
    printlist();

    printf("\n 1개 삭제 후 삽입 연산 테스트\n");
    temp = deleteqlist();//리턴한 item의 값을 temp에 삽입, 첫번째 노드가 사라짐
    addqlist(temp);//노드의 마지막에 temp의 값을 다시 넣어주고, rear이 temp값을 가르키도록 만들면서 첫번째 값이 마지막으로 들어가게 됨
    printlist();

    printf("A등급인 제품번호 = ");
    for (i = 0; i < job_num; i++) {
        temp = deleteqlist();//연결리스트에서 첫번째 (front가 가리키는)노드를 temp에 리턴시킴과 동시에 할당이 해제됨
        if (temp.grade == 'A') {
            printf("%d\t", temp.job_num);
            gradeA++;
        }
        else
            addqlist(temp);//A가 아니라면 연결리스트 마지막에 다시 값을 추가함
    }
    printf("\nA 등급인 제품은 %d개입니다. \n", gradeA);
    printf("%d 개의 등급 A 삭제 후 큐 안의 데이터 = \n", gradeA);
    printlist();
}

void addqlist(element item)
{
    QueueNode * inode = (QueueNode*)malloc(sizeof(QueueNode));
    inode->qdata = item;
    inode->next = NULL;
    if (front == NULL) {//처음으로 노드를 생성한 경우, front,rear값 = NULL
        front = rear = inode;
        /*
           첫 실행 시 front->NULL로 초기화를 한 상태이므로 처음엔 무조건 첫 if문을 실행해서 front와 rear을 첫 노드(inode)로 연결
        */
    }
    else {
        rear->next = inode;
        rear = inode;//rear값 = 전에 넣었던 값, inode = 지금 넣은 값
        /*
            첫 if문을 실행한 이후부터는 front->NULL 값을 갖지 않고 inode라는 값을 갖기 때문에 else문을 실행시킴
            그렇게 첫 스코프를 빠져나가서 inode가 사라지고, i 값이 올라 for문에서 다시 실행을 한 경우 
            QueueNode * inode = (QueueNode*)malloc(sizeof(QueueNode));로 inode를 다시 할당받고 rear이 마지막으로 연결된 inode를 가리킴
            그리고 raer에 inode를 삽입
        */
    }
}

element deleteqlist()
{
    element item;//element타입의 item생성
    QueueNode* dtmp;//dtmp가 QueueNnode의 주소값을 가짐

    if (front == NULL) {
        printf("Queue is Empty");
        exit(1);
    }
    else {
        dtmp = front;//QueueNode의 주소값이 front값을 가짐
        item = front->qdata;//front 포인터가 qdata 주소값을 갖고, 이를 item에 삽입
        front = front->next;//front를 다음 노드를 가르키도록 함
        free(dtmp);//dtmp의 할당을 반환함
        return item;//item값을 리턴함
    }
}

void printlist()
{
    QueueNode* q = front;//포인터q가 front의 주소를 나타냄

    while (q != NULL) {

        printf("%d\t%c\n", q->qdata.job_num, q->qdata.grade);
        q = q->next;
    }
        /*
            q가 NULL 값을 나타내기 전까지 실행
            qdata구조체의 값을 출력
            q가 q의 next 값을 가지며 다음 노드의 주솟값을 나타냄
        */
}