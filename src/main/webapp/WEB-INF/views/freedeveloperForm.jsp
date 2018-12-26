<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common2.jsp"%>
</head>
<script>
$(document).ready(function(){
	
});
function regfreedeveloper(){
	$("[name^=is]").each(function(){
		if($(this).is(":checked") == false){
			$(this).val("n")
			$(this).attr("checked", true)
		}
	})
	
	$.ajax({
	    //--------------------
	    //호출할 서버쪽 url주소 설정
	    //--------------------
	    url: "/test/freedeveloperReg.do"
	    //--------------------
	    // 전송 방법 설정
	    //--------------------
	    ,type : "post"
	    //--------------------
	    // 서버에 보낼 파라미터명과 파라미터값을 설정
	    //--------------------
	    ,data : $("[name=regfreedeveloperFrom]").serialize()
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
<style>
		.tbcss1, .tbcss1 th, .tbcss1 td{
		border-collapse: collapse;
	   border:1px solid #797979;
	   padding:5;
	   font-size:9pt;
	   font-family:tahoma;
	  }
		</style>
<body>
	<center>
	<form name="regfreedeveloperFrom" method="post">
		<table class="tbcss1" cellpadding="7">
		<tr>
			<td>1. 프리랜서 기본 정보
				<table class="tbcss1" cellpadding="7">
				<tr>
					<th bgcolor="lightblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>
						<input type="text" name="free_developer_name" size=15 maxlength=20>
					</td>
					<th bgcolor="lightblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>
						<input type="radio" name="gender" value="m">남
						<input type="radio" name="gender" value="w">여
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">핸드폰</th>
					<td>
						<input type="text" name="phone" size=15 maxlength=20>
						&nbsp;&nbsp;
						<input type="checkbox" name="is_phone" value="y">전화번호틀림&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<th bgcolor="lightblue">이메일</th>
					<td>
						<input type="text" name="email" size=15 maxlength=20>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">출생년도</th>
					<td>
						<select name="birth_year">
							<option ></option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
						</select>
						년생
					</td>
					<th bgcolor="lightblue">최종학력</th>
					<td>
						<input type="radio" name="school_code" value="1">고졸
						<input type="radio" name="school_code" value="2">전문대졸
						<input type="radio" name="school_code" value="3">일반대졸
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">졸업년도</th>
					<td>
						<select name="graduate_date_year">
							<option ></option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
						</select>
						년
						<select name="graduate_date_month">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
					</td>
					<th bgcolor="lightblue">월급통장번호</th>
					<td>
						<select name="bank_no">
							<option >--은행선택--</option>
							<option value="1">기업은행</option>
							<option value="2">신한은행</option>
							<option value="3">하나은행</option>
							<option value="4">국민은행</option>
							<option value="5">농협</option>
						</select>
						<input type="text" name="account_num" size=15 maxlength=20>
						(-없이 입력)&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				</table>
				<br>
			2. 프리랜서 년차
				<table class="tbcss1" cellpadding="7">
				<tr>
					<th bgcolor="lightblue">추정 개발년차</th>
					<td>0년 0개월 ( 0년차 )</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">이력서 상 개발년차</th>
					<td>
						<select name="dev_career_year">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						년
						<select name="dev_career_month">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
						</select>
						개월
						&nbsp;&nbsp;&nbsp;
						(
						<select name="dev_career_confirm_Year">
							<option value=""></option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
						</select>
						년
						<select name="dev_career_confirm_month">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
						<select name="dev_career_confirm_day">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						일
						&nbsp;&nbsp;&nbsp;
						날짜&nbsp;&nbsp;기준)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				</table><br>
			3. 블랙 개발자
				<table class="tbcss1" cellpadding="7">
				<tr>
					<td>
						<c:forEach var="evaList" items="${requestScope.evaluationList}">
							<input type="checkbox" name="evaluation"  value="${evaList.code}">${evaList.name}
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				</table><br>
			4. 프리랜서 파견 정보 ( 전화 상담하면서 입력바람 )
				<table class="tbcss1" cellpadding="7">
				<tr>
					<th bgcolor="lightblue">상담시각</th>
					<td>
						<select name="counsel_time_year">
							<option value=""></option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
						</select>
						년
						<select name="counsel_time_month">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
						<select name="counsel_time_day">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						일
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="counsel_time_hour">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="00">00</option>
						</select>
						시
						<select name="counsel_time_minute">
							<option value=""></option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
							<option value="32">32</option>
							<option value="33">33</option>
							<option value="34">34</option>
							<option value="35">35</option>
							<option value="36">36</option>
							<option value="37">37</option>
							<option value="38">38</option>
							<option value="39">39</option>
							<option value="40">40</option>
							<option value="41">41</option>
							<option value="42">42</option>
							<option value="43">43</option>
							<option value="44">44</option>
							<option value="45">45</option>
							<option value="46">46</option>
							<option value="47">47</option>
							<option value="48">48</option>
							<option value="49">49</option>
							<option value="50">50</option>
							<option value="51">51</option>
							<option value="52">52</option>
							<option value="53">53</option>
							<option value="54">54</option>
							<option value="55">55</option>
							<option value="56">56</option>
							<option value="57">57</option>
							<option value="58">58</option>
							<option value="59">59</option>
						</select>
						분
						&nbsp;
						[지금] [비움]
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">현재직업</th>
					<td>
						<input type="radio" name="now_job_code" value="1">프리랜서개발자
						<input type="radio" name="now_job_code" value="2">정규직개발자
						<input type="radio" name="now_job_code" value="3">기타직업
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">소유스킬</th>
					<td>
						<c:forEach var="skillList" items="${requestScope.skillList}">
							<input type="checkbox" name="skill"  value="${skillList.skill_code}">${skillList.skill_name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">파견역할</th>
					<td>
						<c:forEach var="dispatch_roleList" items="${requestScope.dispatch_roleList}">
							<input type="checkbox" name="dispatch_role"  value="${dispatch_roleList.dispatch_role_code}">${dispatch_roleList.dispatch_role_name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">파견가능일</th>
					<td>
						<select name="dispatch_date_year">
							<option value=""></option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
						</select>
						년
						<select name="dispatch_date_month">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						월
						<select name="dispatch_date_day">
							<option value=""></option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						일
						|
						<input type="checkbox" name="is_dispatch_date" value="y">확정
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">개발 단가</th>
					<td>
						<select name="dev_money_min">
							<option value="0"></option>
							<option value="2200">2200</option>
							<option value="2300">2300</option>
							<option value="2400">2400</option>
							<option value="2500">2500</option>
						</select>
						만원~
						&nbsp;&nbsp;
						<select name="dev_money_max">
							<option value="0"></option>
							<option value="3000">3000</option>
							<option value="3100">3100</option>
							<option value="3200">3200</option>
							<option value="3300">3300</option>
						</select>
						만원
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="is_dev_money_fix" value="y">단가고정
						<input type="checkbox" name="is_dev_money_nego" value="y">협상후결정
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">운영 단가</th>
					<td>
						<select name="oper_money_min">
							<option value="0"></option>
							<option value="2200">2200</option>
							<option value="2300">2300</option>
							<option value="2400">2400</option>
							<option value="2500">2500</option>
						</select>
						만원~
						&nbsp;&nbsp;
						<select name="oper_money_max">
							<option value="0"></option>
							<option value="3000">3000</option>
							<option value="3100">3100</option>
							<option value="3200">3200</option>
							<option value="3300">3300</option>
						</select>
						만원
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="is_oper_money_fix" value="y">단가고정
						<input type="checkbox" name="is_oper_money_nego" value="y">협상후결정
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">기사 자격증</th>
					<td>
						<input type="checkbox" name="is_gisa" value="y">정보처리기사
						<input type="checkbox" name="is_sanupgisa" value="y">정보처리산업기사
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">노트북 소유</th>
					<td>
						<input type="checkbox" name="is_notebook" value="y">노트북대여희망
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">근무가능지역</th>
					<td>
						<c:forEach var="work_areaList" items="${requestScope.work_areaList}">
							<input type="checkbox" name="work_area"  value="${work_areaList.work_area_code}">${work_areaList.work_area_name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">선호분야</th>
					<td>
						<c:forEach var="favoriteList" items="${requestScope.favoriteList}">
							<input type="checkbox" name="favorite_field"  value="${favoriteList.dev_favorite_field_code}">${favoriteList.dev_favorite_field_name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">거주지</th>
					<td>
					 <select name="residence_area_code">
					 		<option value="">
                        <c:forEach var="residence_areaList" items="${requestScope.residence_areaList}">
							<option value="${residence_areaList.residence_area_code}">${residence_areaList.residence_area_name}
						</c:forEach>
                      </select>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightblue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타요구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<td>
						<textarea name="gita_requirement" rows=4 cols=80></textarea>
					</td>
				</tr>
				</table><br>
			5. 프리랜서 파견 정보 ( 전화 상담하면서 입력바람 )
				<table class="tbcss1" cellpadding="7">
				<tr>
					<th bgcolor="lightblue">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화상담&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br>
						시
						<br>
						주의사항
					</th>
					<td>
						<textarea name="warning" rows=4 cols=80></textarea>
					</td>
				</tr>
				</table><br>
		
				<input type="button" value="                저장                " onclick="regfreedeveloper();">
			</td>
		</tr>
	</table>
	</form>
	</center>

</body>
</html>