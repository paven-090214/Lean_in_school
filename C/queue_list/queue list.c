#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct {
	int st_id;
	char st_grade;
} st_struct;

typedef struct node {
	st_struct queue_data;
	struct node* next;
} queue_node;

queue_node *front = NULL,*rear = NULL;

void add_queue(st_struct item){
	queue_node* inode = (queue_node*)malloc(sizeof(queue_node));//
	inode->queue_data = item;//
	inode->next = NULL;
	if (front == NULL) {
		front = rear = inode;//ù ������ �߱� ������ ���Ḯ��Ʈ�� �������, front, rear ��� inode�� ���ϰ� ����
	}
	else {
		rear->next = inode;//rear->next = inode;: ���� rear�� ����Ű�� ����� next�� ���ο� ��� inode�� �����մϴ�. �̰��� ���� ť�� ������ ��� ������ ���ο� ��带 �߰��ϴ� ���� �ǹ��մϴ�.
		rear = inode;//rear = inode;: rear�� ���ο� ��� inode�� ������Ʈ�մϴ�. �̰��� ť�� rear�� ���� �߰��� ���� �̵���ŵ�ϴ�. �̷ν� ���ο� ��尡 ť�� ���� ��ġ�ϰ� �˴ϴ�.
		//rear->next = inode;���� �ļ����� �ۼ�
	}
}

void print_list() {
	queue_node* print = front;//

	while (print != NULL) {
		printf("%d\t%c\n", print->queue_data.st_id, print->queue_data.st_grade);//
		print = print->next;//
	}
}

void return_queue() {

}

int main() {
	st_struct tmp;
	int num = 0, grade_A = 0, n;
	printf("�������� �� : ");
	scanf("%d", &n);

	for (; num < n; num++) {
		printf("�л��� ��ȣ�� ���� : ");
		scanf("%d %c", &tmp.st_id, &tmp.st_grade);
		add_queue(tmp);
	}
	print_list();

	printf("ù��° ��带 ���� ��, ������ ��忡 �ٽ� ����");


	printf("A����� �л� �� : ");
	for (n = 0; n < num; n++) {

		if (tmp.st_grade == 'A') {
			grade_A++;
		}
	}
}