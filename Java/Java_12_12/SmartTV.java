interface TvInterface{
	void youtubePlay();
	void youtubeStop();
	void internetPlay();
	void internetStop();
}

class TV implements TvInterface{
	private int price;
	private int size;
	private String manufacturer;
	public TV(int price, int size, String manufacturer) {
		super();
		this.price = price;
		this.size = size;
		this.manufacturer = manufacturer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	@Override
	public void youtubePlay() {
		System.out.println("유튜브 재생");
	}
	@Override
	public void youtubeStop() {
		System.out.println("유튜브 정지");
	}
	@Override
	public void internetPlay() {
		System.out.println("인터페이스 재생");
	}
	@Override
	public void internetStop() {
		System.out.println("인터페이스 정지");
	}
	@Override
	public String toString() {
		return "TV [price=" + price + ", size=" + size + ", manufacturer=" + manufacturer + "]";
	}
	
}

public class SmartTV extends TV {
	String internet;
	String bluetooth;
	
	public SmartTV(int price, int size, String manufacturer, String internet, String bluetooth) {
		super(price, size, manufacturer);
		this.internet = internet;
		this.bluetooth = bluetooth;
	}

	@Override
	public String toString() {
		return super.toString() + "SmartTV [internet=" + internet + ", bluetooth=" + bluetooth + "]";
	}

	public static void main(String[] args) {
		SmartTV Tv1 = new SmartTV(120000, 23, "NAMSUNG", "internet", "bluetooth");
		
		System.out.println(Tv1);
	}

}
