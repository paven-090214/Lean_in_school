#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct exnode* expointer;//exnode ����ü ������ ���� expointer ����
struct exnode {
    char state[3];//3ũ���� ���ڿ� ����
    int sdata;//���� sdata����
    expointer nlink;//������ nlik ����
};

void make_list1(expointer inode);
void make_list2(expointer inode);
void print_list();

expointer head = NULL;//����� �ּڰ��� �ʱ�ȭ��Ŵ
main()
{
    expointer inode;//�����͸� �����ϱ����� ������
    int k;//�ݺ� Ƚ�� ���� k
    char ltype;//if�� ����

    head = (expointer)malloc(sizeof(struct exnode));//head�� ���ο� �Ҵ���
    strcpy(head->state, "NY");//head�� state�� ���� ���ڿ� "NY"�� �Ҵ�
    head->sdata = 5;//head�� stada�� 5�� �Ҵ�
    head->nlink = NULL;//��尡 ����Ű�� ������ nlink�� �ּڰ��� �ʱ�ȭ��Ŵ

    printf("Select linked list type ?(q/s)");//ltype�� 'q'�Ǵ� 's'�� ����
    ltype = getchar();//���� ����

    for (k = 0; k < 3; k++) {//k��ŭ �ݺ���Ű�� for��
        inode = (expointer)malloc(sizeof(struct exnode));//inode��� expointerŸ������ �Ҵ����
        printf("Enter state_name and order : ");//�������� ���� �Է� ����
        scanf("%s %d", (inode->state), &(inode->sdata));//���� �Ҵ���
        if (ltype == 'q')//'q'�� ���� ���
            make_list1(inode);//make_list1()�Լ��� �����Ŵ(inode)���� ������
        else if (ltype == 's')
            make_list2(inode);
        else printf("Type Error----\n"); // exeption handling
    }
    printf("==============================\n");
    print_list();
}

void make_list1(expointer inode)//�����Լ����� inode�� inode��� �̸����� ����ü�� ������
{
    expointer ptr = head, before=NULL;//ptr�� �ּڰ��� head�� ����Ű���� ��, before�� �ּڰ��� �ʱ�ȭ��Ŵ

    while (ptr != NULL) {//ptr�� �ּڰ��� NULL�� ����ų�� ���� while���� ������
        before = ptr;//defore�� ptr�� �ּڰ��� ���´�
        ptr = ptr->nlink;//ptr�� ���� ����� �ּڰ��� ���´�.
    }
    before->nlink = inode;//inode�ּڰ��� before�� �ּڰ��̵�
    inode->nlink = NULL;//inode�� �ּڰ��� NULL�� �ʱ�ȭ��Ŵ -> inode�ּڰ��� before�� �ּڰ��̵�
}// -> ť

void make_list2(expointer inode)//inode�� ����
{
    inode->nlink = head;//inode�� nlink�� �ּڰ��� head�� ����
    head = inode;//head�� ���� inode�� �Ҵ�
}// -> ����

void print_list()
{
    expointer ptr = head;//ptr�� head�� �ּڰ��� ����Ŵ
    printf("The singly linked list contains : \n");
    while (ptr != NULL) {//ptr�� NULL�� ����ų�� ���� �ݺ�
        printf("%s  :  %d\n", ptr->state, ptr->sdata);//ptr�� state, sdata�� ���
        ptr = ptr->nlink;  //ptr�� �ּڰ��� ���� ����� �ּڰ����� ������
    }
}