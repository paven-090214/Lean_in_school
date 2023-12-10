#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct {
	int st_num;
	char grade;
}element;

typedef struct node {
	element data;
	struct node* next;
} stack_node;

void pushdata(element item) {
	element data;
}

int main() {
	element data;
	int n = 0, num = 0, cond = 1;
	while (cond) {
		printf("데이터 입력 : ");
		scanf("%d %o", &data.st_num, &data.grade);
		if (data.st_num != 0) {

		}
	}
		printf("스택에 데이터를 입력하시겠습니까? (1 / 0)\n");
}