package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class DeveloperServiceImpl implements DeveloperService{
	
	@Autowired
	private DeveloperDAO developerDAO;

	//*****************************************************
	// JSP 페이지의 select, checkbox, radio 에 삽입될 
	// [연락처 사업분야 목록]을 리턴하는  메소드 선언
	//*****************************************************
	public List<Map<String, String>>  getSkill_List( ){
		List<Map<String, String>>  skill_List = this.developerDAO.getSkill_List(  );
		return skill_List;
	}
	public List<Map<String, String>>  getSchool_IndexList( ){
		List<Map<String, String>>  school_IndexList = this.developerDAO.getSchool_IndexList(  );
		return school_IndexList;
	}
	public List<Map<String, String>>  getRoll_fieldList( ){
		List<Map<String, String>>  roll_fieldList = this.developerDAO.getRoll_fieldList(  );
		return roll_fieldList;
	}
	@Override
	public List<Map<String, String>> getCertificate_fieldList() {
		List<Map<String, String>>  certificate_fieldList = this.developerDAO.getCertificate_fieldList(  );
		return certificate_fieldList;
	};
	
	
	public int getDeveloperListAllCnt( RegDeveloperSearchDTO  regDeveloperSearchDTO) {
//		if(regDeveloperSearchDTO.get)
		//System.out.println(regDeveloperSearchDTO.getSkill());
		int developerListAllCnt = this.developerDAO.getDeveloperListAllCnt(regDeveloperSearchDTO);
		//System.out.println('2');
		return developerListAllCnt;
	}

	// -------------------------
	// 검색한 목록 을 리턴하는 메소드
	// -------------------------
	public List<Map<String,String>> getDeveloperList( RegDeveloperSearchDTO  regDeveloperSearchDTO){
		//System.out.println(regDeveloperSearchDTO.getSkill());
		List<Map<String, String>>  developerList = this.developerDAO.getDeveloperList(regDeveloperSearchDTO);
		//System.out.println('1');
		return developerList;
	}
	   
	public int insertDeveloper(RegDeveloperDTO regDeveloperDTO) {
	      int checkid = this.developerDAO.checkid(regDeveloperDTO);
	      int checkaccount_num = this.developerDAO.checkaccount_num(regDeveloperDTO);
	      if(checkid > 0)
	         return -4;
	      else if(checkaccount_num > 0)
	         return -5;
	         // BoardDAOImpl 객체의 getBoardList 메소드 호출로 게시판 글 입력하기
	      else {
	         int DeveloperRegCnt = this.developerDAO.insertDeveloper(regDeveloperDTO);
	         return DeveloperRegCnt;
	      }
	   }
	   

	   public int insertSchool(RegDeveloperDTO regDeveloperDTO) {
	      int SchoolRegCnt = 0;
	      for(int i = 0; i < regDeveloperDTO.getSchool().size();i++) {
	         if(regDeveloperDTO.getSchool().get(i).getSchool_name() != null && 
	               regDeveloperDTO.getSchool().get(i).getSchool_name() != "")
	            SchoolRegCnt = this.developerDAO.insertSchool(regDeveloperDTO.getSchool().get(i));
	      }
	      
	      return SchoolRegCnt;
	   }
	   public int insertFamily(RegDeveloperDTO regDeveloperDTO) {
	      int FamilyRegCnt = 0;
	      for(int i = 0; i < regDeveloperDTO.getFamily().size();i++) {
	         if(regDeveloperDTO.getFamily().get(i).getFamily_name() != null && 
	               regDeveloperDTO.getFamily().get(i).getFamily_name() != "")
	            FamilyRegCnt = this.developerDAO.insertFamily(regDeveloperDTO.getFamily().get(i));
	      }
	      return FamilyRegCnt;
	   }
	   
	   public int insertCompany_career(RegDeveloperDTO regDeveloperDTO) {
	      int Company_careerRegCnt = 0;
	      for(int i = 0; i < regDeveloperDTO.getCompany().size();i++) {
	         if(regDeveloperDTO.getCompany().get(i).getCompany_name() != null && 
	               regDeveloperDTO.getCompany().get(i).getCompany_name() != "")
	            Company_careerRegCnt = this.developerDAO.insertCompany_career(regDeveloperDTO.getCompany().get(i));
	      }
	      return Company_careerRegCnt;
	   }
	   
	   public int insertDeveloper_certificate(RegDeveloperDTO regDeveloperDTO) {
	      int Developer_certificateRegCnt = 0;
	      if(regDeveloperDTO.getCertificate()!=null)
	         Developer_certificateRegCnt = this.developerDAO.insertDeveloper_certificate(regDeveloperDTO);
	      return Developer_certificateRegCnt;
	   }
	   
	   public int insertForeign_language_read(RegDeveloperDTO regDeveloperDTO) {
	      int Foreign_language_read = 0;
	      if(regDeveloperDTO.getForeign_language_read()!=null)
	            this.developerDAO.insertForeign_language_read(regDeveloperDTO);
	      return Foreign_language_read;
	   }
	   
	   public int insertForeign_language_speak(RegDeveloperDTO regDeveloperDTO) {
	      int Foreign_language_speakRegCnt = 0;
	      if(regDeveloperDTO.getForeign_language_speak()!=null)
	         Foreign_language_speakRegCnt = this.developerDAO.insertForeign_language_speak(regDeveloperDTO);
	      return Foreign_language_speakRegCnt;
	   }
	   
	   public int insertIt_education_center(RegDeveloperDTO regDeveloperDTO) {
	      
	      int It_education_centerRegCnt = 0;
	      if(regDeveloperDTO.getIt_education_center_name()!="")
	      It_education_centerRegCnt =   this.developerDAO.insertIt_education_center(regDeveloperDTO);
	      return It_education_centerRegCnt;
	   }
	   
	   public int insertDeveloper_subject(RegDeveloperDTO regDeveloperDTO) {
	      int Developer_subjectRegCnt = 0;
	      if(regDeveloperDTO.getSubject()!=null)
	         Developer_subjectRegCnt = this.developerDAO.insertDeveloper_subject(regDeveloperDTO);
	      return Developer_subjectRegCnt;
	   }
	   
	   public int insertFavorite(RegDeveloperDTO regDeveloperDTO) {
	      
	      int FavoriteRegCnt = this.developerDAO.insertFavorite(regDeveloperDTO);
	      return FavoriteRegCnt;
	   }
	   
	   public int insertDeveloper_attention(RegDeveloperDTO regDeveloperDTO) {
	      int Developer_attentionRegCnt = 0;
	      if(regDeveloperDTO.getAttention()!=null)
	            this.developerDAO.insertDeveloper_attention(regDeveloperDTO);
	      return Developer_attentionRegCnt;
	   }
	   
	   public int insertHobby(RegDeveloperDTO regDeveloperDTO) {
	      int HobbyRegCnt = this.developerDAO.insertHobby(regDeveloperDTO);
	      return HobbyRegCnt;
	   }
	   
	   public int insertDevelopment_career(RegDeveloperDTO regDeveloperDTO) {
	      int Development_careerCnt = 0;
	      for(int i = 0; i < regDeveloperDTO.getProject().size(); i++) {
	         if(regDeveloperDTO.getProject().get(i).getProject_name()!="")
	         Development_careerCnt = this.developerDAO.insertDevelopment_career(regDeveloperDTO.getProject().get(i));
	         if(Development_careerCnt == 1) {
	            this.developerDAO.insertDeveloper_roll(regDeveloperDTO.getProject().get(i));
	            this.developerDAO.insertCareer_development_language(regDeveloperDTO.getProject().get(i));
	            this.developerDAO.insertDevelopment_framework(regDeveloperDTO.getProject().get(i));
	            this.developerDAO.insertDevelopment_DBMS(regDeveloperDTO.getProject().get(i));
	         }
	      }
	      return Development_careerCnt;
	   }
	   public List<Map<String,String>> getCertificate(){
	      List<Map<String,String>> getCertificate = this.developerDAO.getCertificate();
	      return getCertificate;
	   }
	   public List<Map<String, String>> getForeign_language(){
	      List<Map<String,String>> getForeign_language = this.developerDAO.getForeign_language();
	      return getForeign_language;
	   }
	   public List<Map<String,String>> getSubject(){
	      List<Map<String,String>> getSubject = this.developerDAO.getSubject();
	      return getSubject;
	   }
	   public List<Map<String, String>> getAttention(){
	      List<Map<String,String>> getAttention = this.developerDAO.getAttention();
	      return getAttention;
	   }
	   public List<Map<String,String>> getRoll(){
	      List<Map<String,String>> getRoll = this.developerDAO.getRoll();
	      return getRoll;
	   }
	   public List<Map<String, String>> getDevelopment_language(){
	      List<Map<String,String>> getDevelopment_language = this.developerDAO.getDevelopment_language();
	      return getDevelopment_language;
	   }
	   public List<Map<String,String>> getFramework(){
	      List<Map<String,String>> getFramework = this.developerDAO.getFramework();
	      return getFramework;
	   }
	   public List<Map<String, String>> getDbms(){
	      List<Map<String,String>> getDbms = this.developerDAO.getDbms();
	      return getDbms;
	   }
	   
	   
	   
	   public RegDeveloperDTO getUpdeldeveloper(int developer_no) {
			RegDeveloperDTO getUpdeldeveloper = this.developerDAO.getUpdeldeveloper(developer_no);
			if(getUpdeldeveloper != null) {
				List<Integer> certificate = this.developerDAO.getUpdelcertificate(developer_no);
				getUpdeldeveloper.setCertificate(certificate);
				List<Integer> foreign_language_read = this.developerDAO.getUpdelforeign_language_read(developer_no);
				getUpdeldeveloper.setForeign_language_read(foreign_language_read);
				List<Integer> foreign_language_speak = this.developerDAO.getUpdelforeign_language_speak(developer_no);
				getUpdeldeveloper.setForeign_language_speak(foreign_language_speak);
				List<Integer> subject = this.developerDAO.getUpdelsubject(developer_no);
				getUpdeldeveloper.setSubject(subject);
				List<Integer> attention = this.developerDAO.getUpdelattention(developer_no);
				getUpdeldeveloper.setAttention(attention);
				//List<DTOschool> school = this.developerDAO.getUpdelschool(developer_no);
				//getUpdeldeveloper.setSchool(school);
			}
			return getUpdeldeveloper;
		}
		public RegDeveloperDTO getUpdeleducation(int developer_no) {
			RegDeveloperDTO getUpdeleducation = this.developerDAO.getUpdeleducation(developer_no);
			return getUpdeleducation;
		}
		public RegDeveloperDTO getUpdelfavorite(int developer_no) {
			RegDeveloperDTO getUpdelfavorite = this.developerDAO.getUpdelfavorite(developer_no);
			return getUpdelfavorite;
		}
		public RegDeveloperDTO getUpdelhobby(int developer_no) {
			RegDeveloperDTO getUpdelhobby = this.developerDAO.getUpdelhobby(developer_no);
			return getUpdelhobby;
		}
		public int getUpdelschoolCnt(int developer_no) {
			int schoolCnt = this.developerDAO.getUpdelschoolCnt(developer_no);
			return schoolCnt;
		}
		public DTOschool getUpdelschool(Map<String, Integer> Ln_Cnt) {
			DTOschool school = this.developerDAO.getUpdelschool(Ln_Cnt);
			return school;
		}
		public int getUpdelfamilyCnt(int developer_no) {
			int familyCnt = this.developerDAO.getUpdelfamilyCnt(developer_no);
			return familyCnt;
		}
		public DTOfamily getUpdelfamily(Map<String, Integer> Ln_Cnt) {
			DTOfamily family = this.developerDAO.getUpdelfamily(Ln_Cnt);
			return family;
		}
		public int getUpdelcompanyCnt(int developer_no) {
			int companyCnt = this.developerDAO.getUpdelcompanyCnt(developer_no);
			return companyCnt;
		}
		public DTOcompany getUpdelcompany(Map<String, Integer> Ln_Cnt) {
			DTOcompany company = this.developerDAO.getUpdelcompany(Ln_Cnt);
			return company;
		}
		public int getUpdelprojectCnt(int developer_no) {
			int projectCnt = this.developerDAO.getUpdelprojectCnt(developer_no);
			return projectCnt;
		}
		public DTOproject getUpdelproject(Map<String, Integer> Ln_Cnt) {
			
			DTOproject project = this.developerDAO.getUpdelproject(Ln_Cnt);
			
				if(project != null) {
					Ln_Cnt.put("project_no", project.getProject_no());
					List<Integer> roll = this.developerDAO.getUpdelroll(Ln_Cnt);
					project.setRoll(roll);
					List<Integer> development_language = this.developerDAO.getUpdelcareea_development_language(Ln_Cnt);
					project.setDevelopment_language(development_language);
					List<Integer> framework = this.developerDAO.getUpdelframework(Ln_Cnt);
					project.setFramework(framework);
					List<Integer> dbms = this.developerDAO.getUpdeldbms(Ln_Cnt);
					project.setDBMS(dbms);
				}
			return project;
		}
	public int UpdateDeveloper(RegDeveloperDTO regDeveloperDTO) {
			int UpdateDeveloper = this.developerDAO.Updatedeveloper(regDeveloperDTO);
			this.developerDAO.deleteSchool(regDeveloperDTO);
			int SchoolRegCnt = 0;
			for(int i = 0; i < regDeveloperDTO.getSchool().size();i++) {
				if(regDeveloperDTO.getSchool().get(i).getSchool_name() != null && 
					regDeveloperDTO.getSchool().get(i).getSchool_name() != "") {
					regDeveloperDTO.getSchool().get(i).setDeveloper_no(regDeveloperDTO.getDeveloper_no());
					this.developerDAO.UpdateSchool(regDeveloperDTO.getSchool().get(i));
				}
			}
			this.developerDAO.deleteFamily(regDeveloperDTO);
			int FamilyRegCnt = 0;
			for(int i = 0; i < regDeveloperDTO.getFamily().size();i++) {
				if(regDeveloperDTO.getFamily().get(i).getFamily_name() != null && 
						regDeveloperDTO.getFamily().get(i).getFamily_name() != "") {
					regDeveloperDTO.getFamily().get(i).setDeveloper_no(regDeveloperDTO.getDeveloper_no());
					if(regDeveloperDTO.getFamily().get(i).getFamily_together() == null ||
							regDeveloperDTO.getFamily().get(i).getFamily_together() == "")
						regDeveloperDTO.getFamily().get(i).setFamily_together("n");
					this.developerDAO.UpdateFamily(regDeveloperDTO.getFamily().get(i));
				}
			}
			this.developerDAO.deleteCompany_career(regDeveloperDTO);
			int Company_careerRegCnt = 0;
			for(int i = 0; i < regDeveloperDTO.getCompany().size();i++) {
				if(regDeveloperDTO.getCompany().get(i).getCompany_name() != null && 
						regDeveloperDTO.getCompany().get(i).getCompany_name() != "") {
					regDeveloperDTO.getCompany().get(i).setDeveloper_no(regDeveloperDTO.getDeveloper_no());
					this.developerDAO.UpdateCompany_career(regDeveloperDTO.getCompany().get(i));
				}
					
			}
			this.developerDAO.deleteCertificate(regDeveloperDTO);
			if(regDeveloperDTO.getCertificate() != null)
				this.developerDAO.UpdateDeveloper_certificate(regDeveloperDTO);
			this.developerDAO.deleteforeign_language_read(regDeveloperDTO);
			if(regDeveloperDTO.getForeign_language_read() != null)
				this.developerDAO.UpdateForeign_language_read(regDeveloperDTO);
			this.developerDAO.deleteforeign_language_speak(regDeveloperDTO);
			if(regDeveloperDTO.getForeign_language_speak() != null)
				this.developerDAO.UpdateForeign_language_speak(regDeveloperDTO);
			this.developerDAO.deleteIt_education_center(regDeveloperDTO);
			if(regDeveloperDTO.getIt_education_center_name() != "")
				this.developerDAO.updateIt_education_center(regDeveloperDTO);		
			this.developerDAO.deleteSubject(regDeveloperDTO);
			if(regDeveloperDTO.getSubject() != null)
				this.developerDAO.UpdateDeveloper_subject(regDeveloperDTO);
			this.developerDAO.deleteFavorite(regDeveloperDTO);
		      if(regDeveloperDTO.getDay_smoking() != null  &&
		         regDeveloperDTO.getDay_soju() != null  &&
		         regDeveloperDTO.getDay_beer() != null)
		         this.developerDAO.UpdateFavorite(regDeveloperDTO);
		      this.developerDAO.deleteAttention(regDeveloperDTO);
		      if(regDeveloperDTO.getAttention() != null)
		         this.developerDAO.UpdateDeveloper_attention(regDeveloperDTO);
		      this.developerDAO.deleteHobby(regDeveloperDTO);
		      if(regDeveloperDTO.getHobby1() != null &&
		         regDeveloperDTO.getHobby2() != null &&
		         regDeveloperDTO.getHobby3() != null)
		         this.developerDAO.UpdateHobby(regDeveloperDTO);
			this.developerDAO.deleteRoll(regDeveloperDTO);
			this.developerDAO.deleteCareer_development_language(regDeveloperDTO);
			this.developerDAO.deleteFramework(regDeveloperDTO);
			this.developerDAO.deleteDbms(regDeveloperDTO);
			this.developerDAO.deleteDevelopment_career(regDeveloperDTO);
			int Development_careerCnt = 0;
			for(int i = 0; i < regDeveloperDTO.getProject().size(); i++) {
				if(regDeveloperDTO.getProject().get(i).getProject_name() != null && 
						regDeveloperDTO.getProject().get(i).getProject_name() != "") {
						regDeveloperDTO.getProject().get(i).setDeveloper_no(regDeveloperDTO.getDeveloper_no());
						this.developerDAO.UpdateDevelopment_career(regDeveloperDTO.getProject().get(i));
				}
				if(regDeveloperDTO.getProject().get(i).getRoll() != null)
					this.developerDAO.UpdateDeveloper_roll(regDeveloperDTO.getProject().get(i));
				if(regDeveloperDTO.getProject().get(i).getDevelopment_language() != null)
					this.developerDAO.UpdateCareer_development_language(regDeveloperDTO.getProject().get(i));
				if(regDeveloperDTO.getProject().get(i).getFramework() != null)
					this.developerDAO.UpdateDevelopment_framework(regDeveloperDTO.getProject().get(i));
				if(regDeveloperDTO.getProject().get(i).getDBMS() != null)
					this.developerDAO.UpdateDevelopment_DBMS(regDeveloperDTO.getProject().get(i));	
			}
			return UpdateDeveloper;
		}
		public int DeleteDeveloper(RegDeveloperDTO regDeveloperDTO) {
			this.developerDAO.deleteSchool(regDeveloperDTO);
			this.developerDAO.deleteFamily(regDeveloperDTO);
			this.developerDAO.deleteCompany_career(regDeveloperDTO);
			this.developerDAO.deleteCertificate(regDeveloperDTO);
			this.developerDAO.deleteforeign_language_read(regDeveloperDTO);
			this.developerDAO.deleteforeign_language_speak(regDeveloperDTO);
			this.developerDAO.deleteIt_education_center(regDeveloperDTO);
			this.developerDAO.deleteSubject(regDeveloperDTO);
			this.developerDAO.deleteFavorite(regDeveloperDTO);
			this.developerDAO.deleteAttention(regDeveloperDTO);
			this.developerDAO.deleteHobby(regDeveloperDTO);
			this.developerDAO.deleteRoll(regDeveloperDTO);
			this.developerDAO.deleteCareer_development_language(regDeveloperDTO);
			this.developerDAO.deleteFramework(regDeveloperDTO);
			this.developerDAO.deleteDbms(regDeveloperDTO);
			this.developerDAO.deleteDevelopment_career(regDeveloperDTO);
			int DeleteDeveloper = this.developerDAO.deletedeveloper(regDeveloperDTO);
			return DeleteDeveloper;
		}
	

}
