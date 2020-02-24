package ajaxservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.RepaintArea;

public class mobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mobileServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		String phone = request.getParameter("phone");
		if ("1888888888".equals(phone)) {
//			response.getWriter().write("true");
//			response.getWriter().write("注册成功");
//			json格式的true返回
			response.getWriter().write("{\"Msg\": \"true\" }"); 
		} else {
//			response.getWriter().write("false");
//			response.getWriter().write("注册失败");
//			json格式的false返回
			response.getWriter().write("{\"Msg\": \"false\" }");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
