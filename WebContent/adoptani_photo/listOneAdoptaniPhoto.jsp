<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani_photo.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%

 	List<AdoptaniPhotoVO> list = (List) request.getAttribute("oneAdoptAniPhotoList");
	pageContext.setAttribute("list",list);	//�p�G�S��setAttribute�AJLTS��for each�N�S��k�]�C
%>

<html>
<head>
<title>�Ҧ��e�i�ʪ��Ӥ� - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��e�i�ʪ��Ӥ� - listAllAdoptaniPhoto.jsp</h3>
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
		<th>�e�i�ʪ��Ӥ��s��</th>
		<th>�e�i�ʪ��s��</th>
		<th>�o���̷|���s��</th>
		<th>�e�i�ʪ��Ӥ�</th>
		<th>�e�i�ʪ��Ӥ��W��</th>
		<th>�e�i�ʪ��Ӥ����ɦW</th>
		<th>�e�i�ʪ��Ӥ��W�Ǯɶ�</th>
		<th>�e�i�ʪ��Ӥ�����</th>
		

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="adoptaniPhotoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			
			<td>${adoptaniPhotoVO.ado_Ani_Pic_No}</td> 
			<td>${adoptaniPhotoVO.adopt_Ani_Id}</td>
			<td>${adoptaniPhotoVO.mem_Id}</td>
			<td height=200px width=200px style="table-layout:fixed"><div><img onload="javascript:this.resized=true;this.style.width=300;" src="<%=request.getContextPath()%>/DBGifReader_AdoptaniPhoto/DBGifReader_AdoptaniPhoto.do?ado_Ani_Pic_No=${adoptaniPhotoVO.ado_Ani_Pic_No}"></div></td>
			<td>${adoptaniPhotoVO.ado_Pic_name}</td>
			<td>${adoptaniPhotoVO.ado_Pic_nameEX}</td>
			<td>${adoptaniPhotoVO.ado_Pic_time}</td>
			<td>${adoptaniPhotoVO.ado_Pic_type}</td>

   
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ado_Ani_Pic_No" value="${adoptaniPhotoVO.ado_Ani_Pic_No}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			     
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ado_Ani_Pic_No" value="${adoptaniPhotoVO.ado_Ani_Pic_No}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>