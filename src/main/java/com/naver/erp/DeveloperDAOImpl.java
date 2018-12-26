package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeveloperDAOImpl implements DeveloperDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//********************************************************************
	// JSP 페이지의 select, checkbox, radio 에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//********************************************************************
	public List<Map<String, String>>  getSkill_List( ){
		//-------------------------------------------------------------------------------------
		// SqlSessionTemplate 객체의 [selectList(~) 메소드] 호출로 [사업 영역 목록]를 리턴.
		//-------------------------------------------------------------------------------------
		// sqlSession.selectList( "com.naver.erp.ContactDAO.getSaup_fieldList" ); 의미
		//-------------------------------------------------------------------------------------
			// 마이바티스 SQL 구문 설정 XML파일(=mapper_contact.xml))에서
			// <mapper namespace="com.naver.erp.ContactDAO">태그 내부의
			// <select id="getSaup_fieldList" ~> 태그 내부의 
			// [n행 리턴 select 쿼리문]을 실행하여 얻은 데이터를  List<Map<String, String>> 객체 담아 리턴한다.
			// 2번째 인자는 [n행 리턴 select 쿼리문]에 삽입될 데이터이다.
			// 리턴 자료형은 <select id="getSaup_fieldList" ~> 태그의 resultType 속성값에 설정한다
		//-------------------------------------------------------------------------------------
		List<Map<String, String>>  skill_List 											// 스킬
			= sqlSession.selectList(  "com.naver.erp.DeveloperDAO.getSkill_List" );
		return skill_List;
	}
	public List<Map<String, String>>  getSchool_IndexList( ){							// 최종학력
		List<Map<String, String>>  school_IndexList 
			= sqlSession.selectList(  "com.naver.erp.DeveloperDAO.getSchool_IndexList" );
		return school_IndexList;
	}
	public List<Map<String, String>>  getRoll_fieldList( ){								// 역할
		List<Map<String, String>>  roll_fieldList 
			= sqlSession.selectList(  "com.naver.erp.DeveloperDAO.getRoll_fieldList" );
		return roll_fieldList;
	}
	@Override
	public List<Map<String, String>> getCertificate_fieldList() {
		// TODO Auto-generated method stub
		List<Map<String, String>>  certificate_fieldList 
		= sqlSession.selectList(  "com.naver.erp.DeveloperDAO.getCertificate_fieldList" );
	return certificate_fieldList;
	};

	
	public int getDeveloperListAllCnt( RegDeveloperSearchDTO  regDeveloperSearchDTO) {
		int developerListAllCnt = sqlSession.selectOne( "com.naver.erp.DeveloperDAO.getDeveloperListAllCnt", regDeveloperSearchDTO);
		return developerListAllCnt;
	}

	// -------------------------
	// 검색한 목록 을 리턴하는 메소드
	// -------------------------
	public List<Map<String,String>> getDeveloperList( RegDeveloperSearchDTO  regDeveloperSearchDTO){
		List<Map<String, String>>  developerList = sqlSession.selectList("com.naver.erp.DeveloperDAO.getDeveloperList", regDeveloperSearchDTO);
		return developerList;
	}
	public int insertDeveloper(RegDeveloperDTO regDeveloperDTO){
	      int insertDeveloper = sqlSession.insert(   
	         "com.naver.erp.DeveloperDAO.insertDeveloper"//실행할 SQL 구문의 위치 지정
	         , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	      );
	      return insertDeveloper;
	   }
	   public int insertSchool(DTOschool dTOschool){
	      int insertSchool = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertSchool"//실행할 SQL 구문의 위치 지정
	            , dTOschool //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertSchool;
	   }
	   public int insertFamily(DTOfamily dTOfamily){
	      int insertFamily = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertFamily"//실행할 SQL 구문의 위치 지정
	            , dTOfamily //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertFamily;
	   }
	   public int insertCompany_career(DTOcompany dTOcompany){
	      int insertCompany_career = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertCompany_career"//실행할 SQL 구문의 위치 지정
	            , dTOcompany //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertCompany_career;
	   }
	   public int insertDeveloper_certificate(RegDeveloperDTO regDeveloperDTO){
	      int insertDeveloper_certificate = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDeveloper_certificate"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDeveloper_certificate;
	   }
	   public int insertForeign_language_read(RegDeveloperDTO regDeveloperDTO){
	      int insertForeign_language_read = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertForeign_language_read"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertForeign_language_read;
	   }
	   public int insertForeign_language_speak(RegDeveloperDTO regDeveloperDTO){
	      int insertForeign_language_speak = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertForeign_language_speak"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertForeign_language_speak;
	   }
	   public int insertIt_education_center(RegDeveloperDTO regDeveloperDTO){
	      int insertIt_education_center = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertIt_education_center"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertIt_education_center;
	   }
	   public int insertDeveloper_subject(RegDeveloperDTO regDeveloperDTO){
	      int insertDeveloper_subject = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDeveloper_subject"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDeveloper_subject;
	   }
	   public int insertFavorite(RegDeveloperDTO regDeveloperDTO){
	      int insertFavorite = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertFavorite"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertFavorite;
	   }
	   public int insertDeveloper_attention(RegDeveloperDTO regDeveloperDTO){
	      int insertDeveloper_attention = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDeveloper_attention"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDeveloper_attention;
	   }
	   public int insertHobby(RegDeveloperDTO regDeveloperDTO){
	      int insertHobby = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertHobby"//실행할 SQL 구문의 위치 지정
	            , regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertHobby;
	   }
	   public int insertDevelopment_career(DTOproject dtOproject){
	      int insertDevelopment_career = sqlSession.insert(   
	               "com.naver.erp.DeveloperDAO.insertDevelopment_career"//실행할 SQL 구문의 위치 지정
	               , dtOproject //실행할 SQL 구문에서 사용할 데이터 설정
	            );
	      
	      return insertDevelopment_career;
	   }
	   public int insertDeveloper_roll(DTOproject dTOproject){
	      int insertDeveloper_roll = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDeveloper_roll"//실행할 SQL 구문의 위치 지정
	            , dTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDeveloper_roll;
	   }
	   public int insertCareer_development_language(DTOproject dTOproject){
	      int insertCareer_development_language = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertCareer_development_language"//실행할 SQL 구문의 위치 지정
	            , dTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertCareer_development_language;
	   }
	   public int insertDevelopment_framework(DTOproject dTOproject){
	      int insertDevelopment_framework = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDevelopment_framework"//실행할 SQL 구문의 위치 지정
	            , dTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDevelopment_framework;
	   }
	   public int insertDevelopment_DBMS(DTOproject dTOproject){
	      int insertDevelopment_DBMS = sqlSession.insert(   
	            "com.naver.erp.DeveloperDAO.insertDevelopment_DBMS"//실행할 SQL 구문의 위치 지정
	            , dTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	         );
	         return insertDevelopment_DBMS;
	   }
	   public List<Map<String,String>> getCertificate(){
	      List<Map<String,String>> getCertificate = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getCertificate"//실행할 SQL 구문의 위치 지정
	            );
	      return getCertificate;
	   }
	   public List<Map<String,String>> getForeign_language(){
	      List<Map<String,String>> getForeign_language = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getForeign_language"//실행할 SQL 구문의 위치 지정
	            );
	      return getForeign_language;
	   }
	   public List<Map<String,String>> getSubject(){
	      List<Map<String,String>> getSubject = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getSubject"//실행할 SQL 구문의 위치 지정
	            );
	      return getSubject;
	   }
	   public List<Map<String, String>> getAttention(){
	      List<Map<String,String>> getAttention = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getAttention"//실행할 SQL 구문의 위치 지정
	            );
	      return getAttention;
	   }
	   public List<Map<String,String>> getRoll(){
	      List<Map<String,String>> getRoll = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getRoll"//실행할 SQL 구문의 위치 지정
	            );
	      return getRoll;
	   }
	   public List<Map<String,String>> getDevelopment_language(){
	      List<Map<String,String>> getDevelopment_language = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getDevelopment_language"//실행할 SQL 구문의 위치 지정
	            );
	      return getDevelopment_language;
	   }
	   public List<Map<String,String>> getFramework(){
	      List<Map<String,String>> getFramework = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getFramework"//실행할 SQL 구문의 위치 지정
	            );
	      return getFramework;
	   }
	   public List<Map<String, String>> getDbms(){
	      List<Map<String,String>> getDbms = sqlSession.selectList(
	            "com.naver.erp.DeveloperDAO.getDbms"//실행할 SQL 구문의 위치 지정
	            );
	      return getDbms;
	   }
	   public int checkid(RegDeveloperDTO regDeveloperDTO) {
		      int checkid = sqlSession.selectOne(
		            "com.naver.erp.DeveloperDAO.checkid"//실행할 SQL 구문의 위치 지정
		            ,regDeveloperDTO
		            );
		      return checkid;
		   }
		   public int checkaccount_num(RegDeveloperDTO regDeveloperDTO) {
		      int checkaccount_num = sqlSession.selectOne(
		            "com.naver.erp.DeveloperDAO.checkaccount_num"//실행할 SQL 구문의 위치 지정
		            ,regDeveloperDTO
		            );
		      return checkaccount_num;
		   }
	////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////수정, 삭제 페이지 입력문////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////
	public int Updatedeveloper(RegDeveloperDTO regDeveloperDTO){
	int Updatedeveloper = sqlSession.update(	
	"com.naver.erp.DeveloperDAO.Updatedeveloper"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return Updatedeveloper;
	}
	public int deleteSchool(RegDeveloperDTO regDeveloperDTO){
	int deleteSchool = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteSchool"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteSchool;
	}
	public int UpdateSchool(DTOschool dTOschool){
	int UpdateSchool = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateSchool"//실행할 SQL 구문의 위치 지정
	, dTOschool //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateSchool;
	}
	public int deleteFamily(RegDeveloperDTO regDeveloperDTO){
	int deleteFamily = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteFamily"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteFamily;
	}
	public int UpdateFamily(DTOfamily DTOfamily){
	int UpdateFamily = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateFamily"//실행할 SQL 구문의 위치 지정
	, DTOfamily //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateFamily;
	}
	public int deleteCompany_career(RegDeveloperDTO regDeveloperDTO){
	int deleteCompany_career = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteCompany_career"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteCompany_career;
	}
	public int UpdateCompany_career(DTOcompany DTOcompany){
	int UpdateCompany_career = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateCompany_career"//실행할 SQL 구문의 위치 지정
	, DTOcompany //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateCompany_career;
	}
	public int deleteCertificate(RegDeveloperDTO regDeveloperDTO){
	int deleteCertificate = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteCertificate"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteCertificate;
	}
	public int UpdateDeveloper_certificate(RegDeveloperDTO regDeveloperDTO){
	int UpdateDeveloper_certificate = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDeveloper_certificate"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDeveloper_certificate;
	}
	public int deleteforeign_language_read(RegDeveloperDTO regDeveloperDTO){
	int deleteforeign_language_read = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteforeign_language_read"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteforeign_language_read;
	}
	public int UpdateForeign_language_read(RegDeveloperDTO regDeveloperDTO){
	int UpdateForeign_language_read = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateForeign_language_read"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateForeign_language_read;
	}
	public int deleteforeign_language_speak(RegDeveloperDTO regDeveloperDTO){
	int deleteforeign_language_speak = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteforeign_language_speak"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteforeign_language_speak;
	}
	public int UpdateForeign_language_speak(RegDeveloperDTO regDeveloperDTO){
	int UpdateForeign_language_speak = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateForeign_language_speak"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateForeign_language_speak;
	}
	public int deleteIt_education_center(RegDeveloperDTO regDeveloperDTO) {
	int deleteIt_education_center = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteIt_education_center"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteIt_education_center;
	}
	public int updateIt_education_center(RegDeveloperDTO regDeveloperDTO){
	int updateIt_education_center = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.updateIt_education_center"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return updateIt_education_center;
	}
	public int deleteSubject(RegDeveloperDTO regDeveloperDTO){
	int deleteSubject = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteSubject"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteSubject;
	}
	public int UpdateDeveloper_subject(RegDeveloperDTO regDeveloperDTO){
	int UpdateDeveloper_subject = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDeveloper_subject"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDeveloper_subject;
	}
	public int UpdateFavorite(RegDeveloperDTO regDeveloperDTO){
	int UpdateFavorite = sqlSession.update(	
	"com.naver.erp.DeveloperDAO.UpdateFavorite"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateFavorite;
	}
	public int deleteAttention(RegDeveloperDTO regDeveloperDTO){
	int deleteAttention = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteAttention"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteAttention;
	}
	public int UpdateDeveloper_attention(RegDeveloperDTO regDeveloperDTO){
	int UpdateDeveloper_attention = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDeveloper_attention"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDeveloper_attention;
	}
	public int UpdateHobby(RegDeveloperDTO regDeveloperDTO){
	int UpdateHobby = sqlSession.update(	
	"com.naver.erp.DeveloperDAO.UpdateHobby"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateHobby;
	}
	public int deleteDevelopment_career(RegDeveloperDTO regDeveloperDTO){
	int deleteDevelopment_career = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteDevelopment_career"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteDevelopment_career;
	}
	public int UpdateDevelopment_career(DTOproject DTOproject){
	int UpdateDevelopment_career = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDevelopment_career"//실행할 SQL 구문의 위치 지정
	, DTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDevelopment_career;
	}
	public int deleteRoll(RegDeveloperDTO regDeveloperDTO){
	int deleteRoll = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteRoll"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteRoll;
	}
	public int UpdateDeveloper_roll(DTOproject DTOproject){
	int UpdateDeveloper_roll = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDeveloper_roll"//실행할 SQL 구문의 위치 지정
	, DTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDeveloper_roll;
	}
	public int deleteCareer_development_language(RegDeveloperDTO regDeveloperDTO){
	int deleteCareer_development_language = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteCareer_development_language"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteCareer_development_language;
	}
	public int UpdateCareer_development_language(DTOproject DTOproject){
	int UpdateCareer_development_language = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateCareer_development_language"//실행할 SQL 구문의 위치 지정
	, DTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateCareer_development_language;
	}
	public int deleteFramework(RegDeveloperDTO regDeveloperDTO){
	int deleteFramework = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteFramework"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteFramework;
	}
	public int UpdateDevelopment_framework(DTOproject DTOproject){
	int UpdateDevelopment_framework = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDevelopment_framework"//실행할 SQL 구문의 위치 지정
	, DTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDevelopment_framework;
	}
	public int deleteDbms(RegDeveloperDTO regDeveloperDTO){
	int deleteDbms = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteDbms"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteDbms;
	}
	public int UpdateDevelopment_DBMS(DTOproject DTOproject){
	int UpdateDevelopment_DBMS = sqlSession.insert(	
	"com.naver.erp.DeveloperDAO.UpdateDevelopment_DBMS"//실행할 SQL 구문의 위치 지정
	, DTOproject //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return UpdateDevelopment_DBMS;
	}
	public int deletedeveloper(RegDeveloperDTO regDeveloperDTO) {
	int deleteDevelopment = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deletedeveloper"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteDevelopment;
	}
	public int deleteFavorite(RegDeveloperDTO regDeveloperDTO) {
	int deleteFavorite = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteFavorite"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteFavorite;
	}
	public int deleteHobby(RegDeveloperDTO regDeveloperDTO) {
	int deleteHobby = sqlSession.delete(	
	"com.naver.erp.DeveloperDAO.deleteHobby"//실행할 SQL 구문의 위치 지정
	, regDeveloperDTO //실행할 SQL 구문에서 사용할 데이터 설정
	);
	return deleteHobby;
	}
	//////////////////////수정, 삭제 페이지 출력문//////////////////////////////////
	public RegDeveloperDTO getUpdeldeveloper(int developer_no) {
	RegDeveloperDTO getUpdeldeveloper = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdeldeveloper"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdeldeveloper;
	}
	public int getUpdelschoolCnt(int developer_no) {
	int getUpdelschoolCnt = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelschoolCnt"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelschoolCnt;
	}
	public DTOschool getUpdelschool(Map<String, Integer> Ln_Cnt) {
	DTOschool getUpdelschool = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelschool"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelschool;
	}
	public int getUpdelfamilyCnt(int developer_no){
	int getUpdelfamilyCnt = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelfamilyCnt"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelfamilyCnt;
	}
	public DTOfamily getUpdelfamily(Map<String, Integer> Ln_Cnt){
	DTOfamily getUpdelfamily = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelfamily"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelfamily;
	}
	public int getUpdelcompanyCnt(int developer_no){
	int getUpdelcompanyCnt = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelcompanyCnt"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelcompanyCnt;
	}
	public DTOcompany getUpdelcompany(Map<String, Integer> Ln_Cnt){
	DTOcompany getUpdelcompany = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelcompany"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelcompany;
	}
	public List<Integer> getUpdelcertificate(int developer_no){
	List<Integer> getUpdelcertificate = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelcertificate"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelcertificate;
	}
	public List<Integer> getUpdelforeign_language_read(int developer_no){
	List<Integer> getUpdelforeign_language_read = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelforeign_language_read"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelforeign_language_read;
	}
	public List<Integer> getUpdelforeign_language_speak(int developer_no){
	List<Integer> getUpdelforeign_language_speak = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelforeign_language_speak"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelforeign_language_speak;
	}
	public RegDeveloperDTO getUpdeleducation(int developer_no){
	RegDeveloperDTO getUpdeleducation = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdeleducation"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdeleducation;
	}
	public List<Integer> getUpdelsubject(int developer_no){
	List<Integer> getUpdelsubject = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelsubject"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelsubject;
	}
	public RegDeveloperDTO getUpdelfavorite(int developer_no){
	RegDeveloperDTO getUpdelfavorite = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelfavorite"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelfavorite;
	}
	public List<Integer> getUpdelattention(int developer_no){
	List<Integer> getUpdelattention = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelattention"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelattention;
	}
	public RegDeveloperDTO getUpdelhobby(int developer_no){
	RegDeveloperDTO getUpdelhobby = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelhobby"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelhobby;
	}
	public int getUpdelprojectCnt(int developer_no){
	int getUpdelprojectCnt = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelprojectCnt"//실행할 SQL 구문의 위치 지정
	,developer_no
	);
	return getUpdelprojectCnt;
	}
	public DTOproject getUpdelproject(Map<String, Integer> Ln_Cnt){
	DTOproject getUpdelproject = sqlSession.selectOne(
	"com.naver.erp.DeveloperDAO.getUpdelproject"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelproject;
	}
	public List<Integer> getUpdelroll(Map<String, Integer> Ln_Cnt){
	List<Integer> getUpdelroll = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelroll"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelroll;
	}
	public List<Integer> getUpdelcareea_development_language(Map<String, Integer> Ln_Cnt){
	List<Integer> getUpdelcareea_development_language = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelcareea_development_language"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelcareea_development_language;
	}
	public List<Integer> getUpdelframework(Map<String, Integer> Ln_Cnt){
	List<Integer> getUpdelframework = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdelframework"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdelframework;
	}
	public List<Integer> getUpdeldbms(Map<String, Integer> Ln_Cnt){
	List<Integer> getUpdeldbms = sqlSession.selectList(
	"com.naver.erp.DeveloperDAO.getUpdeldbms"//실행할 SQL 구문의 위치 지정
	,Ln_Cnt
	);
	return getUpdeldbms;
	}
	
}
