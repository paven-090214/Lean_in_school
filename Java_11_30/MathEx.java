import java.util.*;
public class MathEx {

	public static void main(String[] args) {
		double a = 2.43;
		System.out.println(Math.PI); // PI 출력
		System.out.println(Math.ceil(a)); // ceil(올림)
		System.out.println(Math.floor(a)); // floor(내림)
		System.out.println(Math.sqrt(9)); // 제곱근
		System.out.println(Math.exp(2)); // e의 2승
		System.out.println(Math.round(3.14)); // 반올림
		for (int i = 0; i < 5; i++)
			System.out.print((int) (Math.random() * 2 ) + " ");//Math.random() * n -> 0 ~ n - 1 까지 랜덤으로 값을 반환함
		}

}
