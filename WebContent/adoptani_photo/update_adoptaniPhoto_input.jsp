<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani_photo.model.*"%>
<%
	AdoptaniPhotoVO adoptaniPhotoVO = (AdoptaniPhotoVO) request.getAttribute("adoptaniPhotoVO"); //AdoptaniServlet.java (Concroller), �s�Jreq��adoptaniVO���� (�]�A�������X��adoptaniVO, �]�]�A��J��ƿ��~�ɪ�adoptaniVO����)
%>
<html>
<head>
<title>�e�i�ʪ��ۤ���ƭק� - update_adoptaniPhoto_input.jsp</title></head>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��ƭק� - update_adoptani_input.jsp</h3>
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

<FORM METHOD="post" ACTION="adoptani_photo.do" name="form1">
<table border="0">


	<tr>
		<td>�e�i�ʪ��ۤ�����</td>
		<td>
			<input type="TEXT" name="ado_Pic_type" size="20" value="<%=adoptaniPhotoVO.getAdo_Pic_type()%>">
		</td>
	</tr>

	

</table>


<br>
<input type="hidden" name="action" value="update">



<input type="hidden" name="ado_Ani_Pic_No" value="<%=adoptaniPhotoVO.getAdo_Ani_Pic_No()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
