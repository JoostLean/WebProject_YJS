package utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	/*
	메서드 생성시 static을 통해 정적메소드로 정의하면 인스턴스 생성없이
	클래스명으로 직접 메서드를 호출할 수 있어 편리하다. 
	*/
	//기능 : 경고창을 띄우고 지정된 페이지로 이동한다.
	public static void alertLocation(String msg, String url, 
			JspWriter out) {
		/*
		Java클래스에서는 JSP의 내장객체를 즉시 사용할 수 없으므로
		반드시 매개변수로 전달받아 사용해야 한다.
		여기서는 웹브라우저에 문자열을 출력하기 위해 out내장객체를
		JspWriter 타입으로 받은 후 사용하고 있다. 
		*/
		try {
			//JavaScript를 하나의 문자열로 정의한다.
			String script = "<script>"
						  + "	alert('" + msg + "');"
						  + "	location.href='" + url + "';"
						  + "</script>";
			//해당 문자열을 웹브라우저에 출력한다.
			out.println(script);
		}
		catch (Exception e) {}
	}
	//기능 : 경고창을 띄우고 위로 한페이지 이동한다.
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>"
						  + "	alert('" + msg + "');"
						  + "	history.back();"
						  + "</script>";
			out.println(script);
		}
		catch (Exception e) {}
	}
	
	/*
	상단 2개의 메서드는 JSP에서 사용하기 위해 정의하였다. JSP에서 out
	내장객체를 전달하면 매개변수로 받아서 사용한다.
	아래 2개는 Servlet에서 사용하기 위해 메서드 오버로딩으로 정의한다.
	서블릿이 직접 요청을 받으므로 respose 내장객체를 통해 화면출력을
	위한 PrintWriter 인스턴스를 생성하여 사용한다.
	*/
	public static void alertLocation(HttpServletResponse resp, String msg,
			String url) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			
			String script = ""
						  + "<script>"
						  + "	alert('"+ msg +"');"
						  + "	location.href='"+ url +"';"
						  + "</script>";
			writer.print(script);
		}
		catch (Exception e) {}
	}
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
						  + "<script>"
						  + "	alert('"+ msg +"');"
						  + "	history.back();"
						  + "</script>";
			writer.print(script);
		}
		catch (Exception e) {}
	}
}
