import java.util.*;
public class CollectionsEx {

	public static void main(String[] args) {
		LinkedList<String> myList = new LinkedList<String>();
		myList.add("���� �̸���");
		myList.add("������ ����");
		myList.add("Blue achive");
		myList.add("Leagu of Legends");
		
		System.out.println(myList);
		System.out.println("sort(����) ��------");
		
		Collections.sort(myList);
		System.out.println(myList);

		System.out.println("sort(����) ��------");
		
		Collections.reverse(myList);
		System.out.println(myList);

		System.out.println("reverse(���� �ݴ�� ���) ��------");
	}
	//sort : a, b, c, d... , ��, ��, ��... ������ ���� ��Ŵ
	//reverse : ���� �Ųٷ� ��� ��Ŵ
}
