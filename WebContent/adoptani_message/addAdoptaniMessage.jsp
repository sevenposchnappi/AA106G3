<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani_message.model.*"%>

<%=
	(AdoptaniMessageVO) request.getAttribute("adoptaniMessageVO")	
	//�Ĥ@���i�즹�����Onull�A�]���S���o�F��C
%>
<%
	AdoptaniMessageVO adoptaniMessageVO = (AdoptaniMessageVO) request.getAttribute("adoptaniMessageVO");	
	//�w�����~��J�A�ӫO�duser�ҿ�J���Ҧ����e�A�e�X��Y���~���Υ��������C
%>
<%
/**
	�����~�T���n�`�N�g�n�ת����~�B�z�C
**/
%>


<html>
<head>
<title>�e�i�ʪ���Ʒs�W - addAdoptani.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>





<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
			<h3>�e�i�ʪ��d���s�W - addAdoptani.jsp</h3>
			</td>
			<td>
			   <a href="select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
		    </td>
		</tr>
	</table>
	
	<h3>�e�i�ʪ����:</h3>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
		</ul>
		</font>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_message/AdoptaniMessageServlet.do" name="form1">
	<table border="0">
	
		<tr>
			<td>�e�i�ʪ��s��:</td>
			<td><input type="TEXT" name="adopt_Ani_Id" size="30" 	placeholder="�п�J�e�i�ʪ��s��ex.40000001"
				value="<%= (adoptaniMessageVO==null)? "" : adoptaniMessageVO.getAdopt_Ani_Id()%>" /></td>
		</tr>
		<tr>
			<td>�o���̷|���s��:</td>
			<td><input type="TEXT" name="mem_Id" size="30" 	placeholder="�п�J�|���s��ex.10000001"
				value="<%= (adoptaniMessageVO==null)? "" : adoptaniMessageVO.getMem_Id() %>" /></td>
		</td>
		</tr>  
		
		<tr>
			<td>�d�����e:</td>
			<td>
				<textarea cols="50" rows="5" name="ado_Ani_Mes" ><%=(adoptaniMessageVO==null)?"":adoptaniMessageVO.getAdo_Ani_Mes()%></textarea>
			
<!-- 			<input type="TEXT" name="Mem_Id" size="20" placeholder="8�X" -->
<%-- 				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getMem_Id()%>" /></td> --%>
		</tr>
		


	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
	</FORM>
</body>

</html>

