package com.naver.erp;

import java.util.List;

public class DTOfamily {
	private String family_name; 
	private String family_relation_no;
	private String family_birth;
	private String family_together;
	private int developer_no; 
	
	public int getDeveloper_no() {
		return developer_no;
	}
	public void setDeveloper_no(int developer_no) {
		this.developer_no = developer_no;
	}
	public String getFamily_name() {
		return family_name;
	}
	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}
	public String getFamily_relation_no() {
		return family_relation_no;
	}
	public void setFamily_relation_no(String family_relation_no) {
		this.family_relation_no = family_relation_no;
	}
	public String getFamily_birth() {
		return family_birth;
	}
	public void setFamily_birth(String family_birth) {
		this.family_birth = family_birth;
	}
	public String getFamily_together() {
		return family_together;
	}
	public void setFamily_together(String family_together) {
		this.family_together = family_together;
	}
}
