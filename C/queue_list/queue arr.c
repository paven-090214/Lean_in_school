#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#define MAX_QUEUE_SIZE 10

typedef struct {
	int id;
	char grade;
} data;
//����ü ����

data queue[MAX_QUEUE_SIZE];//data Ÿ���� ����ü, �迭
int front = -1;
int rear = -1;
//�迭 ����

void add_queue(data item){//tmp�� ���� ����Ȱ��� item
	if (MAX_QUEUE_SIZE - 1 == rear) {
		printf("�����Ͱ� ��� á���ϴ�.\n");
	}
	else {
		queue[++rear] = item;
	}
}

data return_queue() {
	if (front == rear) {
		printf("���� �������� �ʽ��ϴ�.\n");
	}
	else {
		printf("��ȣ : %d\t���� : %c\n", queue[front], queue[front]);
		front++;
	}
}

int main() {
	data tmp;//data���� �־��� �ӽ� ����? ����
	int number = 0;
	printf("�ݺ� Ƚ�� : ");
	scanf("%d", &number);
	for (int i = 0; i < number; i++) {
		printf("�л��� ��ȣ : ");
		scanf("%d", &tmp.id);
		getchar();
		printf("�л��� ���� : ");
		scanf("%c", &tmp.grade);
		//tmp�� grade, st_id�� ���� ����
		add_queue(tmp);
	}
	printf("����� ����ü�� ���� : ");
	scanf("%d", &number);
	for (int i = 0; i < number; i++) {
		return_queue();
	}
}