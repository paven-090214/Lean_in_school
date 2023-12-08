
public class Point {
	private int x, y;
	Point() {}
	Point(int x, int y){
		this.x = x;
		this.y = y;
	}
//	public void set(int x, int y) {
//		this.x = x;
//		this.y = y;
//	}
	public void showPoint() {
		System.out.println(x + ", " + y );
	}
	
	public static void main(String[] args) {
		Point p1 = new Point(1, 2);
//		p1.set(1, 2);
		p1.showPoint();
		
		ColorPoint cp = new ColorPoint(3, 4, "»¡°­");
//		cp.set(3,  4);
//		cp.setColor("»¡°­");
		cp.showColorPoint();
		
	}

}
