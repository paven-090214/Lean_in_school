public interface PhoneInterface {
	int TIMEOUT = 10000;
	void sendCall();
	void receiveCall();
	default void printLogo() {
		System.out.println("**phone**");
	}
}

interface MobilePhoneInterface extends PhoneInterface{
	void sendSMS();
	void receive();
}

interface MP3Interface{
	public void play();
	public void stop();
}

class PDA{
	public int calculate(int x, int y) {
		return x + y;
	}
}



class SamsungPhone implements PhoneInterface {

	@Override
	public void sendCall() {
		System.out.println("갤럭시 전화 걸었음");
	}

	@Override
	public void receiveCall() {
		System.out.println("갤럭시 전화 왔음");
		
	}
	
}

class IPhone implements PhoneInterface {

	@Override
	public void sendCall() {
		System.out.println("아이폰 전화 걸었음");
	}

	@Override
	public void receiveCall() {
		System.out.println("아이폰 전화 왔음");
		
	}
	
}