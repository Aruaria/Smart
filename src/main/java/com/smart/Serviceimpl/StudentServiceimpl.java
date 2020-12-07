package com.smart.Serviceimpl;

import java.util.List;

import com.smart.Beans.Student;
import com.smart.Dao.StudentDao;
import com.smart.Daoimpl.StudentDaoimpl;
import com.smart.Service.StudentService;

public class StudentServiceimpl implements StudentService{
	StudentDao sd = new StudentDaoimpl();
	@Override
	public Student checkStudentIdAndPwd(String id, String pwd) {
		if(!id.equals(pwd)) {
			return null;
		}
		return sd.checkStudentIdAndPwd(id, pwd);
	}
	@Override
	public Student getStudentByStuName(String StuName) {
		return sd.getStudentByStuName(StuName);
	}
	@Override
	public int getAllStudentSum() {
		return sd.getAllStudentSum();
	}
	@Override
	public int getFalseStudentSum() {
		return sd.getFalseStudentSum();
	}

}
