package javaBean;

public class GradeBean {
	private String name;
	private int point;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

	public String getGrade() {
		String dg = "";
		if (point >= 90) {
			dg = "A";
		}
		else if (point >= 80) {
			dg = "B";
		}
		else if (point >= 70) {
			dg = "C";
		}
		else {
			dg = "F";
		}
		return dg;
	}
}

