public class DowncastingEx {

	public static void main(String[] args) {
		Person p = new Student("�ȼ�ȯ");
		Student s;
		
		s = (Student)p;
		System.out.println(s.name);
		s.grade = "A";
	}

}
