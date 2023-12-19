import java.util.*;

interface StudentInterface{
	void StringName();
	void StringAddr();
	void StringGrade();
}

class StudentElement{
	private int st_id;
	protected String name;
	protected String grade;
	
	public StudentElement(int st_id, String name, String grade) {
		super();
		this.st_id = st_id;
		this.name = name;
		this.grade = grade;
	}

	public int getSt_id() {
		return st_id;
	}

	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}

class People extends StudentElement implements StudentInterface{
	private String addr;
	private String phone;
	private String price;
	public People(int st_id, String name, String grade, String addr, String phone, String price) {
		super(st_id, name, grade);
		this.addr = addr;
		this.phone = phone;
		this.price = price;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	@Override
	public void StringName() {
		System.out.println("이름 :" + name);
		
	}
	@Override
	public void StringAddr() {
		System.out.println("주소 : " + addr);
	}
	@Override
	public void StringGrade() {
		System.out.println("성적 : " + grade);
	}

	
}

public class SampleEx_1 extends People {
	private String num;
	


	public String getNum() {
		return num;
	}



	public void setNum(String num) {
		this.num = num;
	}



	public SampleEx_1(int st_id, String name, String grade, String addr, String phone, String price, String num) {
		super(st_id, name, grade, addr, phone, price);
		this.num = num;
	}



	@Override
	public String toString() {
		return "[번호=" + num + ", 주소=" + getAddr() + ", 핸드폰 기종=" + getPhone() + ", 가격="
				+ getPrice() + ", 학생 id=" + getSt_id() + ", 이름=" + getName() + ", 성적=" + getGrade()
				+ "]";
	}



	public static void main(String[] args) {
		ArrayList<SampleEx_1> list = new ArrayList();
		SampleEx_1 p1 = new SampleEx_1(1, "안수환", "A", "부천", "안드로이드", "1만원", "1번");
		SampleEx_1 p2 = new SampleEx_1(2, "권수환", "B", "광명", "애플", "5만원", "2번");
		SampleEx_1 p3 = new SampleEx_1(3, "안진호", "C", "서울", "안드로이드", "2만원", "3번");
		
		list.add(p1);
		list.add(p2);
		list.add(p3);
		
		System.out.println("모든 배열");
		for(SampleEx_1 arr : list) {
			System.out.println(arr);
		}

		System.out.println("기종 : 안드로이드");
		for(SampleEx_1 arraylist : list) {
			if(arraylist.getPhone() == "안드로이드") {
				System.out.println(arraylist);
			}
		}
		System.out.println("학생 id가 2보다 큼");
		for(SampleEx_1 List : list) {
			if(List.getSt_id() > 2) {
				System.out.println(List);
			}
		}
		System.out.println("번호가 2번");
		for(SampleEx_1 arr : list) {
			if(arr.getNum() == "2번") {
				System.out.println(arr);
			}
		}
	    for (SampleEx_1 ListInterface : list) {//list는 배열의 형태이기 때문에, 인터페이스를 부를 경우에도 배열로 불러야 한다.
	    	ListInterface.StringName(); // StudentInterface의 메서드 호출
	    	ListInterface.StringAddr(); // StudentInterface의 메서드 호출
	    	ListInterface.StringGrade(); // StudentInterface의 메서드 호출
	    }
		
	}

}
