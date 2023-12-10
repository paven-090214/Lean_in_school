#include<stdio.h>
#include<stdlib.h>

typedef struct {
	int data;
	struct element* next;
} element;

void add_node(element* head, int index, int data) {
	int num = index;
	element* ptr_node = head;
	element* insert_node = (element*)malloc(sizeof(element));
	insert_node->data = data;

	while (ptr_node != NULL) {
		ptr_node = ptr_node->next;
	
		if (ptr_node == NULL) {

		}
	}
}
element* head = NULL;

int main() {
	element* head = (element*)malloc(sizeof(element));
	head->data = 0;
	head->next = NULL;
}
//https://codejin.tistory.com/136