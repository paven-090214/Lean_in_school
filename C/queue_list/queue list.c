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
		front = rear = inode;//첫 실행을 했기 때문에 연결리스트가 비어있음, front, rear 모두 inode를 향하게 만듬
	}
	else {
		rear->next = inode;//rear->next = inode;: 현재 rear가 가리키는 노드의 next를 새로운 노드 inode로 설정합니다. 이것은 현재 큐의 마지막 노드 다음에 새로운 노드를 추가하는 것을 의미합니다.
		rear = inode;//rear = inode;: rear를 새로운 노드 inode로 업데이트합니다. 이것은 큐의 rear를 새로 추가된 노드로 이동시킵니다. 이로써 새로운 노드가 큐의 끝에 위치하게 됩니다.
		//rear->next = inode;보다 후순위로 작성
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
	printf("데이터의 수 : ");
	scanf("%d", &n);

	for (; num < n; num++) {
		printf("학생의 번호와 성적 : ");
		scanf("%d %c", &tmp.st_id, &tmp.st_grade);
		add_queue(tmp);
	}
	print_list();

	printf("첫번째 노드를 삭제 후, 마지막 노드에 다시 연결");


	printf("A등급의 학생 수 : ");
	for (n = 0; n < num; n++) {

		if (tmp.st_grade == 'A') {
			grade_A++;
		}
	}
}