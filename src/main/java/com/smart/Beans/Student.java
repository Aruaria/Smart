package com.smart.Beans;

import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class Student {
	@JSONField(name = "ksh")
	private String ksh;//考生号
	@JSONField(name = "xh")
    private String xh;//学号
	@JSONField(name = "xm")
    private String xm;//姓名
	@JSONField(name = "xb")
    private String xb;//性别
	@JSONField(name = "csrq")
    private String csrq;//出生日期
	@JSONField(name = "sfzh")
    private String sfzh;//身份证号
	@JSONField(name = "zzmm")
    private String zzmm;//政治面貌
	@JSONField(name = "mz")
    private String mz;//民族
	@JSONField(name = "zymc")
    private String zymc;//专业名称
	@JSONField(name = "bj")
    private String bj;//班级
	@JSONField(name = "jg")
    private String jg;//籍贯
    private List<Course> courses;//课程
	public String getKsh() {
		return ksh;
	}
	public void setKsh(String ksh) {
		this.ksh = ksh;
	}
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getBj() {
		return bj;
	}
	public void setBj(String bj) {
		this.bj = bj;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
    
    
}
