package com.smart.Serviceimpl;

import java.util.List;

import com.smart.Beans.Course;
import com.smart.Dao.CourseDao;
import com.smart.Daoimpl.CourseDaoimpl;
import com.smart.Service.CourseService;

public class CourseServiceimpl implements CourseService {
	
	CourseDao cd = new CourseDaoimpl();
	
	@Override
	public List<Course> getCoursesbyStuId(String stuId) {
		return cd.getCoursesbyStuId(stuId);
	}

	@Override
	public int getCourseSum() {
		// TODO Auto-generated method stub
		return cd.getCourseSum();
	}

	@Override
	public int getFCourseSum() {
		// TODO Auto-generated method stub
		return cd.getCourseSum();
	}

	@Override
	public List<String> getFalseCourse() {
		// TODO Auto-generated method stub
		return cd.getFalseCourse();
	}

	@Override
	public List<String> getFalseClass() {
		// TODO Auto-generated method stub
		return cd.getFalseClass();
	}

}
