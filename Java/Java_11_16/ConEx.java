class A{
	public A() {
		System.out.println("»ý¼ºÀÚ A");
	}
}

class B extends A{
	public B() {
		System.out.println("»ý¼ºÀÚ B");
	}
}

class C extends B{
	public C() {
		System.out.println("»ý¼ºÀÚ C");
	}
}

public class ConEx {
	public static void main(String[] args) {
		C c = new C();

	}

}
