<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>

<%
AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniVOServlet.java(Concroller), �s�Jreq��adoptaniVO����

%>

<html>
<head>
<title>�e�i�ʪ���� - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�e�i�ʪ���� - listOneAdoptani.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�e�i�ʪ��s��</th>
		<th>�o���̷|���s��</th>
		<th>�e�i�ʪ��W�r</th>
		<th>�e�i�ʪ��j�Y��</th>
		<th>�e�i�ʪ��ʪ�����</th>
		<th>�e�i�ʪ��ʧO</th>
		<th>�e�i�ʪ����d���p</th>
		<th>�e�i�ʪ��̭]����</th>
		<th>�e�i�ʪ����</th>
		<th>�e�i�ʪ��髬</th>
		<th>�e�i�ʪ��~��</th>
		<th>�e�i�ʪ��`�|</th>
		<th>�e�i�ʪ������s��</th>
		<th>�e�i�ɶ�</th>
		<th>�e�i�ʪ����󪬺A</th>
		<th>�e�i�ʪ��إ߮ɶ�</th>
		<th>�e�i�a�I�g��</th>
		<th>�e�i�a�I�n��</th>
		<th>��/��</th>
		<th>�m����</th>
		<th>�D����W����</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%= adoptaniVO.getAdopt_Ani_Id()%></td> 
		<td><%= adoptaniVO.getMem_Id()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_name()%></td>
		<td  style="table-layout:fixed; height:100px ; width:100px"><div><img style="table-layout:fixed; max-height:100px; max-width:100px"  src="<%=request.getContextPath()%>/DBGifReader_AdoptaniPhoto/DBGifReader_AdoptaniPhoto.do?adopt_Ani_Id=<%= adoptaniVO.getAdopt_Ani_Id()%>&ado_Pic_type=0"></div></td>
		<td><%= adoptaniVO.getAdopt_Ani_type()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_gender()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_heal()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_Vac()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_color()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_body()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_age()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_Neu()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_chip()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_date()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_status()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_CreDate()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_FinLat()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_FinLon()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_city()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_town()%></td>
		<td><%= adoptaniVO.getAdopt_Ani_road()%></td> 
	</tr>
</table>

</body>
</html>



