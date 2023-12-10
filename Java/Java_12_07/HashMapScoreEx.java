import java.util.*;
public class HashMapScoreEx {

	public static void main(String[] args) {
		HashMap<String, Integer> javaScore = new HashMap<String, Integer>();
		javaScore.put("권수환", 93);
		javaScore.put("안수환", 94);
		javaScore.put("마성혁", 95);
		javaScore.put("이승민", 96);
		
		System.out.println("HashMap의 요소 개수 : " + javaScore.size());
		
		Set<String> keys = javaScore.keySet();
		
		Iterator<String> it = keys.iterator();
		
		while(it.hasNext()) {
			String name = it.next();
			int score = javaScore.get(name);
			System.out.println(name + ", " + score);
		}
		
	}

}
