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
			@RequestParam(value="developer_no", required=false, defaultValue="82") int developer_no
			) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("updelForm");
				try {
					// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [입력성공 행의 개수]얻기
					RegDeveloperDTO developList = this.developerService.getUpdeldeveloper(developer_no);
					mav.addObject("developList", developList);

					//System.out.println("fffff");
					RegDeveloperDTO educationList = this.developerService.getUpdeleducation(developer_no);
					mav.addObject("educationList", educationList);
					//System.out.println("11");
					RegDeveloperDTO favoriteList = this.developerService.getUpdelfavorite(developer_no);
					mav.addObject("favoriteList", favoriteList);
					//System.out.println("22");
					RegDeveloperDTO hobbyList = this.developerService.getUpdelhobby(developer_no);
					mav.addObject("hobbyList", hobbyList);
					//System.out.println("33");
					
					int schoolCnt = this.developerService.getUpdelschoolCnt(developer_no);
					mav.addObject("schoolCnt", schoolCnt);
					//System.out.println("44");

					RegDeveloperDTO educationList = this.developerService.getUpdeleducation(developer_no);
					mav.addObject("educationList", educationList);
					RegDeveloperDTO favoriteList = this.developerService.getUpdelfavorite(developer_no);
					mav.addObject("favoriteList", favoriteList);
					RegDeveloperDTO hobbyList = this.developerService.getUpdelhobby(developer_no);
					mav.addObject("hobbyList", hobbyList);
					
					int schoolCnt = this.developerService.getUpdelschoolCnt(developer_no);
					mav.addObject("schoolCnt", schoolCnt);

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

				//	System.out.println("55");

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

					//System.out.println("66");

				}catch(Exception ex) {
					// 예외 발생 시 실행할 코드 설정
					System.out.println("UpdelDeveloper.UpdelDeveloper(~) 메소드 예외 발생");
				}
				return mav;
	}
	//////////////////개발자 정보 입력////////////////////////////
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
				int schoolCnt = 0;
				int familyCnt = 0;
				try {
					// [BoardServiceImpl 객체]의 insertBoard 메소드 호출로 게시판 입력하고 [입력성공 행의 개수]얻기
					int developerRegCnt = this.developerService.insertDeveloper(regDeveloperDTO);
					if(developerRegCnt == 1)
						schoolCnt = this.developerService.insertSchool(regDeveloperDTO);
					if(schoolCnt >= 1)
						familyCnt = this.developerService.insertFamily(regDeveloperDTO);
					if(familyCnt >= 1) {
						this.developerService.insertCompany(regDeveloperDTO);
						this.developerService.insertProject(regDeveloperDTO);
					}
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
	public String goRegisterForm() {
		return "registerForm";
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
}
