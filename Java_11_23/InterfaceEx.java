class SmartPhone extends PDA implements MobilePhoneInterface, MP3Interface{

	@Override
	public void sendCall() {
		System.out.println("������");
		
	}

	@Override
	public void receiveCall() {
		System.out.println("��ȭ ����");
		
	}

	@Override
	public void play() {
		System.out.println("���");
	}

	@Override
	public void stop() {
		System.out.println("����");
	}

	@Override
	public void sendSMS() {
		System.out.println("���� ����");
		
	}

	@Override
	public void receive() {
		System.out.println("���� ��");
	}
	
	public void schedule() {
		System.out.println("������ �����մϴ�.");
	}
	
}

public class InterfaceEx {

	public static void main(String[] args) {
		SmartPhone phone = new SmartPhone();
		phone.sendCall();
		phone.play();
		System.out.println("3�� 5�� ���ϸ�" + phone.calculate(3, 5));
		phone.schedule();
	}

}
