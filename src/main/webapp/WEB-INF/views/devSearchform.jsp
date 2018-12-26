<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--jsp 기술의 한 종류인 [page directive] 를 이용하여 현 jsp 페이지 처리 방식 선언하기-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
   <!--현재 이 jsp 페이지 실행 후 생성되는 문서는 html이고, 이문서는 utf-8 방식으로 인코딩 한다 라고 설정함.-->
   <!--현재 이 jsp 페이지는 utf-8 방식으로 인코딩 한다-->
   <!--utf-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할수 있는 방법이다.-->
<%@page contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<!--jsp 기술의 한 종류인 [include directive]를 이용하여 common2.jsp 파일 내의 소스를 삽입하기-->
<!--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-->
<%@include file="common2.jsp"%>
<html>
 <head>
 <script>
 $(document).ready(function(){
     // name=devSearchForm 인 변수 devSearchFormobj 선언
     var devSearchFormobj=$("[name=devSearchForm]");
     
    
   //==============================================================
     //검색 결과물 홀수행은 흰색, 짝수행은 색칠하고 마우스 갖다대면 색 변하고 떼면 원상복귀.
      $(".developerlist").find("tr:eq(0)").nextAll().each(function(i){
        var obj=$(this);
        // i번째 tr 태그가 형제 tr 중 위치하는 인덱스 번호 얻기
        // i번째 tr태그의 형제 서열 인덱스 번호 얻기
        var index= $(this).index();
        // 형제 서열 인덱스 번호가 홀수이면 배경색 바꾸기
        if (index%2==0){
           obj.attr("bgcolor","#CCCCCC")
        }
     })
     $(".developerlist").find("tr:eq(0)").nextAll().hover(
           function(){
              var obj= $(this);
              obj.attr("bgcolor","#A7A7A7")
           }
           ,function(){
              var obj=$(this);
              var index= $(this).index();
              if (index%2==1){
                 obj.attr("bgcolor","white")
              }else{
              obj.attr("bgcolor","#CCCCCC")
           }
           });
     
   //[초기화 후 전부검색] 버튼에 이벤트 시 실행할 구문 설정하기            
   devSearchFormobj.find(".searchDeveloperall").click(function(){
   // 검색 조건 관련 입력 양식의 데이터를 바꾸거나 체크를 풀기
   // <주의> name=selectPageNo ,name=rowCntPerPage,type=button를 가진 입력 양식은 제외
   devSearchFormobj.find("[name=min_devYear]").val('');
    devSearchFormobj.find("[name=max_devYear]").val('');
    devSearchFormobj.find("[name=gender1]").prop("checked",false);
    devSearchFormobj.find("[name=gender2]").prop("checked",false);
    devSearchFormobj.find("[name=skill]").prop("checked",false);
    devSearchFormobj.find("[name=final_education]").prop("checked",false);
    devSearchFormobj.find("[name=dispatch]").prop("checked",false);
    devSearchFormobj.find("[name=certificate]").prop("checked",false);
    devSearchFormobj.find("[name=birth_year1]").val('');
    devSearchFormobj.find("[name=birth_month1]").val('');
    devSearchFormobj.find("[name=birth_year2]").val('');
    devSearchFormobj.find("[name=birth_month2]").val('');
    devSearchFormobj.find("[name=role]").prop("checked",false);
    devSearchFormobj.find("[name=min_age]").val('');
    devSearchFormobj.find("[name=max_age]").val('');
    devSearchFormobj.find("[name=min_soju]").val('');
    devSearchFormobj.find("[name=max_soju]").val('');
    devSearchFormobj.find("[name=min_beer]").val('');
    devSearchFormobj.find("[name=max_beer]").val('');
    devSearchFormobj.find("[name=keyword1]").val('');
    devSearchFormobj.find("[name=keyword2]").val('');
    devSearchFormobj.find("[name=orAnd]").val('or');
   //alert(123);
   goDevSearchForm();
   });     
   //[검색] 버튼에 이벤트 시 실행할 구문 설정하기  
   devSearchFormobj.find(".searchDeveloper").click(function(){
     // alert(123);
       goDevSearchForm();
   });
   
   devSearchFormobj.find("[name=rowCntPerPage]").change(function(){
       goDevSearchForm();
   });
   devSearchFormobj.find("[name=sort_multi]").change(function(){
      //alert(111);
      devSearchFormobj.find("[name=sort]").val('');
      //alert(222);
      var sort_multi=devSearchFormobj.find("[name=sort_multi]").val();
      //alert(333);
      if(sort_multi!=''){
        // alert(444);
         devSearchFormobj.find("[name=sort]").val(sort_multi);
      }
    //  alert(555);
       goDevSearchForm();
   });
    // 개발년차 날짜 검색 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=min_devYear],[name=max_devYear]").change(function(){
        check_dev_date();
    });
    // 생일 검색 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=birth_year1], [name=birth_month1]").change(function(){
        check_birth_date();
    });
    // 생일 검색 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=birth_year2], [name=birth_month2]").change(function(){
         check_birth_date();
    });
    // 나이 나이 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=min_age],[name=max_age]").change(function(){
        check_age();
    });
    // 소주 주량 검색 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=min_soju],[name=max_soju]").change(function(){
        check_soju();
    });
    // 맥주 주량 검색 조건 입력 양식의 유효성 체크함수 호출
   devSearchFormobj.find("[name=min_beer],[name=max_beer]").change(function(){
        check_beer();
    });
  //============================================================================================= 비움

  //개발년차 [비움] 클릭 시 모두 지움
  devSearchFormobj.find(".empty1").click(function(){
        var devSearchFormobj=$("[name=devSearchForm]");
        // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
        // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=min_devYear],[name=max_devYear]").val('');
  });
  devSearchFormobj.find(".empty2").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
          // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
          // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
          devSearchFormobj.find("[name=final_education]").prop("checked",false);

  });
  devSearchFormobj.find(".empty3").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
        // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
        // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=certificate]").prop("checked",false);
  });
  devSearchFormobj.find(".empty4").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
        // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
        // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name^=birth]").val('');
  });
  devSearchFormobj.find(".empty5").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
        // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
        // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=role]").prop("checked",false);
  });
  devSearchFormobj.find(".empty6").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
          // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
          // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=min_age]").val('');
        devSearchFormobj.find("[name=max_age]").val('');
  });
  devSearchFormobj.find(".empty7").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
          // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
          // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=min_soju]").val('');
        devSearchFormobj.find("[name=max_soju]").val('');
  });

  devSearchFormobj.find(".empty8").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
          // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
          // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=min_beer]").val('');
          devSearchFormobj.find("[name=max_beer]").val('');
  });

  devSearchFormobj.find(".empty9").click(function(){
  var devSearchFormobj=$("[name=devSearchForm]");
        // name속성값이 min_reg_로 시작하는 입력양식의 value값 비우기
        // $로 표시할시 min_reg_로 끝하는 입력양식의 value값 비우기
        devSearchFormobj.find("[name=keyword1]").val('');
        devSearchFormobj.find("[name=keyword2]").val('');
  });
  devSearchFormobj.find(".developer").click(function(){
     location.replace("/erp/registerForm.do");
     
  });
//----------------------------------------------------------------
  // [오늘] 글씨를 클릭하면 실행할 구문설정
  //----------------------------------------------------------------\
  devSearchFormobj.find(".to_today").click(function(){
     // 현재 날짜를 관리하는 date객체 생성하여 객체의 메위주를 today에 저장

      // ex) 2월 말일 계산 = 2002.2.0 
      var today = new Date();
      // 현재 날짜의 년도 얻기
      var year = today.getFullYear();
      // 현재 날짜의 월 얻기
      // date객체 생성시 index가 0~11까지라 +1 
      var month=today.getMonth()+1; if(month<10){month="0"+month}
      //현재 날짜의 년도를 name=min_reg_year 을 가진 입력 양식에 넣어주기
      devSearchFormobj.find("[name=birth_year1]").val(year);
      //현재 날짜의 월을 name=min_reg_year 을 가진 입력 양식에 넣어주기
      devSearchFormobj.find("[name=birth_month1]").val(month);
      
      devSearchFormobj.find("[name=birth_year2]").val(year);
      
      devSearchFormobj.find("[name=birth_month2]").val(month);
      // check_reg_date 함수를 호출하여 날짜 범위의 유효성 체크
      /* alert(year);
      alert(month); */
  });
  
   //흔적남기기
  devSearchFormobj.find("[name=min_devYear]").val("${param.min_devYear}");
   devSearchFormobj.find("[name=max_devYear]").val("${param.max_devYear}");

  /*  devSearchFormobj.find("[name=gender1]").val("${param.gender1}");
   devSearchFormobj.find("[name=gender2]").val("${param.gender2}");  */
   <c:forEach var="skill" items="${paramValues.skill}">
      devSearchFormobj.find("[name=skill]").filter("[value=${skill}]").attr("checked",true);
  </c:forEach>
  <c:forEach var="final_education" items="${paramValues.final_education}">
     devSearchFormobj.find("[name=final_education]").filter("[value=${final_education}]").attr("checked",true);
  </c:forEach>
  <c:forEach var="certificate" items="${paramValues.certificate}">
     devSearchFormobj.find("[name=certificate]").filter("[value=${certificate}]").attr("checked",true);
  </c:forEach>
  <c:forEach var="role" items="${paramValues.role}">
     devSearchFormobj.find("[name=role]").filter("[value=${role}]").attr("checked",true);
  </c:forEach>
  <c:forEach var="dispatch" items="${paramValues.dispatch}">
     devSearchFormobj.find("[name=dispatch]").filter("[value=${dispatch}]").attr("checked",true);
  </c:forEach>
  
     devSearchFormobj.find("[name=gender1]").filter("[value=${param.gender1}]").attr("checked",true);
     devSearchFormobj.find("[name=gender2]").filter("[value=${param.gender2}]").attr("checked",true);
 
   devSearchFormobj.find("[name=birth_year1]").val("${param.birth_year1}");
   devSearchFormobj.find("[name=birth_month1]").val("${param.birth_month1}");
   devSearchFormobj.find("[name=birth_year2]").val("${param.birth_year2}");
   devSearchFormobj.find("[name=birth_month2]").val("${param.birth_month2}");
   devSearchFormobj.find("[name=min_age]").val("${param.min_age}");
   devSearchFormobj.find("[name=max_age]").val("${param.max_age}");
   devSearchFormobj.find("[name=min_soju]").val("${param.min_soju}");
   devSearchFormobj.find("[name=max_soju]").val("${param.max_soju}");
   devSearchFormobj.find("[name=min_beer]").val("${param.min_beer}");
   devSearchFormobj.find("[name=max_beer]").val("${param.max_beer}");
   devSearchFormobj.find("[name=keyword1]").val("${param.keyword1}");
   devSearchFormobj.find("[name=keyword2]").val("${param.keyword2}");
   devSearchFormobj.find("[name=sort]").val("${param.sort}");
   devSearchFormobj.find("[name=orAnd]").val("${param.orAnd}");
   devSearchFormobj.find("[name=sort_multi]").val("${param.sort_multi}");
   
   
   devSearchFormobj.find("[name=selectPageNo]").val("${regDeveloperSearchDTO.selectPageNo}");
   /* $("[name=contactupdelform]").find("[name=selectPageNo]").val('${regDeveloperDTO.selectPageNo}'); */
   devSearchFormobj.find("[name=rowCntPerPage]").val("${regDeveloperSearchDTO.rowCntPerPage}");
   
   

  });
  //======================================================================================
  //======================================================================================
  // 개발년차 왼쪽 먼저 안넣을시 검사, 중단
  function check_dev_date(){
      var devSearchFormobj=$("[name=devSearchForm]");
      //----------------------------------
      var min_reg_year = devSearchFormobj.find("[name=min_devYear]").val( );
      var max_reg_year = devSearchFormobj.find("[name=max_devYear]").val( );
      
      //----------------------------------
      if( (min_reg_year==null || min_reg_year.length==0) || (max_reg_year==null && max_reg_year.length>0) ){
         alert("왼쪽 년도를 먼저 선택해야 합니다.");
         devSearchFormobj.find("[name=max_devYear]").val( "" );
         return;
      };
    //----------------------------------
      //개발년차 유효성2
      if( (min_reg_year!=null && min_reg_year.length>0) && (max_reg_year!=null && max_reg_year.length>0)  ){

          var max_date = devSearchFormobj.find("[name=max_devYear]").val(  );
          var min_date = devSearchFormobj.find("[name=min_devYear]").val(  );
          if( parseInt(max_date,10) < parseInt(min_date,10) ) {
             alert("[최소 년도]가 [최대 년도] 보다 큽니다. 재 선택 바람!");
             devSearchFormobj.find("[name^=min_]").val("");
             devSearchFormobj.find("[name^=max_]").val("");
             return;
          }
       }
    };


  //======================================================================================
    // 생일 왼쪽 먼저 안넣을시 검사, 중단
    function check_birth_date(){
       var devSearchFormobj=$("[name=devSearchForm]");
       //----------------------------------
       var birth_year1 = devSearchFormobj.find("[name=birth_year1]").val( );
       var birth_month1 = devSearchFormobj.find("[name=birth_month1]").val( );
       var birth_year2 = devSearchFormobj.find("[name=birth_year2]").val( );
       var birth_month2 = devSearchFormobj.find("[name=birth_month2]").val( );
       
       //----------------------------------
       if( (birth_year1==null || birth_year1.length==0) && (birth_month1!=null && birth_month1.length>0)
               //|| (birth_year2==null || birth_year2.length==0) && (birth_month2!=null && birth_month2.length>0)
               ){      
            alert("검색 시작 생일년도를 먼저 선택해야 합니다.");
            devSearchFormobj.find("[name=birth_month1]").val( "" );
            return;
         };
         
         if( (birth_year2==null || birth_year2.length==0) && (birth_month2!=null && birth_month2.length>0)){
            alert("검색 시작 생일년도를 먼저 선택해야 합니다.");
            devSearchFormobj.find("[name=birth_month2]").val( "" );
            return;
         };
         
         if( (birth_year1==null || birth_year1.length==0)  && (birth_year2!=null && birth_year2.length>0)){
            alert("검색 시작 생일을 먼저 선택해야 합니다.");
            devSearchFormobj.find("[name=birth_year2]").val( "" );
            return;
         };
         
         if( (birth_month1==null || birth_month1.length==0)  && (birth_year2!=null && birth_year2.length>0)){
            alert("검색 시작 생일을 먼저 선택해야 합니다.");
            devSearchFormobj.find("[name=birth_year2]").val( "" );
            return;
         };
       
       //----------------------------------
       //----------------------------------
         //생일 유효성
          if(     (birth_year1!=null && birth_year1.length>0) && (birth_month1!=null && birth_month1.length>0) &&
                 (birth_year2!=null && birth_year2.length>0) && (birth_month2!=null && birth_month2.length>0)){
              var max_year_date = devSearchFormobj.find("[name=birth_year2]").val(  );
              var max_month_date = devSearchFormobj.find("[name=birth_month2]").val(  );
              var min_year_date = devSearchFormobj.find("[name=birth_year1]").val(  );
              var min_month_date = devSearchFormobj.find("[name=birth_month1]").val(  );
              
              if( parseInt( max_year_date,10 ) < parseInt(min_year_date,10) ){
                        alert("[생일 시작 년도]가 [생일 마지막 년도] 보다 큽니다. 재 선택 바람!");
                        devSearchFormobj.find("[name^=birth_]").val("");
                       return;
                  }else if( parseInt( max_year_date,10) == parseInt(min_year_date,10) ){
                     if(parseInt( max_month_date,10 ) < parseInt(min_month_date,10) ){
                      alert("[생일 시작 년도]가 [생일 마지막 년도] 보다 큽니다. 재 선택 바람!");
                        devSearchFormobj.find("[name^=birth_]").val("");
                       return;
                    }
               }
            } 
       
       
       
       
    };
  //======================================================================================
    //나이 왼쪽 select 부터 클릭하지 않으면 alert하고 비움.
    function check_age(){
       var devSearchFormobj=$("[name=devSearchForm]");
       //----------------------------------
       var min_reg_age = devSearchFormobj.find("[name=min_age]").val( );
       var max_reg_age = devSearchFormobj.find("[name=max_age]").val( );
      
       
       //----------------------------------
       //나이 유효성1
       if( (min_reg_age==null || min_reg_age.length==0) || (max_reg_age==null && max_reg_age.length>0) ){
          alert("왼쪽 나이를 먼저 선택해야 합니다.");
          devSearchFormobj.find("[name=min_age]").val( "" );
        devSearchFormobj.find("[name=max_age]").val( "" );
          return;
       }
      //----------------------------------
      //나이 유효성2
       if( (min_reg_age!=null && min_reg_age.length>0) && (max_reg_age!=null && max_reg_age.length>0)  ){
          var min_age = devSearchFormobj.find("[name=min_age]").val( );
           var max_age = devSearchFormobj.find("[name=max_age]").val( );
           if( parseInt(max_age,10) < parseInt(min_age,10) ) {
              alert("[최소 나이]가 [최대 나이] 보다 큽니다. 재 선택 바람!");
              devSearchFormobj.find("[name=min_age]").val("");
              devSearchFormobj.find("[name=max_age]").val("");
              return;
           }
        }
     };
   //======================================================================================
     //소주 왼쪽 select 부터 클릭하지 않으면 alert하고 비움.
     function check_soju(){
        var devSearchFormobj=$("[name=devSearchForm]");
        //----------------------------------
        var min_reg_soju = devSearchFormobj.find("[name=min_soju]").val( );
        var max_reg_soju = devSearchFormobj.find("[name=max_soju]").val( );
       
        //----------------------------------
        //소주 유효성1
        if( (min_reg_soju==null || min_reg_soju.length==0) || (max_reg_soju==null && max_reg_soju.length>0) ){
           alert("왼쪽 주량을 먼저 선택해야 합니다.");
           devSearchFormobj.find("[name=min_soju]").val( "" );
         devSearchFormobj.find("[name=max_soju]").val( "" );
           return;
        }
        
          //----------------------------------
        //소주 유효성2
         if( (min_reg_soju!=null && min_reg_soju.length>0) && (max_reg_soju!=null && max_reg_soju.length>0)  ){
            var min_age = devSearchFormobj.find("[name=min_soju]").val( );
             var max_age = devSearchFormobj.find("[name=max_soju]").val( );
             if( parseInt(max_age,10) < parseInt(min_age,10) ) {
                alert("[시작 소주 주량]이 [마지막 소주 주량] 보다 큽니다. 재 선택 바람!");
                devSearchFormobj.find("[name=min_soju]").val("");
                devSearchFormobj.find("[name=max_soju]").val("");
                return;
             }
          }
        
        
      };
      //======================================================================================
     //맥주 왼쪽 select 부터 클릭하지 않으면 alert하고 비움.
     function check_beer(){
        var devSearchFormobj=$("[name=devSearchForm]");
        //----------------------------------
        var min_reg_beer = devSearchFormobj.find("[name=min_beer]").val( );
        var max_reg_beer = devSearchFormobj.find("[name=max_beer]").val( );
       
        
        //----------------------------------
        //맥주 유효성1
        if( (min_reg_beer==null || min_reg_beer.length==0) || (max_reg_beer==null && max_reg_beer.length>0) ){
           alert("왼쪽 주량을 먼저 선택해야 합니다.");
           devSearchFormobj.find("[name=min_beer]").val( "" );
         devSearchFormobj.find("[name=max_beer]").val( "" );
           return;
        }
      //----------------------------------
        //맥주 유효성2
         if( (min_reg_beer!=null && min_reg_beer.length>0) && (max_reg_beer!=null && max_reg_beer.length>0)  ){
            var min_beer = devSearchFormobj.find("[name=min_beer]").val( );
             var max_beer = devSearchFormobj.find("[name=max_beer]").val( );
             if( parseInt(max_beer,10) < parseInt(min_beer,10) ) {
                alert("[시작 맥주 주량]이 [마지막 맥주 주량] 보다 큽니다. 재 선택 바람!");
                devSearchFormobj.find("[name=min_beer]").val("");
                devSearchFormobj.find("[name=max_beer]").val("");
                return;
             }
          }
    };
/*
   //======================================================================================
   // 왼쪽 부터 입력하지 않으면 alert하고 비움.
   function check_beer(){
      var devSearchFormobj=$("[name=devSearchForm]");
      //----------------------------------
      var min_beer = devSearchFormobj.find("[name=min_beer]").val( );
      var max_beer = devSearchFormobj.find("[name=max_beer]").val( );
     
      
      //----------------------------------
      if( (min_beer==null || min_beer.length==0) || (max_beer==null && max_beer.length>0) ){
         alert("왼쪽 년도를 먼저 선택해야 합니다.");
         devSearchFormobj.find("[name=min_beer]").val( "" );
       devSearchFormobj.find("[name=max_beer]").val( "" );
         return;
      };
    };
*/
   
   function goDevSearchForm(){
   
      document.devSearchForm.submit();
      //alert(111);
   }
   
    function openDeveloperUpDelForm(developer_no){
       //alert(1);
        $("[name=updelForm]").find("[name=developer_no]").val(developer_no);
       // alert(2);
        
       // alert(3);
         document.updelForm.submit();
        // alert(4);
   } 

     </script>

 </head>

 <body><center>
  <form name="devSearchForm" method="post" action="/erp/devSearchForm.do">
<table border=1 cellpadding=8 class=tbcss1 width=45%>
<caption>[정규직 검색]</caption>
<tr>
   <td bgcolor="#838383" align=center>개발년차 
   <td> 
   <!-- 최소 개발년차 -->
   <select name="min_devYear" >
      <option value=""></option>
         <script>
                for( var i=1 ; i<40 ; i++){
                    document.write( "<option value='"+i+"'>"+i );
                }
         </script>
   </select>년차 ~
      

   <!-- 최대 개발년차 -->
   <select name="max_devYear">
       <option value=""></option>
         <script>
                for( var i=2 ; i<41 ; i++){
                    document.write( "<option value='"+i+"'>"+i );
                }
         </script>
   </select>년차 &nbsp;

   <span style="cursor:pointer" class="empty1">[비움]</span>

   <!-- 성별 체크박스 주말 남욱 수정부분-->
   <input type="checkbox" name="gender1" value="m">남
   <input type="checkbox" name="gender2" value="w">여
   
   <tr>
       <td bgcolor="#838383" align=center>소유스킬
   </td>
      <TD>   
         <c:forEach var="skill" items="${skill_List}">
               <input type="checkbox" name="skill" value="${skill.development_language_no}">${skill.development_language_name}
      </c:forEach>
 
      </TD>  
   <tr>
       <td bgcolor="#838383" align=center>최종학력
   </td>
   <TD>
      <c:forEach var="final_education" items="${school_IndexList}">
               <input type="checkbox" name="final_education" value="${final_education.school_no}" >${final_education.school_name}
      </c:forEach>

       &nbsp; &nbsp;<span style="cursor:pointer" class="empty2">[비움]</span>
   </TD>

   <tr>
      <td bgcolor="#838383" align=center>현재 상황
      <td>   
         <!-- 파견중, 대기중 체크박스 -->
         <input type="checkbox" name="dispatch" value="waiting">대기중
         <input type="checkbox" name="dispatch" value="dispatching">파견중
   
   <tr>
      <td bgcolor="#838383" align=center>자격증
   </td>
   <TD>   
     <c:forEach var="certificate" items="${certificate_fieldList}">
         <input type="checkbox" name="certificate" value="${certificate.certificate_no}" >${certificate.certificate_name}
   </c:forEach>
     
       &nbsp; &nbsp;<span style="cursor:pointer" class="empty3">[비움]</span>
   </TD>
   <tr>
      <td bgcolor="#838383" align=center>생일
      <td>   
      <!-- 생일 1번째 '년' select 박스 -->
       <select name="birth_year1">
            <option value=""></option>
            <script>
                   for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
       </select>년 
   
      <!-- 생일 1번째 '월' select 박스 -->
       <select name="birth_month1">
            <option value="">
                  <script>
                  var zero = '0';
                     for( var i=1 ; i<=12 ; i++){
                         if(i<10){ document.write( "<option value='"+zero+i+"'>0"+i ); }
                         else   { document.write( "<option value="+i+">"+i ); }
                     }
                  </script>
       </select>월 ~&nbsp
   
      <!-- 생일 2번째 '년' select 박스 -->
       <select name="birth_year2">
           <option value=""></option>
               <script>
                      for( var i=1960 ;  i<new Date( ).getFullYear( )+1 ; i++){
                          document.write( "<option value='"+i+"'>"+i );
                      }
               </script>
       </select>년 
         
      <!-- 생일 2번째 '월' select 박스 -->
       <select name="birth_month2">
           <option value="">
                     <script>
                      var zero = '0';
                        for( var i=1 ; i<=12 ; i++){
                            if(i<10){ document.write( "<option value='"+zero+i+"'>0"+i ); }
                            else   { document.write( "<option value='"+i+"'>"+i ); }
                        }
                     </script>
        </select>월
   
         &nbsp; &nbsp;<span style="cursor:pointer" class="to_today">[오늘]</span>   
         &nbsp; &nbsp;<span style="cursor:pointer" class="empty4">[비움]</span>

   <tr>
      <td bgcolor="#838383" align=center>역할
   </td>
      <TD>
      <c:forEach var="role" items="${roll_fieldList}">
         <input type="checkbox" name="role" value="${role.roll_no}" >${role.roll_name}
   </c:forEach>   
    
      &nbsp; &nbsp;<span style="cursor:pointer" class="empty5">[비움]</span>
      </TD>     
<tr>
   <td bgcolor="#838383" align=center>나이
   <td>   
   <!-- 나이 첫번째 select -->
   <select name="min_age">
      <option value=""></option>
            <script>
                   for( var i=20 ;  i<60 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
   </select>살~ 

   <!-- 나이 두번째 select -->
   <select name="max_age">
      <option value=""></option>
            <script>
                   for( var i=20 ;  i<60 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
   </select>살  
      
      &nbsp; &nbsp;<span style="cursor:pointer" class="empty6">[비움]</span>

   <tr>
      <td bgcolor="#838383" align=center>소주주량
      <td>   
      <!-- 소주 첫번째 select -->
      <select name="min_soju">
         <option value=""></option>
            <script>
                   for( var i=0 ;  i<11 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
      </select>병~ 
   
      <!-- 소주 두번째 select -->
      <select name="max_soju">
         <option value=""></option>
            <script>
                   for( var i=0 ;  i<11 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
      </select>병
        &nbsp; &nbsp;<span style="cursor:pointer" class="empty7">[비움]</span>
        
   <tr>
      <td bgcolor=#838383 align=center>맥주주량</td>
      <!-- 맥주 첫번째 select -->
      <td>
      <select name="min_beer">  
         <option value=""></option>
            <script>
                   for( var i=0 ;  i<11 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
       </select>잔~
   
      <!-- 맥주 첫번째 select -->
      <select name="max_beer"> 
          <option value=""></option>
            <script>
                   for( var i=0 ;  i<11 ; i++){
                       document.write( "<option value='"+i+"'>"+i );
                   }
            </script>
      </select>잔 (500CC 기준)
   
     <span style="cursor:pointer" class="empty8">&nbsp[비움]</span>
         
   <tr>
      <td bgcolor=#838383 align=center>키워드</td>
      <td><input type="text" name="keyword1">
      
        <!-- Keyword(or, and)  -->
       <select name="orAnd"> 
            <option value="or"> or
            <option value="and"> and
       </select>
         
       <input type="text" name="keyword2" onkeyup="is_keyword()">
       <span style="cursor:pointer" class="empty9">&nbsp[비움]</span>

</table>
   
         <div style="height:2"></div>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <div class="mButton gCenter">
        <input type="button" value="             검색             "  class="searchDeveloper">
        <input type="button"  value="초기화 후 전부검색" class="searchDeveloperall">
        
        <span style="cursor:pointer" class="developer">
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[정규직 개발자 정보 등록]</span>
    </div>
   


   
   
   


    <div style="height:100"></div>
    
    <!--**********************************************-->
   <!--[검색 수] 출력--->
   <!--**********************************************-->
   <font size="2" align=center><b>
     
    [검색 개수 : ${developerListAllCnt}개]</b></font>


<table border=0 class="pagingNos"  width=100%>
      <tr>
         <td align=left>
            [다중 정렬]
            <select name="sort_multi" style="width:230px">
               <option value="">
               <option value="developer_name desc, 5 asc">이름 내림차순>나이 오름차순
               <option value="developer_name desc, 5 desc">이름 내림차순>나이 내림차순
               <option value="developer_name asc, 5 asc">이름 오름차순>나이 오름차순
               <option value="developer_name asc, 5 desc">이름 오름차순>나이 내림차순                       
               <option value="developer_name desc, 11 asc">이름 내림차순>최종학력 오름차순
               <option value="developer_name desc, 11 desc">이름 내림차순>최종학력 내림차순
               <option value="developer_name asc, 11 asc">이름 오름차순>최종학력 오름차순
               <option value="developer_name asc, 11 desc">이름 오름차순>최종학력 내림차순
               <option value="developer_name desc, 15 asc">이름 내림차순>자격증 오름차순
               <option value="developer_name desc, 15 desc">이름 내림차순>자격증 내림차순
               <option value="developer_name asc, 15 asc">이름 오름차순>자격증 오름차순
               <option value="developer_name asc, 15 desc">이름 오름차순>자격증 내림차순                       
               <option value="3 desc, 5 asc">성별  내림차순>나이 오름차순
               <option value="3 desc, 5 desc">성별  내림차순>나이 내림차순
               <option value="3 asc, 5 asc">성별  오름차순>나이 오름차순
               <option value="3 asc, 5 desc">성별  오름차순>나이 내림차순
               <option value="5 desc, 13 asc">나이 내림차순>개발년차 오름차순
               <option value="5 desc, 13 desc">나이 내림차순>개발년차 내림차순
               <option value="5 asc, 13 asc">나이 오름차순>개발년차 오름차순
               <option value="5 asc, 13 desc">나이 오름차순>개발년차 내림차순
            </select>
            </td>
         
          <td width=70% align=left>
          
             &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
              &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
               &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
               &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
             &nbsp;&nbsp; &nbsp;&nbsp;
               
           
          <!----------------------------------->
         <!-- 검색 결과물의 개수가 1개 이상일 경우 페이징 처리 관련 html 출력-->
         <!----------------------------------->
         <c:if test="${developerListAllCnt>0}">
            <!-- 만약 [시작페이지 번호]가 [화면당 보이는 페이지 번호 개수]보다 크면-->
            <!-- [처음], [이전] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
            <!-- 현재 페이지로 다시 이동하기-->
            <c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
               <a href="javascript:$('[name=selectPageNo]').val('1');goDevSearchForm( );">[처음] </a>
               <a href="javascript:$('[name=selectPageNo]').val('${pageingData.beginPageNo-1}');goDevSearchForm( );">[이전]  </a>
            </c:if>
            <!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기-->
            <!-- 선택된 페이지 번호는 번호만 출력하고 클릭하지 못하게 하고-->
            <!-- 선택 안된 페이지 번호는 대괄호로 감싸 출력하고 클릭하면 원하는 -->
            <!-- 원하는 페이지번호를 hidden 입력 양식에 담고 현재 페이지로 다시 이동하기-->
            <c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
               <c:if test="${pageingData.selectPageNo!=pageNo}">
                  <a href="javascript:$('[name=selectPageNo]').val('${pageNo}');goDevSearchForm()">[${pageNo}]</a>
               </c:if>
               <c:if test="${pageingData.selectPageNo==pageNo}">
                  ${pageNo}
               </c:if>
            </c:forEach>
            <!-- 만약면 현재 화면에서 보이는 [끝 페이지 번호]가 [맨 마지막 페이지 번호]보다 작으면-->
            <!-- [다음], [마지막] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
            <!-- 현재 페이지로 다시 이동하기-->
            <c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
               <a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');goDevSearchForm();">  [다음] </a>
               <a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');goDevSearchForm();">[마지막] </a>
            </c:if>
         </c:if> 
       </td>
           
  
           
      <td align=right>
         <select name="rowCntPerPage">
               <option value="10">10
               <option value="15">15
               <option value="20">20
               <option value="25">25
               <option value="30">30
               <option value="35">35
               <option value="40">40
         </select> 행보기
         </tr> 
</table>


   <input type="hidden" name="sort">
     <input type="hidden" name="selectPageNo">
          
          
 <table border=1 cellpadding=5 cellspacing=0 bordercolor=gray  width=100% class="tbcss2 developerlist">
   <!------------------------------------------>
   <!--검색 결과의 헤더 행 출력하기. 클릭하면 원하는 정렬 데이터를 hidden 태그에 담고 자기 자신으로 접속하기---->
   <!------------------------------------------>
   <tr bgcolor=#838383>
   
<th>번호
      <!-- 만약 파라미터명이 sort가 파라미터값이 contact_name 아래 소스 표현-->
      <c:choose>
         <c:when test="${param.sort=='developer_name desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val( 'developer_name asc' );goDevSearchForm( );">▼이름
               
         </c:when>
         <c:when test="${param.sort=='developer_name asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('developer_name desc');goDevSearchForm( );">▲이름
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('developer_name asc');goDevSearchForm( );">이름
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='3 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('3 asc');goDevSearchForm( );">▼성별
         </c:when>
         <c:when test="${param.sort=='3 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('3 desc');goDevSearchForm( );">▲성별
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('3 asc');goDevSearchForm( );">성별
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='4 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('4 asc');goDevSearchForm( );">▼출생년도
         </c:when>
         <c:when test="${param.sort=='4 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('4 desc');goDevSearchForm( );">▲출생년도
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('4 asc');goDevSearchForm( );">출생년도
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='5 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('5 asc');goDevSearchForm( );">▼나이
         </c:when>
         <c:when test="${param.sort=='5 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('5 desc');goDevSearchForm( );">▲나이
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('5 asc');goDevSearchForm( );">나이
         </c:otherwise>
      </c:choose>
      
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='6 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('6 asc');goDevSearchForm( );">▼핸드폰
         </c:when>
         <c:when test="${param.sort=='6 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('6 desc');goDevSearchForm( );">▲핸드폰
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('6 asc');goDevSearchForm( );">핸드폰
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='7 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('7 asc');goDevSearchForm( );">▼이메일
         </c:when>
         <c:when test="${param.sort=='7 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('7 desc');goDevSearchForm( );">▲이메일
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('7 asc');goDevSearchForm( );">이메일
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='8 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('8 asc');goDevSearchForm( );">▼주민번호
         </c:when>
         <c:when test="${param.sort=='8 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('8 desc');goDevSearchForm( );">▲주민번호
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('8 asc');goDevSearchForm( );">주민번호
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='addr desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('addr asc');goDevSearchForm( );">▼거주지
         </c:when>
         <c:when test="${param.sort=='addr asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('addr desc');goDevSearchForm( );">▲거주지
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('addr asc');goDevSearchForm( );">거주지
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='11 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('11 asc');goDevSearchForm( );">▼최종 학력
         </c:when>
         <c:when test="${param.sort=='11 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('11 desc');goDevSearchForm( );">▲최종 학력
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('11 asc');goDevSearchForm( );">최종 학력
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='12 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('12 asc');goDevSearchForm( );">▼최종학력졸업일
         </c:when>
         <c:when test="${param.sort=='12 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('12 desc');goDevSearchForm( );">▲최종학력졸업일
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('12 asc');goDevSearchForm( );">최종학력졸업일
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='13 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('13 asc');goDevSearchForm( );">▼개발년차
         </c:when>
         <c:when test="${param.sort=='13 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('13 desc');goDevSearchForm( );">▲개발년차
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('13 asc');goDevSearchForm( );">개발년차
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='14 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('14 asc');goDevSearchForm( );">▼소유기술
         </c:when>
         <c:when test="${param.sort=='14 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('14 desc');goDevSearchForm( );">▲소유기술
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('14 asc');goDevSearchForm( );">소유기술
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
      <c:choose>
         <c:when test="${param.sort=='15 desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('15 asc');goDevSearchForm( );">▼자격증
         </c:when>
         <c:when test="${param.sort=='15 asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('15 desc');goDevSearchForm( );">▲자격증
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('15 asc');goDevSearchForm( );">자격증
         </c:otherwise>
      </c:choose>
      <!------------------------------------->
<!--     <c:choose>
         <c:when test="${param.sort=='dispatch desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dispatch asc');goDevSearchForm( );">▼현재상황
         </c:when>
         <c:when test="${param.sort=='dispatch asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dispatch desc');goDevSearchForm( );">▲현재상황
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('dispatch asc');goDevSearchForm( );">현재상황
         </c:otherwise>
      </c:choose>
-->  
      <!------------------------------------->
<!--       <c:choose>
         <c:when test="${param.sort=='remain_months desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('remain_months asc');goDevSearchForm( );">▼프로젝트 남은개월수
         </c:when>
         <c:when test="${param.sort=='remain_months asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('remain_months desc');goDevSearchForm( );">▲프로젝트 남은개월수
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('remain_months asc');goDevSearchForm( );">프로젝트 남은개월수
         </c:otherwise>
      </c:choose> -->
      <!------------------------------------->
<!--
      <c:choose>
         <c:when test="${param.sort=='get_together desc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('get_together asc');goDevSearchForm( );">▼회식회수
         </c:when>
         <c:when test="${param.sort=='get_together asc'}">
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('get_together desc');goDevSearchForm( );">▲회식회수
         </c:when>
         <c:otherwise>
            <th style="cursor:pointer"
               onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('get_together asc');goDevSearchForm( );">회식회수
         </c:otherwise>
      </c:choose>
-->     

 
   
      <!------------------------------------->
      <!--검색 결과물 출력-->
      <!-- @httpservletrequest객체에 contactlist 라는 키값으로 저장된 -->
      <!-- list<map<string,string>>객체 안의 데이터를 커스텀 태그의 반복문으로 출력하기 -->
      <!-- var="contact는 map 객체를 담는 변수 -->
      <!------------------------------------->

  
    <c:forEach var="developer" items="${developerList}" varStatus="loopTagStatus">
      <tr align="center" style="cursor:pointer"
         onclick="openDeveloperUpDelForm(${developer.developer_no})">
         <td>${pageingData.beginRowNo_desc-loopTagStatus.index}
          <%-- <td>${developer.developer_no} --%> <!-- 내림 순서 번호 -->
         <td>${developer.developer_name}                       <!-- 연락처명 출력 -->
         <td>${developer.developergender}                                    <!-- 전화번호 출력 -->
         <td>${developer.birth_year}                         <!-- 연락처 사업분야를 모아 콤마를 중간에 넣어 출력 -->
         <td>${developer.age} 
         <td>${developer.cellphone}                       <!-- 연락처명 출력 -->
         <td>${developer.email}                                    <!-- 전화번호 출력 -->
         <td>${developer.jumin_num}                         <!-- 연락처 사업분야를 모아 콤마를 중간에 넣어 출력 -->
         <td>${developer.addr} 
         <td>${developer.lastschool}                       <!-- 연락처명 출력 -->
         <td>${developer.lastschoolgradudate} 
         <td>${developer.dev_career}
         <td>${developer.reg_skill}
         <td>${developer.certificate}                                   <!-- 전화번호 출력 -->
                                     <!-- 등록일 출력 -->
   </c:forEach> 
</table>
</form>
<form name="updelForm" method=post action="/erp/updelForm.do">
   <input type="hidden" name="developer_no">
</form>
<form name="regdev" action="/erp/registerForm.do"></form>
 </body>
</html>