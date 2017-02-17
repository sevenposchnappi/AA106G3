<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani_sponsor.model.*"%>
<%@ page import="com.chung.tools.Tools"%>


<%-- 取得Service物件，調用DAO裡面的getAll()，取資料庫此Table的每筆資料。 --%>

<%	
	String adopt_Ani_Id = (String) request.getParameter("adopt_Ani_Id");
	System.out.println(adopt_Ani_Id);
	AdoptaniSponsorService adoptaniSponsorSvc = new AdoptaniSponsorService();
	List<AdoptaniSponsorVO> list = adoptaniSponsorSvc.getOneAdoptaniAllSponsor(adopt_Ani_Id);
    pageContext.setAttribute("list",list);	//要放到scope裡面才找得到。
    Integer TotalSponsor = adoptaniSponsorSvc.getOneAllMoney(adopt_Ani_Id);
%>

<html>
<head>
<title>贊助</title>
</head>
<body bgcolor='white'>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='400'>

<h1>獲得贊助金額:<%=TotalSponsor%></h1>
	<tr>
<!-- 		<th>送養動物留言編號</th> -->
<!-- 		<th>送養動物編號</th> -->
		<th>贊助會員</th>
		<th>贊助金額</th>
		<th>贊助物資</th>
		<th>贊助時間</th>
	</tr>
	<c:forEach var="adoptaniSponsorVO" items="${list}" >
		<tr align='center' valign='middle' ${(adoptaniSponsorVO.ado_Ani_Spo_No==param.ado_Ani_Spo_No) ? 'bgcolor=#CCCCFF':''}>
<%-- 			<td>${adoptaniSponsorVO.ado_Ani_Spo_No}</td>  --%>
<%-- 			<td>${adoptaniSponsorVO.adopt_Ani_Id}</td> --%>
			<td>${adoptaniSponsorVO.mem_Id}</td>
			<td>${adoptaniSponsorVO.ado_Ani_Spo_money}</td>
			<td>${adoptaniSponsorVO.ado_Ani_Spo_thing}</td>
			<td>${adoptaniSponsorVO.ado_Ani_Spo_time}</td>
<!-- 			<td> -->
<%-- 			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/adoptani_sponsor/AdoptaniSponsorServlet.do"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="ado_Ani_Spo_No" value="${adoptaniSponsorVO.ado_Ani_Spo_No}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/adoptani_sponsor/AdoptaniSponsorServlet.do"> --%>
<!-- 			    <input type="submit" value="刪除"> -->
<%-- 			    <input type="hidden" name="ado_Ani_Spo_No" value="${AdoptaniSponsorVO.ado_Ani_Spo_No}"> --%>
<%-- 			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
<!-- 			</td> -->
			     
		</tr>
	</c:forEach>
</table>






</body>
</html>