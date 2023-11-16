
class Person{
	private String name;
	private String addr;
	private int phone;

	public Person(String name, String addr, int phone) {
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	
	public void showPerson() {
		System.out.println(name + addr + phone);
	}

}

class Student extends Person{
	private String school;
	private String stuid;
	
	public Student(String name, String addr, int phone, String school, String stuid) {
	super(name, addr, phone);
	this.school = school;
	this.stuid = stuid;
	}
	
	public void showStudent() {
		super.showPerson();
		System.out.println(school + stuid);
	}
}
public class StudentEx {
	
	public static void main(String[] args) {
		Student st1 = new Student("안수환", "경기도", 79349922, "동미대", "20230882");
		//st1.showPerson();
		st1.showStudent();
	}
}