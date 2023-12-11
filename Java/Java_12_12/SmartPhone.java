interface  PhoneInterface{
	//void sendCall(); void receiveCall(); 	void sendSMS();	void receiveSMS();	void mp3Play();	void mp3Stop(); 가 있다. 
	void sendCall();
	void receiveCall();
	void sendSMS();
	void receiveSMS();
	void mp3Play();
	void mp3Stop();
}

class Phone implements PhoneInterface{
	//Phone에는 폰번호, 제조사, 가격 등의 정보가 저장되어 있다.
	
	private int num;
	private int price;
	private String name;
	
	public Phone(int num, int price, String name) {
		super();
		this.num = num;
		this.price = price;
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public void sendCall() {
		System.out.println("전화 걸기");	
	}

	@Override
	public void receiveCall() {
		System.out.println("전화 받기");	
	}

	@Override
	public void sendSMS() {
		System.out.println("메세지 보내기");	
	}

	@Override
	public void receiveSMS() {
		System.out.println("메세지 받기");	
	}

	@Override
	public void mp3Play() {
		System.out.println("mp3 재생");	
	}

	@Override
	public void mp3Stop() {
		System.out.println("mp3 정지");
		
	}

	@Override
	public String toString() {
		return "Phone [num=" + num + ", price=" + price + ", name=" + name + "]";
	}
	
}


public class SmartPhone extends Phone {
		int memori_size;
		String type;
		String bluetooth;
		
		public SmartPhone(int num, int price, String name, int memori_size, String type, String bluetooth) {
			super(num, price, name);
			this.memori_size = memori_size;
			this.type = type;
			this.bluetooth = bluetooth;
		}


		@Override
		public String toString() {
			return super.toString() + "SmartPhone [memori_size=" + memori_size + ", type=" + type + ", bluetooth=" + bluetooth + "]";
		}


		public SmartPhone (int num, int price, String name){
			super(num, price, name);
		}
	
	
	public static void main(String[] args) {
		SmartPhone p1 = new SmartPhone(100, 200, "안수환", 123, "G5", "bluetooth");
		System.out.println(p1);
	}

}
