#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct exnode* expointer;//exnode 구조체 포인터 변소 expointer 생성
struct exnode {
    char state[3];//3크기의 문자열 생성
    int sdata;//정수 sdata생성
    expointer nlink;//포인터 nlik 생성
};

void make_list1(expointer inode);
void make_list2(expointer inode);
void print_list();

expointer head = NULL;//헤드의 주솟값을 초기화시킴
main()
{
    expointer inode;//데이터를 보관하기위해 복사함
    int k;//반복 횟수 정수 k
    char ltype;//if문 결정

    head = (expointer)malloc(sizeof(struct exnode));//head를 메인에 할당함
    strcpy(head->state, "NY");//head의 state의 값에 문자열 "NY"를 할당
    head->sdata = 5;//head의 stada에 5를 할당
    head->nlink = NULL;//헤드가 가리키는 포인터 nlink의 주솟값을 초기화시킴

    printf("Select linked list type ?(q/s)");//ltype에 'q'또는 's'를 받음
    ltype = getchar();//문자 버퍼

    for (k = 0; k < 3; k++) {//k만큼 반복시키는 for문
        inode = (expointer)malloc(sizeof(struct exnode));//inode라는 expointer타입으로 할당받음
        printf("Enter state_name and order : ");//데이터의 값을 입력 받음
        scanf("%s %d", (inode->state), &(inode->sdata));//값을 할당함
        if (ltype == 'q')//'q'가 참일 경우
            make_list1(inode);//make_list1()함수를 실행시킴(inode)값을 복사함
        else if (ltype == 's')
            make_list2(inode);
        else printf("Type Error----\n"); // exeption handling
    }
    printf("==============================\n");
    print_list();
}

void make_list1(expointer inode)//메인함수에서 inode를 inode라는 이름으로 구조체를 복사함
{
    expointer ptr = head, before=NULL;//ptr의 주솟값이 head를 가리키도록 함, before의 주솟값을 초기화시킴

    while (ptr != NULL) {//ptr의 주솟값이 NULL을 가리킬때 까지 while문을 실행함
        before = ptr;//defore이 ptr의 주솟값을 갖는다
        ptr = ptr->nlink;//ptr이 다음 노드의 주솟값을 갖는다.
    }
    before->nlink = inode;//inode주솟값이 before의 주솟값이됨
    inode->nlink = NULL;//inode의 주솟값이 NULL로 초기화시킴 -> inode주솟값이 before의 주솟값이됨
}// -> 큐

void make_list2(expointer inode)//inode로 복사
{
    inode->nlink = head;//inode의 nlink의 주솟값을 head로 변경
    head = inode;//head의 값에 inode를 할당
}// -> 스택

void print_list()
{
    expointer ptr = head;//ptr이 head의 주솟값을 가리킴
    printf("The singly linked list contains : \n");
    while (ptr != NULL) {//ptr이 NULL을 가리킬때 까지 반복
        printf("%s  :  %d\n", ptr->state, ptr->sdata);//ptr의 state, sdata를 출력
        ptr = ptr->nlink;  //ptr의 주솟값이 다음 노드의 주솟값으로 변경함
    }
}