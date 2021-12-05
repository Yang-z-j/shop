package merchant.Interface;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Interface.Util;
import entity.*;

public class MerchantDaoImpl {

//	商家注册
	public int merchantRegist(Merchant merchant) {
		int succ = 0;
		String sql = "insert into merchant(Mid,Mpassword,Mname,Mintroduction,Mphone,Micon) value(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = Util.executePreparedStatement(sql);
			ps.setString(1, merchant.getMid());
			ps.setString(2, merchant.getMpassword());
			ps.setString(3, merchant.getMname());
			ps.setString(4, merchant.getMintroduction());
			ps.setString(5, merchant.getMphone());
			ps.setString(6, merchant.getMicon());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return succ;
	}

//	商家登录
	public boolean merchantLogin(Merchant merchant) {
		// TODO Auto-generated method merchantb
		String sql = "select * from merchant where Mid=? and Mpassword=?";
		boolean flag = false;
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, merchant.getMid());
			ps.setString(2, merchant.getMpassword());
			ResultSet set = ps.executeQuery();
			if (set.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return flag;
	}

//	商家信息更新
	public void merchantUpdate(Merchant merchant) {
		// TODO Auto-generated method merchantb
		String sql = "update merchant set Mname=?,Mpassword=?,Mintroduction=?,Mphone=?,Micon=? where id='"
				+ merchant.getMid() + "'";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, merchant.getMname());
			ps.setString(2, merchant.getMpassword());
			ps.setString(3, merchant.getMintroduction());
			ps.setString(5, merchant.getMphone());
			ps.setObject(6, merchant.getMicon());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

//	得到所有商家信息
	public List<Merchant> getAllmerchants() {
		// TODO Auto-generated method userb
		String sql = "select * from merchant";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Merchant> merchantlist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Mid = set.getString("Mid");
				String Mpassword = set.getString("Mpassword");
				String Mname = set.getString("Mname");
				String Mintroduction = set.getString("Mintroduction");
				String Mphone = set.getString("Mphone");
				String Micon = set.getString("Micon");
				Merchant merchant = new Merchant(Mid,Mpassword,Mname,Mintroduction,Mphone,Micon);
				merchantlist.add(merchant);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return merchantlist;
	}

//	商家密码修改
//	public void merchantUpdatePassword(Merchant merchant) {
//		// TODO Auto-generated method merchantb
//		String sql = "update merchant set name=?,sex=?,major=?,password=? where id='" + merchant.getmerchantid() + "'";
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, merchant.getmerchantname());
//			ps.setString(2, merchant.getmerchantsex());
//			ps.setString(3, merchant.getmerchantmajor());
//			ps.setString(4, merchant.getmerchantpwd());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//	}
//
////	删除商家
//	public void merchantDelete(Merchant merchant) {
//		// TODO Auto-generated method merchantb
//		String sql = "delete from merchant where id=?";
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, merchant.getmerchantid());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//	}

//	查找商家账号

}
