package com.smart.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginOrLogoutServlet")
public class LoginOrLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		case "logout":
			logout(request,response);
			break;
		}
		
		
	}
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取表单参数
		HttpSession session = request.getSession();
		String verity = request.getParameter("verity").trim().toLowerCase();
		String id = request.getParameter("id").trim();
		String Code = ((String)session.getAttribute("code")).toLowerCase();
		//校验验证码,如果验证码正确，再校验是管理员还是学生
		
		if(Code.equals(verity)) {
			//验证码正确，再校验是管理员还是学生，如果id长度是5，是管理员，长度是11，是学生
			if(id.length()==5) {
				//id长度是5，是管理员
				request.getRequestDispatcher("AdminServlet?method=login").forward(request, response);
			}else if(id.length()==11) {
				//id长度是11，是学生
				request.getRequestDispatcher("StudentServlet?method=login").forward(request, response);
			}else {
				//既不是学生也不是管理员
				request.setAttribute("errorMsg", "账号或密码错误");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else {
			//验证码错误
			request.setAttribute("errorMsg", "验证码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("admin", null);
		session.setAttribute("student", null);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
