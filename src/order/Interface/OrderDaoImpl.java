package order.Interface;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Interface.Util;
import entity.*;

public class OrderDaoImpl {

//	订单添加
	public int orderAdd(Order order) {
		int succ = 0;
		String sql = "insert into rder(Uid,Gname,Gprice,Gsize,Gnum,Gphoto,Gstate) value(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = Util.executePreparedStatement(sql);
			ps.setString(1, order.getUid());
			ps.setString(2, order.getGname());
			ps.setString(3, order.getGprice());
			ps.setString(4, order.getGsize());
			ps.setString(5, order.getGnum());
			ps.setString(6, order.getGphoto());
			ps.setString(7, order.getGstate());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		MorderAdd(order);
		return succ;
	}

//	商家订单
	public void MorderAdd(Order order) {
		String Msql = "insert into Morder(Uid,Gname,Gprice,Gsize,Gnum,Gphoto,Gstate) value(?,?,?,?,?,?,?)";
		try {
			PreparedStatement Mps = Util.executePreparedStatement(Msql);
			Mps.setString(1, order.getUid());
			Mps.setString(2, order.getGname());
			Mps.setString(3, order.getGprice());
			Mps.setString(4, order.getGsize());
			Mps.setString(5, order.getGnum());
			Mps.setString(6, order.getGphoto());
			Mps.setString(7, order.getGstate());
			Mps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

//	得到所有用户订单
	public List<Order> getAllorders() {
		// TODO Auto-generated method userb
		String sql = "select * from rder";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Order> orderlist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Uid = set.getString("Uid");
				String Gname = set.getString("Gname");
				String Gprice = set.getString("Gprice");
				String Gsize = set.getString("Gsize");
				String Gnum = set.getString("Gnum");
				String Gphoto = set.getString("Gphoto");
				String Gstate = set.getString("Gstate");
				Order order = new Order(Uid, Gname, Gprice, Gsize, Gnum, Gphoto, Gstate);
				orderlist.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return orderlist;
	}

//	得到所有商家订单
	public List<Order> getAllMorders() {
		// TODO Auto-generated method userb
		String sql = "select * from Morder";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Order> orderlist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Uid = set.getString("Uid");
				String Gname = set.getString("Gname");
				String Gprice = set.getString("Gprice");
				String Gsize = set.getString("Gsize");
				String Gnum = set.getString("Gnum");
				String Gphoto = set.getString("Gphoto");
				String Gstate = set.getString("Gstate");
				Order order = new Order(Uid, Gname, Gprice, Gsize, Gnum, Gphoto, Gstate);
				orderlist.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return orderlist;
	}

//	更新订单状态
	public void orderUpdate(Order order) {
		// TODO Auto-generated method stub
		String sql = "update Morder set Gstate=? where Gname='" + order.getGname() + "'";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, order.getGstate());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

////删除商品
	public void orderDelete(Order order) {
		// TODO Auto-generated method goodsb
		String sql = "delete from rder where Gname=?";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, order.getGname());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}
	
////减去商品数量
	public void UpdateGstock(String[] data) {
		// TODO Auto-generated method goodsb
		String sql = "update goods set Gstock=? where Gname='" + data[0] + "'";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, data[1]);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}
}
