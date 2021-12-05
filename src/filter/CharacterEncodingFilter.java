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
	// �����FilterConfig�������Ե������Ƿ�ֹ��init()����֮��ĵط�ʹ�øö����
	private FilterConfig config;
	// ���������Ե����������������ղ�����ȫվͳһ����
	private String encoding = "UTF-8";

	public void init(FilterConfig config) throws ServletException {
		// ������config��ֵ����Tomcat�������ݹ����ľֲ��������������������������п���ʹ��
		this.config = config;
		// ��ȡ��web.xml�ļ���Ϊ�ù��������õĳ�ʼ��������Ŀ���ǿ���������ñ��룬������Ҫ�Ѿ������Ӳ�����ڴ����У��������޸ģ�
		String initEncoding = config.getInitParameter("encoding");
		// �����web.xml��������ȷָ���������õı��������ָ���ı��룬���û��ָ�������Ĭ�ϵı���ֵUTF-8
		if (initEncoding != null && !"".equals(initEncoding.trim())) {
			this.encoding = initEncoding;
		}
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// ��ServletRequest��ServletResponse����ǿ��ת��ΪHttp���͵�HttpServletRequest��HttpServletResponse
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		// �öδ���ֻ�ܽ��post�������������⣬����get������Ҫ��������
		// request.setCharacterEncoding(this.config.getInitParameter("encoding"));
		request.setCharacterEncoding(this.encoding);
		response.setCharacterEncoding(this.encoding);
		response.setContentType("text/html;charset=" + this.encoding);
		// ���в���������request������а�װ��
		chain.doFilter(new MyRequest(request), response);
	}

	/*
	 * Ϊ����ǿĳ�����ĳ�������������������¼��ַ����� ��1��ʵ�ֽӿڻ�̳и��࣬Ȼ��ȥ��дҪ����ǿ�ķ��� ��2������װ�����ģʽ
	 * �Զ���һ����ʵ�ֺͱ���ǿ�������ͬ�Ľӿڻ��� �ѱ���ǿ�Ķ�����Ϊ�����һ����Ա���� ���幹�췽�������ݱ���ǿ����Ȼ�����ĳ�Ա������ֵ
	 * ��дҪ��ǿ�ķ����Ϳ����� ��3�����ö�̬����ķ�ʽ��������ǿ
	 */
	// ����һ�������࣬Ŀ���Ƕ���ص�getParameter����������ǿ����д��
	class MyRequest extends HttpServletRequestWrapper {
		private HttpServletRequest request;

		public MyRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}

		// ��дgetParameter()����
		@Override
		public String getParameter(String name) {
			String inputValue = this.request.getParameter(name);
			if (inputValue == null || inputValue.trim().equals("")) {
				return null;
			}
			// ����POST������ֱ�ӷ��У���Ϊǰ��������Ѿ����Խ��POST��ʽ������������
			if (this.request.getMethod().equalsIgnoreCase("POST")) {
				return inputValue;
			}
			// ��ʾһ���ǲ���get��ʽ���ύ��ʽ
			try {
				// ��Ӹ��жϵ�ԭ������һЩ�汾�ϸߵ�Tomcat���Ѿ������ǽ������봦����
				System.out.println("inputValue-before:=" + inputValue);
				if (inputValue.indexOf("?") >= 0) {

					inputValue = new String(inputValue.getBytes("iso-8859-1"), encoding);

				} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// ��ȡtomcat�������İ汾
					inputValue = new String(inputValue.getBytes("iso-8859-1"), encoding);
				}
				System.out.println("inputValue-after:=" + inputValue);
				return inputValue;
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
		}

		// ��дgetParameterValues()����
		@Override
		public String[] getParameterValues(String name) {
			// ��ȡ�������ݵ��ύ��ʽ
			String method = request.getMethod();
			if ("POST".equalsIgnoreCase(method)) {
				return this.request.getParameterValues(name);
			}
			// ��ʾ�ύ��ʽΪGET������Ҫ�ֶ��Ĵ���
			String[] values = this.request.getParameterValues(name);
			for (int i = 0; values != null && i < values.length; i++) {
				try {
					if (values[i].indexOf("?") >= 0) {
						values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
					} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// ��ȡtomcat�������İ汾
						values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
					}
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return values;
		}

		// ��дgetParameterMap()����
		@Override
		public Map<String, String[]> getParameterMap() {
			// ��ȡ�������ݵ��ύ��ʽ
			String method = request.getMethod();
			if ("POST".equalsIgnoreCase(method)) {
				return this.request.getParameterMap();
			}
			// ��ʾ�ύ��ʽΪGET������Ҫ�ֶ��Ĵ���
			Map<String, String[]> map = this.request.getParameterMap();
			// ����Map����
			for (String key : map.keySet()) {
				String[] values = map.get(key);
				for (int i = 0; values != null && i < values.length; i++) {
					try {
						if (values[i].indexOf("?") >= 0) {
							values[i] = new String(values[i].getBytes("iso-8859-1"), encoding);
						} else if (Double.parseDouble(config.getInitParameter("tomcat")) < 8) {// ��ȡtomcat�������İ汾
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
		// ���ж�һЩ��Դ���ͷŲ���
	}
}
