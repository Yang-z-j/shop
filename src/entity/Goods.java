package entity;

/*
 *	�̼�
*/
public class Goods implements java.io.Serializable {
	// password����Ʒ��
	private String Gname;
	// Sex����Ʒ�۸�
	private String Gprice;
	// Phone����Ʒ�ߴ�
	private String Gsize;
	// Mgoods����Ʒ����
	private String Gtype;
	// Mlicense����Ʒ�ܿ��
	private String Goitw;
	// Mintroduction����ͼ
	private String Gphoto;
	// Mlicense����Ʒ�ܿ��
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
