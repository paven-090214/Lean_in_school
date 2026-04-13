package javaBean;

public class PersonBean {
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getResultAge() {
		String resultAge;
		if (age < 20) {
			resultAge = "미성년자";
		}
		else {
			resultAge = "성인";
		}
		return resultAge;
	}
}
