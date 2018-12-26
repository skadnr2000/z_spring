package com.naver.erp;

import java.util.List;

public class RegDeveloperDTO {
	private int developer_no; 
	private String developer_id;
	private String developer_pwd;
	private String developer_name;
	private String developer_jumin_num;
	private String developer_phone;
	private String developer_email;
	private String religion_no;
	private String military_service_no;
	private String zip_code;
	private String addr;
	private String emergency_contact_name;
	private String emergency_contact_relation_no;
	private String emergency_contact_phone;
	private String bank_no;
	private String account_num;
	private List<DTOschool> school;//학력정보
	private List<DTOfamily> family;// 가족정보
	
	
	private List<DTOcompany> company;// 회사경력 정보

	private List<Integer> certificate; //자격증 취득 정보
		
	private List<Integer> foreign_language_read; // 외국어 관련 정보 	
	private List<Integer> foreign_language_speak; // 외국어 관련 정보 
	
	private String it_education_center_name; // 교육센터 관련 정보
	private String education_period;
	private String education_date_year;
	private String education_date_month;
	private String education_date_day;
	
	private List<Integer> subject;// 수료과목

	private String day_smoking; // 관심분야 정보
	private String day_soju;
	private String day_beer;
	private List<Integer> attention;
	
	private String hobby1; // 취미 정보
	private String hobby2;
	private String hobby3;
	
	private List<DTOproject> project;// 개발경력 정보
	
	
	/*private String keyword1; // 1번쨰 키워드 저장 // 검색관련 변수
	
	private String keyword2; // 2번쨰 키워드 저장
	// 검색 결과 저장 DTO 공통 속성변수 선언
	private String sort; //정렬 데이터 저장.<참고> 필요에 따라 초기값 입력 가능.
	private String rowCntPerPage=15; // 한 화면에 보여지는 검색 결과 최대행 개수 저장. <주의> 반드시 초기값 입력할것.
	private String selectPageNo=1; // 현재 선택된 페이지 번호 저장. <주의> 반드시 초기값 입력할 것.
	private String beginRowNo;
	private String endRowNo;*/
	
	public List<DTOfamily> getFamily() {
		return family;
	}
	public List<Integer> getCertificate() {
		return certificate;
	}
	public void setCertificate(List<Integer> certificate) {
		this.certificate = certificate;
	}
	public List<Integer> getForeign_language_read() {
		return foreign_language_read;
	}
	public void setForeign_language_read(List<Integer> foreign_language_read) {
		this.foreign_language_read = foreign_language_read;
	}
	public List<Integer> getForeign_language_speak() {
		return foreign_language_speak;
	}
	public void setForeign_language_speak(List<Integer> foreign_language_speak) {
		this.foreign_language_speak = foreign_language_speak;
	}
	public String getIt_education_center_name() {
		return it_education_center_name;
	}
	public void setIt_education_center_name(String it_education_center_name) {
		this.it_education_center_name = it_education_center_name;
	}
	public String getEducation_period() {
		return education_period;
	}
	public void setEducation_period(String education_period) {
		this.education_period = education_period;
	}

	public String getEducation_date_year() {
		return education_date_year;
	}
	public void setEducation_date_year(String education_date_year) {
		this.education_date_year = education_date_year;
	}
	public String getEducation_date_month() {
		return education_date_month;
	}
	public void setEducation_date_month(String education_date_month) {
		this.education_date_month = education_date_month;
	}
	public String getEducation_date_day() {
		return education_date_day;
	}
	public void setEducation_date_day(String education_date_day) {
		this.education_date_day = education_date_day;
	}
	public List<Integer> getSubject() {
		return subject;
	}
	public void setSubject(List<Integer> subject) {
		this.subject = subject;
	}
	
	public void setFamily(List<DTOfamily> family) {
		this.family = family;
	}
	public int getDeveloper_no() {
		return developer_no;
	}
	public void setDeveloper_no(int developer_no) {
		this.developer_no = developer_no;
	}
	public String getDeveloper_id() {
		return developer_id;
	}
	public void setDeveloper_id(String developer_id) {
		this.developer_id = developer_id;
	}
	public String getDeveloper_pwd() {
		return developer_pwd;
	}
	public void setDeveloper_pwd(String developer_pwd) {
		this.developer_pwd = developer_pwd;
	}
	public String getDeveloper_name() {
		return developer_name;
	}
	public void setDeveloper_name(String developer_name) {
		this.developer_name = developer_name;
	}
	public String getDeveloper_jumin_num() {
		return developer_jumin_num;
	}
	public void setDeveloper_jumin_num(String developer_jumin_num) {
		this.developer_jumin_num = developer_jumin_num;
	}
	public String getDeveloper_phone() {
		return developer_phone;
	}
	public void setDeveloper_phone(String developer_phone) {
		this.developer_phone = developer_phone;
	}
	public String getDeveloper_email() {
		return developer_email;
	}
	public void setDeveloper_email(String developer_email) {
		this.developer_email = developer_email;
	}
	public String getReligion_no() {
		return religion_no;
	}
	public void setReligion_no(String religion_no) {
		this.religion_no = religion_no;
	}
	public String getMilitary_service_no() {
		return military_service_no;
	}
	public void setMilitary_service_no(String military_service_no) {
		this.military_service_no = military_service_no;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmergency_contact_name() {
		return emergency_contact_name;
	}
	public void setEmergency_contact_name(String emergency_contact_name) {
		this.emergency_contact_name = emergency_contact_name;
	}
	public String getEmergency_contact_relation_no() {
		return emergency_contact_relation_no;
	}
	public void setEmergency_contact_relation_no(String emergency_contact_relation_no) {
		this.emergency_contact_relation_no = emergency_contact_relation_no;
	}
	public String getEmergency_contact_phone() {
		return emergency_contact_phone;
	}
	public void setEmergency_contact_phone(String emergency_contact_phone) {
		this.emergency_contact_phone = emergency_contact_phone;
	}
	public String getBank_no() {
		return bank_no;
	}
	public void setBank_no(String bank_no) {
		this.bank_no = bank_no;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public List<DTOschool> getSchool() {
		return school;
	}
	public void setSchool(List<DTOschool> school) {
		this.school = school;
	}
	public List<DTOcompany> getCompany() {
		return company;
	}
	public void setCompany(List<DTOcompany> company) {
		this.company = company;
	}
	public String getDay_smoking() {
		return day_smoking;
	}
	public void setDay_smoking(String day_smoking) {
		this.day_smoking = day_smoking;
	}
	public String getDay_soju() {
		return day_soju;
	}
	public void setDay_soju(String day_soju) {
		this.day_soju = day_soju;
	}
	public String getDay_beer() {
		return day_beer;
	}
	public void setDay_beer(String day_beer) {
		this.day_beer = day_beer;
	}
	public List<Integer> getAttention() {
		return attention;
	}
	public void setAttention(List<Integer> attention) {
		this.attention = attention;
	}
	public String getHobby1() {
		return hobby1;
	}
	public void setHobby1(String hobby1) {
		this.hobby1 = hobby1;
	}
	public String getHobby2() {
		return hobby2;
	}
	public void setHobby2(String hobby2) {
		this.hobby2 = hobby2;
	}
	public String getHobby3() {
		return hobby3;
	}
	public void setHobby3(String hobby3) {
		this.hobby3 = hobby3;
	}
	public List<DTOproject> getProject() {
		return project;
	}
	public void setProject(List<DTOproject> project) {
		this.project = project;
	}
	
}
