package entity;

/*
 * 用户
 */
public class User implements java.io.Serializable {
	// Uid：用户的账号
	private String Uid;
	// Uname：用户的登陆名
	private String Uname;
	// Upassword：用户的登陆密码
	private String Upassword;
	// Usex：用户的性别
	private String Usex;
	// Uphone：用户的手机号
	private String Uphone;
	// Ureceiving：收货人
	private String Ureceiving;
	// Uaddress：收货地址
	private String Uaddress;

	public User() {
	}

	public User(String uid, String uname, String upassword, String usex, String uphone, String ureceiving,
			String uaddress) {
		super();
		Uid = uid;
		Uname = uname;
		Upassword = upassword;
		Usex = usex;
		Uphone = uphone;
		Ureceiving = ureceiving;
		Uaddress = uaddress;
	}



	public String getUid() {
		return Uid;
	}

	public void setUid(String uid) {
		Uid = uid;
	}

	public String getUname() {
		return Uname;
	}

	public void setUname(String uname) {
		Uname = uname;
	}

	public String getUpassword() {
		return Upassword;
	}

	public void setUpassword(String upassword) {
		Upassword = upassword;
	}

	public String getUsex() {
		return Usex;
	}

	public void setUsex(String usex) {
		Usex = usex;
	}

	public String getUphone() {
		return Uphone;
	}

	public void setUphone(String uphone) {
		Uphone = uphone;
	}

	public String getUreceiving() {
		return Ureceiving;
	}

	public void setUreceiving(String ureceiving) {
		Ureceiving = ureceiving;
	}

	public String getUaddress() {
		return Uaddress;
	}

	public void setUaddress(String uaddress) {
		Uaddress = uaddress;
	}

}
