class SmartPhone extends PDA implements MobilePhoneInterface, MP3Interface{

	@Override
	public void sendCall() {
		System.out.println("따르릉");
		
	}

	@Override
	public void receiveCall() {
		System.out.println("전화 왔음");
		
	}

	@Override
	public void play() {
		System.out.println("재생");
	}

	@Override
	public void stop() {
		System.out.println("정지");
	}

	@Override
	public void sendSMS() {
		System.out.println("문자 보냄");
		
	}

	@Override
	public void receive() {
		System.out.println("문자 옴");
	}
	
	public void schedule() {
		System.out.println("일정을 관리합니다.");
	}
	
}

public class InterfaceEx {

	public static void main(String[] args) {
		SmartPhone phone = new SmartPhone();
		phone.sendCall();
		phone.play();
		System.out.println("3과 5를 더하면" + phone.calculate(3, 5));
		phone.schedule();
	}

}
