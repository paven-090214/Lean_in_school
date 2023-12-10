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
	printf("복사된 num의 값 : %d\n", new_node->num);
}

int main() {
	char node_name[20];
	int node_data;
	//헤드
	element* head = (element*)malloc(sizeof(element));
	head->num = 0;
	head->next = NULL;

	//노드 1
	element* node_1 = (element*)malloc(sizeof(element));
	node_1->next = NULL;
	node_1->num = 10;
	head->next = node_1;

	//노드 2
	element* node_2 = (element*)malloc(sizeof(element));
	node_2->next = NULL;
	node_2->num = 20;
	node_1->next = node_2;

	printf("노드의 이름 : ");
	scanf("%s", &node_name);
	printf("노드의 데이터 값 : ");
	scanf("%d",&node_data);

	copy_node(node_name, node_data);

	//연결리스트 출력
	element* print = head;
	while (print != NULL) {
		printf("연결리스트 출력 : %d\n", print->num);
		print = print->next;
	}
}