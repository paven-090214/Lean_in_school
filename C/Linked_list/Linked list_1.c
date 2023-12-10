#define _CTR_SECURE_NOT_WARNINGS
#include<stdio.h>
#include <stdlib.h>

typedef struct  element{//구조체 생성
	int data;
	struct element* next;
} node;

int main() {
	node* head = (node*)malloc(sizeof(node));//head 할당
	head->next = NULL;//NULL값으로 지정
	node* node_1 = (node*)malloc(sizeof(node_1));//node_1 할당
	node_1->next = NULL;//NULL값으로 지정
	node_1->data = 10;//node_1의 data에 10 저장
	head->next = node_1;//head가 다음으로 node_1 지정
	node* node_2 = (node*)malloc(sizeof(node_2));//node_2 할당
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