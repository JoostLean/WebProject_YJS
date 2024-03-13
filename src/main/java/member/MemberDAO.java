package member;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
	
	public MemberDAO (ServletContext application) {
		super(application);
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
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
