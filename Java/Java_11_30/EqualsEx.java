import java.lang.Object.*;
class Point{
	private int x;
	private int y;
	public Point(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
	
	public boolean equals(Point obj) {
		Point p = (Point)obj;
		if(x * y == p.x * p.y)
			return true;
		else
			return false;
	}
	
}
public class EqualsEx {

	public static void main(String[] args) {
		Point p1 = new Point(3, 4);
		Point p2 = new Point(2, 2);
		Point p3 = new Point(2, 2);
		System.out.println(p1.equals(p2));
		System.out.println(p2.equals(p3));

	}

}
