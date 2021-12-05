package filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class CharacterEncodingFilter implements Filter {
	// 定义该FilterConfig类型属性的作用是防止在init()方法之外的地方使用该对象的
	private FilterConfig config;
	// 声明该属性的作用是用来灵活接收并设置全站统一编码
	private String encoding = "UTF-8";

	public void init(FilterConfig config) throws ServletException {
		// 给属性config赋值，把Tomcat容器传递过来的局部变量保存起来，在其它方法中可以使用
		this.config = config;
		// 获取在web.xml文件中为该过滤器配置的初始化参数，目的是可以灵活设置编码，而不需要把具体编码硬编码在代码中（不便于修改）
		String initEncoding = config.getInitParameter("encoding");
		// 如果在web.xml配置了明确指定了所采用的编码则采用指定的编码，如果没有指定则采用默认的编码值UTF-8
		if (initEncoding != null && !"".equals(initEncoding.trim())) {
			this.encoding = initEncoding;
		}
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// 把ServletRequest和ServletResponse参数强制转化为Http类型的HttpServletRequest和HttpServletResponse
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		// 该段代码只能解决post的请求乱码问题，对于get请求还需要单独处理
		// request.setCharacterEncoding(this.config.getInitParameter("encoding"));
		request.setCharacterEncoding(this.encoding);
		response.setCharacterEncoding(this.encoding);
		response.setContentType("text/html;charset=" + this.encoding);
		// 放行操作（并对request对象进行包装）
		chain.doFilter(new MyRequest(request), response);
	}

	/*
	 * 为了增强某个类的某个方法功能我们有以下几种方法： （1）实现接口或继承该类，然后去复写要被增强的方法 （2）采用装饰设计模式
	 * 自定义一个类实现和被增强对象的相同的接口或类 把被增强的对象作为该类的一个成员变量 定义构造方法并传递被增强对象，然后给类的成员变量赋值
	 * 复写要增强的方法就可以了 （3）采用动态代理的方式来进行增强
	 */
	// 定义一个内容类，目的是对相关的getParameter方法进行增强（覆写）
	class MyRequest extends HttpServletRequestWrapper {
		private HttpServletRequest request;

		public MyRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		// 覆写getParameter()方法
		@Override
		public String getParameter(String name) {
			String inputValue = this.request.getParameter(name);
			if (inputValue == null || inputValue.trim().equals("")) {
				return null;
			}
			// 对于POST请求则直接放行，因为前面的设置已经可以解决POST方式的乱码问题了
			if (this.request.getMethod().equalsIgnoreCase("POST")) {
				return inputValue;
			}
			// 表示一定是采用get方式的提交方式
			try {
				// 添加该判断的原因是在一些版本较高的Tomcat中已经帮我们进行乱码处理了
				System.out.println("inputValue-before:=" + inputValue);
				if (inputValue.indexOf("?") >= 0) {

					inputValue = new String(inputValue.getBytes("iso-8859-1"), encoding);

				} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// 获取tomcat服务器的版本
					inputValue = new String(inputValue.getBytes("iso-8859-1"), encoding);
				}
				System.out.println("inputValue-after:=" + inputValue);
				return inputValue;
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}

		// 覆写getParameterValues()方法
		@Override
		public String[] getParameterValues(String name) {
			// 获取请求数据的提交方式
			String method = request.getMethod();
			if ("POST".equalsIgnoreCase(method)) {
				return this.request.getParameterValues(name);
			}
			// 表示提交方式为GET，必须要手动的处理
			String[] values = this.request.getParameterValues(name);
			for (int i = 0; values != null && i < values.length; i++) {
				try {
					if (values[i].indexOf("?") >= 0) {
						values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
					} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// 获取tomcat服务器的版本
						values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
					}
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return values;
		}

		// 覆写getParameterMap()方法
		@Override
		public Map<String, String[]> getParameterMap() {
			// 获取请求数据的提交方式
			String method = request.getMethod();
			if ("POST".equalsIgnoreCase(method)) {
				return this.request.getParameterMap();
			}
			// 表示提交方式为GET，必须要手动的处理
			Map<String, String[]> map = this.request.getParameterMap();
			// 遍历Map集合
			for (String key : map.keySet()) {
				String[] values = map.get(key);
				for (int i = 0; values != null && i < values.length; i++) {
					try {
						if (values[i].indexOf("?") >= 0) {
							values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
						} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// 获取tomcat服务器的版本
							values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				map.put(key, values);
			}
			return map;

		}

	}

	public void destroy() {
		// 进行对一些资源的释放操作
	}
}
