package member;

import java.text.SimpleDateFormat;
import java.util.Date;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
	
	public MemberDAO (ServletContext application) {
		super(application);
	}
	
	public MemberDAO () {
		super();
	}
	
	public MemberDTO regMemberDTO(String uid, String uname, String upass) {
		MemberDTO dto = new MemberDTO();
		/* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 설정할
		수 있도록 쿼리문을 작성 */
		String query = "INSERT INTO member (id, pass, name, regidate) "
				+ " VALUES (?, ?, ?, sysdate)";
		String regidate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		try {
			//쿼리문 실행과 인파라미터 설정을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			psmt.setString(3, uname);
			// psmt.setString(4, regidate);
			
			int result = psmt.executeUpdate();
			
			//반환된 ResultSet에 회원정보가 저장되어 있는지 확인
			if(result > 0) {
				//정보가 있다면 DTO에 저장한다.
				dto.setId(uid);
				dto.setPass(uname);
				dto.setName(upass);
				dto.setRegidate(rs.getString(4));
				//dto.setRegidate(regidate);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public MemberDTO getMemberDTO(String uid) {
		
		MemberDTO dto = new MemberDTO();
		/* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 설정할
		수 있도록 쿼리문을 작성 */
		String query = "SELECT * FROM member WHERE id=?";
				 
		try {
			//쿼리문 실행과 인파라미터 설정을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(1, uid);
			//쿼리문을 실행한 후 결과는 ResultSet을 통해 반환
			rs = psmt.executeQuery();
			//반환된 ResultSet에 회원정보가 저장되어 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO에 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {

		MemberDTO dto = new MemberDTO();
		/* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 설정할
		수 있도록 쿼리문을 작성 */
		String query = "SELECT * FROM member WHERE id=? "
				+ " AND pass=?";
		try {
			//쿼리문 실행과 인파라미터 설정을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//쿼리문을 실행한 후 결과는 ResultSet을 통해 반환
			rs = psmt.executeQuery();
			//반환된 ResultSet에 회원정보가 저장되어 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO에 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
//				dto.setName(rs.getString(3));
//				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public MemberDTO getMemberDTO(String uid, String upass, String uname) {
		
		MemberDTO dto = new MemberDTO();
		/* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 설정할
		수 있도록 쿼리문을 작성 */
		String query = "SELECT * FROM member WHERE id=? "
				+ " AND pass=?";
		
		try {
			//쿼리문 실행과 인파라미터 설정을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//쿼리문을 실행한 후 결과는 ResultSet을 통해 반환
			rs = psmt.executeQuery();
			//반환된 ResultSet에 회원정보가 저장되어 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO에 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public MemberDTO editMemberDTO(String uid, String uname, String upass) {
		MemberDTO dto = new MemberDTO();
		/* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를 설정할
		수 있도록 쿼리문을 작성 */
		String query = "UPDATE member SET pass=?, name=? "
						+ " WHERE id=?";
		try {
			//쿼리문 실행과 인파라미터 설정을 위한 prepared 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인파라미터를 설정
			psmt.setString(1, upass);
			psmt.setString(2, uname);
			psmt.setString(3, uid);
			
			int result = psmt.executeUpdate();
			
			//정보가 있다면 DTO에 저장한다.
			dto.setId(uid);
			dto.setName(upass);
			dto.setPass(uname);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
