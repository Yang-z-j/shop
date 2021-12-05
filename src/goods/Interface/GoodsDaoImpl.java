package goods.Interface;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Interface.Util;
import entity.*;

public class GoodsDaoImpl {

//	��Ʒ���
	public int goodsAdd(Goods goods) {
		int succ = 0;
		String sql = "insert into goods(Gname,Gprice,Gsize,Gtype,Goitw,Gphoto,Gstock) value(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = Util.executePreparedStatement(sql);
			ps.setString(1, goods.getGname());
			ps.setString(2, goods.getGprice());
			ps.setString(3, goods.getGsize());
			ps.setString(4, goods.getGtype());
			ps.setString(5, goods.getGoitw());
			ps.setString(6, goods.getGphoto());
			ps.setString(7, goods.getGstock());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return succ;
	}

//	��Ʒ��¼
//	public boolean goodsLogin(Goods goods) {
//		// TODO Auto-generated method goodsb
//		String sql = "select * from goods where id=? and name=? and password=?";
//		boolean flag = false;
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, goods.getgoodsid());
//			ps.setString(2, goods.getgoodsname());
//			ps.setString(3, goods.getgoodspwd());
//			ResultSet set = ps.executeQuery();
//			if (set.next()) {
//				flag = true;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//		return flag;
//	}
//
////	��Ʒ��Ϣ����
//	public void goodsUpdate(Goods goods) {
//		// TODO Auto-generated method goodsb
//		String sql = "update goods set name=?,sex=?,major=?,password=? where id='" + goods.getgoodsid() + "'";
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, goods.getgoodsname());
//			ps.setString(2, goods.getgoodssex());
//			ps.setString(3, goods.getgoodsmajor());
//			ps.setString(4, goods.getgoodspwd());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//	}
//	
////	��Ʒ�����޸�
//	public void goodsUpdatePassword(Goods goods) {
//		// TODO Auto-generated method goodsb
//		String sql = "update goods set name=?,sex=?,major=?,password=? where id='" + goods.getgoodsid() + "'";
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, goods.getgoodsname());
//			ps.setString(2, goods.getgoodssex());
//			ps.setString(3, goods.getgoodsmajor());
//			ps.setString(4, goods.getgoodspwd());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//	}
//
////	ɾ����Ʒ
	public void goodsDelete(Goods goods) {
		// TODO Auto-generated method goodsb
		String sql = "delete from goods where Gname=?";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, goods.getGname());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

////ɾ������
	public void goodsDeleteAll() {
		// TODO Auto-generated method goodsb
		String sql = "delete from goods";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

//
////	������Ʒ����
	public List<Goods> selectgoodsByGtype(String Gtype) {
		String sql = "select * from goods where Gtype = '" + Gtype + " '";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Goods> goodsType = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Gname = set.getString("Gname");
				String Gprice = set.getString("Gprice");
				String Gsize = set.getString("Gsize");
				String Gtype1 = set.getString("Gtype");
				String Goitw = set.getString("Goitw");
				String Gphoto = set.getString("Gphoto");
				String Gstock = set.getString("Gstock");
				Goods goods = new Goods(Gname, Gprice, Gsize, Gtype1, Goitw, Gphoto, Gstock);
				goodsType.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return goodsType;
	}
	
////������Ʒ
public List<Goods> searchGoods(String name) {
	String sql = "select * from goods where Gname like '%" + name + "%'";
	PreparedStatement ps = Util.executePreparedStatement(sql);
	List<Goods> goodsName = new ArrayList<>();
	try {
		ResultSet set = ps.executeQuery();
		while (set.next()) {
			String Gname = set.getString("Gname");
			String Gprice = set.getString("Gprice");
			String Gsize = set.getString("Gsize");
			String Gtype = set.getString("Gtype");
			String Goitw = set.getString("Goitw");
			String Gphoto = set.getString("Gphoto");
			String Gstock = set.getString("Gstock");
			Goods goods = new Goods(Gname, Gprice, Gsize, Gtype, Goitw, Gphoto, Gstock);
			goodsName.add(goods);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		Util.close();
	}
	return goodsName;
}

//
////	�õ�������Ʒ
	public List<Goods> getAllgoodss() {
		// TODO Auto-generated method userb
		String sql = "select * from goods";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Goods> goodslist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Gname = set.getString("Gname");
				String Gprice = set.getString("Gprice");
				String Gsize = set.getString("Gsize");
				String Gtype = set.getString("Gtype");
				String Goitw = set.getString("Goitw");
				String Gphoto = set.getString("Gphoto");
				String Gstock = set.getString("Gstock");
				Goods goods = new Goods(Gname, Gprice, Gsize, Gtype, Goitw, Gphoto, Gstock);
				goodslist.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return goodslist;
	}

}
