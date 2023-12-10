import java.util.*;

class Point {
    // 1. 필드
    private int x, y;

    // 2. 생성자
    public Point() {
    }

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // 3. 메소드
    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "Point [x=" + x + ", y=" + y + "]";
    }
}

public class ToStringEx {

	public static void main(String[] args) {
		Point p1 = new Point(2, 3);
		Point p2 = new Point(3, 4);
		Point p3 = new Point(1, 3);
		
		ArrayList<Point> list = new ArrayList<Point>();
		list.add(p1);
		list.add(p2);
		list.add(p3);
		//System.out.println(list);
		//x가 5보다 작은 점을 찾아 출력 (for each문) --> 중요
		for(Point point : list) {
			if(point.getX() > 5) {
				System.out.println(point);
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			Point point = list.get(i);
			if(point.getX() > 5) {
				System.out.println(point);
			}
		}
		
	}

}
