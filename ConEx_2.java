class A2{
	public A2(){
		System.out.println("������A");
	}
	public A2(int x) {
		System.out.println("�Ű�����������A");
	}
}

class B2{
	public B2(){
		System.out.println("������B");
	}
	public B2(int x) {
		System.out.println("�Ű�����������B");
	}
}

public class ConEx_2 {

	public static void main(String[] args) {
		B2 b2 = new B2(5);
	}

}
