package com.naver.erp;

import java.util.List;

public class DTOproject {
	private int project_no; 
	private String project_name; 
	private String project_start_date_year;
	private String project_start_date_month;
	private String project_end_date_year;
	private String project_end_date_month;
	private String customer_name; // 고객사
	private String worker_name; // 근무사
	private List<Integer> roll;
	
	private String server_kijong_name; // 여기서부터 개발환경 정보
	private String server_os_name;
	private List<Integer> development_language;
	private List<Integer> framework;
	private List<Integer> DBMS;
	private int developer_no; 
	
	public int getDeveloper_no() {
		return developer_no;
	}
	public void setDeveloper_no(int developer_no) {
		this.developer_no = developer_no;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_start_date_year() {
		return project_start_date_year;
	}
	public void setProject_start_date_year(String project_start_date_year) {
		this.project_start_date_year = project_start_date_year;
	}
	public String getProject_start_date_month() {
		return project_start_date_month;
	}
	public void setProject_start_date_month(String project_start_date_month) {
		this.project_start_date_month = project_start_date_month;
	}
	public String getProject_end_date_year() {
		return project_end_date_year;
	}
	public void setProject_end_date_year(String project_end_date_year) {
		this.project_end_date_year = project_end_date_year;
	}
	public String getProject_end_date_month() {
		return project_end_date_month;
	}
	public void setProject_end_date_month(String project_end_date_month) {
		this.project_end_date_month = project_end_date_month;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getWorker_name() {
		return worker_name;
	}
	public void setWorker_name(String worker_name) {
		this.worker_name = worker_name;
	}
	public String getServer_kijong_name() {
		return server_kijong_name;
	}
	public void setServer_kijong_name(String server_kijong_name) {
		this.server_kijong_name = server_kijong_name;
	}
	public String getServer_os_name() {
		return server_os_name;
	}
	public void setServer_os_name(String server_os_name) {
		this.server_os_name = server_os_name;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public List<Integer> getRoll() {
		return roll;
	}
	public void setRoll(List<Integer> roll) {
		this.roll = roll;
	}
	public List<Integer> getDevelopment_language() {
		return development_language;
	}
	public void setDevelopment_language(List<Integer> development_language) {
		this.development_language = development_language;
	}
	public List<Integer> getFramework() {
		return framework;
	}
	public void setFramework(List<Integer> framework) {
		this.framework = framework;
	}
	public List<Integer> getDBMS() {
		return DBMS;
	}
	public void setDBMS(List<Integer> dBMS) {
		DBMS = dBMS;
	}
}
