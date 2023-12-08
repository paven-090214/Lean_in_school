class ColorPoint extends Point{
	private String color;
	ColorPoint(int x, int y, String color){
		super(x, y);
		//super.x = x;
		//super.y = y;
	}
	ColorPoint(){}
	void setColor(String color) {
		this.color = color;
	}
	public void showColorPoint() {
		System.out.println(color);
		showPoint();
	}
}
