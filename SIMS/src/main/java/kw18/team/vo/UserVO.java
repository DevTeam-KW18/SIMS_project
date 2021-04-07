package kw18.team.vo;

public class UserVO {
	private String id;
	private String passwd;
	private String type;
	private String university;
	
	
	public UserVO() {
		super();
	}

	public UserVO(String id, String passwd, String type, String university) {
		this.id = id;
		this.passwd = passwd;
		this.type = type;
		this.university = university;
	}
	
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}