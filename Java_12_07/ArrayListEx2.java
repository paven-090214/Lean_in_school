import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListEx2 {

	public static void main(String[] args) {
		ArrayList<String> a = new ArrayList<String>();
		
		Scanner scanner = new Scanner(System.in);
		for(int i = 0; i < 4; i ++) {
			System.out.print("이름 : ");
			String s = scanner.next();
			a.add(s);
		}
		for(int i = 0; i < a.size(); i++) {
			String name = a.get(i);
			System.out.println(name + ", ");
		}
		
		int longestindex = 0;
		for(int i = 0; i < a.size(); i++) {
			if(a.get(longestindex).length() < a.get(i).length())
				longestindex = i;
		}
		System.out.println("가장 긴 이름 : " + a.get(longestindex));
		
	}

}
