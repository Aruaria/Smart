package com.smart.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smart.Beans.Admin;
import com.smart.Beans.Course;
import com.smart.Beans.Student;
import com.smart.Service.CourseService;
import com.smart.Service.StudentService;
import com.smart.Serviceimpl.CourseServiceimpl;
import com.smart.Serviceimpl.StudentServiceimpl;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    StudentService ss = new StudentServiceimpl();   
    CourseService cs = new CourseServiceimpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//登录
		String method = request.getParameter("method");
		switch (method) {
		case "login":
			login(request,response);
			break;
		}
		//查询个人信息
		//查询成绩
	}
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取表单信息
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("password").trim();
		Student st = ss.checkStudentIdAndPwd(id, pwd);
		if(st!=null) {//有这个人
			List<Course> list = cs.getCoursesbyStuId(id);
			st.setCourses(list);//课程
			HttpSession session = request.getSession();
			session.setAttribute("student", st);
			request.getRequestDispatcher("views/main.jsp").forward(request, response);
		}else {//没这个人
			request.setAttribute("errorMsg", "用户名或密码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

}
