package com.naver.erp;

import java.util.List;

public class DTOschool {
	private String school_name; // 학력관련 정보 
	private String school_dept_no;
	private String major;
	private String sub_major;
	private String graduation_date_year;
	private String graduation_date_month;
	private String school_no;
	private int developer_no; 
	
	public int getDeveloper_no() {
		return developer_no;
	}
	public void setDeveloper_no(int developer_no) {
		this.developer_no = developer_no;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getSchool_dept_no() {
		return school_dept_no;
	}
	public void setSchool_dept_no(String school_dept_no) {
		this.school_dept_no = school_dept_no;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSub_major() {
		return sub_major;
	}
	public void setSub_major(String sub_major) {
		this.sub_major = sub_major;
	}
	public String getGraduation_date_year() {
		return graduation_date_year;
	}
	public void setGraduation_date_year(String graduation_date_year) {
		this.graduation_date_year = graduation_date_year;
	}
	public String getGraduation_date_month() {
		return graduation_date_month;
	}
	public void setGraduation_date_month(String graduation_date_month) {
		this.graduation_date_month = graduation_date_month;
	}
	public String getSchool_no() {
		return school_no;
	}
	public void setSchool_no(String school_no) {
		this.school_no = school_no;
	}
	
	
}
