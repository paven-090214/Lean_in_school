import java.util.*;
public class HashMapScoreEx {

	public static void main(String[] args) {
		HashMap<String, Integer> javaScore = new HashMap<String, Integer>();
		javaScore.put("�Ǽ�ȯ", 93);
		javaScore.put("�ȼ�ȯ", 94);
		javaScore.put("������", 95);
		javaScore.put("�̽¹�", 96);
		
		System.out.println("HashMap�� ��� ���� : " + javaScore.size());
		
		Set<String> keys = javaScore.keySet();
		
		Iterator<String> it = keys.iterator();
		
		while(it.hasNext()) {
			String name = it.next();
			int score = javaScore.get(name);
			System.out.println(name + ", " + score);
		}
		
	}

}
