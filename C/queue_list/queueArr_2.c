#define _CRT_SECURE_NO_WARNINGS
#define MAX_SIZE 5
#include<stdio.h>

typedef struct {
	int num;
	char grade;
}data;

int front = 0, rear = 0;
data queue[MAX_SIZE];

data addArr(data item) {
	if (front == (rear + 1) % MAX_SIZE) {
		printf("큐가 가득 찼다.\n");
		exit(1);
	}
	else {
		queue[rear++] = item;
		return item;
	}
}

void delData() {
	if (rear == front) {
		printf("큐가 비어있습니다.\n");
	}
	else {
		front = (front + 1) % MAX_SIZE;
		queue[front];
	}
}

int main() {
	data temp;
	int i = 0, cond = 1;
	while (cond) {
		printf("완료한 작업 수 :  ");
		scanf("%d", &i);
		for (int j = 0; j < i; j++) {
			printf("완료한 작업번호와 작업상태 : ");
			scanf("%d %c", &temp.num, &temp.grade);
			addArr(temp);
		}
		printf("몇개의 데이터를 삭제하시겠습니까? : ");
		scanf("%d", &i);
		for (int j = 0; j < i; j++) {
			delData();
		}
		printf("작업을 계속 하시겠습니까? (1 / 0) : ");
		scanf("%d", &cond);
	}
	printf("front : %d, rear : %d", front, rear);
}