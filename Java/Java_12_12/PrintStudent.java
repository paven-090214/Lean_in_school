import java.util.*;

interface StudentInterface{
		public static final String SW="�İ��� �ļҰ�";
		public static final String AI="�İ��� �ΰ������а�";
		public static final String ECO="�濵�к� �濵�а�";
		public static final String DES="�������к� ��Ȱ�����ΰ�";
		
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
	@Override
	public String getResult() {
		if(grade >= 80) {
			return "�� ���߾��";
		}
		else {
			return "����";
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
		return "��Ÿ �а�";
	}
	
}

public class PrintStudent {
	
	public static void main(String[] args) {
		ArrayList<Student> mylist = new ArrayList();
		Student s1 = new Student("�ȼ�ȯ", "��õ",1 ,90 ,1100);
		Student s2 = new Student("�Ǽ�ȯ", "����",2 ,100 ,1100);
		Student s3 = new Student("����ȣ", "��õ",3 ,60 ,1200);
		Student s4 = new Student("�赵��", "�Ϻ�",4 ,1 ,1300);
		mylist.add(s1);
		mylist.add(s2);
		mylist.add(s3);
		mylist.add(s4);
		for(Student arr : mylist) {
			System.out.println(arr);
		}
	}

}
