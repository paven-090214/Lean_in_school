
public class StringEx {

	public static void main(String[] args) {
		String a = new String ("C++");
		String b = new String("C#");
		
		System.out.println(a + " 의 문자열의 길이 : " + a.length());
		System.out.println(b + " 의 문자열의 길이 : " + b.length());
		
		System.out.println(a.contains("#"));//문자열에 #의 포하 여부
		System.out.println(b.contains("#"));
		
		a = a.concat(b);//문자열 연결
		System.out.println(a);
		
		a = a.trim();//문자열의 공백 제거
		System.out.println(a);
		
		a = a.replace("C++", "JAVA ");//문자열 변경
		System.out.println(a);
		

		System.out.println("배열 생성------------");
		String array[] = a.split(" ");//공백(띄어쓰기)로 배열의 행 변경을 기준으로 함
		//String array[] = a.split("#"); -> #을 배열의 행 변경 기준으로 함
		for(String arr : array) {
			System.out.println(arr);
		}
		
		a = a.substring(5);//인덱스 5부터 출력함
		System.out.println(a);
		
		char c = a.charAt(1);//1번째 인덱스의 값을 c에 리턴
		System.out.println(c);
		
	}

}
