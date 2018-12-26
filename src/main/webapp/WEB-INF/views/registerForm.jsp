<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common2.jsp"%>
<script>
//***********************************************************
//행 추가하는 함수 선언
//***********************************************************
function addTR( classN ){
	try{
		//---------------
		// checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
		// checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
		// 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
		//---------------
		var cr_selector = "[type=checkbox],[type=radio]";
		var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]"
		var all_selector = cr_selector + "," +not_cr_selector;
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
		// 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
		//---------------
		var obj = $("."+classN);
		var lastObj = obj.last( );
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수 누적하기
		//---------------
		var dataCnt = 0; 
		var flag = true;
		
		lastObj.find( cr_selector+ ", "+not_cr_selector ).each( function(){
				if( flag == false) { return; }
				// i번째 입력양식을 관리하는 JQuery 객체를 생성해서 저장
				var thisObj = $(this);
				var nameV = thisObj.attr("name");		//선택자 name의 속성값 변경
				if( nameV.indexOf("[")<0 || nameV.indexOf("]")<0 ) {
					alert( "1행의 [" + nameV+"] 라는 입력양식의 이름에는 [i]가 있어야 합니다."); flag = false;
				}
				else{
					// i번째 입력양식이 checkbox 또는 radio 면
					if( thisObj.is(":radio") || thisObj.is(":checkbox") ){
						if( thisObj.filter(":checked").length>0){ dataCnt++;  }
					}
					// i번째 입력양식이 checkbox 도 아니고 radio 도 아니면
					else{
						// i번째 입력양식의 입력값이 있으면 dataCnt 변수안에 1증가
						var val = thisObj.val( );
						if( val.split(" ").join("")!="" ){ dataCnt++; }
					}
				}
		})
		if( flag == false) { return; }
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수가 0개면 함수중단하기
		//---------------
		if(dataCnt==0 ) { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }
		//---------------
		// 마지막 행 복사해 마지막 다음에 삽입하기
		// 삽입한 행의 입력 양식에 데이터 비우기
		//---------------
		var trCnt = lastObj.index();
		var re1 = lastObj.find("[name$='server_kijong_name']").filter(":checked").index()
		var re2 = lastObj.find("[name$='server_os_name']").filter(":checked").index()
		$("[name=remember1]").val(re1)
		$("[name=remember2]").val(re2)
		$("[name=remember3]").val(trCnt)
		lastObj.after( lastObj.clone() );
		var lastObj = lastObj.next( );
		lastObj.find(cr_selector).prop("checked",false)
		lastObj.find(not_cr_selector).val("")
		
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 모든 태그 내부의 입력 양식의 name 속성값의 중간에 [i] 삽입하기
		//---------------
		obj = $("."+classN);
		obj.each( function(i){
				var obj3 = $(this).find(all_selector);
				obj3.each( function(){
					var thisObj = $(this);
					var nameV = thisObj.attr("name");
					//-----
					var arr1  = nameV.split("[");
					var arr2  = arr1[1].split("]");
					nameV = arr1[0] + "["+(i)+"]" +arr2[1];
					thisObj.attr( "name",  nameV   );
				})
		});
		//---------------
		// name 값 출력하기. 추후 주석 처리할 것
		//---------------
		/* print_nameV( classN ); */
	}catch(e){
		alert("addTR(~) 함수 호출 시 에러 발생!");
	}
}
//***********************************************************
// 행 삭제하는 함수 선언
//***********************************************************
function delLastTR( classN ){
	try{
		//---------------
		// checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
		// checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
		// 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
		//---------------
		var cr_selector = "[type=checkbox],[type=radio]";
		var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
		var all_selector = cr_selector + "," +not_cr_selector;
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
		// 매개변수로 들어온 선택자가 가르키는 태그가 1개면 함수 중단.
		//---------------
		var obj = $("."+classN);
		if( obj.length==1 ) { return; }
		//---------------
		// 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
		// 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 삭제하기.
		//---------------
		var lastObj = obj.last( );
		if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
		lastObj.remove();
		//---------------
		// name 값 출력하기. 주석 처리할 것
		//---------------
		/* print_nameV( classN ) */
	}catch(e){
		alert("delLastTR(~) 함수 호출 시 에러 발생!");
	}
}
//***********************************************************
// 행 안의 입력 양식의 name 출력하는 함수 선언
//***********************************************************
/* function print_nameV( classN ){
	try{
		$(".xxxxx").remove();
		$("body").append("<center><div class=xxxxx></div></center>");
		var xxxxxObj = $(".xxxxx");
		var cr_selector = "[type=checkbox],[type=radio]";
		var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
		var all_selector = cr_selector + "," +not_cr_selector;
		obj = $("."+classN);
		xxxxxObj.html(" ");
		var htmls = [];
		obj.each( function(i){
				var obj3 = $(this).find(all_selector);
				obj3.each( function(){
					var thisObj = $(this); var nameV = thisObj.attr("name");
					htmls.push( nameV + " / " );
				})
				htmls.push("<br>");
		});
	xxxxxObj.append( htmls.join("") );
	}catch(e){
		alert("print_nameV(~) 함수 호출 시 에러 발생!");
	}
} */
function remember(){
	var Cnt = $("[name=remember3]").val() 
	$("[name$='server_kijong_name']").slice((Cnt-2)*3, Cnt+(Cnt-2)*3-(Cnt-2)).eq($('[name=remember1]').val()).prop("checked", true)
	$("[name$='server_os_name']").slice((Cnt-2)*3, Cnt+(Cnt-2)*3-(Cnt-2)).eq($('[name=remember2]').val()).prop("checked", true)
}
$(document).ready(function(){
	$("[name^=company]").change(function(){
        var registerForm=$("[name=registration]");
       for(var i=0; i < $('.career_tr').length; i++){      
  
                   if($("[name='company["+i+"].hire_date_year']").val().split(" ").join()!=""
                      && $("[name='company["+i+"].hire_date_month']").val().split(" ").join()!=""
                      && $("[name='company["+i+"].leave_date_year']").val().split(" ").join()!=""
                      && $("[name='company["+i+"].leave_date_month']").val().split(" ").join()!=""
                      ){

                       
                     if(parseInt(( $("[name='company["+i+"].hire_date_year']").val() ),10 )
                          > parseInt(($("[name='company["+i+"].leave_date_year']").val() ),10 )
                          ){
                         alert("입사 년도가 퇴사 년도보다 큽니다.  재 선택 바람!");
                             registerForm.find("[name='company["+i+"].hire_date_year']").val( "" );
                            registerForm.find("[name='company["+i+"].leave_date_year']").val( "" );
                           registerForm.find("[name='company["+i+"].hire_date_month']").val( "" );
                           registerForm.find("[name='company["+i+"].leave_date_month']").val( "" );
                          return;
                   }else if(parseInt(( $("[name='company["+i+"].hire_date_year']").val() ),10 )
                         == parseInt(($("[name='company["+i+"].leave_date_year']").val() ),10 )
                         ){
                      if(parseInt(($("[name='company["+i+"].hire_date_month']").val() ),10 )
                         > parseInt(($("[name='company["+i+"].leave_date_month']").val() ),10 )
                      ){
                         alert("입사 년도가 퇴사 년도보다 큽니다.  재 선택 바람!");
                          registerForm.find("[name='company["+i+"].hire_date_year']").val( "" );
                          registerForm.find("[name='company["+i+"].leave_date_year']").val( "" );
                         registerForm.find("[name='company["+i+"].hire_date_month']").val( "" );
                          registerForm.find("[name='company["+i+"].leave_date_month']").val( "" );
                           return;
                     }
                   } 
                 }
               }   //for끝
    });
  
  $("[name^=project]").change(function(){
 var registerForm=$("[name=registration]");
  for(var i=0; i < $('.devcareer_add').length; i++){
     if($("[name='project["+i+"].project_start_date_year']").val().split(" ").join()!=""
            &&   $("[name='project["+i+"].project_start_date_month']").val().split(" ").join()!=""
            && $("[name='project["+i+"].project_end_date_year']").val().split(" ").join()!=""
            &&$("[name='project["+i+"].project_end_date_month']").val().split(" ").join()!=""
         ){

            if(parseInt(( $("[name='project["+i+"].project_start_date_year']").val() ),10 )
                > parseInt(($("[name='project["+i+"].project_end_date_year']").val() ),10 )
                ){
               alert("시작연도가 종료연도보다 큽니다.  재 선택 바람!");
               registerForm.find("[name='project["+i+"].project_start_date_year']").val( "" );
                  registerForm.find("[name='project["+i+"].project_end_date_year']").val( "" );
                 registerForm.find("[name='project["+i+"].project_start_date_month']").val( "" );
                 registerForm.find("[name='project["+i+"].project_end_date_month']").val( "" );
                return;
         }else if(parseInt(( $("[name='project["+i+"].project_start_date_year']").val() ),10 )
               == parseInt(($("[name='project["+i+"].project_end_date_year']").val() ),10 )
               ){
            if(parseInt(($("[name='project["+i+"].project_start_date_month']").val() ),10 )
               > parseInt(($("[name='project["+i+"].project_end_date_month']").val() ),10 )
            ){
               alert("시작연도가 종료연도보다 큽니다.  재 선택 바람!");
               registerForm.find("[name='project["+i+"].project_start_date_year']").val( "" );
               registerForm.find("[name='project["+i+"].project_end_date_year']").val( "" );
               registerForm.find("[name='project["+i+"].project_start_date_month']").val( "" );
               registerForm.find("[name='project["+i+"].project_end_date_month']").val( "" );
                 return;
            }
          }
         }
       }// for문끝
       
  });
});

function register(){
	   
     var developer_id = $("[name=developer_id]").val();
     var developer_pwd = $("[name=developer_pwd]").val();
     var developer_pwd_cf = $("[name=developer_pwd_cf]").val();
     var developer_name = $("[name=developer_name]").val();
     var developer_jumin_num = $("[name=developer_jumin_num]").val();
     var developer_phone = $("[name=developer_phone]").val();
     var developer_email = $("[name=developer_email]").val();
     var religion_no = $("[name=religion_no]").val();
     var military_service_no = $("[name=military_service_no]").val();
     var zip_code = $("[name=zip_code]").val();
     var addr = $("[name=addr]").val();
     var emergency_contact_name = $("[name=emergency_contact_name]").val();
     var emergency_contact_relation_no = $("[name=emergency_contact_relation_no]").val();
     var emergency_contact_phone = $("[name=emergency_contact_phone]").val();
     var bank_no = $("[name=bank_no]").val();
     var account_num = $("[name=account_num]").val();
     
     if(developer_id.split(" ").join()==""){
        alert("아이디 입력 요망");
        $("[name=developer_id]").val("");
        return;
     }
     
     if( new RegExp(/^[가-힣a-zA-Z0-9]{5,13}$/).test(developer_id)==false  ){
        alert( "아이디는 공백 없이 영대소문자 또는 한글 또는 숫자만 입력돼야 합니다.(5글자에서 13글자입력요망)");
        $("[name=developer_id]").val( "" );
          return;
      }
     
     if(developer_pwd.split(" ").join()==""){
        alert("암호 입력 요망");
        $("[name=developer_pwd]").val("");
        return;
     }
     
     if( new RegExp(/^[a-z0-9]{8,15}$/).test(developer_pwd)==false ){
    alert( "암호를 공백 없이 영소문자  또는 숫자만 입력돼야 합니다.(8글자에서 15글자입력요망)");
     $("[name=developer_pwd]").val( "" );
     return;
     }
     
     if(developer_pwd_cf.split(" ").join()==""){
         alert("암호확인 입력 요망");
         $("[name=developer_pwd_cf]").val("");
         return;
      }
     
     if( new RegExp(/^[a-z0-9]{8,15}$/).test(developer_pwd_cf)==false ){
        alert( "암호확인을 공백 없이 영소문자  또는 숫자만 입력돼야 합니다.(8글자에서 15글자입력요망)");
        $("[name=developer_pwd_cf]").val( "" );
        return;
     }
     
     if(developer_pwd != developer_pwd_cf) {
        alert("비밀번호가 상이합니다.");
        $("[name=developer_pwd]").val("");
        $("[name=developer_pwd_cf]").val("");
        $("[name=developer_pwd]").focus();
        return;
     }
     
     if(developer_name.split(" ").join()==""){
        alert("이름 입력 요망");
        $("[name=developer_name]").val("");
        return;
     }
     
     if( new RegExp(/^[가-힣a-zA-Z]{2,}$/).test(developer_name)==false ){
        alert( "이름은 공백 없이 한글,영대소문자  만 입력돼야 합니다.");
        $("[name=developer_name]").val("");
        return;
     }
     
     
     if(developer_jumin_num.split(" ").join()==""){
         alert("주민번호 입력 요망");
         $("[name=developer_jumin_num]").val("")
         return;
      }
     
      if( new RegExp( /^[0-9]{13}$/ ).test(developer_jumin_num)==false ) {
          alert("주민번호는 공백없이 숫자만 입력하시고 13자리로 입력 요망");
          $("[name=developer_jumin_num]").val("");
         return;
     }
      
      if(developer_phone.split(" ").join()==""){
         alert("핸드폰 입력 요망");
         $("[name=developer_phone]").val("");
         return;
      
      }
      
      if( new RegExp( /^[0-9]{10,30}$/ ).test(developer_phone)==false ){
         alert("번호는 - 없이 숫자만 입력 요망!");
         $("[name=developer_phone]").val("");
         return;
      }
      
      if(developer_email.split(" ").join()==""){
         alert("email 입력 요망");
         $("[name=developer_email]").val("");
         return;
      }
      
      if( new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test(developer_email)==false  ){
         alert( "이메일 입력양식을 지켜주세요");
         $("[name=developer_email]").val( "" );
         return;
      }
      
      if(religion_no.split(" ").join()==""){
         alert("종교 입력 요망");
         $("[name=religion_no]").val("");
         return;
      }
      
      if(military_service_no.split(" ").join()==""){
         alert("병역 입력 요망");
         $("[name=military_service_no]").val("");
         return;
      }
      
      if(zip_code.split(" ").join()==""){
         alert("우편번호 입력 요망");
         $("[name=zip_code]").val("");
         return;
      }
      
      if( new RegExp(/^[0-9]{1,5}$/).test(zip_code)==false  ){
         alert( "우편번호 공백 없이 숫자 만 입력돼야 합니다.");
         $("[name=zip_code]").val( "" );
         return;
      }
      
      if(addr.split(" ").join()==""){
         alert("주소 입력 요망");
         $("[name=addr]").val("");
         return;
      }
      
      if(emergency_contact_name.split(" ").join()==""){
         alert("연락 받을 사람 이름 입력 요망");
         $("[name=emergency_contact_name]").val("");
         return;
      }
      
      if( new RegExp(/^[가-힣a-zA-Z]{2,}$/).test(emergency_contact_name)==false  ){
         alert( "이름은 공백 없이 한글,영대소문자  만 입력돼야 합니다.");
         $("[name=emergency_contact_name]").val( "" );
         return;
      }
      
      if(emergency_contact_relation_no.split(" ").join()==""){
         alert("관계 입력 요망");
         $("[name=emergency_contact_relation_no]").val("");
         return;
      }
      
      if(emergency_contact_phone.split(" ").join()==""){
         alert("지인 전화번호 입력 요망");
         $("[name=emergency_contact_phone]").val("");
         return;
      }
      
      if( new RegExp( /^[0-9]{10,30}$/ ).test(emergency_contact_phone)==false ){
         alert("번호는 - 없이 숫자만 입력 요망!");
         $("[name=emergency_contact_phone]").val("");
         return;
      }
      
      if(bank_no.split(" ").join()==""){
         alert("은행 선택해주세요");
         $("[name=bank_no]").val("");
         return;
      }
      
      if(account_num.split(" ").join()==""){
         alert("계좌번호 입력해주세요");
         $("[name=account_num]").val("");
         return;
      }
      
      if( new RegExp(/^[0-9]{5,13}$/).test(account_num)==false  ){
         alert( "계좌번호는 숫자만 입력해주세요");
         $("[name=account_num]").val( "" );
         return;
      }
    
 
 
 
 
 
    var highschool = $("[name='school[0].school_name']").val();
    var collage = $("[name='school[1].school_name']").val();
    var university = $("[name='school[2].school_name']").val();
    var university_master = $("[name='school[3].school_name']").val();
    var university_doctor = $("[name='school[4].school_name']").val();
    
    if(highschool.split(" ").join()==""){
       alert("고등학교를 입력해주세요");
       $("[name='school[0].school_name']").val("");
       return;
    }
    
    if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(highschool)==false  ){
       alert( "숫자입력불가");
       $("[name='school[0].school_name']").val( "" );
       return;
    }
    
    if($("[name='school[0].graduation_date_year']").val().split(" ").join()==""){
       alert("고등학교 졸업년도를 입력해주세요");
       return;
    }
    
    if($("[name='school[0].graduation_date_month']").val().split(" ").join()==""){
       alert("고등학교 졸업월을 입력해주세요");
       return;
    }
    
    
    if(collage.split(" ").join()!=""){
       if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(collage)==false  ){
           alert( "숫자입력불가");
           $("[name='school[1].school_name']").val( "" );
           return;
        }
       if($("[name='school[1].school_dept_no']").val().split(" ").join()==""){
          alert("전문대 학부를 선택해주세요");
          return;
       }
       else if($("[name='school[1].major']").val().split(" ").join()==""){
          alert("전공과목을 입력해주세요");
          return;
       }
       else if($("[name='school[1].graduation_date_year']").val().split(" ").join()==""){
          alert("전문대 졸업년도를 입력해주세요");
          return;
       }
       else if($("[name='school[1].graduation_date_month']").val().split(" ").join()==""){
          alert("전문대 졸업월을 입력해주세요");
          return;
       }
    }
    
    
    
    if(university.split(" ").join()!=""){
    	if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(university)==false  ){
    	       alert( "숫자입력불가");
    	       $("[name='school[2].school_name']").val( "" );
    	       return;
    	}
       if($("[name='school[2].school_dept_no']").val().split(" ").join()==""){
          alert("대학교 학부를 선택해주세요");
          return;
       }
       else if($("[name='school[2].major']").val().split(" ").join()==""){
          alert("전공과목을 입력해주세요");
          return;
       }
       else if($("[name='school[2].graduation_date_year']").val().split(" ").join()==""){
          alert("전문대 졸업년도를 입력해주세요");
          return;
       }
       else if($("[name='school[2].graduation_date_month']").val().split(" ").join()==""){
          alert("전문대 졸업월을 입력해주세요");
          return;
       }
    
    }
    
    
    
    if(university_master.split(" ").join()!=""){
    	if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(university_master)==false  ){
    	       alert( "숫자입력불가");
    	       $("[name='school[3].school_name']").val( "" );
    	       return;
    	    }
       if($("[name='school[3].school_dept_no']").val().split(" ").join()==""){
          alert("대학교 석사 학부를 선택해주세요");
          return;
          }
       else if($("[name='school[3].major']").val().split(" ").join()==""){
          alert("전공과목을 입력해주세요");
          return;
       }
       else if($("[name='school[3].graduation_date_year']").val().split(" ").join()==""){
          alert("전문대 졸업년도를 입력해주세요");
          return;
       }
       else if($("[name='school[3].graduation_date_month']").val().split(" ").join()==""){
          alert("전문대 졸업월을 입력해주세요");
          return;
       }
    }
    
    if(university_doctor.split(" ").join()!=""){
    	if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(university_doctor)==false  ){
    	       alert( "숫자입력불가");
    	       $("[name='school[4].school_name']").val( "" );
    	       return;
    	    }
       if($("[name='school[4].school_dept_no']").val().split(" ").join()==""){
          alert("대학교 박사 학부를 선택해주세요");
          return;
       }
       else if($("[name='school[4].major']").val().split(" ").join()==""){
          alert("전공과목을 입력해주세요");
          return;
       }
       else if($("[name='school[4].graduation_date_year']").val().split(" ").join()==""){
          alert("전문대 졸업년도를 입력해주세요");
          return;
       }
       else if($("[name='school[4].graduation_date_month']").val().split(" ").join()==""){
          alert("전문대 졸업월을 입력해주세요");
          return;
       }
    }
    

       for(var i=0; i < $('.xxx').length; i++){         
          var family_relation_no = $("[name='family[" + i + "].family_relation_no']").val();   
          var family_name = $("[name='family[" + i + "].family_name']").val();
          var family_birth = $("[name='family[" + i + "].family_birth']").val();
       
          if(family_relation_no==0  || family_relation_no==null){
             alert("가족 관계를 입력해주세요");
             $("[name='family[" + i + "].family_relation_no']").val("");
             
             return;
          };
          if(family_name.split(" ").join()==""){
             alert("가족 이름을 입력해주세요");
             $("[name='family[" + i + "].family_name']").val("");
             
             return;
          };
          if( new RegExp(/^[가-힣a-zA-Z]{2,}$/).test(family_name)==false  ){
                alert( "이름은 공백 없이 한글,영대소문자  만 입력돼야 합니다.");
                $("[name='family[" + i + "].family_name']").val( "" );
                return;
          }
          if(family_birth==0  || family_birth==null){
             alert("가족 출생년도를 입력해주세요");
             $("[name='family[" + i + "].family_birth']").val("");
             
             return;
          };
          if($("[name='family[" + i + "].family_together']").is(":checked") == false){
              $("[name='family[" + i + "].family_together']").val("n");
              $("[name='family[" + i + "].family_together']").attr("checked",true);      
           };
       };

if($("[name='company[0].company_name']").val().split(" ").join()!=""){
           
           for(var i=0; i < $('.career_tr').length; i++){      
                  var company_name = $("[name='company["+i+"].company_name']").val();
                  var company_task = $("[name='company["+i+"].company_task']").val();
                  var boonya_no = $("[name='company["+i+"].boonya_no']").val();
                  var booseo_no = $("[name='company["+i+"].booseo_no']").val();
                  var jikup_no = $("[name='company["+i+"].jikup_no']").val();
                  var hire_type_no = $("[name='company["+i+"].hire_type_no']").val();
                  var salary = $("[name='company["+i+"].salary']").val();
                  
                  if(company_name.split(" ").join()==""){
                     alert("회사명을 입력해주세요");
                     $("[name='company["+i+"].company_name']").val("");
                     return;
                  }
                  if(company_task.split(" ").join()==""){
                     alert("업무명을 입력해주세요");
                     $("[name='company["+i+"].company_task']").val("");
                     return;
                  }
                  if(boonya_no.split(" ").join()==""){
                     alert("분야를 입력해주세요");
                     $("[name='company["+i+"].boonya_no']").val("");
                     return;
                  }
                  if(booseo_no.split(" ").join()==""){
                     alert("부서를 입력해주세요");
                     $("[name='company["+i+"].booseo_no']").val("");
                     return;
                  }
                  if(jikup_no.split(" ").join()==""){
                     alert("직위를 입력해주세요");
                     $("[name='company["+i+"].jikup_no']").val("");
                     return;
                  }
                  if(hire_type_no.split(" ").join()==""){
                     alert("고용형태를 입력해주세요");
                     $("[name='company["+i+"].hire_type_no']").val("");
                     return;
                  }
                  if(salary.split(" ").join()==""){
                     alert("연봉을 입력해주세요");
                     $("[name='company["+i+"].salary']").val("");
                     return;
                  }
                  if($("[name='company["+i+"].hire_date_year']").val().split(" ").join()==""){
                     alert("입사년도를 입력해주세요");
                     $("[name='company["+i+"].hire_date_year']").val("");
                     return;
                  }
                  if($("[name='company["+i+"].hire_date_month']").val().split(" ").join()==""){
                     alert("입사 월을 입력해주세요");
                     $("[name='company["+i+"].hire_date_month']").val("");
                     return;
                  }
                  if($("[name='company["+i+"].leave_date_year']").val().split(" ").join()==""){
                     alert("퇴사년도를 입력해주세요");
                     $("[name='company["+i+"].leave_date_year']").val("");
                     return;
                  }
                  if($("[name='company["+i+"].leave_date_month']").val().split(" ").join()==""){
                     alert("퇴사월을 입력해주세요");
                     $("[name='company["+i+"].leave_date_month']").val("");
                     return;
                  }
               }
        }
 
 
    var it_education_center_name = $("[name=it_education_center_name]").val();
    var education_period = $("[name=education_period]").val();
    
    
    if(it_education_center_name.split(" ").join()!=""){
    	
    	if(education_period.split(" ").join()==""){
          alert("교육기간 입력해주세요");
          return;
       }
        else if($("[name=education_date_year]").val().split(" ").join()=="" ){
           alert("교육수료일 년도를 입력해주세요");
           return;
        }
        else if($("[name=education_date_month]").val().split(" ").join()=="" ){
           alert("교육수료일 월을 입력해주세요");
           return;
        }
        else if($("[name=education_date_day]").val().split(" ").join()=="" ){
           alert("교육수료일 일을 입력해주세요");
           return;
        }
        else if($("[name=subject]").filter(":checked").length==0){
           alert("수료과목을 한개 이상 체크해주세요");
           return;
        }
     
    }
    if(education_period.split(" ").join()!="" || 
    	$("[name=education_date_year]").val().split(" ").join()!="" ||
    	$("[name=education_date_month]").val().split(" ").join()!=""||
    	$("[name=education_date_day]").val().split(" ").join()!=""||
    	$("[name=subject]").filter(":checked").length!=0
    		){
    	if(it_education_center_name.split(" ").join()==""){
            alert("교육센터명을 입력해주거나 그 외 다른 입력을 지워주세요.");
            return;
         }
    }
    

 
 
 
 
 
       for(var i=0; i < $('.devcareer_add').length; i++){
          var project_name = $("[name='project["+i+"].project_name']").val();
          
          if(project_name.split(" ").join()!=""){
             if($("[name='project["+i+"].project_start_date_year']").val().split(" ").join()=="" ){
                alert("시작년도를 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].project_start_date_month']").val().split(" ").join()==""){
                alert("시작 월을 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].project_end_date_year']").val().split(" ").join()=="" ){
                alert("종료년도를 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].project_end_date_month']").val().split(" ").join()==""){
                alert("종료 월을 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].customer_name']").val().split(" ").join()==""){
                alert("고객사를 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].worker_name']").val().split(" ").join()==""){
                alert("근무사를 입력해주세요");
                return;
             }
             else if($("[name='project["+i+"].roll']").filter(":checked").length==0){
                alert("역활을 한 개 이상 체크해주세요");
                return;
             }
             else if($("[name='project["+i+"].server_kijong_name']").filter(":checked").length==0){
                alert("서버 기종을 선택해 주세요");
                return;
             }
             else if($("[name='project["+i+"].server_os_name']").filter(":checked").length==0){
                alert("서버 OS를 선택해 주세요");
                return;
             }
             else if($("[name='project["+i+"].development_language']").filter(":checked").length==0){
                alert("언어를 한개 이상 선택해 주세요");
                return;
             }
             else if($("[name='project["+i+"].framework']").filter(":checked").length==0){
                alert("프레임워크를 한개 이상 선택해 주세요");
                return;
             }
             else if($("[name='project["+i+"].DBMS']").filter(":checked").length==0){
                alert("DBMS를 한개 이상 선택해 주세요");
                return;
             }
          }
          if($("[name='project["+i+"].project_start_date_year']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].project_start_date_month']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].project_end_date_year']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].project_end_date_month']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].customer_name']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].worker_name']").val().split(" ").join()!=""||
        	 $("[name='project["+i+"].roll']").filter(":checked").length!=0||
        	 $("[name='project["+i+"].server_kijong_name']").filter(":checked").length!=0||
        	 $("[name='project["+i+"].server_os_name']").filter(":checked").length!=0||
        	 $("[name='project["+i+"].development_language']").filter(":checked").length!=0||
        	 $("[name='project["+i+"].framework']").filter(":checked").length!=0||
        	 $("[name='project["+i+"].DBMS']").filter(":checked").length!=0){
        	  if(project_name.split(" ").join()==""){
        		  alert("프로젝트이름을 입력해주거나 그외 다른 입력을 지워주세요.");
                  return;
        	  }
          }
       }
    
 
 
 

    
    
    $.ajax({
         //--------------------
         //호출할 서버쪽 url주소 설정
         //--------------------
         url: "/test/developerRegProc.do"
         //--------------------
         // 전송 방법 설정
         //--------------------
         ,type : "post"
         //--------------------
         // 서버에 보낼 파라미터명과 파라미터값을 설정
         //--------------------
         ,data : $("[name=registration]").serialize()
         //--------------------
         // 서버와 응답을 성공적으로 받을 경우 실행할 익명함수 설정.
         // 익명함수의 매개 변수 html 에는boardRegProc.jsp 의 실행 결과물인 html소스가 문자열로 들어옴.
         //--------------------
         ,success : function (insertCnt){
            if(insertCnt > 0){
              // alert(insertCnt);
               alert("게시판 새글쓰기 성공")
               //location.replace("/erp/developerList.do");
            }
            else if(insertCnt == -4){
            	alert("아이디 중복입니다.")
            }
            else if(insertCnt == -5){
            	alert("계좌번호 중복입니다.")
            }
            else {
               alert("게시판 새글쓰기 실패")
            }
         }
         ,error : function(){
            alert("서버와 비동기 방식 통신 실패!");
         }
         
      });
 }
 

   
</script>
</head>



<style>
 .tb1, .tb1 td, .tb1 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
  .tb2, .tb2 td, .tb2 th{
   border-collapse: collapse;
   border:1px solid white;
 }
   .tb3, .tb3 td, .tb3 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
   .tb4, .tb4 td, .tb4 th{
   border:1px solid #000000;
   border-collapse: collapse;
 }
    .tb6, .tb6 td, .tb6 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
     .tb7, .tb7 td, .tb7 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
      .tb8, .tb8 td, .tb8 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
       .tb10, .tb10 td, .tb10 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
        .tb10_1, .tb10_1 td, .tb10_1 th{
   border-collapse: collapse;
   border:1px solid #000000;
 }
</style>

<body>
   <table align=center>
      <tr>
         <td>
            <form name="registration" method="post" action="">
    
    <h2 bgcolor="#838383" height="40">
        <font face="맑은고딕" size="5">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        [정규직 등록화면]
        </font>
     </h2>
   1.개인정보
    
   <table class="tb1" border=1 cellpadding="6">
               <tr>
                  <th bgcolor="#838383">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <td>
                     <input type="text" name="developer_id" size=26 maxlength=20>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <th bgcolor="#838383">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;암호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <td>
                     <input type="password" name="developer_pwd" size=27 maxlength=20>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <th bgcolor="#838383">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;암호확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <td>
                     <input type="password" name="developer_pwd_cf" size=27 maxlength=20>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">이름</th>
                  <td>
                     <input type="text" name="developer_name" size=26 maxlength=20>
                  </td>
                  <th bgcolor="#838383">주민번호</th>
                  <td>
                     <input type="text" name="developer_jumin_num" size=26 maxlength=20>
                  </td>
                  <th bgcolor="#838383">핸드폰</th>
                  <td>
                     <input type="text" name="developer_phone" size=26 maxlength=20>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">이메일</th>
                  <td>
                     <input type="text" name="developer_email" size=26 maxlength=20>
                  </td>
                  <th bgcolor="#838383">종교</th>
                  <td>
                     <select name="religion_no">
                        <option value=""></option>
                        <option value="1">기독교</option>
                        <option value="2">천주교</option>
                        <option value="3">불교</option>
                        <option value="4">무교</option>
                        <option value="5">기타</option>
                     </select>
                  </td>
                  <th bgcolor="#838383">병역</th>
                  <td>
                     <select name="military_service_no">
                        <option value=""></option>
                        <option value="1">미필</option>
                        <option value="2">군필</option>
                        <option value="3">면제</option>
                        <option value="4">공익</option>
                        <option value="5">상근</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">주소</th>
                  <td colspan=5> [우편번호]: 
                     <input type="text" size="12" name="zip_code" size=20 maxlength=20>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     [주소]: 
                     <input type="text" size="60" name="addr" size=20 maxlength=20>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">긴급연락처</th>
                  <td colspan=5> [연락 받을 사람 이름]: 
                     <input type="text" name="emergency_contact_name" size=20 maxlength=20>&nbsp;&nbsp;&nbsp;
                     [관계]: 
                     <select name="emergency_contact_relation_no">
                        <option value=""></option>
                        <option value="1">부모</option>
                        <option value="2">형제</option>
                        <option value="3">친척</option>
                        <option value="4">지인</option>
                     </select>
                     (부모,형제,친척,지인)&nbsp;&nbsp;&nbsp;
                     [전화번호]:
                     <input type="text" name="emergency_contact_phone" size=20 maxlength=20>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">월급통장번호</th>
                  <td colspan=5>
                     <select name="bank_no">
                        <option value="">--은행선택--</option>
                        <option value="1">기업은행</option>
                        <option value="2">신한은행</option>
                        <option value="3">하나은행</option>
                        <option value="4">국민은행</option>
                        <option value="5">농협</option>
                     </select>
                     <input type="text" name="account_num" size=20 maxlength=20>
                     (-없이 입력)
                  </td>
               </tr>
            </table>
   
   <br>
   2.학력
   <table class="tb1" border=1 cellpadding="6">
            <tr>
               <th bgcolor="#838383">학교명</th>
               <th bgcolor="#838383">학부</th>
               <th bgcolor="#838383">전공과목</th>
               <th bgcolor="#838383">부전공과목</th>
               <th bgcolor="#838383">졸업일</th>
            </tr>
            <tr>
               <td>
                  <input type="text" name="school[0].school_name" size=15 maxlength=20> 고등학교 졸
                        <input type="hidden" name="school[0].school_no" value="1">
               </td>
               <td>
               <input type="hidden" name="school[0].school_dept_no">
               </td>
                    <td>
                    <input type="hidden" name="school[0].major">
                    </td>
                     <td>
                     <input type="hidden" name="school[0].sub_major">
                     </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="school[0].graduation_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  년
                  <select name="school[0].graduation_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                  월
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr>
               <td>
                  <input type="text" name="school[1].school_name" size=15 maxlength=20> 전문대 졸 (대학 졸)
                        <input type="hidden" name="school[1].school_no" value="2">
               </td>
               <td>
                  &nbsp;&nbsp;
                  <select name="school[1].school_dept_no">
                     <option value="0"></option>
                     <option value="1">기계공학부</option>
                     <option value="2">전기전자통신공학부</option>
                     <option value="3">컴퓨터공학부</option>
                     <option value="4">경영학부</option>
                     <option value="5">생활환경공학부</option>
                  </select>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[1].major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[1].sub_major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="school[1].graduation_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  년
                  <select name="school[1].graduation_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                  월
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr>
               <td>
                  <input type="text" name="school[2].school_name" size=15 maxlength=20> 대학교 학사 졸
                  <input type="hidden" name="school[2].school_no" value="3">
               </td>
               <td>
                  &nbsp;&nbsp;
                  <select name="school[2].school_dept_no">
                     <option value="0"></option>
                     <option value="1">컴퓨터학부</option>
                     <option value="2">유아교육학부</option>
                     <option value="3">사회복지학부</option>
                     <option value="4">간호학부</option>
                     <option value="5">생활체육학부</option>
                     <option value="6">철도기계시스템학부</option>
                  </select>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[2].major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[2].sub_major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="school[2].graduation_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  년
                  <select name="school[2].graduation_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                  월
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr>
               <td>
                  <input type="text" name="school[3].school_name" size=15 maxlength=20> 대학교 석사 졸
                        <input type="hidden" name="school[3].school_no" value="4">
               </td>
               <td>
                  &nbsp;&nbsp;
                  <select name="school[3].school_dept_no">
                     <option value="0"></option>
                     <option value="1">컴퓨터학부</option>
                     <option value="2">유아교육학부</option>
                     <option value="3">사회복지학부</option>
                     <option value="4">간호학부</option>
                     <option value="5">생활체육학부</option>
                     <option value="6">철도기계시스템학부</option>
                  </select>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[3].major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[3].sub_major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="school[3].graduation_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  년
                  <select name="school[3].graduation_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                  월
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            <tr>
               <td>
                  <input type="text" name="school[4].school_name" size=15 maxlength=20> 대학교 박사 졸
                  <input type="hidden" name="school[4].school_no" value="5">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <select name="school[4].school_dept_no">
                     <option value="0"></option>
                     <option value="1">컴퓨터학부</option>
                     <option value="2">유아교육학부</option>
                     <option value="3">사회복지학부</option>
                     <option value="4">간호학부</option>
                     <option value="5">생활체육학부</option>
                     <option value="6">철도기계시스템학부</option>
                  </select>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[4].major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;
                  <input type="text" name="school[4].sub_major" size=17 maxlength=20>
                  &nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="school[4].graduation_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  년
                  <select name="school[4].graduation_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                  월
                  &nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            </table><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            *검정고시 출신은 고등학교명에 [검정고시] 라고 입력하십시오...<br><br>
   
   3.가족
   <table class="tb1" border=1 cellpadding="6">
            <tr>
               <th bgcolor="#838383">관계</th>
               <th bgcolor="#838383">이름</th>
               <th bgcolor="#838383">출생년도</th>
               <th bgcolor="#838383">동거여부</th>
            </tr>
            <tr align=center class="xxx">
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="family[0].family_relation_no">
                     <option value=""></option>
                     <option value="1">부</option>
                     <option value="2">모</option>
                     <option value="3">형제</option>
                     <option value="4">자매</option>
                  </select>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" name="family[0].family_name" size=20 maxlength=20>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <select name="family[0].family_birth">
                     <option value=""></option>
                        <script>
                               for( var i=1950 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
               <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="checkbox" name="family[0].family_together" value="y">동거
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" onClick="addTR('xxx');">[행추가]</span>&nbsp;&nbsp;<span style="cursor:pointer" onClick="delLastTR('xxx');">[행삭제]</span>
            <br><br>
   
   4.회사 경력
   <table class="tb1" border=1 cellpadding="6">
               <tr>
                  <th bgcolor="#838383">회사명/업무</th>
                  <th bgcolor="#838383">분야</th>
                  <th bgcolor="#838383">부서</th>
                  <th bgcolor="#838383">직위</th>
                  <th bgcolor="#838383">고용형태</th>
                  <th bgcolor="#838383">연봉</th>
                  <th bgcolor="#838383">입사일/퇴사일</th>
               </tr>
               <tr class="career_tr">
                  <td align=right>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회사명:
                     <input type="text" size="10" name="company[0].company_name" size=20 maxlength=20>
                     &nbsp;&nbsp;<br>
                     업무:
                     <input type="text" size="10" name="company[0].company_task" size=20 maxlength=20>
                     &nbsp;&nbsp;
                  </td>
                  <td align=center>
                     &nbsp;&nbsp;
                     <select name="company[0].boonya_no">
                              <option value=""></option>
                              <option value="1">웹프로그래머</option>
                              <option value="2">응용프로그래머</option>
                              <option value="3">웹디자인</option>
                              <option value="4">웹기획·PM</option>
                              <option value="5">DBA·데이터베이스</option>
                              <option value="6">IT·디자인·컴퓨터강사</option>
                           </select>
                     &nbsp;&nbsp;
                  </td>
                  <td align=center>
                     &nbsp;&nbsp;
                     <select name="company[0].booseo_no">
                        <option value=""></option>
                        <option value="1">영업팀</option>
                        <option value="2">경리팀</option>
                        <option value="3">인사팀</option>
                        <option value="4">회계팀</option>
                        <option value="5">광고팀</option>
                     </select>
                     &nbsp;&nbsp;
                     </td>
                  <td align=center>
                     &nbsp;&nbsp;
                     <select name="company[0].jikup_no">
                        <option value=""></option>
                        <option value="1">사원</option>
                        <option value="2">대리</option>
                        <option value="3">과장</option>
                        <option value="4">차장</option>
                        <option value="5">부장</option>
                        <option value="6">이사</option>
                        <option value="7">상무</option>
                        <option value="8">전무</option>
                        <option value="9">부사장</option>
                        <option value="10">사장</option>
                        <option value="11">회장</option>
                     </select>
                     &nbsp;&nbsp;
                     </td>
                  <td align=center>
                     &nbsp;&nbsp;
                     <select name="company[0].hire_type_no">
                        <option value=""></option>
                        <option value="1">정규직</option>
                        <option value="2">계약직</option>
                        <option value="3">알바</option>
                        <option value="4">파견직</option>
                        <option value="5">인턴</option>
                     </select>
                     &nbsp;&nbsp;
                     </td>
                  <td align=center>
                     &nbsp;&nbsp;
                     <select name="company[0].salary">
                        <option value=""></option>
                        <script>
                           var zero = 0;
                           for( var i=2000 ;  i<=5000 ; i=i+100){
                                      document.write( "<option value='"+i+"'>"+i );
                                  }
                            </script>
                     </select>
                     만원
                     &nbsp;&nbsp;
                     </td>
                  <td align=center>
                     &nbsp;&nbsp;입사일:
                  <select name="company[0].hire_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1970 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                     년
                  <select name="company[0].hire_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                     월&nbsp;&nbsp;<br>
                     &nbsp;&nbsp;퇴사일:
                  <select name="company[0].leave_date_year">
                     <option value=""></option>
                        <script>
                               for( var i=1970 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                   document.write( "<option value='"+i+"'>"+i );
                               }
                              </script>
                  </select>
                     년
                  <select name="company[0].leave_date_month">
                     <option value=""></option>
                        <script>
                              for( var i=1 ; i<=12 ; i++){
                                  if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                  else   { document.write( "<option value='"+i+"'>"+i ); }
                              }
                            </script>
                  </select>
                     월&nbsp;&nbsp;
                  </td>
               </tr>
               </table>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <span style="cursor:pointer" onClick="addTR('career_tr');">[행추가]</span>&nbsp;&nbsp; <span style="cursor:pointer" onClick="delLastTR('career_tr');">[행삭제]</span>
               <br><br>
   
   5.자격증<br>
            <c:forEach var="certificate" items="${requestScope.certificateList}">
               <input type="checkbox" name="certificate"  value="${certificate.certificate_no}">${certificate.certificate_name}
            </c:forEach>
            <br><br>
   
   6.외국어 (중급이상만 입력)
   <table class="tb1" border=1 cellpadding="6" >
               <tr>
                  <th width="130" bgcolor="#838383">독해 가능 외국어</th>
                  <td width="280">
                     <c:forEach var="foreign_language" items="${requestScope.foreign_languageList}">
                        <input type="checkbox" name="foreign_language_read"  value="${foreign_language.foreign_language_no}">${foreign_language.foreign_language_name}
                     </c:forEach>
                  </td>
               </tr>
               <tr>
                  <th bgcolor="#838383">회화 가능 외국어</th>
                  <td>
                      <c:forEach var="foreign_language" items="${requestScope.foreign_languageList}">
                        <input type="checkbox" name="foreign_language_speak"  value="${foreign_language.foreign_language_no}">${foreign_language.foreign_language_name}
                     </c:forEach>
                  </td>
               </tr>
               </table>
               <br><br>
   
   7.IT 교육센터
   <table class="tb1" border=1 cellpadding="6">
               <tr>
                  <th bgcolor="#838383">교육센터명</th>
                  <th bgcolor="#838383">교육기간</th>
                  <th bgcolor="#838383">교육수료일</th>
                  <th bgcolor="#838383">수료과목</th>
               </tr>
               <tr>
                  <td align=center>
                     <input type="text" name="it_education_center_name" size=20 maxlength=20>
                  </td>
                  <td align=center>
                     <select name="education_period">
                        <option value=""></option>
                        <script>
                               for( var i=1 ; i<=12 ; i++){
                                   if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                   else   { document.write( "<option value='"+i+"'>"+i ); }
                                 }
                            </script>
                     </select>
                     개월
                  </td>
                  <td align=center>
                     <select name="education_date_year">
                        <option value=""></option>
                           <script>
                                     for( var i=2008 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                         document.write( "<option value='"+i+"'>"+i );
                                     }
                              </script>
                     </select>
                     &nbsp;&nbsp;년
                     <select name="education_date_month">
                        <option value=""></option>
                           <script>
                                  for( var i=1 ; i<=12 ; i++){
                                      if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                      else   { document.write( "<option value='"+i+"'>"+i ); }
                                  }
                            </script>
                     </select>
                     &nbsp;&nbsp;월
                     <select name="education_date_day">
                        <option value=""></option>
                           <script>
                                    for( var i=1 ; i<=31 ; i++){
                                        if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                           else   { document.write( "<option value='"+i+"'>"+i ); }
                                    }
                                 </script>
                     </select>
                     &nbsp;&nbsp;일
                  </td>
                  <td>
                      <c:forEach var="subject" items="${requestScope.subjectList}">
                        <input type="checkbox" name="subject"  value="${subject.subject_no}">${subject.subject_name}
                     </c:forEach>
                  </td>
               </tr>
               </table><br><br>
   
   8.기호
   <table class="tb1" border=1 cellpadding="6">
               <tr>
                  <th bgcolor="#838383">하루흡연량</th>
                  <th bgcolor="#838383">소주주량</th>
                  <th bgcolor="#838383">맥주주량 (500CC기준)</th>
                  <th bgcolor="#838383">관심분야</th>
               </tr>
               <tr align=center>
                  <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select name="day_smoking">
                        <option value="0"></option>
                        <option value="1">반</option>
                        <option value="2">한</option>
                        <option value="3">두</option>
                     </select>
                     갑
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select name="day_soju">
                        <option value="0"></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                     </select>
                     병
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </td>
                  <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select name="day_beer">
                        <option value="0"></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                     </select>
                     잔
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </td>
                  <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <c:forEach var="attention" items="${requestScope.attentionList}">
                        <input type="checkbox" name="attention"  value="${attention.attention_no}">${attention.attention_name}
                     </c:forEach>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  </tr>
               </table>
               <br><br>
   
   9.취미<br>
            <input type="text" name="hobby1" size=30 maxlength=20>
            &nbsp;&nbsp;&nbsp;
            <input type="text" name="hobby2" size=30 maxlength=20>
            &nbsp;&nbsp;&nbsp;
            <input type="text" name="hobby3" size=30 maxlength=20>
            <br><br>
   
   10.개발 경력
   <table class="tb1" border=1 cellpadding="6">
            <tr>
               <th bgcolor="#838383" width="280" rowspan="2">
                  프로젝트명 / 기간
               </th>
               <th bgcolor="#838383" width="230" rowspan="2">
                  고객사 / 근무사 / 역할
               </th>
               <th bgcolor="#838383">
                  개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환&nbsp;&nbsp;&nbsp;&nbsp;경
               </th>
            </tr>
            <tr>
               <th bgcolor="#838383" width="650">
                  기종/OS/언어/DBMS/TOOL/기타
               </th>
            </tr>
            <tr class="devcareer_add">
               <td> 
                  <table class="tb2">
                     <tr>
                        <th width="100" bgcolor="#838383">프로젝트명</th>
                        <td>
                           <input type="text" name="project[0].project_name" size=22 maxlength=20 >
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">시작일</th>
                        <td>
                           <select name="project[0].project_start_date_year">
                                 <option value=""></option>
                                    <script>
                                     for( var i=2000 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                         document.write( "<option value='"+i+"'>"+i );
                                     }
                                </script>
                           </select>&nbsp;
                           년
                           <select name="project[0].project_start_date_month">
                              <option value=""></option>
                                    <script>
                                    for( var i=1 ; i<=12 ; i++){
                                        if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                        else   { document.write( "<option value='"+i+"'>"+i ); }
                                    }
                               </script>
                           </select>&nbsp;
                           월
                        </td>
                     </tr>
                     
                     <tr>
                        <th bgcolor="#838383">종료일</th>
                        <td>
                           <select name="project[0].project_end_date_year">
                              <option value=""></option>
                                       <script>
                                        for( var i=2000 ;  i<new Date( ).getFullYear( )+1 ; i++){
                                            document.write( "<option value='"+i+"'>"+i );
                                        }
                                   </script>
                           </select>&nbsp;
                           년
                           <select name="project[0].project_end_date_month">
                              <option value=""></option>
                                    <script>
                                    for( var i=1 ; i<=12 ; i++){
                                        if(i<10){ document.write( "<option value='0"+i+"'>0"+i ); }
                                        else   { document.write( "<option value='"+i+"'>"+i ); }
                                    }
                               </script>
                           </select>&nbsp;
                           월
                        </td>
                     </tr>
                  </table>
               </td>
               <td>
                  <table class="tb2">
                     <tr>
                        <th width="80"bgcolor="#838383">고객사</th>
                        <td>
                           <input type="text" name="project[0].customer_name" size=20 maxlength=20>
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">근무사</th>
                        <td>
                           <input type="text" name="project[0].worker_name" size=20 maxlength=20>
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">역할</th>
                     </tr>
                  </table>
                  <c:forEach var="roll" items="${requestScope.rollList}">
                     <input type="checkbox" name="project[0].roll"  value="${roll.roll_no}">${roll.roll_name}
                  </c:forEach>
               </td>
               <td height="250">
                  <table align="center" class="tbcss1" border=1 cellpadding="6" width="620" >
                     <tr>
                        <th width="120" bgcolor="#838383">
                           서버기종(H/W)
                        </th>
                        <td width="350">
                           <input type="radio" name="project[0].server_kijong_name" value="IBM">IBM
                           <input type="radio" name="project[0].server_kijong_name" value="Sun">Sun
                                    <input type="radio" name="project[0].server_kijong_name" value="Dell">Dell
                                    
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">
                           서버 OS
                        </th>
                        <td>
                           <input type="radio" name="project[0].server_os_name" value="IBM">IBM
                                    <input type="radio" name="project[0].server_os_name" value="Windowserver">Window server
                                    <input type="radio" name="project[0].server_os_name" value="Linux">Linux
                                    
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">
                           언어
                        </th>
                        <td>
                            <c:forEach var="development_language" items="${requestScope.development_languageList}">
                              <input type="checkbox" name="project[0].development_language"  value="${development_language.development_language_no}">${development_language.development_language_name}
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">
                           프레임워크
                        </th>
                        <td>
                           <c:forEach var="framework" items="${requestScope.frameworkList}">
                              <input type="checkbox" name="project[0].framework"  value="${framework.framework_no}">${framework.framework_name}
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <th bgcolor="#838383">
                           DBMS
                        </th>
                        <td>
                            <c:forEach var="DBMS" items="${requestScope.dbmsList}">
                              <input type="checkbox" name="project[0].DBMS"  value="${DBMS.dbms_no}">${DBMS.dbms_name}
                           </c:forEach>
                        </td>
                     </tr>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      </table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="hidden" name="remember1" value="">
      <input type="hidden" name="remember2" value="">
      <input type="hidden" name="remember3" value="">
      <span style="cursor:pointer" onClick="addTR('devcareer_add');remember();">[행추가]</span>&nbsp;&nbsp; <span style="cursor:pointer" onClick="delLastTR('devcareer_add');">[행삭제]</span>
      <br><br>
      </table>
      <center>
      <input type="button" style="width:300" value="                저장                " name="save" onClick="register();">
      <br><br>
      </center>
   </form>
         </td>
      </tr>
   </table>
   


</body>
</html>