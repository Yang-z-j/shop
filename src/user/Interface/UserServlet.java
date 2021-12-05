package user.Interface;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.BaseServlet;
import entity.User;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl = new UserDaoImpl();

//	用户注册
	public void userRegist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Uname = request.getParameter("Uname");
		String Upassword = request.getParameter("Upassword");
		String Usex = request.getParameter("Usex");
		String Uphone = request.getParameter("Uphone");
		String Ureceiving = request.getParameter("Ureceiving");
		String Uaddress = request.getParameter("Uaddress");
		System.out.println("用户id" + Uid);
		System.out.println("用户密码" + Upassword);
		User user = new User();
		user.setUid(Uid);
		user.setUname(Uname);
		user.setUpassword(Upassword);
		user.setUsex(Usex);
		user.setUphone(Uphone);
		user.setUreceiving(Ureceiving);
		user.setUaddress(Uaddress);
		int succ = userDaoImpl.userRegist(user);
		if (succ > 0) {
			request.setAttribute("succeed", "注册成功  请登录！");
			request.getRequestDispatcher("/user/Userlogin.jsp").forward(request, response);
		} else {
			request.setAttribute("tips", "注册失败,该用户已被注册！");
			request.getRequestDispatcher("/user/Userregister.jsp").forward(request, response);
		}
	}

//	用户登录
	public void userLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uname = null;
		String Uid = request.getParameter("Uid");
		String Upassword = request.getParameter("Upassword");
		User user = new User();
		user.setUid(Uid);
		user.setUpassword(Upassword);
		boolean succ = userDaoImpl.userLogin(user);
		System.out.println(succ);
		if (succ) {
			List<User> userList = userDaoImpl.getAllusers();
			for (User User : userList) {
				System.out.println("name"+User.getUname());
				String getId = User.getUid();
				if (getId.equals(Uid)) {
					Uname = User.getUname();
				}
			}
			System.out.println(Uname);
			request.setAttribute("Uid", Uid);
			request.setAttribute("Uname", Uname);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			request.setAttribute("tips", "登录信息错误！");
			request.getRequestDispatcher("/user/Userlogin.jsp").forward(request, response);
		}
	}

//	选择用户名
	public void selectUserByUid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("id");
		User User = userDaoImpl.selectUserByUid(Uid);
		if (User.getUid() == null) {
			System.out.println("该用户" + Uid + "不存在！");
		}
		request.setAttribute("User", User);
		request.getRequestDispatcher("/userLogin/update.jsp").forward(request, response);
	}

//	删除用户信息
//	public void userDelete(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String sid = request.getParameter("id");
//		User stu = new User();
//		stu.setUid(sid);
//		userDaoImpl.userDelete(stu);
//		request.setAttribute("sid", stu.getUid());
//		List<User> userList = userDaoImpl.getAllusers();
//		request.setAttribute("userList", userList);
//		request.getRequestDispatcher("/userLogin/show.jsp").forward(request, response);
//	}
	
//	用户更改
	public void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Uname = request.getParameter("Uname");
		String Upassword = request.getParameter("Upassword");
		String Usex = request.getParameter("Usex");
		String Uphone = request.getParameter("Uphone");
		String Ureceiving = request.getParameter("Ureceiving");
		String Uaddress = request.getParameter("Uaddress");
		User user = new User();
		user.setUid(Uid);
		user.setUname(Uname);
		user.setUpassword(Upassword);
		user.setUsex(Usex);
		user.setUphone(Uphone);
		user.setUreceiving(Ureceiving);
		user.setUaddress(Uaddress);
		userDaoImpl.updateUser(user);
	}

//	用户购物车
	public void userShoppingCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("id");
		User stu = new User();
		stu.setUid(sid);
		userDaoImpl.userDelete(stu);
		request.setAttribute("sid", stu.getUid());
		List<User> userList = userDaoImpl.getAllusers();
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/userLogin/show.jsp").forward(request, response);
	}

//	用户订单

}