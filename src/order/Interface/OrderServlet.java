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

//	������Ʒ���
	public void orderAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Gname = request.getParameter("Gname");
		String Gprice = request.getParameter("Gprice");
		String Gsize = request.getParameter("Gsize");
		String Gnum = request.getParameter("Gnum");
		String Gphoto = request.getParameter("Gphoto");
		String Gstate = "δ����";
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
			request.setAttribute("succeed", "��ӳɹ�");
		} else {
			request.setAttribute("tips", "���ʧ��");
		}
	}
	
//   �޸Ķ���״̬
	public void orderUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		String Gstate = request.getParameter("Gstate");
		Order order = new Order();
		order.setGname(Gname);
		order.setGstate(Gstate);
		orderDaoImpl.orderUpdate(order);
	}
	
////ɾ����Ʒ
	public void orderDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Gname = request.getParameter("Gname");
		Order order = new Order();
		order.setGname(Gname);
		orderDaoImpl.orderDelete(order);
	}

//	��Ӷ���
	/*
	 * public void orderAccount(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String Gname =
	 * request.getParameter("Gname");
	 * 
	 * }
	 */
}
