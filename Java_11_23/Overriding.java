class Wepon{
	protected int fire() {
		return 1;
	}
}

class Canon extends Wepon{
	@Override
	protected int fire() {
		return 10;
	}
}

public class Overriding {

	public static void main(String[] args) {
		Wepon wp1 = new Wepon();
		wp1.fire();
		System.out.println("�⺻ Ŭ���� : " + wp1.fire());
		Wepon cn1 = new Canon();
		cn1.fire();
		System.out.println("�ڽ� Ŭ���� : " + cn1.fire());
	}
}
