package entity;

/*
 *	商家
*/
public class Goods implements java.io.Serializable {
	// password：商品名
	private String Gname;
	// Sex：商品价格
	private String Gprice;
	// Phone：商品尺寸
	private String Gsize;
	// Mgoods：商品类型
	private String Gtype;
	// Mlicense：商品总库存
	private String Goitw;
	// Mintroduction：样图
	private String Gphoto;
	// Mlicense：商品总库存
	private String Gstock;

	public Goods() {
	}

	public Goods(String gname, String gprice, String gsize, String gtype, String goitw, String gphoto, String gstock) {
		super();
		Gname = gname;
		Gprice = gprice;
		Gsize = gsize;
		Gtype = gtype;
		Goitw = goitw;
		Gphoto = gphoto;
		Gstock = gstock;
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

	public String getGtype() {
		return Gtype;
	}

	public void setGtype(String gtype) {
		Gtype = gtype;
	}

	public String getGoitw() {
		return Goitw;
	}

	public void setGoitw(String goitw) {
		Goitw = goitw;
	}

	public String getGphoto() {
		return Gphoto;
	}

	public void setGphoto(String gphoto) {
		Gphoto = gphoto;
	}

	public String getGstock() {
		return Gstock;
	}

	public void setGstock(String gstock) {
		Gstock = gstock;
	}

}
