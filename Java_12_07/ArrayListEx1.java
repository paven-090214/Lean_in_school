
import java.util.ArrayList;



public class ArrayListEx1 {

	public static void main(String[] args) {
		ArrayList<Integer> intList = new ArrayList<Integer>();
		
		intList.add(100);
		intList.add(200);
		intList.add(314);
		intList.add(400);
		intList.add(2, 300);
		System.out.println(intList);
		//���, �հ� ���ϱ�
		//��� 1
		int sum = 0;
		for(int i = 0; i < intList.size(); i++) {
			sum = sum + intList.get(i);
		}
		System.out.print("�հ� : " + sum + ", ��� : " + (double)sum/intList.size());
		
		//��� 2
		for(Integer one : intList)
		{
			sum += one;
		}

		System.out.print("\n�հ� : " + sum + ", ��� : " + (double)sum/intList.size());
		
		
	}

}
