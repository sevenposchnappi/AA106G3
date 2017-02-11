<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani.model.*"%>
<%
	AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniServlet.java (Concroller), �s�Jreq��adoptaniVO���� (�]�A�������X��adoptaniVO, �]�]�A��J��ƿ��~�ɪ�adoptaniVO����)
%>

<%/**
	Q:update_adoptani_input.jsp  ${(adoptaniVO.adopt_Ani_gender==1) ? 'checked':''}
		�S��set�]�i�H��EL����C
	A:Control�̭���set�C


**/ %>


<html>
<head>
<title>�e�i�ʪ���ƭק� - update_adoptani_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

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

<FORM METHOD="post" ACTION="adoptani.do" name="form1">
<table border="0">



	<tr>
		<td>�e�i�ʪ��W�r</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_name" size="20" value="<%=adoptaniVO.getAdopt_Ani_name()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��ʪ�����</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_type" size="1" value="<%=adoptaniVO.getAdopt_Ani_type()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��ʧO</td>
		<td>
			<input type="radio" name="Adopt_Ani_gender" size="20" value="1" ${(adoptaniVO.adopt_Ani_gender==1) ? 'checked':''}>��	
			<input type="radio" name="Adopt_Ani_gender" size="20" value="0" ${(adoptaniVO.adopt_Ani_gender==0) ? 'checked':''}>��
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ����d���p</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_heal" size="20" value="<%=adoptaniVO.getAdopt_Ani_heal()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��̭]����</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_Vac" size="20" value="<%=adoptaniVO.getAdopt_Ani_Vac()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ����</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_color" size="20" value="<%=adoptaniVO.getAdopt_Ani_color()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��髬</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_body" size="20" value="<%=adoptaniVO.getAdopt_Ani_body()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��~��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_age" size="20" value="<%=adoptaniVO.getAdopt_Ani_age()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ��`�|</td>
		<td>
			<input type="radio" name="Adopt_Ani_Neu" size="20" value="1" ${(adoptaniVO.adopt_Ani_Neu==1) ? 'checked':''}>�w����	
			<input type="radio" name="Adopt_Ani_Neu" size="20" value="0" ${(adoptaniVO.adopt_Ani_Neu==0) ? 'checked':''}>������
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ������s��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_chip" size="15" value="<%=adoptaniVO.getAdopt_Ani_chip()%>">
		</td>
	</tr>

	<tr>
		<!-- �S����ܮɶ��N�۰ʶ�J�{�b�ɶ� -->
		<%java.sql.Timestamp date_SQL = new java.sql.Timestamp(System.currentTimeMillis());%>
		<td>�e�i�ɶ�:</td>
		<td>
			<input id="datetimepicker1" readonly name="Adopt_Ani_date" type="text" value="<%=(adoptaniVO==null)? date_SQL : adoptaniVO.getAdopt_Ani_date() %>" />
		</td>
	</tr>
	<tr>
		<td>�e�i�ʪ����󪬺A</td>
		<td>
			<input type="radio" name="Adopt_Ani_status" size="20" value="1" ${(adoptaniVO.adopt_Ani_status==1) ? 'checked':''}>��@��	
			<input type="radio" name="Adopt_Ani_status" size="20" value="0" ${(adoptaniVO.adopt_Ani_status==0) ? 'checked':''}>�����
		</td>
	</tr>

	<tr>
		<td>�e�i�a�I�g��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_FinLat" size="20" value="<%=adoptaniVO.getAdopt_Ani_FinLat()%>">
		</td>
	</tr>
	<tr>
		<td>�e�i�a�I�n��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_FinLon" size="20" value="<%=adoptaniVO.getAdopt_Ani_FinLon()%>">
		</td>
	</tr>
	<tr>
		<td>��/��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_city" size="20" value="<%=adoptaniVO.getAdopt_Ani_city()%>">
		</td>
	</tr>
	<tr>
		<td>�m����</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_town" size="20" value="<%=adoptaniVO.getAdopt_Ani_town()%>">
		</td>
	</tr>
	<tr>
		<td>�D����W����</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_road" size="20" value="<%=adoptaniVO.getAdopt_Ani_road()%>">
		</td>
	</tr>
		<tr>
		<td>Like��</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_like" size="20" value="<%=adoptaniVO.getAdopt_Ani_like()%>">
		</td>
	</tr>
	

</table>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="adopt_Ani_Id" value="<%=adoptaniVO.getAdopt_Ani_Id()%>">
<input type="hidden" name="Mem_Id" value="<%=adoptaniVO.getMem_Id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>


<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp)</b>
</body>
</body>
</html>
