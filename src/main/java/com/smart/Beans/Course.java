package com.smart.Beans;

import com.alibaba.fastjson.annotation.JSONField;

public class Course {

	@JSONField(name = "stuId")
	private String stuId;//学号
	@JSONField(name = "courseId")
	private String courseId;//课程编号
	@JSONField(name = "courseName")
	private String courseName;//课程名
	@JSONField(name = "courseType")
	private String courseType;//课程类型
	@JSONField(name = "courseNum")
	private double courseNum;//学分
	@JSONField(name = "score")
	private double score;//成绩
	@JSONField(name = "courseYear")
	private String courseYear;//学年
	
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseType() {
		return courseType;
	}
	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}
	public double getCourseNum() {
		return courseNum;
	}
	public void setCourseNum(double courseNum) {
		this.courseNum = courseNum;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getCourseYear() {
		return courseYear;
	}
	public void setCourseYear(String courseYear) {
		this.courseYear = courseYear;
	}
	
	
	
}
