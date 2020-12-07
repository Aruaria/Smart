package com.smart.Dao;

import java.util.List;

import com.smart.Beans.Student;

public interface StudentDao {
	
	//获取学生信息
	public Student checkStudentIdAndPwd(String id, String pwd);
	//获取学生信息
	public Student getStudentByStuName(String StuName);
	//获取学生总数
	public int getAllStudentSum();
	//获取挂科人数
	public int getFalseStudentSum();
}
