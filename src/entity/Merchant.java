package entity;

/*
 *	商家
*/
public class Merchant implements java.io.Serializable {
	// UserID：商家的账号
	private String Mid;
	// password：商家的登陆密码
	private String Mpassword;
	// Sex：店铺名
	private String Mname;
	// Mintroduction：商家介绍
	private String Mintroduction;
	// Mphone：商家电话
	private String Mphone;
	// Phone：店铺图标
	private String Micon;

	public Merchant() {
	}

	public Merchant(String mid, String mpassword, String mname, String mintroduction, String mphone, String micon) {
		super();
		Mid = mid;
		Mpassword = mpassword;
		Mname = mname;
		Mintroduction = mintroduction;
		Mphone = mphone;
		Micon = micon;
	}

	public String getMid() {
		return Mid;
	}

	public void setMid(String mid) {
		Mid = mid;
	}

	public String getMpassword() {
		return Mpassword;
	}

	public void setMpassword(String mpassword) {
		Mpassword = mpassword;
	}

	public String getMname() {
		return Mname;
	}

	public void setMname(String mname) {
		Mname = mname;
	}

	public String getMintroduction() {
		return Mintroduction;
	}

	public void setMintroduction(String mintroduction) {
		Mintroduction = mintroduction;
	}

	public String getMphone() {
		return Mphone;
	}

	public void setMphone(String mphone) {
		Mphone = mphone;
	}

	public String getMicon() {
		return Micon;
	}

	public void setMicon(String micon) {
		Micon = micon;
	}

}