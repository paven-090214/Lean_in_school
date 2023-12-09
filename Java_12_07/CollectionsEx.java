import java.util.*;
public class CollectionsEx {

	public static void main(String[] args) {
		LinkedList<String> myList = new LinkedList<String>();
		myList.add("너의 이름은");
		myList.add("날씨의 아이");
		myList.add("Blue achive");
		myList.add("Leagu of Legends");
		
		System.out.println(myList);
		System.out.println("sort(정렬) 전------");
		
		Collections.sort(myList);
		System.out.println(myList);

		System.out.println("sort(정렬) 후------");
		
		Collections.reverse(myList);
		System.out.println(myList);

		System.out.println("reverse(값을 반대로 출력) 후------");
	}
	//sort : a, b, c, d... , ㄱ, ㄴ, ㄷ... 순으로 정렬 시킴
	//reverse : 값을 거꾸로 출력 시킴
}
