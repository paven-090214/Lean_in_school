abstract class Calc{
	abstract int add(int a, int b);
	abstract int sub(int a, int b);
	abstract double average(int[] arr);
}

class GoodCal extends Calc{

	@Override
	int add(int a, int b) {
		return a + b;
	}

	@Override
	int sub(int a, int b) {
		return a - b;
	}
	
	@Override
	double average(int[] arr) {
		double sum = 0;
		for(int item : arr) {
			sum += item;
		}
		return sum / arr.length;
	}
	
}

public class GoodCalcEx {

	public static void main(String[] args) {
		GoodCal gc1 = new GoodCal();
		System.out.println(gc1.add(1,  2));
		System.out.println(gc1.sub(2,  4));
		int[] arr = {2, 3, 4};
		System.out.println(gc1.average(arr));
	}

}
