package com.naver.erp;

import java.util.List;

public class RegDeveloperSearchDTO {
	private String min_devYear; // 검색조건 변수
	private String max_devYear;
	private String gender1;
	private String gender2;
	private List<Integer> skill;
	private List<Integer> final_education;
	
	private List<String> dispatch;
	private List<Integer> certificate;
	private String birth_year1;
	private String birth_month1;
	private String birth_year2;  
	private String birth_month2;
	private List<Integer> role;
	private String min_age;
	private String max_age;
	private String min_soju;
	private String max_soju;
	private String addr;
	private String min_beer;
	private String max_beer;
	private String orAnd;
	private String sort_multi;
	private String keyword1; // 1번쨰 키워드 저장 // 검색관련 변수
	
	private String keyword2; // 2번쨰 키워드 저장
	// 검색 결과 저장 DTO 공통 속성변수 선언
	private String sort; //정렬 데이터 저장.<참고> 필요에 따라 초기값 입력 가능.
	private int rowCntPerPage=15; // 한 화면에 보여지는 검색 결과 최대행 개수 저장. <주의> 반드시 초기값 입력할것.
	private int selectPageNo=1; // 현재 선택된 페이지 번호 저장. <주의> 반드시 초기값 입력할 것.
	private int beginRowNo;
	private int endRowNo;
	
	
	
	public String getGender1() {
		return gender1;
	}
	public String getGender2() {
		return gender2;
	}
	public void setGender1(String gender1) {
		this.gender1 = gender1;
	}
	public void setGender2(String gender2) {
		this.gender2 = gender2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMin_devYear() {
		return min_devYear;
	}
	public String getMax_devYear() {
		return max_devYear;
	}
//	public List<String> getGender() {
//		return gender;
//	}
	public List<Integer> getSkill() {
		return skill;
	}
	public List<Integer> getFinal_education() {
		return final_education;
	}
	public List<String> getDispatch() {
		return dispatch;
	}
	public List<Integer> getCertificate() {
		return certificate;
	}
	public String getBirth_year1() {
		return birth_year1;
	}
	public String getBirth_month1() {
		return birth_month1;
	}
	public String getBirth_year2() {
		return birth_year2;
	}
	public String getBirth_month2() {
		return birth_month2;
	}
	public List<Integer> getRole() {
		return role;
	}
	public String getMin_age() {
		return min_age;
	}
	public String getMax_age() {
		return max_age;
	}
	public String getMin_soju() {
		return min_soju;
	}
	public String getMax_soju() {
		return max_soju;
	}
	public String getMin_beer() {
		return min_beer;
	}
	public String getMax_beer() {
		return max_beer;
	}
	public String getOrAnd() {
		return orAnd;
	}
	public String getSort_multi() {
		return sort_multi;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public String getSort() {
		return sort;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public int getBeginRowNo() {
		return beginRowNo;
	}
	public int getEndRowNo() {
		return endRowNo;
	}
	public void setMin_devYear(String min_devYear) {
		this.min_devYear = min_devYear;
	}
	public void setMax_devYear(String max_devYear) {
		this.max_devYear = max_devYear;
	}
//	public void setGender(List<String> gender) {
//		this.gender = gender;
//	}
	public void setSkill(List<Integer> skill) {
		this.skill = skill;
	}
	public void setFinal_education(List<Integer> final_education) {
		this.final_education = final_education;
	}
	public void setDispatch(List<String> dispatch) {
		this.dispatch = dispatch;
	}
	public void setCertificate(List<Integer> certificate) {
		this.certificate = certificate;
	}
	public void setBirth_year1(String birth_year1) {
		this.birth_year1 = birth_year1;
	}
	public void setBirth_month1(String birth_month1) {
		this.birth_month1 = birth_month1;
	}
	public void setBirth_year2(String birth_year2) {
		this.birth_year2 = birth_year2;
	}
	public void setBirth_month2(String birth_month2) {
		this.birth_month2 = birth_month2;
	}
	public void setRole(List<Integer> role) {
		this.role = role;
	}
	public void setMin_age(String min_age) {
		this.min_age = min_age;
	}
	public void setMax_age(String max_age) {
		this.max_age = max_age;
	}
	public void setMin_soju(String min_soju) {
		this.min_soju = min_soju;
	}
	public void setMax_soju(String max_soju) {
		this.max_soju = max_soju;
	}
	public void setMin_beer(String min_beer) {
		this.min_beer = min_beer;
	}
	public void setMax_beer(String max_beer) {
		this.max_beer = max_beer;
	}
	public void setOrAnd(String orAnd) {
		this.orAnd = orAnd;
	}
	public void setSort_multi(String sort_multi) {
		this.sort_multi = sort_multi;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public void setBeginRowNo(int beginRowNo) {
		this.beginRowNo = beginRowNo;
	}
	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}
	
}
