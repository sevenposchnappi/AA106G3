<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani_message.model.*"%>
<%@ page import="com.chung.tools.Tools"%>

<%
	Tools tools = new Tools();
%>
<%=session.getAttribute("adoptaniMessageVO") %>
 <br>
<%=request.getAttribute("adoptaniMessageVO") %>
<jsp:useBean id="adoptaniMessageVO" scope="request"	class="com.adoptani_message.model.AdoptaniMessageVO" />
<%-- <% --%>
// 	AdoptaniMessageVO adoptaniMessageVO = null;
// 	if(session.getAttribute("adoptaniMessageVO") != null){
// 		adoptaniMessageVO = (AdoptaniMessageVO) session.getAttribute("adoptaniMessageVO");
// 	}else{
// 		adoptaniMessageVO = (AdoptaniMessageVO) request.getAttribute("adoptaniMessageVO");
// 	}

<%-- %> --%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�e�i�ʪ��d�� - listOneAdoptaniMessage.jsp</title>
</head>
<body bgcolor='white'>
	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�浧�e�i�ʪ��d�� - listOneAdoptaniMessage.jsp</h3> <a
				href="select_page.jsp"><img src="images/back1.gif" width="100"
					height="32" border="0">�^����</a>
			</td>
		</tr>
	</table>





	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>�e�i�ʪ��d���s��</th>
			<th>�e�i�ʪ��s��</th>
			<th>�o���̷|���s��</th>
			<th>�e�i�ʪ��ʪ��d���ɶ�</th>
			<th>�e�i�ʪ��d�����e</th>

		</tr>
		<tr align='center' valign='middle'>
			<td>${adoptaniMessageVO.ado_Ani_Mes_No}</td>
			<td>${adoptaniMessageVO.adopt_Ani_Id}</td>
			<td>${adoptaniMessageVO.mem_Id}</td>
			<td>${adoptaniMessageVO.ado_Ani_Mes_time}</td>
			<td>${adoptaniMessageVO.ado_Ani_Mes}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_message/AdoptaniMessageServlet.do">
					<input type="submit" value="�ק�"> 
					<input type="hidden" name="ado_Ani_Mes_No" value="<%=adoptaniMessageVO.getAdo_Ani_Mes_No()%>"> 
						<input type="hidden" name="adopt_Ani_Id" value="<%=adoptaniMessageVO.getAdopt_Ani_Id()%>"> 
						<input type="hidden" name="mem_Id" value="<%=adoptaniMessageVO.getMem_Id()%>"> 
						<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
						<input type="hidden" name="action" value="getOne_For_Update">
				</FORM>
			</td>
			<td>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/adoptani_message/AdoptaniMessageServlet.do">
					<input type="submit" value="�R��"> 
					<input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}"> 
					<input type="hidden" name="action" value="delete">
				</FORM>
			</td>

		</tr>

	</table>









	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>



