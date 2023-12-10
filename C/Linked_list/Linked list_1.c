#define _CTR_SECURE_NOT_WARNINGS
#include<stdio.h>
#include <stdlib.h>

typedef struct  element{//����ü ����
	int data;
	struct element* next;
} node;

int main() {
	node* head = (node*)malloc(sizeof(node));//head �Ҵ�
	head->next = NULL;//NULL������ ����
	node* node_1 = (node*)malloc(sizeof(node_1));//node_1 �Ҵ�
	node_1->next = NULL;//NULL������ ����
	node_1->data = 10;//node_1�� data�� 10 ����
	head->next = node_1;//head�� �������� node_1 ����
	node* node_2 = (node*)malloc(sizeof(node_2));//node_2 �Ҵ�
	node_2->next = NULL;
	node_2->data = 20;
	node_1->next = node_2;

	node* curr = head->next;
	while (curr != NULL) {
		printf("%d\n", curr->data);
		curr = curr->next;
	}

	free(node_1);
	free(node_2);
	free(head);
}