import java.util.*;

interface StudentInterface{
		public static final String SW="컴공부 컴소과";
		public static final String AI="컴공부 인공지능학과";
		public static final String ECO="경영학부 경영학과";
		public static final String DES="디자인학부 생활디자인과";
		
		String getResult();
		String getDept();
}

class Person{
	private String name;
	private String addr;
	
	Person(){}
	public Person(String name, String addr) {
		super();
		this.name = name;
		this.addr = addr;
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

}

class Student extends Person implements StudentInterface{
	private int st_id;
	private int grade;
	private int major;
	public Student(String name, String addr, int st_id, int grade, int major) {
		super(name, addr);
		this.st_id = st_id;
		this.grade = grade;
		this.major = major;
	}
	
	
	public int getSt_id() {
		return st_id;
	}


	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public int getMajor() {
		return major;
	}


	public void setMajor(int major) {
		this.major = major;
	}


	@Override
	public String getResult() {
		if(grade >= 80) {
			return "참 잘했어요";
		}
		else {
			return "ㄲㅂ";
		}
	}
	@Override
	public String toString() {
		return "Student [st_id=" + st_id + ", grade=" + grade + ", major=" + major + ", getResult()=" + getResult()
				+ ", getDept()=" + getDept() + "]";
	}
	@Override
	public String getDept() {
		if(major == 1100) return Student.SW;
		if(major == 1200) return Student.AI;
		if(major == 1300) return Student.DES;
		if(major == 1400) return Student.ECO;
		return "기타 학과";
	}
	
}

public class PrintStudent {
	
	public static void main(String[] args) {
		ArrayList<Student> mylist = new ArrayList();
		Student s1 = new Student("안수환", "부천",1 ,90 ,1100);
		Student s2 = new Student("권수환", "광명",2 ,100 ,1100);
		Student s3 = new Student("안진호", "부천",3 ,60 ,1200);
		Student s4 = new Student("김도현", "일본",4 ,1 ,1300);
		mylist.add(s1);
		mylist.add(s2);
		mylist.add(s3);
		mylist.add(s4);
		for(Student arr : mylist) {
			if(arr.getGrade() >= 80) {
				System.out.println(arr.getName() + ", " + arr.getResult() + " <- 우수 성적 학생");
			}
		}
		for(Student arr : mylist) {
			if(arr.getAddr() == "일본") {
				System.out.println(arr.getName() + " <-- 이분 일본 사람임");
			}
		}
	}

}
