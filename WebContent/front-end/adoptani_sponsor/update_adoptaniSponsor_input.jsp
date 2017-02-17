<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani_sponsor.model.*"%>
<%
	AdoptaniSponsorVO adoptaniSponsorVO = (AdoptaniSponsorVO) request.getAttribute("adoptaniSponsorVO"); //AdoptaniServlet.java (Concroller), 存入req的adoptaniVO物件 (包括幫忙取出的adoptaniVO, 也包括輸入資料錯誤時的adoptaniVO物件)
	request.setAttribute("adoptaniSponsorVO", adoptaniSponsorVO);
    
	

%>

<%/**
	Q:update_adoptani_input.jsp  ${(adoptaniVO.adopt_Ani_gender==1) ? 'checked':''}
		沒有set也可以用EL取到。
	A:Control裡面有set。


**/ %>


<html>
<head>
<title>送養動物贊助修改 - update_adoptaniSponsor_input.jsp</title></head>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>送養動物贊助修改 - update_adoptaniSponsor_input.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>資料修改:</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/adoptani_sponsor/AdoptaniSponsorServlet.do" name="form1">
<table border="0">

		<tr>
			<td>修改贊助動物:</td>
			<td>
				<input type="text" name="adopt_Ani_Id" value="<%= (adoptaniSponsorVO==null)? "" : adoptaniSponsorVO.getAdopt_Ani_Id()%>">
			
		</tr>
		<tr>
			<td>修改贊助金額:</td>
			<td>
				<input type="text" name="ado_Ani_Spo_money" value="<%= (adoptaniSponsorVO==null)? "" : adoptaniSponsorVO.getAdo_Ani_Spo_money()%>">
			
		</tr>
		<tr>
			<td>修改贊助物資:</td>
			<td>
				<input type="text" name="ado_Ani_Spo_thing" value="<%= (adoptaniSponsorVO==null)? "" : adoptaniSponsorVO.getAdo_Ani_Spo_thing()%>">
			
		</tr>

	

</table>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ado_Ani_Spo_No" value="<%=adoptaniSponsorVO.getAdo_Ani_Spo_No()%>">
<input type="hidden" name="adopt_Ani_Id" value="<%=adoptaniSponsorVO.getAdopt_Ani_Id()%>">
<input type="hidden" name="mem_Id" value="<%=adoptaniSponsorVO.getMem_Id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--用於:istAllEmp.jsp 與 複合查詢 listEmps_ByCompositeQuery.jsp-->
<input type="submit" value="送出修改"></FORM>


<br>送出修改的來源網頁路徑:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (此範例目前用於:istAllEmp.jsp 與 複合查詢 listEmps_ByCompositeQuery.jsp)</b>
</body>
</body>
</html>
