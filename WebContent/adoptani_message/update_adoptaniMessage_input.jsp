<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani_message.model.*"%>
<%
	AdoptaniMessageVO adoptaniMessageVO = (AdoptaniMessageVO) request.getAttribute("adoptaniMessageVO"); //AdoptaniServlet.java (Concroller), �s�Jreq��adoptaniVO���� (�]�A�������X��adoptaniVO, �]�]�A��J��ƿ��~�ɪ�adoptaniVO����)
	//session.setAttribute("adoptaniMessageVO", adoptaniMessageVO);

%>

<%/**
	Q:update_adoptani_input.jsp  ${(adoptaniVO.adopt_Ani_gender==1) ? 'checked':''}
		�S��set�]�i�H��EL����C
	A:Control�̭���set�C


**/ %>


<html>
<head>
<title>�e�i�ʪ��d���ק� - update_adoptaniMessage_input.jsp</title></head>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�e�i�ʪ��d���ק� - update_adoptaniMessage_input.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
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
			<td>�ק�d�����e:</td>
			<td>
				<textarea cols="50" rows="5" name="ado_Ani_Mes" ><%= (adoptaniMessageVO==null)? "" : adoptaniMessageVO.getAdo_Ani_Mes()%></textarea>
			
		</tr>
	

</table>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ado_Ani_Mes_No" value="<%=adoptaniMessageVO.getAdo_Ani_Mes_No()%>">
<input type="hidden" name="adopt_Ani_Id" value="<%=adoptaniMessageVO.getAdopt_Ani_Id()%>">
<input type="hidden" name="mem_Id" value="<%=adoptaniMessageVO.getMem_Id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>


<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp)</b>
</body>
</body>
</html>
