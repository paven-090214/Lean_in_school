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
		printf("ť�� ���� á��.\n");
		exit(1);
	}
	else {
		queue[rear++] = item;
		return item;
	}
}

void delData() {
	if (rear == front) {
		printf("ť�� ����ֽ��ϴ�.\n");
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
		printf("�Ϸ��� �۾� �� :  ");
		scanf("%d", &i);
		for (int j = 0; j < i; j++) {
			printf("�Ϸ��� �۾���ȣ�� �۾����� : ");
			scanf("%d %c", &temp.num, &temp.grade);
			addArr(temp);
		}
		printf("��� �����͸� �����Ͻðڽ��ϱ�? : ");
		scanf("%d", &i);
		for (int j = 0; j < i; j++) {
			delData();
		}
		printf("�۾��� ��� �Ͻðڽ��ϱ�? (1 / 0) : ");
		scanf("%d", &cond);
	}
	printf("front : %d, rear : %d", front, rear);
}