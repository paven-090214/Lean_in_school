// 추상 클래스 정의
abstract class Shape {
    // 추상 메서드 선언
    abstract void draw();
    // 일반 메서드
    void display() {
        System.out.println("도형을 그립니다.");
    }
}
// 추상 클래스를 상속받은 구체 클래스
class Circle extends Shape {
    // 추상 메서드 구현
    @Override
    void draw() {
        System.out.println("원을 그립니다.");
    }
}
// 추상 클래스를 상속받은 다른 구체 클래스
class Rectangle extends Shape {
    // 추상 메서드 구현
    @Override
    void draw() {
        System.out.println("사각형을 그립니다.");
    }
}
public class AbstractClassExample {
    public static void main(String[] args) {
        // 추상 클래스는 직접 인스턴스를 생성할 수 없음
        // Shape shape = new Shape(); // 에러 발생
        // 추상 클래스를 상속받은 구체 클래스의 인스턴스 생성
        Circle circle = new Circle();
        Rectangle rectangle = new Rectangle();

        // 추상 메서드 호출
        circle.draw();
        rectangle.draw();

        // 일반 메서드 호출
        circle.display();
        rectangle.display();
    }
}
