
public class WrapperEx {

	public static void main(String[] args) {
		char c1 = '4', c2 = 'F';
		System.out.println(Character.toLowerCase(c2));//대문자가 소문자로 출력
		if(Character.isDigit(c1)) {
			System.out.println(c1 +" : c1 -> 숫자");
		}
		if(Character.isAlphabetic(c2)) {
			System.out.println(c2 + " : c2 -> 영문자");
		}
		System.out.println(Integer.parseInt("-123"));//문자가 숫자로 출력됨
		System.out.println(Integer.toBinaryString(28));//2진수 출력
		System.out.println(Integer.toHexString(28));//16진수 출력
		System.out.println(Integer.bitCount(28));//2진수에서의 1의 개수
		
		Double d = Double.valueOf(3.14);
		System.out.println(d.toString());//문자열로 변경
		System.out.println(Double.parseDouble("3.14"));//3.14문자열을 double타입으로 변환
		
		boolean b = (4>3);
		System.out.println(Boolean.toString(b));//b가 true면 ture를 문자열로 반환, false면 false를 문자열로 반환
		System.out.println(Boolean.parseBoolean("true1"));//true일 경우에만 true를 반환, 그 외의 경우에는 모두 false를 반환함
		
	}

}