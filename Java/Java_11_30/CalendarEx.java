import java.util.*;

public class CalendarEx {

	public static void main(String[] args) {
		Calendar today = Calendar.getInstance();
		System.out.println(today);
		int yy = today.get(Calendar.YEAR);
		int mm = today.get(Calendar.MONTH);
		int day = today.get(Calendar.DAY_OF_MONTH);
		int hour = today.get(Calendar.HOUR);
		int minute = today.get(Calendar.MINUTE);
		
		System.out.println(yy + "년 " + mm + "월 " + day + "일 " + hour + "시 " + minute + "분 입니다.");
	}

}
