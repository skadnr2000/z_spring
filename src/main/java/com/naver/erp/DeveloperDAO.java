package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface DeveloperDAO {

	//*****************************************************
	// JSP 페이지의 checkbox에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//*****************************************************
	List<Map<String, String>>  getSkill_List( );
	List<Map<String, String>>  getSchool_IndexList( );
	List<Map<String, String>>  getRoll_fieldList( );
	
	// ------------------------------------
	// [검색한 목록 총 개수] 를 리턴하는 메소드 선언
	// ------------------------------------
	int getDeveloperListAllCnt( RegDeveloperSearchDTO regDeveloperSearchDTO);
	// -------------------------
	// 검색한 목록 을 리턴하는 메소드
	// -------------------------
	List<Map<String,String>> getDeveloperList( RegDeveloperSearchDTO  regDeveloperSearchDTO);
	List<Map<String, String>> getCertificate_fieldList();
	int insertDeveloper(RegDeveloperDTO regDeveloperDTO);
	   int insertSchool(DTOschool dTOschool);
	   int insertFamily(DTOfamily dTOfamily);
	   int insertCompany_career(DTOcompany dTOcompany);
	   int insertDeveloper_certificate(RegDeveloperDTO regDeveloperDTO);
	   int insertForeign_language_read(RegDeveloperDTO regDeveloperDTO);
	   int insertForeign_language_speak(RegDeveloperDTO regDeveloperDTO);
	   int insertIt_education_center(RegDeveloperDTO regDeveloperDTO);
	   int insertDeveloper_subject(RegDeveloperDTO regDeveloperDTO);
	   int insertFavorite(RegDeveloperDTO regDeveloperDTO);
	   int insertDeveloper_attention(RegDeveloperDTO regDeveloperDTO);
	   int insertHobby(RegDeveloperDTO regDeveloperDTO);
	   int insertDevelopment_career(DTOproject dtOproject);
	   int insertDeveloper_roll(DTOproject dTOproject);
	   int insertCareer_development_language(DTOproject dTOproject);
	   int insertDevelopment_framework(DTOproject dTOproject);
	   int insertDevelopment_DBMS(DTOproject dTOproject);
	   List<Map<String,String>> getCertificate();
	   List<Map<String, String>> getForeign_language();
	   List<Map<String,String>> getSubject();
	   List<Map<String, String>> getAttention();
	   List<Map<String,String>> getRoll();
	   List<Map<String, String>> getDevelopment_language();
	   List<Map<String,String>> getFramework();
	   List<Map<String, String>> getDbms();
	   int checkaccount_num(RegDeveloperDTO regDeveloperDTO);
	   int checkid(RegDeveloperDTO regDeveloperDTO);
	 //개발자 정보 수정, 삭제 페이지 출력 
		RegDeveloperDTO getUpdeldeveloper(int developer_no);
		int getUpdelschoolCnt(int developer_no);
		DTOschool getUpdelschool(Map<String, Integer> Ln_Cnt);
		int getUpdelfamilyCnt(int developer_no);
		DTOfamily getUpdelfamily(Map<String, Integer> Ln_Cnt);
		int getUpdelcompanyCnt(int developer_no);
		DTOcompany getUpdelcompany(Map<String, Integer> Ln_Cnt);
		List<Integer> getUpdelcertificate(int developer_no);
		List<Integer> getUpdelforeign_language_read(int developer_no);
		List<Integer> getUpdelforeign_language_speak(int developer_no);
		RegDeveloperDTO getUpdeleducation(int developer_no);
		List<Integer> getUpdelsubject(int developer_no);
		RegDeveloperDTO getUpdelfavorite(int developer_no);
		List<Integer> getUpdelattention(int developer_no);
		RegDeveloperDTO getUpdelhobby(int developer_no);
		int getUpdelprojectCnt(int developer_no);
		DTOproject getUpdelproject(Map<String, Integer> Ln_Cnt);
		List<Integer> getUpdelroll(Map<String, Integer> Ln_Cnt);
		List<Integer> getUpdelcareea_development_language(Map<String, Integer> Ln_Cnt);
		List<Integer> getUpdelframework(Map<String, Integer> Ln_Cnt);
		List<Integer> getUpdeldbms(Map<String, Integer> Ln_Cnt);
		//개발자 정보 수정, 삭제 페이지 입력
		int Updatedeveloper(RegDeveloperDTO regDeveloperDTO);
		int deleteSchool(RegDeveloperDTO regDeveloperDTO);
		int UpdateSchool(DTOschool DTOschool);
		int deleteFamily(RegDeveloperDTO regDeveloperDTO);
		int UpdateFamily(DTOfamily DTOfamily);
		int deleteCompany_career(RegDeveloperDTO regDeveloperDTO);
		int UpdateCompany_career(DTOcompany DTOcompany);
		int deleteCertificate(RegDeveloperDTO regDeveloperDTO);
		int UpdateDeveloper_certificate(RegDeveloperDTO regDeveloperDTO);
		int deleteforeign_language_read(RegDeveloperDTO regDeveloperDTO);
		int UpdateForeign_language_read(RegDeveloperDTO regDeveloperDTO);
		int deleteforeign_language_speak(RegDeveloperDTO regDeveloperDTO);
		int UpdateForeign_language_speak(RegDeveloperDTO regDeveloperDTO);
		int deleteIt_education_center(RegDeveloperDTO regDeveloperDTO);
		int updateIt_education_center(RegDeveloperDTO regDeveloperDTO);
		int deleteSubject(RegDeveloperDTO regDeveloperDTO);
		int UpdateDeveloper_subject(RegDeveloperDTO regDeveloperDTO);
		int UpdateFavorite(RegDeveloperDTO regDeveloperDTO);
		int deleteAttention(RegDeveloperDTO regDeveloperDTO);
		int UpdateDeveloper_attention(RegDeveloperDTO regDeveloperDTO);
		int UpdateHobby(RegDeveloperDTO regDeveloperDTO);
		int deleteDevelopment_career(RegDeveloperDTO regDeveloperDTO);
		int UpdateDevelopment_career(DTOproject DTOproject);
		int deleteRoll(RegDeveloperDTO regDeveloperDTO);
		int UpdateDeveloper_roll(DTOproject DTOproject);
		int deleteCareer_development_language(RegDeveloperDTO regDeveloperDTO);
		int UpdateCareer_development_language(DTOproject DTOproject);
		int deleteFramework(RegDeveloperDTO regDeveloperDTO);
		int UpdateDevelopment_framework(DTOproject DTOproject);
		int deleteDbms(RegDeveloperDTO regDeveloperDTO);
		int UpdateDevelopment_DBMS(DTOproject DTOproject);
		int deletedeveloper(RegDeveloperDTO RegDeveloperDTO);
		int deleteFavorite(RegDeveloperDTO RegDeveloperDTO);
		int deleteHobby(RegDeveloperDTO RegDeveloperDTO);
}
