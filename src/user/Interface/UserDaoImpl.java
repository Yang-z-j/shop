package user.Interface;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Interface.Util;
import entity.*;

public class UserDaoImpl {

//	用户注册
	public int userRegist(User user) {
		int succ = 0;
		String sql = "insert into user(Uid,Uname,Upassword,Usex,Uphone,Ureceiving,Uaddress) value(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = Util.executePreparedStatement(sql);
			ps.setString(1, user.getUid());
			ps.setString(2, user.getUname());
			ps.setString(3, user.getUpassword());
			ps.setString(4, user.getUsex());
			ps.setString(5, user.getUphone());
			ps.setString(6, user.getUreceiving());
			ps.setString(7, user.getUaddress());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return succ;
	}

//	用户登录
	public boolean userLogin(User user) {
		// TODO Auto-generated method userb
		String sql = "select * from user where Uid=? and Upassword=?";
		boolean flag = false;
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, user.getUid());
			ps.setString(2, user.getUpassword());
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

//	用户密码修改
//	public void userUpdatePassword(User user) {
//		// TODO Auto-generated method userb
//		String sql = "update User set name=?,sex=?,major=?,password=? where Uid='" + user.getUid() + "'";
//		PreparedStatement ps = Util.executePreparedStatement(sql);
//		try {
//			ps.setString(1, user.getUname());
//			ps.setString(2, user.getUsex());
//			ps.setString(3, user.getusermajor());
//			ps.setString(4, user.getuserpwd());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.close();
//		}
//	}
	
//	用户更新
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		String sql = "update user set Uname=?,Upassword=?,Usex=?,Uphone=?,Ureceiving=?,Uaddress=? where Uid='" + user.getUid() + "'";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, user.getUname());
			ps.setString(2, user.getUpassword());
			ps.setString(3, user.getUsex());
			ps.setString(4, user.getUphone());
			ps.setString(5, user.getUreceiving());
			ps.setString(6, user.getUaddress());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}


//	删除用户
	public void userDelete(User user) {
		// TODO Auto-generated method userb
		String sql = "delete from user where Uid=?";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		try {
			ps.setString(1, user.getUid());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
	}

//	查找用户账号
	public User selectUserByUid(String Uid) {
		String sql = "select * from user where Uid = '" + Uid + " '";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		User user = new User();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				user.setUid(set.getString("Uid"));
				user.setUname(set.getString("Uname"));
				user.setUpassword(set.getString("Upassword"));
				user.setUsex(set.getString("Usex"));
				user.setUphone(set.getString("Uphone"));
				user.setUreceiving(set.getString("Ureceiving"));
				user.setUaddress(set.getString("Uaddress"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return user;
	}
//
////	得到所有用户
	public List<User> getAllusers() {
		// TODO Auto-generated method userb
		String sql = "select * from user";
		PreparedStatement ps = Util.executePreparedStatement(sql);
		List<User> userlist = new ArrayList<>();
		try {
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				String Uid = set.getString("Uid");
				String Uname = set.getString("Uname");
				String Upassword = set.getString("Upassword");
				String Usex = set.getString("Usex");
				String Uphone = set.getString("Uphone");
				String Ureceiving = set.getString("Ureceiving");
				String Uaddress = set.getString("Uaddress");
				User user = new User(Uid,Uname,Upassword,Usex,Uphone,Ureceiving,Uaddress);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.close();
		}
		return userlist;
	}
	
	

}
