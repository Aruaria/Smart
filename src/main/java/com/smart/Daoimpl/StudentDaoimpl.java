package com.smart.Daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smart.Beans.Admin;
import com.smart.Beans.Student;
import com.smart.Dao.StudentDao;
import com.smart.Util.DBUtil;

public class StudentDaoimpl implements StudentDao {

	DBUtil db = new DBUtil();
	ResultSet rs = null;
	
	@Override
	public Student checkStudentIdAndPwd(String id, String pwd) {
		String sql = "select * from 信息系 where 学号 = ?";
		Object[] params = new Object[]{id};
		rs = db.executeQuery(sql, params);
		try {
			if(rs.next()){
				//说明用户名和密码正确,取出对象
				Student st = new Student();
				st.setKsh(rs.getString(1));
				st.setXh(rs.getString(2));
				st.setXm(rs.getString(3));
				st.setXb(rs.getString(4));
				st.setCsrq(rs.getString(5));
				st.setSfzh(rs.getString(6));
				st.setZzmm(rs.getString(7));
				st.setMz(rs.getString(8));
				st.setZymc(rs.getString(9));
				st.setBj(rs.getString(10));
				st.setJg(rs.getString(12));
				return st;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Student getStudentByStuName(String StuName) {
		String sql = "select * from 信息系 where 姓名 = ?";
//		List<Student> stuList = new ArrayList<Student>();
		Object[] params = new Object[]{StuName};
		rs = db.executeQuery(sql, params);
		try {
			if(rs.next()){
				//说明用户名和密码正确,取出对象
				Student st = new Student();
				st.setKsh(rs.getString(1));
				st.setXh(rs.getString(2));
				st.setXm(rs.getString(3));
				st.setXb(rs.getString(4));
				st.setCsrq(rs.getString(5));
				st.setSfzh(rs.getString(6));
				st.setZzmm(rs.getString(7));
				st.setMz(rs.getString(8));
				st.setZymc(rs.getString(9));
				st.setBj(rs.getString(10));
				st.setJg(rs.getString(12));
//				stuList.add(st);
				return st;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getAllStudentSum() {
		String sql = "select count(*) as sum from 信息系";
//		Object[] params = new Object[]{StuName};
		rs = db.executeQuery(sql, null);
		int sum=0;
		try {
			if(rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	@Override
	public int getFalseStudentSum() {
		String sql = "select count(*) as sum  from (select stuId from scores where score < 60 group by stuId) as a";
//		Object[] params = new Object[]{StuName};
		rs = db.executeQuery(sql, null);
		int sum=0;
		try {
			if(rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

}
