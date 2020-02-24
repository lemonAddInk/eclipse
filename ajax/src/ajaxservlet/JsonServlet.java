package ajaxservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enity.student;
import net.sf.json.JSONObject;

public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println(name+"----"+age);
		// 通过导入jar包使用json封装对象
		JSONObject json = new JSONObject();
		student stu = new student("zs",12);
		student stu2 = new student("ls",13);
		student stu3 = new student("ww",14);
		json.put("stu", stu);
		json.put("stu2", stu2);
		json.put("stu3", stu3);
//		返回值为json需要使用print进行返回值处理
		response.getWriter().print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
