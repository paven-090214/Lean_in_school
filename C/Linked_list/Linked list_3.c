#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct node {
	int num;
	struct node* next;
} element;

element* head;

void copy_node(element* addnode, int data) {
	element* new_node = (element*)malloc(sizeof(element));
	new_node->next = head;
	new_node->num = data;
	printf("����� num�� �� : %d\n", new_node->num);
}

int main() {
	char node_name[20];
	int node_data;
	//���
	element* head = (element*)malloc(sizeof(element));
	head->num = 0;
	head->next = NULL;

	//��� 1
	element* node_1 = (element*)malloc(sizeof(element));
	node_1->next = NULL;
	node_1->num = 10;
	head->next = node_1;

	//��� 2
	element* node_2 = (element*)malloc(sizeof(element));
	node_2->next = NULL;
	node_2->num = 20;
	node_1->next = node_2;

	printf("����� �̸� : ");
	scanf("%s", &node_name);
	printf("����� ������ �� : ");
	scanf("%d",&node_data);

	copy_node(node_name, node_data);

	//���Ḯ��Ʈ ���
	element* print = head;
	while (print != NULL) {
		printf("���Ḯ��Ʈ ��� : %d\n", print->num);
		print = print->next;
	}
}