<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- JSP페이지에서 사용할 [사용자정의 태그]인 [JSTL의 C코어 태그 선언] -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- JSP기술의 한 종류인 page directive를 이용하여 현 JSP페이지 처리방식 선언하기 -->

<!-- 현재 이 JSP 페이지 실행후 생성되는 문서는 HTML 이고, 이문서는 UTF-8방식으로 인코딩한다라고 설정함
현재 이JSP페이지는 UTF-8방식으로 인코딩한다
UTF-8 인코딩방식은 한글을 포함 전세계 모든 문자열을 부호화 할수있는 방법이다. -->


<script src="/erp/resources/jquery-1.11.0.min.js" type ="text/javascript"></script>
<!-- css파일 수입  -->
<link href="/erp/resources/style1.css" rel="stylesheet" type="text/css">

<!-- C 코어 커스텀 태그 사용하여 HttpServletRequest 객체에  bgcolor1 이라는 키값으로 pink라는 문자열을 저장 -->
<c:set var="bgcolor1" value="#B2EBF4" scope="request"/>
