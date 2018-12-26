package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface DeveloperService {

	//*****************************************************
	// JSP 페이지의 checkbox에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//*****************************************************
	List<Map<String, String>>  getSkill_List( );
	List<Map<String, String>>  getSchool_IndexList( );
	List<Map<String, String>>  getRoll_fieldList( );
	List<Map<String, String>> getCertificate_fieldList();
	
	// ------------------------------------
	// [검색한 목록 총 개수] 를 리턴하는 메소드 선언
	// ------------------------------------
	int getDeveloperListAllCnt( RegDeveloperSearchDTO regDeveloperSearchDTO);
	// -------------------------
	// 검색한 목록 을 리턴하는 메소드
	// -------------------------
	List<Map<String,String>> getDeveloperList( RegDeveloperSearchDTO  regDeveloperSearchDTO);
	int insertDeveloper(RegDeveloperDTO regDeveloperDTO);
	   int insertSchool(RegDeveloperDTO regDeveloperDTO);
	   int insertFamily(RegDeveloperDTO regDeveloperDTO);
	   int insertCompany_career(RegDeveloperDTO regDeveloperDTO);
	   int insertDeveloper_certificate(RegDeveloperDTO regDeveloperDTO);
	   int insertForeign_language_read(RegDeveloperDTO regDeveloperDTO);
	   int insertForeign_language_speak(RegDeveloperDTO regDeveloperDTO);
	   int insertIt_education_center(RegDeveloperDTO regDeveloperDTO);
	   int insertDeveloper_subject(RegDeveloperDTO regDeveloperDTO);
	   int insertFavorite(RegDeveloperDTO regDeveloperDTO);
	   int insertDeveloper_attention(RegDeveloperDTO regDeveloperDTO);
	   int insertHobby(RegDeveloperDTO regDeveloperDTO);
	   int insertDevelopment_career(RegDeveloperDTO regDeveloperDTO);
	   List<Map<String,String>> getCertificate();
	   List<Map<String, String>> getForeign_language();
	   List<Map<String,String>> getSubject();
	   List<Map<String, String>> getAttention();
	   List<Map<String,String>> getRoll();
	   List<Map<String, String>> getDevelopment_language();
	   List<Map<String,String>> getFramework();
	   List<Map<String, String>> getDbms();
	   
	   RegDeveloperDTO getUpdeldeveloper(int developer_no);
		RegDeveloperDTO getUpdeleducation(int developer_no);
		RegDeveloperDTO getUpdelfavorite(int developer_no);
		RegDeveloperDTO getUpdelhobby(int developer_no);
		int getUpdelschoolCnt(int developer_no);
		int getUpdelfamilyCnt(int developer_no);
		int getUpdelcompanyCnt(int developer_no);
		int getUpdelprojectCnt(int developer_no);
		DTOschool getUpdelschool(Map<String, Integer> Ln_Cnt);
		DTOfamily getUpdelfamily(Map<String, Integer> Ln_Cnt);
		DTOcompany getUpdelcompany(Map<String, Integer> Ln_Cnt);
		DTOproject getUpdelproject(Map<String, Integer> Ln_Cnt);

		int UpdateDeveloper(RegDeveloperDTO regDeveloperDTO);
		int DeleteDeveloper(RegDeveloperDTO regDeveloperDTO);
	
}
