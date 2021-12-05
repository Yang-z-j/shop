package merchant.Interface;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.BaseServlet;
import entity.Merchant;
import entity.User;

/**
 * Servlet implementation class merchantServlet
 */
@WebServlet("/merchantServlet")
public class MerchantServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	MerchantDaoImpl merchantDaoImpl = new MerchantDaoImpl();

//	商家注册
	public void merchantRegist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Mid = request.getParameter("Mid");
		String Mpassword = request.getParameter("Mpassword");
		String Mname = request.getParameter("Mname");
		String Mintroduction = request.getParameter("Mintroduction");
		String Mphone = request.getParameter("Mphone");
		String Micon = request.getParameter("Micon");
		System.out.println(Micon);
		Merchant merchant = new Merchant();
		merchant.setMid(Mid);
		merchant.setMpassword(Mpassword);
		merchant.setMname(Mname);
		merchant.setMintroduction(Mintroduction);
		merchant.setMphone(Mphone);
		merchant.setMicon(Micon);
		int succ = merchantDaoImpl.merchantRegist(merchant);
		if (succ > 0) {
			request.setAttribute("succeed", "注册成功！");
			request.getRequestDispatcher("/merchant/Mlogin.jsp").forward(request, response);
		} else {
			request.setAttribute("tips", "注册失败,该用户已被注册！");
			request.getRequestDispatcher("/merchant/Mregister.jsp").forward(request, response);
		}
	}

//	商家登录
	public void merchantLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Mname = null;
		String Micon = null;
		String Mid = request.getParameter("Mid");
		String Mpassword = request.getParameter("Mpassword");
		Merchant merchant = new Merchant();
		merchant.setMid(Mid);
		merchant.setMpassword(Mpassword);
		boolean succ = merchantDaoImpl.merchantLogin(merchant);
		if (succ) {
			List<Merchant> merchantList = merchantDaoImpl.getAllmerchants();
			for (Merchant Merchant : merchantList) {
				String getId = Merchant.getMid();
				if (getId.equals(Mid)) {
					Mname = Merchant.getMname();
					Micon = Merchant.getMicon();
				}
			}
			request.setAttribute("Mname", Mname);
			request.setAttribute("Micon", Micon);
			request.getRequestDispatcher("/Mindex.jsp").forward(request, response);
		} else {
			request.setAttribute("tips", "登录信息错误！");
			request.getRequestDispatcher("/merchant/Mlogin.jsp").forward(request, response);
		}
	}

//	商家信息更新
	public void merchantUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Mid = request.getParameter("Mid");
		String Mname = request.getParameter("Mname");
		String Mintroduction = request.getParameter("Mintroduction");
		String Mphone = request.getParameter("Mphone");
		String Micon = request.getParameter("Micon");
		Merchant merchant = new Merchant();
		merchant.setMid(Mid);
		merchant.setMname(Mname);
		merchant.setMintroduction(Mintroduction);
		merchant.setMphone(Mphone);
		merchant.setMicon(Micon);
		merchantDaoImpl.merchantUpdate(merchant);
		List<Merchant> merchantList = merchantDaoImpl.getAllmerchants();
		request.setAttribute("merchantList", merchantList);
		request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
	}
	
//	修改商家密码
//	public void merchantUpdatePassword(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Mid = request.getParameter("Mid");
//		String Mpassword = request.getParameter("Mpassword");
//		Merchant merchant = new Merchant();
//		merchant.setMid(Mid);
//		merchant.setMpassword(Mpassword);
//		merchantDaoImpl.merchantUpdatePassword(merchant);
//		List<Merchant> merchantList = merchantDaoImpl.getAllmerchants();
//		request.setAttribute("merchantList", merchantList);
//		request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
//	}

//	查找商家账号
//	public void selectmerchantBySid(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Mid = request.getParameter("Mid");
//		Merchant merchant = merchantDaoImpl.selectMerchantBySid(Mid);
//		if (null == merchant.getMid()) {
//			System.out.println("该用户" + Mid + "不存在！");
//		}
//		request.setAttribute("merchant", merchant);
//		request.getRequestDispatcher("/merchantLogin/update.jsp").forward(request, response);
//	}

//	删除商家
//	public void merchantDelete(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Mid = request.getParameter("Mid");
//		Merchant merchant = new Merchant();
//		merchant.setMid(Mid);
//		merchantDaoImpl.merchantDelete(merchant);
//		request.setAttribute("Mid", merchant.getMid());
//		List<Merchant> merchantList = merchantDaoImpl.getAllmerchants();
//		request.setAttribute("merchantList", merchantList);
//		request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
//	}
}