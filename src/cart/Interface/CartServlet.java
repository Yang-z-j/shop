package cart.Interface;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.BaseServlet;
import entity.Cart;
import entity.Goods;
import entity.Order;

/**
 * Servlet implementation class merchantServlet
 */
@WebServlet("/cartServlet")
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	CartDaoImpl cartDaoImpl = new CartDaoImpl();

//	��Ʒ���
	public void cartAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Gname = request.getParameter("Gname");
		String Gprice = request.getParameter("Gprice");
		String Gsize = request.getParameter("Gsize");
		String Gnum = request.getParameter("Gnum");
		String Gphoto = request.getParameter("Gphoto");
		Cart cart = new Cart();
		cart.setUid(Uid);
		cart.setGname(Gname);
		cart.setGprice(Gprice);
		cart.setGsize(Gsize);
		cart.setGnum(Gnum);
		cart.setGphoto(Gphoto);
		int succ = cartDaoImpl.cartAdd(cart);
		if (succ > 0) {
			request.setAttribute("succeed", "��ӳɹ�");
		} else {
			request.setAttribute("tips", "���ʧ��");
		}
	}

////ɾ����Ʒ
	public void cartDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Gname = request.getParameter("Gname");
		Cart cart = new Cart();
		cart.setUid(Uid);
		cart.setGname(Gname);
		cartDaoImpl.cartDelete(cart);
	}

////ɾ��������Ʒ
	public void cartDeleteAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		Cart cart = new Cart();
		cart.setUid(Uid);
		cartDaoImpl.cartDeleteAll(cart);
	}
	
////�޸���Ʒ����
	public void cartUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Uid = request.getParameter("Uid");
		String Gname = request.getParameter("Gname");
		String Gnum = request.getParameter("Gnum");
		Cart cart = new Cart();
		cart.setUid(Uid);
		cart.setGname(Gname);
		cart.setGnum(Gnum);
		cartDaoImpl.cartUpdate(cart);
	}

}
