#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

typedef struct {//����ü ����
	int job_num;
	char grade;
} element;

typedef struct node {//element, next����
	element qdata;
	struct node* next;
} QueueNode;

QueueNode * rear = NULL, *front = NULL;
void addqlist(element item);
element deleteqlist();
void printlist();

main()
{
    int i, job_num, gradeA = 0;
    element temp;

    printf("���� �۾��� �۾� ����? ");
    scanf("%d", &job_num);

    printf("�۾���ȣ�� �۾����� �Է� :\n");
    for (i = 0; i < job_num; i++) {
        scanf("%d %c", &temp.job_num, &temp.grade);//
        addqlist(temp);
    }

    printf("\n ���� ť ���� ������ = \n");
    printlist();

    printf("\n 1�� ���� �� ���� ���� �׽�Ʈ\n");
    temp = deleteqlist();//������ item�� ���� temp�� ����, ù��° ��尡 �����
    addqlist(temp);//����� �������� temp�� ���� �ٽ� �־��ְ�, rear�� temp���� ����Ű���� ����鼭 ù��° ���� ���������� ���� ��
    printlist();

    printf("A����� ��ǰ��ȣ = ");
    for (i = 0; i < job_num; i++) {
        temp = deleteqlist();//���Ḯ��Ʈ���� ù��° (front�� ����Ű��)��带 temp�� ���Ͻ�Ŵ�� ���ÿ� �Ҵ��� ������
        if (temp.grade == 'A') {
            printf("%d\t", temp.job_num);
            gradeA++;
        }
        else
            addqlist(temp);//A�� �ƴ϶�� ���Ḯ��Ʈ �������� �ٽ� ���� �߰���
    }
    printf("\nA ����� ��ǰ�� %d���Դϴ�. \n", gradeA);
    printf("%d ���� ��� A ���� �� ť ���� ������ = \n", gradeA);
    printlist();
}

void addqlist(element item)
{
    QueueNode * inode = (QueueNode*)malloc(sizeof(QueueNode));
    inode->qdata = item;
    inode->next = NULL;
    if (front == NULL) {//ó������ ��带 ������ ���, front,rear�� = NULL
        front = rear = inode;
        /*
           ù ���� �� front->NULL�� �ʱ�ȭ�� �� �����̹Ƿ� ó���� ������ ù if���� �����ؼ� front�� rear�� ù ���(inode)�� ����
        */
    }
    else {
        rear->next = inode;
        rear = inode;//rear�� = ���� �־��� ��, inode = ���� ���� ��
        /*
            ù if���� ������ ���ĺ��ʹ� front->NULL ���� ���� �ʰ� inode��� ���� ���� ������ else���� �����Ŵ
            �׷��� ù �������� ���������� inode�� �������, i ���� �ö� for������ �ٽ� ������ �� ��� 
            QueueNode * inode = (QueueNode*)malloc(sizeof(QueueNode));�� inode�� �ٽ� �Ҵ�ް� rear�� ���������� ����� inode�� ����Ŵ
            �׸��� raer�� inode�� ����
        */
    }
}

element deleteqlist()
{
    element item;//elementŸ���� item����
    QueueNode* dtmp;//dtmp�� QueueNnode�� �ּҰ��� ����

    if (front == NULL) {
        printf("Queue is Empty");
        exit(1);
    }
    else {
        dtmp = front;//QueueNode�� �ּҰ��� front���� ����
        item = front->qdata;//front �����Ͱ� qdata �ּҰ��� ����, �̸� item�� ����
        front = front->next;//front�� ���� ��带 ����Ű���� ��
        free(dtmp);//dtmp�� �Ҵ��� ��ȯ��
        return item;//item���� ������
    }
}

void printlist()
{
    QueueNode* q = front;//������q�� front�� �ּҸ� ��Ÿ��

    while (q != NULL) {

        printf("%d\t%c\n", q->qdata.job_num, q->qdata.grade);
        q = q->next;
    }
        /*
            q�� NULL ���� ��Ÿ���� ������ ����
            qdata����ü�� ���� ���
            q�� q�� next ���� ������ ���� ����� �ּڰ��� ��Ÿ��
        */
}