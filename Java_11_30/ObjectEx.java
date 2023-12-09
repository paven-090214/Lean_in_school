class Object{
	private int x;
	private int y;
	public Object(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
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
		return "Object [x=" + x + ", y=" + y + "]";
	}
	
}

public class ObjectEx {

	public static void main(String[] args) {
		Object obj1 = new Object(1, 2);
		
		System.out.println(obj1);

		obj1.setX(2);
		obj1.setY(5);
		
		System.out.println(obj1);
	}

}
