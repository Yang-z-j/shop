package goods.Interface;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.BaseServlet;
import entity.Goods;
import entity.User;

/**
 * Servlet implementation class merchantServlet
 */
@WebServlet("/GoodsServlet")
public class GoodsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();

//	商品添加
	public void goodsAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		String Gprice = request.getParameter("Gprice");
		String Gsize = null;
		String Gsize1 = request.getParameter("Gsize1");
		String Gsize2 = request.getParameter("Gsize2");
		String Gsize3 = request.getParameter("Gsize3");
		String Gsize4 = request.getParameter("Gsize4");
		String Gsize5 = request.getParameter("Gsize5");
		String Gsize6 = request.getParameter("Gsize6");
		Gsize = Gsize1 + "," + Gsize2 + "," + Gsize3 + "," + Gsize4 + "," + Gsize5 + "," + Gsize6;
		Gsize = Gsize.replace(",null,",",");
		Gsize = Gsize.replace("null,","");
		Gsize = Gsize.replace(",null","");
		System.out.println(Gsize);
		String Gtype = request.getParameter("Gtype");
		String Goitw = request.getParameter("Goitw");
		String Gphoto = request.getParameter("Gphoto");
		String Gstock = Goitw;
		System.out.println(Gphoto);
		Goods goods = new Goods();
		goods.setGname(Gname);
		goods.setGprice(Gprice);
		goods.setGsize(Gsize);
		goods.setGtype(Gtype);
		goods.setGoitw(Goitw);
		goods.setGphoto(Gphoto);
		goods.setGstock(Gstock);
		int succ = goodsDaoImpl.goodsAdd(goods);
		if (succ > 0) {
			request.setAttribute("succeed", "添加成功");
			response.sendRedirect("/shopping/operation/Gadd.jsp");
		} else {
			request.setAttribute("tips", "添加失败");
			response.sendRedirect("/shopping/operation/Gadd.jsp");
		}
	}

//	商品展示
//	public void goodsShow(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Gid = request.getParameter("Gid");
//		String Gname = request.getParameter("Gname");
//		String Gprice = request.getParameter("Gprice");
//		String Gsize = request.getParameter("Gsize");
//		String Gphoto = request.getParameter("Gphoto");
//		String Gtype = request.getParameter("Gtype");
//		String Gsales = request.getParameter("Gsales");
//		String Goitw = request.getParameter("Goitw");
//		String Gstock = request.getParameter("Gstock");
//		Goods goods = new Goods();
//		goods.setGid(Gid);
//		goods.setGname(Gname);
//		goods.setGprice(Gprice);
//		goods.setGsize(Gsize);
//		goods.setGphoto(Gphoto);
//		goods.setGtype(Gtype);
//		goods.setGoitw(Gsales);
//		goods.setGoitw(Goitw);
//		goods.setGoitw(Gstock);
//		boolean succ = goodsDaoImpl.merchantLogin(merchant);
//		if (succ) {
//			List<Merchant> merchantList = goodsDaoImpl.getAllmerchants();
//			request.setAttribute("merchantList", merchantList);
//			request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
//		} else {
//			request.setAttribute("error", "登录信息错误！");
//			request.getRequestDispatcher("/merchantLogin/merchantLogin.jsp").forward(request, response);
//		}
//	}
//
////	商品信息更新
//	public void merchantUpdate(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Gid = request.getParameter("Gid");
//		String Gname = request.getParameter("Gname");
//		String Gprice = request.getParameter("Gprice");
//		String Gsize = request.getParameter("Gsize");
//		String Gphoto = request.getParameter("Gphoto");
//		String Gtype = request.getParameter("Gtype");
//		String Goitw = request.getParameter("Goitw");
//		Goods goods = new Goods();
//		goods.setGid(Gid);
//		goods.setGname(Gname);
//		goods.setGprice(Gprice);
//		goods.setGsize(Gsize);
//		goods.setGphoto(Gphoto);
//		goods.setGtype(Gtype);
//		goods.setGoitw(Goitw);
//		goodsDaoImpl.goodsUpdate(goods);
//		List<Merchant> merchantList = goodsDaoImpl.getAllmerchants();
//		request.setAttribute("merchantList", merchantList);
//		request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
//	}
//	
////	修改商家密码
//	public void merchantUpdatePassword(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Mid = request.getParameter("Mid");
//		String Mpassword = request.getParameter("Mpassword");
//		Merchant merchant = new Merchant();
//		merchant.setMid(Mid);
//		merchant.setMpassword(Mpassword);
//		goodsDaoImpl.merchantUpdatePassword(merchant);
//		List<Merchant> merchantList = goodsDaoImpl.getAllmerchants();
//		request.setAttribute("merchantList", merchantList);
//		request.getRequestDispatcher("/merchantLogin/show.jsp").forward(request, response);
//	}
//
////	查找商品类型
	public void selectgoodsByGtype(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gtype = request.getParameter("Gtype");
		List<Goods> goodsType = goodsDaoImpl.selectgoodsByGtype(Gtype);
		request.setAttribute("goodsType", goodsType);
		request.getRequestDispatcher("/show/show.jsp").forward(request, response);
	}
	
////搜索商品
public void searchGoods(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	String name = request.getParameter("name");
	List<Goods> goodsName = goodsDaoImpl.searchGoods(name);
	request.setAttribute("goodsName", goodsName);
	request.getRequestDispatcher("/shopping/show/show.jsp").forward(request, response);
}
	
//
////删除商品
	public void goodsDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		Goods goods = new Goods();
		goods.setGname(Gname);
		goodsDaoImpl.goodsDelete(goods);
	}
	
////删除所有商品
public void goodsDeleteAll(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	goodsDaoImpl.goodsDeleteAll();
}
}