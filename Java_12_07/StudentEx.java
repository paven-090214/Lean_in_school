import java.util.*;

class Student_element{
	private String name;
	private String addr;
	private int id;
	private int grade;
	public Student_element(String name, String addr, int id, int grade) {
		super();
		this.name = name;
		this.addr = addr;
		this.id = id;
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Student_element [name=" + name + ", addr=" + addr + ", id=" + id + ", grade=" + grade + "]";
	}
	
	
	
}
public class StudentEx {

	public static void main(String[] args) {
		ArrayList<Student_element> list = new ArrayList<>();
		
		Student_element sd1 = new Student_element("안수환", "부천", 20230882, 90);
		Student_element sd2 = new Student_element("권수환", "광명", 20230881, 100);
		
		list.add(sd1);
		list.add(sd2);
		/*
		for(int i = 0; i <list.size();i++) { 
			System.out.println(list(i));
		}
		 */
		// <- 안됨
		for(Student_element point : list) {
			System.out.println(point);
		}
		
		for(Student_element point : list) {
			if(point.getAddr().equals("부천")) {
				System.out.println(point);
			}
		}
		
		for(Student_element point : list) {
			if(point.getGrade() >= 85) {
				System.out.println(point);
			}
		}
	}
}
