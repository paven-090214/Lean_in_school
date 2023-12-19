import java.util.HashMap;

public class HashMapScoreEx {
    public static void main(String[] args) {
        // HashMap 생성
        HashMap<String, Integer> hashMap = new HashMap<>();

        // 값 추가
        hashMap.put("Java", 90);
        hashMap.put("Python", 95);
        hashMap.put("C++", 85);

        // 값 검색
        int javaScore = hashMap.get("Java");
        System.out.println("Java의 점수: " + javaScore);

        // 키 존재 여부 확인
        boolean containsKey = hashMap.containsKey("Python");
        System.out.println("Python 키 존재 여부: " + containsKey);

        // 모든 키 출력
        System.out.println("모든 키: " + hashMap.keySet());

        // 모든 값 출력
        System.out.println("모든 값: " + hashMap.values());

        // 모든 키-값 쌍 출력
        System.out.println("모든 키-값 쌍: " + hashMap.entrySet());

        // 값 수정
        hashMap.put("Java", 92);

        // 값 삭제
        hashMap.remove("C++");

        // 모든 키-값 쌍 반복 출력
        for (HashMap.Entry<String, Integer> entry : hashMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}
