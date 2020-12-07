package com.smart.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.smart.Beans.Admin;
import com.smart.Beans.Course;
import com.smart.Beans.Student;
import com.smart.Service.AdminService;
import com.smart.Service.CourseService;
import com.smart.Service.StudentService;
import com.smart.Serviceimpl.AdminServiceimpl;
import com.smart.Serviceimpl.CourseServiceimpl;
import com.smart.Serviceimpl.StudentServiceimpl;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminService as = new AdminServiceimpl();
	StudentService ss = new StudentServiceimpl(); 
	CourseService cs = new CourseServiceimpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		switch (method) {
		case "login":
			login(request,response);
			break;
		case "queryStudent":
			queryStudent(request,response);
			break;
		case "queryCourse":
			queryCourse(request,response);
			break;
		case "updateAdmin":
			updateAdmin(request,response);
			break;
		case "deleteAdmin":
			deleteAdmin(request,response);
			break;
		case "addAdmin":
			addAdmin(request,response);
			break;
		case "datashow":
			datashow(request,response);
			break;
		}
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取表单信息
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("password").trim();
		Admin ad = as.checkUserNameAndPwd(id, pwd);
		if(ad!=null) {//有这个人
			HttpSession session = request.getSession();
			//超管拿管理员信息
			if(ad.getAdminName().equals("超级管理员")) {
				List<Admin> adminlist = as.getAllAdmin();
//				System.out.println();
				session.setAttribute("adminlist", adminlist);
			}
			session.setAttribute("admin", ad);
			request.getRequestDispatcher("views/main.jsp").forward(request, response);
		}else {//没这个人
			request.setAttribute("errorMsg", "用户名或密码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	protected void queryStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		String name = request.getParameter("name").trim();
		Student st = ss.getStudentByStuName(name);
		PrintWriter out = response.getWriter();
		 if(st!=null) {//有这个人
			 String jsonOutput= JSON.toJSONString(st);
			 out.write(jsonOutput);
			 out.flush();
		     out.close();
//			 System.out.println();
		}else {//没这个人
//			System.out.println("test");
			 out.write("null");
			 out.flush();
		     out.close();
		}
//		 out.write(array);
	}
	
	protected void queryCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		String name = request.getParameter("name").trim();
		Student st = ss.getStudentByStuName(name);
		PrintWriter out = response.getWriter();
		 if(st!=null) {//有这个人
			 List<Course> co = cs.getCoursesbyStuId(st.getXh());
			 String jsonOutput= JSON.toJSONString(co);
//			 jsonOutput = jsonOutput.substring(1, jsonOutput.length()-1);
//			 System.out.println(jsonOutput);
			 out.write(jsonOutput);
			 out.flush();
		     out.close();
		}else {//没这个人
			 out.write("null");
			 out.flush();
		     out.close();
		}
	}
	protected void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取表单信息
		String oldId = request.getParameter("oldId").trim();
		String adminId = request.getParameter("adminId").trim();
		if(oldId.equals(adminId) || !as.isExist(adminId)) {//id相同可以改自己的,id不重复
			String adminName = request.getParameter("adminName").trim();
			String adminPwd = request.getParameter("adminPwd").trim();
			as.updateAdmin(adminId, adminName,adminPwd,oldId);
			List<Admin> adminlist = as.getAllAdmin();
			HttpSession session = request.getSession();
			session.setAttribute("adminlist", adminlist);
			request.getRequestDispatcher("views/ManAdmin.jsp").forward(request, response);
		}else{//不可以改id为已存在的
			request.setAttribute("errorMsg", "该账户已经存在");
			request.getRequestDispatcher("views/ManAdmin.jsp").forward(request, response);
		}
	}
	protected void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取表单信息
		String id = request.getParameter("adminId").trim();
		as.deleteAdmin(id);
		List<Admin> adminlist = as.getAllAdmin();
		HttpSession session = request.getSession();
		session.setAttribute("adminlist", adminlist);
		request.getRequestDispatcher("views/ManAdmin.jsp").forward(request, response);
	}
	protected void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取表单信息
		String adminId = request.getParameter("adminId").trim();
		String adminName = request.getParameter("adminName").trim();
		String adminPwd = request.getParameter("adminPwd").trim();
		Admin ad = new Admin();
		ad.setAdminId(adminId);
		ad.setAdminName(adminName);
		ad.setAdminPwd(adminPwd);
		as.addAdmin(ad);
		List<Admin> adminlist = as.getAllAdmin();
		HttpSession session = request.getSession();
		session.setAttribute("adminlist", adminlist);
		request.getRequestDispatcher("views/ManAdmin.jsp").forward(request, response);
	}
	protected void datashow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取学生总数
		int allSum = ss.getAllStudentSum();
		//获取挂科学生数
		int falseSum = ss.getFalseStudentSum();
		//获取成绩总数
		int courseSum = cs.getCourseSum();
		//获取挂科最多的6门课程
		List<String> falseCourses = cs.getFalseCourse();
		//获取挂科最多的6个班级
		List<String> falseclasses = cs.getFalseClass();
		//获取挂科科目数
		int falseNum = cs.getFCourseSum();
		HttpSession session = request.getSession();
		session.setAttribute("allSum", allSum);
		session.setAttribute("falseSum", falseSum);
		session.setAttribute("courseSum", courseSum);
		session.setAttribute("falseCourses", falseCourses);
		session.setAttribute("falseclasses", falseclasses);
		request.getRequestDispatcher("views/data.jsp").forward(request, response);
	}
}
