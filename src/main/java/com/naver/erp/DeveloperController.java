package com.naver.erp;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DeveloperController {

	@Autowired
	private DeveloperService developerService;
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////  스킬
	
	@ModelAttribute("skill_List")	// @ModelAttribute가 붙은 메소드는 0개 이상이다. 키값은 다 다르게줘야함
	public List<Map<String,String>> getSkill_List(){ 
		List<Map<String,String>> skill_List = this.developerService.getSkill_List();
		return skill_List;
	}
	
//	@ModelAttribute("skill_Map")
//	public Map<String,String> getSaup_fieldMap(){ 
//		//-----------------------------------------------------------------------------
//		// 동료 메소드인 getSkill_List() 를 호출하여 
//		// DB 에 있는 사업분야 목록을 검색해 List<Map<String,String>> 객체에 저장하기
//		// List<Map<String,String>> 객체에 저장된 사업 목록 데이터를 Map<String,String> 객체로 저장하기
//		//-----------------------------------------------------------------------------
//		List<Map<String, String>> skill_List = getSkill_List();
//		Map<String,String> skill_Map = new HashMap<String,String>();
//		for(Map<String,String> tmp : skill_List) {
//			skill_Map.put(tmp.get("skill_code"), tmp.get("skill_name"));
//		}
//		return skill_Map;
//	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////// 최종학력
	
	@ModelAttribute("school_IndexList")	// @ModelAttribute가 붙은 메소드는 0개 이상이다. 키값은 다 다르게줘야함
	public List<Map<String,String>> getSchool_IndexList(){ 
		List<Map<String,String>> school_IndexList = this.developerService.getSchool_IndexList();
		return school_IndexList;
	}
	
//	@ModelAttribute("school_IndexMap")
//	public Map<String,String> getSchool_IndexMap(){ 
//	//-----------------------------------------------------------------------------
//	// 동료 메소드인 getSchool_IndexList() 를 호출하여 
//	// DB 에 있는 사업분야 목록을 검색해 List<Map<String,String>> 객체에 저장하기
//	// List<Map<String,String>> 객체에 저장된 사업 목록 데이터를 Map<String,String> 객체로 저장하기
//	//-----------------------------------------------------------------------------
//		List<Map<String, String>> school_IndexList = getSchool_IndexList();
//		Map<String,String> school_IndexMap = new HashMap<String,String>();
//		for(Map<String,String> tmp : school_IndexList) {
//			school_IndexMap.put(tmp.get("school_no"), tmp.get("school_name"));
//		}
//		return school_IndexMap;
//	}

///////////////////////////////////////////////////////////////////////////////////////////////////////// 역할

	@ModelAttribute("roll_fieldList")	// @ModelAttribute가 붙은 메소드는 0개 이상이다. 키값은 다 다르게줘야함
	public List<Map<String,String>> getRoll_fieldList(){ 
		List<Map<String,String>> roll_fieldList = this.developerService.getRoll_fieldList();
		return roll_fieldList;
	}
	
//	@ModelAttribute("roll_fieldMap")
//	public Map<String,String> getRoll_fieldMap(){ 
//	//-----------------------------------------------------------------------------
//	//동료 메소드인 getRoll_fieldList() 를 호출하여 
//	//DB 에 있는 사업분야 목록을 검색해 List<Map<String,String>> 객체에 저장하기
//	//List<Map<String,String>> 객체에 저장된 사업 목록 데이터를 Map<String,String> 객체로 저장하기
//	//-----------------------------------------------------------------------------
//		List<Map<String, String>> roll_fieldList = getRoll_fieldList();
//		Map<String,String> roll_fieldMap = new HashMap<String,String>();
//		for(Map<String,String> tmp : roll_fieldList) {
//			roll_fieldMap.put(tmp.get("roll_no"), tmp.get("roll_name"));
//		}
//			return roll_fieldMap;
//	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////// 자격증

@ModelAttribute("certificate_fieldList")	// @ModelAttribute가 붙은 메소드는 0개 이상이다. 키값은 다 다르게줘야함
public List<Map<String,String>> getCertificate_fieldList(){ 
List<Map<String,String>> certificate_fieldList = this.developerService.getCertificate_fieldList();
return certificate_fieldList;
}
@ModelAttribute("certificateList")
public List<Map<String, String>> certificateList(){
   List<Map<String,String>> certificateList = this.developerService.getCertificate();
   return certificateList;
}
@ModelAttribute("foreign_languageList")
public List<Map<String, String>> foreign_languageList(){
   List<Map<String,String>> foreign_languageList = this.developerService.getForeign_language();
   return foreign_languageList;
}
@ModelAttribute("subjectList")
public List<Map<String, String>> subjectList(){
   List<Map<String,String>> subjectList = this.developerService.getSubject();
   return subjectList;
}
@ModelAttribute("attentionList")
public List<Map<String, String>> attentionList(){
   List<Map<String,String>> attentionList = this.developerService.getAttention();
   return attentionList;
}
@ModelAttribute("rollList")
public List<Map<String, String>> rollList(){
   List<Map<String,String>> rollList = this.developerService.getRoll();
   return rollList;
}
@ModelAttribute("development_languageList")
public List<Map<String, String>> development_languageList(){
   List<Map<String,String>> development_languageList = this.developerService.getDevelopment_language();
   return development_languageList;
}
@ModelAttribute("frameworkList")
public List<Map<String, String>> frameworkList(){
   List<Map<String,String>> frameworkList = this.developerService.getFramework();
   return frameworkList;
}
@ModelAttribute("dbmsList")
public List<Map<String, String>> dbmsList(){
   List<Map<String,String>> dbmsList = this.developerService.getDbms();
   return dbmsList;
}

//@ModelAttribute("certificate_fieldMap")
//public Map<String,String> getCertificate_fieldMap(){ 
////-----------------------------------------------------------------------------
////동료 메소드인 getRoll_fieldList() 를 호출하여 
////DB 에 있는 사업분야 목록을 검색해 List<Map<String,String>> 객체에 저장하기
////List<Map<String,String>> 객체에 저장된 사업 목록 데이터를 Map<String,String> 객체로 저장하기
////-----------------------------------------------------------------------------
//List<Map<String, String>> certificate_fieldList = getCertificate_fieldList();
//Map<String,String> certificate_fieldMap = new HashMap<String,String>();
//for(Map<String,String> tmp : certificate_fieldList) {
//	certificate_fieldMap.put(tmp.get("roll_no"), tmp.get("roll_name"));
//}
//return certificate_fieldMap;
//}
/////////////////////////////////////////////////////////////////////////////////////////////////////////

@RequestMapping( 
        
        // 클라이언트(웹브라우저)의 접속 URL 설정
        value="/developerRegProc.do", 
        // 클라이언트(웹브라우저)가 파라미터를 보내는 방법은 post로 설정, 즉 post 방식으로 보낸 데이터만 받겠다는 의미
        method=RequestMethod.POST,
        // 클라이언트(웹브라우저)가 응답받을 수 있는 데이터 형식과 문자셋 지정
        produces="application/json;charset=UTF-8"
  )
  @ResponseBody // -> 메소드의 리턴값을 JSON으로 변경하여 클라이언트에게 전송하는 어노테이션 설정
  public int insertDeveloper( 
        
        @ModelAttribute("regDeveloperDTO") RegDeveloperDTO regDeveloperDTO
        ) {
           int result = 0;
           try {
              // [BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [입력성공 행의 개수]얻기
              int developerRegCnt = this.developerService.insertDeveloper(regDeveloperDTO);
              int schoolRegCnt = this.developerService.insertSchool(regDeveloperDTO);
              int familyRegCnt = this.developerService.insertFamily(regDeveloperDTO);
              int company_careerRegCnt = this.developerService.insertCompany_career(regDeveloperDTO);
              int Developer_certificateRegCnt = this.developerService.insertDeveloper_certificate(regDeveloperDTO);
              int Foreign_language_readRegCnt = this.developerService.insertForeign_language_read(regDeveloperDTO);
              int Foreign_language_speakRegCnt = this.developerService.insertForeign_language_speak(regDeveloperDTO);
              int it_education_centerRegCnt = this.developerService.insertIt_education_center(regDeveloperDTO);
              int developer_subjectRegCnt = this.developerService.insertDeveloper_subject(regDeveloperDTO);
              int favoriteRegCnt = this.developerService.insertFavorite(regDeveloperDTO);
              int developer_attentionRegCnt = this.developerService.insertDeveloper_attention(regDeveloperDTO);
              int hobbyRegCnt = this.developerService.insertHobby(regDeveloperDTO);
              int development_careerRegCnt = this.developerService.insertDevelopment_career(regDeveloperDTO);
              result = developerRegCnt;
           }catch(Exception ex) {
              // 예외 발생 시 실행할 코드 설정
              result = -1;
              System.out.println("insertDeveloper.insertDeveloper(~) 메소드 예외 발생");
           }
           return result;
  }


	@RequestMapping(       
	        // 클라이언트(웹브라우저)의 접속 URL 설정
	        value="/registerForm.do"
	  )
	  public String asdf() {
	     return "registerForm";
	  }

	@RequestMapping(value="/devSearchForm.do")
	public ModelAndView DeveloperForm(
			// 모든 파라미터값이 저장된 ContactSearchDTO 객체를 매개변수로 선언
			// 이 파라미터 값들은 연락처 검색 화면을 구현하는데 필요한 데이터들이다.
			@ModelAttribute("regDeveloperSearchDTO") RegDeveloperSearchDTO regDeveloperSearchDTO
	){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("devSearchform");
		try {
			System.out.println("1");
//		System.out.println(regDeveloperSearchDTO.getAddr());
//			System.out.println(regDeveloperSearchDTO.getMin_devYear());
//			System.out.println(regDeveloperSearchDTO.getMax_devYear());
			System.out.println(regDeveloperSearchDTO.getGender1());
			System.out.println(regDeveloperSearchDTO.getGender2());
			//System.out.println(regDeveloperSearchDTO.getSort());
			
//			System.out.println(regDeveloperSearchDTO.getSkill());
//			System.out.println(regDeveloperSearchDTO.getFinal_education());
//			System.out.println(regDeveloperSearchDTO.getDispatch());
//			System.out.println(regDeveloperSearchDTO.getCertificate());
//			System.out.println(regDeveloperSearchDTO.getBirth_year1());
//			System.out.println(regDeveloperSearchDTO.getBirth_month1());
//			System.out.println(regDeveloperSearchDTO.getBirth_year2());
//			System.out.println(regDeveloperSearchDTO.getBirth_month2());
//			System.out.println(regDeveloperSearchDTO.getRole());
//			System.out.println(regDeveloperSearchDTO.getMin_age());
//			System.out.println(regDeveloperSearchDTO.getMax_age());
//			System.out.println(regDeveloperSearchDTO.getMin_soju());
//			System.out.println(regDeveloperSearchDTO.getMax_soju());
//			System.out.println(regDeveloperSearchDTO.getMax_beer());
//			System.out.println(regDeveloperSearchDTO.getMin_beer());
//			System.out.println(regDeveloperSearchDTO.getOrAnd());
//			System.out.println(regDeveloperSearchDTO.getSort());
//			System.out.println(regDeveloperSearchDTO.getBeginRowNo());
//			System.out.println(regDeveloperSearchDTO.getEndRowNo());
			

			
			// 성공 총 개수 리턴
			
			int developerListAllCnt = this.developerService.getDeveloperListAllCnt(regDeveloperSearchDTO);
		
			int selectPageNo = regDeveloperSearchDTO.getSelectPageNo();
			int rowCntPerPage = regDeveloperSearchDTO.getRowCntPerPage();
			Map<String,Integer> pageingData = PageingData2.getPageingData(
					developerListAllCnt
					,selectPageNo
					,rowCntPerPage
					, 10
			);

			regDeveloperSearchDTO.setSelectPageNo( pageingData.get("selectPageNo") );
			// 페이지 번호 맞는 시작행 번호를 regDeveloperDTO 객체에 재입력해 준다
			regDeveloperSearchDTO.setBeginRowNo( pageingData.get("beginRowNo") );
			// 페이지 번호 맞는 끝행 번호를 regDeveloperDTO 객체에 재입력해 준다
			regDeveloperSearchDTO.setEndRowNo( pageingData.get("endRowNo") );
			
			// DeveloperSeviceImpl 객체의 메소드 호출로 검색한 검색 목록 얻기
			//System.out.println("1818");
			List<Map<String,String>> developerList = this.developerService.getDeveloperList(regDeveloperSearchDTO);
			//System.out.println("1231818");
			mav.addObject("developerListAllCnt", developerListAllCnt);
			// [ModelAndView객체]에 검색한 연락처 목록 을 저장하기
			mav.addObject("developerList", developerList);
			// [ModelAndView객체]에 페이징 처리 관련 데이터가 저장된 HashMap 객체 저장하기
			mav.addObject("pageingData", pageingData);
			
			mav.addObject("regDeveloperSearchDTO", regDeveloperSearchDTO);
			
			
			
		}catch(Exception e) {
			System.out.println(" DeveloperController.DeveloperForm(~) 메소드 예외 발생");
		}
		return mav;
	}


	
	
	
	
@RequestMapping( 
			
			// 클라이언트(웹브라우저)의 접속 URL 설정
			value="/updelProc.do", 
			// 클라이언트(웹브라우저)가 파라미터를 보내는 방법은 post로 설정, 즉 post 방식으로 보낸 데이터만 받겠다는 의미
			method=RequestMethod.POST,
			// 클라이언트(웹브라우저)가 응답받을 수 있는 데이터 형식과 문자셋 지정
			produces="application/json;charset=UTF-8"
	)
	@ResponseBody // -> 메소드의 리턴값을 JSON으로 변경하여 클라이언트에게 전송하는 어노테이션 설정
	public int UpdelDeveloper( 
			@RequestParam("upDel") String upDel
			,@ModelAttribute("regDeveloperDTO") RegDeveloperDTO regDeveloperDTO
			) {
				int result = 0;
				System.out.println(regDeveloperDTO.getDay_smoking());
				System.out.println("sadas" + regDeveloperDTO.getDeveloper_no());
				try {
					if(upDel.equals("u")) {
						int developerUpCnt = this.developerService.UpdateDeveloper(regDeveloperDTO);
						result = developerUpCnt;
					}
					else if(upDel.equals("d")) {
						int developerDelCnt = this.developerService.DeleteDeveloper(regDeveloperDTO);
						result = developerDelCnt;
					}

				}catch(Exception ex) {
					// 예외 발생 시 실행할 코드 설정
					result = -1;
					System.out.println("insertDeveloper.insertDeveloper(~) 메소드 예외 발생");
				}
				return result;
	}
	/////////////////////수정 삭제 페이지 출력//////////////////////////////////
	@RequestMapping( 
			// 클라이언트(웹브라우저)의 접속 URL 설정
			value="/updelForm.do"
	)
	public ModelAndView UpdelDeveloper( 
			@RequestParam(value="developer_no" , required=false, defaultValue="20") int developer_no
			) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("updelForm");
				System.out.println(developer_no);
				try {
					mav.addObject("developer_no",developer_no);
					//RegDeveloperDTO regDeveloperDTO
					// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [입력성공 행의 개수]얻기
					RegDeveloperDTO developList = this.developerService.getUpdeldeveloper(developer_no);
					mav.addObject("developList", developList);
					System.out.println("fffff");
					RegDeveloperDTO educationList = this.developerService.getUpdeleducation(developer_no);
					mav.addObject("educationList", educationList);
					System.out.println("11");
					RegDeveloperDTO favoriteList = this.developerService.getUpdelfavorite(developer_no);
					mav.addObject("favoriteList", favoriteList);
					System.out.println("22");
					RegDeveloperDTO hobbyList = this.developerService.getUpdelhobby(developer_no);
					mav.addObject("hobbyList", hobbyList);
					System.out.println("33");
					
					int schoolCnt = this.developerService.getUpdelschoolCnt(developer_no);
					mav.addObject("schoolCnt", schoolCnt);
					System.out.println("44");
					for(int i = 1; i <= schoolCnt; i++) {
						Map<String, Integer> Ln_Cnt = new HashMap<String,Integer>();
						Ln_Cnt.put("developer_no", developer_no);
						Ln_Cnt.put("schoolCnt", i);
						DTOschool schoolList = this.developerService.getUpdelschool(Ln_Cnt);
						mav.addObject("schoolList"+i, schoolList);
					}
					int familyCnt = this.developerService.getUpdelfamilyCnt(developer_no);
					mav.addObject("familyCnt", familyCnt);
					for(int i = 1; i <= familyCnt; i++) {
						Map<String, Integer> Ln_Cnt = new HashMap<String,Integer>();
						Ln_Cnt.put("developer_no", developer_no);
						Ln_Cnt.put("familyCnt", i);
						DTOfamily familyList = this.developerService.getUpdelfamily(Ln_Cnt);
						mav.addObject("familyList"+i, familyList);
					}
					System.out.println("55");
					int companyCnt = this.developerService.getUpdelcompanyCnt(developer_no);
					mav.addObject("companyCnt", companyCnt);
					for(int i = 1; i <= companyCnt; i++) {
						Map<String, Integer> Ln_Cnt = new HashMap<String,Integer>();
						Ln_Cnt.put("developer_no", developer_no);
						Ln_Cnt.put("companyCnt", i);
						DTOcompany companyList = this.developerService.getUpdelcompany(Ln_Cnt);
						mav.addObject("companyList"+i, companyList);
					}
					int projectCnt = this.developerService.getUpdelprojectCnt(developer_no);
					mav.addObject("projectCnt", projectCnt);
					for(int i = 1; i <= projectCnt; i++) {
						Map<String, Integer> Ln_Cnt = new HashMap<String,Integer>();
						Ln_Cnt.put("developer_no", developer_no);
						Ln_Cnt.put("projectCnt", i);
						DTOproject projectList = this.developerService.getUpdelproject(Ln_Cnt);
						mav.addObject("projectList"+i, projectList);
					}
					System.out.println("66");
				}catch(Exception ex) {
					// 예외 발생 시 실행할 코드 설정
					System.out.println("UpdelDeveloper.UpdelDeveloper(~) 메소드 예외 발생");
				}
				return mav;
	}
}