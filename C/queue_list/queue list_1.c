#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>

typedef struct {
	int st_id;
	char grade;
}st_data;

typedef struct element {
	st_data st_element;
	struct element* next;
}queue_node;

queue_node* front = NULL, * rear = NULL;//queue_node로 정의

void add_node(st_data item) {
	queue_node* inode = (queue_node*)malloc(sizeof(queue_node));
	inode->next = NULL;
	inode->st_element = item;

	if (front == NULL){
		front = rear = inode;
		}
	else {
		rear->next = inode;//순서 바뀌면 안됨
		rear = inode;
	}
}

void delete_queue() {
	st_data element;
	queue_node* free_node = front;
	if (front == NULL) {
		printf("큐가 비어있습니다.\n");
	}
	else {
		printf("%d\t%c\n", free_node->st_element.st_id, free_node->st_element.grade);
		element = front->st_data;
		front = front->next;
		free(free_node);
	}
}

void check_list() {
	queue_node* print = front;
	while (print != NULL) {
		printf("%d\t%c\n", print->st_element.st_id, print->st_element.grade);
		print = print->next;
	}
}

int main() {
	int cond = 1, num = 0;
	st_data tmp;

	printf("데이터 추가 : 1\n데이터 삭제 : 2\n데이터 확인 : 3\n종료 : 4\n");
	while (1) {
		printf(">> ");
		scanf("%d", &num);
		if (num == 1) {
			printf("학생의 id : ");
			scanf("%d", &tmp.st_id);
			getchar();
			printf("학생의 성적 : ");
			scanf("%c", &tmp.grade);
			add_node(tmp);
		}
		else if (num == 2) {//2를 입력하면 스택에서 1개의 데이터를 삭제하고, 삭제한 데이터를 콘솔에 보여준다.
			delete_queue();
		}
		else if (num == 3) {
			check_list();
		}
		else if (num == 4) {
			return 0;
		}
		num = 0;
	}
}
