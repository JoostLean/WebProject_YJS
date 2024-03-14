package member;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String regidate;
//	private java.sql.Date regidate;
	
//	public MemberDTO(String user_id, String user_name, String password) {
//		super();
//	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
//	public java.sql.Date getRegidate() {
//		return regidate;
//	}
//	public void setRegidate(java.sql.Date regidate) {
//		this.regidate = regidate;
//	}
}
