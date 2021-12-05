package cart.Interface;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Interface.Util;
import entity.*;

public class CartDaoImpl {

//	购物车添加
	public int cartAdd(Cart cart) {
		int succ = 0;
		String sql = "insert into cart(Uid,Gname,Gprice,Gsize,Gnum,Gphoto) value(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = Util.executePreparedStatement(sql);
			ps.setString(1, cart.getUid());
			ps.setString(2, cart.getGname());
			ps.setString(3, cart.getGprice());
			ps.setString(4, cart.getGsize());
			ps.setString(5, cart.getGnum());
			ps.setString(6, cart.getGphoto());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return succ;
	}

//	得到所有购物车商品
	public List<Cart> getAllcarts() {
		// TODO Auto-generated method userb
		String sql = "select * from cart";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<Cart> cartlist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Uid = set.getString("Uid");
				String Gname = set.getString("Gname");
				String Gprice = set.getString("Gprice");
				String Gsize = set.getString("Gsize");
				String Gnum = set.getString("Gnum");
				String Gphoto = set.getString("Gphoto");
				Cart cart = new Cart(Uid, Gname, Gprice, Gsize, Gnum, Gphoto);
				cartlist.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return cartlist;
	}

////删除商品
	public void cartDelete(Cart cart) {
		// TODO Auto-generated method goodsb
		String sql = "delete from cart where Uid=? and Gname=?";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, cart.getUid());
			ps.setString(2, cart.getGname());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

////删除所有
	public void cartDeleteAll(Cart cart) {
		// TODO Auto-generated method goodsb
		String sql = "delete from cart where Uid=?";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, cart.getUid());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}
	
//	更新商品数量
	public void cartUpdate(Cart cart) {
		// TODO Auto-generated method stub
		String sql = "update cart set Gnum=? where Uid='" + cart.getUid() + "' and Gname='" + cart.getGname() + "'";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, cart.getGnum());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}
}
