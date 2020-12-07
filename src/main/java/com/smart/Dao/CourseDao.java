package com.smart.Dao;

import java.util.List;

import com.smart.Beans.Course;

public interface CourseDao {
	//根据学号获取多个课程信息
	public List<Course> getCoursesbyStuId(String stuId);
	//获取成绩总数
	public int getCourseSum();
	//获取挂科科目数
	public int getFCourseSum();
	//获取挂科最多的6门课程
	public List<String> getFalseCourse();
	//获取挂科最多的6个班级
	public List<String> getFalseClass();
}
