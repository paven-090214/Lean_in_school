#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct data{
	int st_id;
	char st_grade;
}data;

typedef struct node {
	data st_data;
	struct node* next;
}stack_node;

stack_node* top = NULL;

void add_node(data item) {
	stack_node* inode = (stack_node*)malloc(sizeof(stack_node));
	inode->next = NULL;
	inode->st_data = item;
	if (top == NULL) {
		top = inode;
	}
	else {
		top->next = inode;
		top = inode;
	}
}

void return_stack() {
	stack_node* return_data = (stack_node*)malloc(sizeof(stack_node));
	if (top == NULL) {
		printf("�����Ͱ� ����\n");
		exit(1);
	}
	else {
		return_data = top;
		printf("%d, %c\n", return_data->st_data.st_id, return_data->st_data.st_grade);
		top = top->next;
		free(return_data);
	}
}

void print_stack() {
	stack_node* print = top;
	while (print != NULL) {
		printf("%d, %c\n", print->st_data.st_id, print->st_data.st_grade);
		print = print->next;
	}
}

int main() {
	int num = 0;
	data tmp;
	printf("1. ��ũ �߰�\n2. ������ ����\n3. ������ Ȯ��\n4. ����\n");
	while (1) {
		printf(">>");
		scanf("%d", &num);
		if (num == 1) {
			printf("�л� id : ");
			scanf("%d", &tmp.st_id);
			getchar();
			printf("�л� ���� : ");
			scanf("%c", &tmp.st_grade);
			add_node(tmp);
		}
		else if (num == 2) {
			return_stack();
		}
		else if (num == 3) {
			print_stack();
		}
		else if (num == 4) {
			return 0;
		}
		else {
			printf("��ȣ�� �߸��Է��ϼ̽��ϴ�.\n");
		}
		num = 0;
	}
}