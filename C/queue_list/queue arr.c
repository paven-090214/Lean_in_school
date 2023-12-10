#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#define MAX_QUEUE_SIZE 10

typedef struct {
	int id;
	char grade;
} data;
//구조체 생성

data queue[MAX_QUEUE_SIZE];//data 타입의 구조체, 배열
int front = -1;
int rear = -1;
//배열 생성

void add_queue(data item){//tmp의 값이 복사된것이 item
	if (MAX_QUEUE_SIZE - 1 == rear) {
		printf("데이터가 모두 찼습니다.\n");
	}
	else {
		queue[++rear] = item;
	}
}

data return_queue() {
	if (front == rear) {
		printf("값이 존재하지 않습니다.\n");
	}
	else {
		printf("번호 : %d\t성적 : %c\n", queue[front], queue[front]);
		front++;
	}
}

int main() {
	data tmp;//data값을 넣어줄 임시 깡통? 생성
	int number = 0;
	printf("반복 횟수 : ");
	scanf("%d", &number);
	for (int i = 0; i < number; i++) {
		printf("학생의 번호 : ");
		scanf("%d", &tmp.id);
		getchar();
		printf("학생의 성적 : ");
		scanf("%c", &tmp.grade);
		//tmp의 grade, st_id에 값을 삽입
		add_queue(tmp);
	}
	printf("출력할 구조체의 갯수 : ");
	scanf("%d", &number);
	for (int i = 0; i < number; i++) {
		return_queue();
	}
}