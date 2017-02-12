<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani_message.model.*"%>
<%@ page import="com.chung.tools.Tools"%>


<%-- ���oService����A�ե�DAO�̭���getAll()�A����Ʈw��Table���C����ơC --%>
<%
	AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
    List<AdoptaniMessageVO> list = adoptaniMessageSvc.getAllMessage();
    pageContext.setAttribute("list",list);	//�n���scope�̭��~��o��C
%>

<html>
<head>
<title>�Ҧ��e�i�ʪ��d����� - listAllAdoptaniMessage.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��e�i�ʪ���� - listAllAdoptaniMessage.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�e�i�ʪ��d���s��</th>
		<th>�e�i�ʪ��s��</th>
		<th>�o���̷|���s��</th>
		<th>�e�i�ʪ��ʪ��d���ɶ�</th>
		<th>�e�i�ʪ��d�����e</th>

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="adoptaniMessageVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(adoptaniMessageVO.ado_Ani_Mes_No==param.ado_Ani_Mes_No) ? 'bgcolor=#CCCCFF':''}>
			<td>${adoptaniMessageVO.ado_Ani_Mes_No}</td> 
			<td>${adoptaniMessageVO.adopt_Ani_Id}</td>
			<td>${adoptaniMessageVO.mem_Id}</td>
			<td>${adoptaniMessageVO.ado_Ani_Mes_time}</td>
			<td>${adoptaniMessageVO.ado_Ani_Mes}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_message/AdoptaniMessageServlet.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ado_Ani_Mes_No" value="${adoptaniMessageVO.ado_Ani_Mes_No}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_message/AdoptaniMessageServlet.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ado_Ani_Mes_No" value="${adoptaniMessageVO.ado_Ani_Mes_No}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
			     
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
<br>




</body>
</html>