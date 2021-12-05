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

//	�̼�ע��
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
			request.setAttribute("succeed", "ע��ɹ���");
			request.getRequestDispatcher("/merchant/Mlogin.jsp").forward(request, response);
		} else {
			request.setAttribute("tips", "ע��ʧ��,���û��ѱ�ע�ᣡ");
			request.getRequestDispatcher("/merchant/Mregister.jsp").forward(request, response);
		}
	}

//	�̼ҵ�¼
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
			request.setAttribute("tips", "��¼��Ϣ����");
			request.getRequestDispatcher("/merchant/Mlogin.jsp").forward(request, response);
		}
	}

//	�̼���Ϣ����
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
	
//	�޸��̼�����
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

//	�����̼��˺�
//	public void selectmerchantBySid(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String Mid = request.getParameter("Mid");
//		Merchant merchant = merchantDaoImpl.selectMerchantBySid(Mid);
//		if (null == merchant.getMid()) {
//			System.out.println("���û�" + Mid + "�����ڣ�");
//		}
//		request.setAttribute("merchant", merchant);
//		request.getRequestDispatcher("/merchantLogin/update.jsp").forward(request, response);
//	}

//	ɾ���̼�
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