package com.smart.Daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smart.Beans.Admin;
import com.smart.Beans.Course;
import com.smart.Dao.AdminDao;
import com.smart.Dao.CourseDao;
import com.smart.Util.DBUtil;

public class CourseDaoimpl implements CourseDao {

	DBUtil db = new DBUtil();
	ResultSet rs = null;
	
	@Override
	public List<Course> getCoursesbyStuId(String stuId) {
		String sql="select * from scores where stuId = ?";
		Object[] params = new Object[]{stuId};
		rs = db.executeQuery(sql, params);
		try {
			List<Course> list = new ArrayList<Course>();
			while(rs.next()){
				//根据学号取出他的课程
				Course co = new Course();
				co.setCourseId(rs.getString("classId"));
				co.setCourseName(rs.getString("className"));
				co.setCourseType(rs.getString("classType"));
				co.setCourseNum(rs.getDouble("classNum"));
				co.setScore(rs.getDouble("score"));
				co.setCourseYear(rs.getString("stuyear"));
				list.add(co);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getCourseSum() {
		String sql = "select count(*) as sum from scores";
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
	public int getFCourseSum() {
		String sql = "select count(*) as sum from scores where score < 60";
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
	public List<String> getFalseCourse() {
		String sql = "select className,count(*) as sum from scores where score < 60 group by className order by count(*) desc limit 6";
		List<String> list = new ArrayList<String>();
		rs = db.executeQuery(sql, null);
		try {
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<String> getFalseClass() {
		String sql = "select count(*) as sum,b.班级 from (select stuId from scores where score < 60 group by stuId) as a left join  信息系 as b  on  a.stuId =b.学号 group by b.班级 order by sum desc limit 6";
		List<String> list = new ArrayList<String>();
		rs = db.executeQuery(sql, null);
		try {
			while(rs.next()) {
				list.add(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}
