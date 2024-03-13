package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

//DB연결을 위한 클래스 생성
public class JDBConnect {
	
	//멤버변수 : DB연결, 쿼리문 실행 및 전송, 결과셋 반환
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//기본생성자
	public JDBConnect() {
		try {
			//오라클 JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//커넥션URL, 계정 아이디와 패스워드
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pwd = "1234";
			//오라클에 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//인수(인자)생성자1 : JSP에서 JDBC정보를 매개변수를 통해 전달
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인자생성자 1)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//인수생성자2 : JSP에서 application 내장객체만 매개변수로 전달
	public JDBConnect(ServletContext application) {
		//Java에서 직접 web.xml의 정보를 가져온다.
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		//얻어온 정보를 통해 DB에 연결한다.
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인자생성자 2)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	//자원반납
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}