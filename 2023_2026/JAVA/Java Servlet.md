# Java Servlet
## Java Servlet의 전체적인 흐름
> 사용자 -> 브라우저가 요청 ->서버가 처리후 응답 HTML 생성 -> 브라우저의 화면 출력
## 정적 페이지와 동적 페이지
### 정적 페이지
```
index.html
style.css
logo.png
script.js
```
이런 파일들은 서버가 특별히 계산하거나 Java 코드를 실행할 필요가 없어서 파일을 그대로 브라우저에 보낸다.

### 동적 페이지
```
login.jsp
mypage.jsp
board.jsp
orderList.jsp
```
이런 페이지들은 매번 같은 화면이 나오는 게 아닐 수 있다.  
이런 경우 JSP 같은 동적 페이지는 WAS/Tomcat이 Java코드를 실행해서 HTML을 만든 후 처리한다.
## Servlet
> Servlet은 서버에서 브라우저 요청을 처리하고 응답을 만들어주는 Java 클래스다.  
> 일반 Java 클래스는 계산, 객체 생성, 출력 같은 일반 작업을 한다면, Servlet은 웹 요청을 처리한다.
```
일반 Java 클래스
→ 일반 프로그램 로직 처리

Servlet 클래스
→ 브라우저 요청 처리
→ request 데이터 읽기
→ Java 로직 실행
→ response 응답 생성
```
## JSP파일이 변환된 Servlet의 구조
```Java
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        // 로그인 처리

        // 응답 생성
    }
}
```
- JSP파일의 안에는 처음부터 Servlet 코드가 존재하지 않는다.
- JSP의 HTML은 out.write("HTML문자열") 코드로 바뀐다.
- JSP 안의 Java 코드는 Servlet 메서드 안으로 들어간다.
```JSP
<h1>로그인 성공</h1>
<%= id %>
<%
String id = request.getParameter("id");
%>
```
 JSP 변환 과정
 ```Java
ut.write("<h1>로그인 성공</h1>");
out.write(id);
String id = request.getParameter("id");
```
## Servlet class
- .class 파일은 JVM이 실행할 수 있는 바이트코드 파일을 의미한다.  
- class 파일은 특정 사용자의 데이터가 아니라, 요청을 처리하는 방법을 담고 있다.  
- id, pw 값은 JSP 파일 안에 있는 게 아니다.  
- id, pw 값은 사용자가 submit한 요청의 request 객체 안에 있다.  
```
class 파일의 내부
1. HTML을 출력하는 코드
2. request에서 값을 꺼내는 코드
3. response에 결과를 쓰는 코드
4. JSP에서 작성한 Java 로직
```
## Servlet 객체
- Tomcat은 Servlet 클래스를 메모리에 올려 객체를 만든다.
- Tomcat은 요청이 들어오면 해당 Servlet 객체의 메서드를 실행한다.
## EX). 로그인 페이지 흐름
### 사용자가 처음 접속했을 경우
처음 요청이거나 JSP가 수정된 경우라면 Tomcat은 JSP를 Java 파일로 변환함.
```
login.jsp -> 변환 -> login_jsp.java  
```
Tomcat이 class파일을 메모리에 올림  
```
login_jsp.java -> 컴파일 -> login_jsp.class  
```
Tomcat이 request 객체와 response 객체를 만듦.  
```
login_jsp.class -> Servlet  
```
Servlet 객체의 _jspService(request, response)가 실행됨.
```
request = 이번 요청 정보
response = 이번 응답 정보
```
이때 처음 로그인 페이지에 들어온 상황이라면 아직 사용자가 id, pw를 입력하지 않았어.
```
request.getParameter("id");
request.getParameter("pw");
```
는 보통 `null`이다.
Servlet 객체는 JSP의 HTML 부분을 실행해서 로그인 폼 HTML을 만들어.
```HTML
<form action="login.jsp" method="post">
    <input type="text" name="id">
    <input type="password" name="pw">
    <button type="submit">로그인</button>
</form>
```
이 response를 통해 브라우저로 라서 로그인 화면을 부여준다.
### 사용자가 로그인 버튼을 눌렀을 경우
```
id = admin
pw = 1234
```
브라우저가 서버로 요청을 다시 보낸다.
```
POST /login.jsp

id=admin&pw=1234
```
Tomcat이 요청을 받음.
이번에는 이미 login.jsp가 Java로 변환되고 class로 컴파일되어 있을 가능성이 높아.  
  
그래서 보통 다시 JSP를 Java로 변환하지 않고, 이미 만들어진 Servlet 객체를 재사용해.  
```
이미 만들어진 login_jsp Servlet 객체 사용
```
Tomcat은 response 객체도 새로 만듦.  
  
그리고 Servlet 객체의 메서드를 실행함.  
```Java
_jspService(request, response);
```
Servlet 객체 내부에서 이런 코드가 실행됨.
```Java
String id = request.getParameter("id");
String pw = request.getParameter("pw");
```
으로 id, pw에 값이 저장된다.  
그다음 Java코드가 로그인을 처리한다.
```Java
if (id.equals("admin") && pw.equals("1234")) {
    out.write("<h1>로그인 성공</h1>");
} else {
    out.write("<h1>로그인 실패</h1>");
}
```
최종적으로 HTML이 만들어진다.
로그인 성공:
```HTML
<h1>로그인 성공</h1>
```
로그인 실패 :
```HTML
<h1>로그인 실패</h1>
```
이런 HTML이 respose에 담겨서 브라우저의 화면에 표시한다.
## “class 파일 안의 내용을 response로 보내는가?”
```
class 파일로부터 만들어진 Servlet 객체가 실행된다.
 ↓
그 실행 결과로 HTML 문자열이 만들어진다.
 ↓
그 HTML 문자열이 response에 담겨 브라우저로 간다.
```
```
class 파일 자체를 보내는 것이 아님
Servlet 실행 결과를 보내는 것
```
## 정리
### Java 파일
```
Tomcat이 JSP를 변환해서 만든 Servlet Java 소스 파일
HTML은 out.write() 코드로 바뀜
JSP의 Java 코드는 메서드 안에 들어감
```
예
```Java
out.write("<h1>로그인</h1>");
String id = request.getParameter("id");
```
### class 파일
```
Java 파일을 컴파일해서 만든 실행 가능한 파일
JVM이 실행할 수 있음
처리 방법이 들어 있음
특정 사용자의 실제 id, pw 값은 없음
```
### Servlet 객체
```
class 파일을 메모리에 올려 만든 실제 객체
Tomcat이 관리함
request를 받아 처리함
HTML 응답을 생성함
```
### request 객체
```
사용자가 서버로 보낸 요청 정보
요청마다 새로 생성됨
사용자가 입력한 id, pw 같은 값이 들어 있음
```
### response 객체
```
서버가 브라우저로 보낼 응답 정보
요청마다 새로 생성됨
최종 HTML이 담겨 브라우저로 전송됨
```
### class -> response?
```
class 파일로부터 만들어진 Servlet 객체가 실행된다.
 ↓
그 실행 결과로 HTML 문자열이 만들어진다.
 ↓
그 HTML 문자열이 response에 담겨 브라우저로 간다.
결과
class 파일 자체를 보내는 것이 아님
Servlet 실행 결과를 보내는 것
```
### 반복 과정
```
JSP 변환/컴파일:
처음 또는 수정 시 발생

request/response 생성:
요청마다 발생

Servlet 객체 실행:
요청마다 발생
```
## 최종
```
1. 사용자가 브라우저에서 login.jsp에 접속한다.

2. 브라우저가 서버로 HTTP 요청을 보낸다.

3. Tomcat/WAS가 요청을 받는다.

4. 요청한 대상이 JSP 파일임을 확인한다.

5. 처음 요청이거나 JSP가 수정된 경우,
   Tomcat이 login.jsp를 Servlet 형태의 Java 파일로 변환한다.

6. 변환된 Java 파일 안에는 Servlet 클래스 코드가 자동으로 만들어진다.
   JSP의 HTML은 out.write() 코드로 바뀐다.
   JSP의 Java 코드는 Servlet 메서드 안으로 들어간다.

7. Java 파일이 컴파일되어 class 파일이 된다.

8. Tomcat은 class 파일을 메모리에 올리고 Servlet 객체를 생성한다.

9. 사용자의 요청마다 Tomcat은 request 객체와 response 객체를 만든다.

10. Tomcat은 Servlet 객체의 메서드를 실행하면서
    request와 response를 전달한다.

11. Servlet 객체는 request에서 필요한 데이터를 꺼낸다.
    예를 들어 id, pw 값을 꺼낸다.

12. Servlet 객체는 Java 코드로 필요한 처리를 한다.
    예를 들어 로그인 성공/실패를 판단한다.

13. Servlet 객체는 HTML 문자열을 만들어 response에 쓴다.

14. Tomcat은 response에 담긴 HTML을 브라우저로 전송한다.

15. 브라우저는 받은 HTML을 해석해서 사용자 화면에 보여준다.
```
## 헷갈렸던 부분
### 1.
```
class 파일 안에 사용자 정보가 들어 있다.
```
->
```
class 파일 안에는 처리 방법이 들어 있다.
사용자 정보는 요청마다 request에 들어온다.
```
### 2.
```
Servlet 객체가 class 파일 내용을 response에 담아 보낸다.
```
->
```
Servlet 객체가 class 파일의 코드를 실행한다.
그 실행 결과로 HTML이 만들어진다.
그 HTML이 response에 담겨 전송된다.
```
### 3.
```
Servlet 객체에 request, response객체들이 존재한다.
```
->
```
Tomcat이 Servlet 객체를 만들고, 요청이 들어올 때마다 request와 response 객체를 만든 뒤, Servlet 객체의 메서드에 인자로 넘겨준다.
정리하면
Tomcat
  ↓
login_jsp Servlet 객체 생성
  ↓
사용자 요청 도착
  ↓
Tomcat이 request 객체 생성
Tomcat이 response 객체 생성
  ↓
Tomcat이 Servlet 객체의 메서드 호출

login_jsp객체._jspService(request, response)

  ↓
Servlet 메서드 내부에서 request 사용
  ↓
HTML 생성
  ↓
response에 담음
  ↓
브라우저로 전송
```
