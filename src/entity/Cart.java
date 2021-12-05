package entity;

/*
 *	商家
*/
public class Cart implements java.io.Serializable {
	// Uid：用户名
	private String Uid;
	// Gname：商品名
	private String Gname;
	// Gprice：商品价格
	private String Gprice;
	// Gsize：商品尺寸
	private String Gsize;
	// Gnum：商品总库存
	private String Gnum;
	// Gphoto：样图
	private String Gphoto;

	public Cart() {
	}

	public Cart(String uid, String gname, String gprice, String gsize, String gnum, String gphoto) {
		super();
		Uid = uid;
		Gname = gname;
		Gprice = gprice;
		Gsize = gsize;
		Gnum = gnum;
		Gphoto = gphoto;
	}

	public String getUid() {
		return Uid;
	}

	public void setUid(String uid) {
		Uid = uid;
	}

	public String getGname() {
		return Gname;
	}

	public void setGname(String gname) {
		Gname = gname;
	}

	public String getGprice() {
		return Gprice;
	}

	public void setGprice(String gprice) {
		Gprice = gprice;
	}

	public String getGsize() {
		return Gsize;
	}

	public void setGsize(String gsize) {
		Gsize = gsize;
	}

	public String getGnum() {
		return Gnum;
	}

	public void setGnum(String gnum) {
		Gnum = gnum;
	}

	public String getGphoto() {
		return Gphoto;
	}

	public void setGphoto(String gphoto) {
		Gphoto = gphoto;
	}
	
}