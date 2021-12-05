package order.Interface;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.BaseServlet;
import entity.Goods;
import entity.Order;
import goods.Interface.GoodsDaoImpl;

/**
 * Servlet implementation class merchantServlet
 */
@WebServlet("/orderServlet")
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
	GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();

//	订单商品添加
	public void orderAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Gname = request.getParameter("Gname");
		String Gprice = request.getParameter("Gprice");
		String Gsize = request.getParameter("Gsize");
		String Gnum = request.getParameter("Gnum");
		String Gphoto = request.getParameter("Gphoto");
		String Gstate = "未发货";
		Order order = new Order();
		order.setUid(Uid);
		order.setGname(Gname);
		order.setGprice(Gprice);
		order.setGsize(Gsize);
		order.setGnum(Gnum);
		order.setGphoto(Gphoto);
		order.setGstate(Gstate);
		List<Goods> goodsList = goodsDaoImpl.getAllgoodss();
		for (Goods goods : goodsList) {
			if(goods.getGname().equals(Gname)) {
				int Gstock = Integer.parseInt(goods.getGstock())-Integer.parseInt(Gnum);
				System.out.println(String.valueOf(Gstock));
				String[] data = {Gname,String.valueOf(Gstock)};
				System.out.println(data[1]);
				orderDaoImpl.UpdateGstock(data);
			}
		}
		int succ = orderDaoImpl.orderAdd(order);
		if (succ > 0) {
			request.setAttribute("succeed", "添加成功");
		} else {
			request.setAttribute("tips", "添加失败");
		}
	}
	
//   修改订单状态
	public void orderUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		String Gstate = request.getParameter("Gstate");
		Order order = new Order();
		order.setGname(Gname);
		order.setGstate(Gstate);
		orderDaoImpl.orderUpdate(order);
	}
	
////删除商品
	public void orderDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		Order order = new Order();
		order.setGname(Gname);
		orderDaoImpl.orderDelete(order);
	}

//	添加订单
	/*
	 * public void orderAccount(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String Gname =
	 * request.getParameter("Gname");
	 * 
	 * }
	 */
}
