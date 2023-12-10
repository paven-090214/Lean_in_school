#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct node {
	int data;
	char grade;
	struct node* next;
	//element* next;
}element;

int main() {
	element* head = (element*)malloc(sizeof(element));
	head->data = 10;
	head->grade = 'A';
	head->next = NULL;
	element* node_1 = (element*)malloc(sizeof(element));
	node_1->data = 20;
	node_1->grade = 'C';
	node_1->next = NULL;
	head->next = node_1;
	element* node_2 = (element*)malloc(sizeof(element));
	node_2->data = 30;
	node_2->grade = 'C';
	node_2->next = NULL;
	node_1->next = node_2;
	
	element* curr_1 = head->next;
	element* curr_2 = head->next;
	printf("%d, %c\n", head->data, head->grade);
	while (curr_1 != NULL) {
		printf("%d, %c\n", curr_1->data, curr_2->grade);
		curr_1 = curr_1->next;
		curr_2 = curr_2->next;
	}

	free(head);
	free(node_1);
	free(node_2);
}