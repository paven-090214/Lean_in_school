class A2{
	public A2(){
		System.out.println("생성자A");
	}
	public A2(int x) {
		System.out.println("매개변수생성자A");
	}
}

class B2{
	public B2(){
		System.out.println("생성자B");
	}
	public B2(int x) {
		System.out.println("매개변수생성자B");
	}
}

public class ConEx_2 {

	public static void main(String[] args) {
		B2 b2 = new B2(5);
	}

}
