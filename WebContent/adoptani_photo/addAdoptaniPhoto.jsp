<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani_photo.model.*"%>

<%=
	(AdoptaniPhotoVO) request.getAttribute("adoptaniPhotoVO")	
	//�Ĥ@���i�즹�����Onull�A�]���S���o�F��C
%>
<%
	AdoptaniPhotoVO adoptaniPhotoVO = (AdoptaniPhotoVO) request.getAttribute("adoptaniPhotoVO");	
	//�w�����~��J�A�ӫO�duser�ҿ�J���Ҧ����e�A�e�X��Y���~���Υ��������C
%>



<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�e�i�ʪ��Ӥ��s�W - addAdoptaniPhoto.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
	
	<script><!--for�w��--->
		function doFirst(){	
			//�PHTML�e���������p�A�A�بƥ��ť���\��
			document.getElementById('theFile').onchange = fileChange;
		}
	
		function fileChange(){
			var file = document.getElementById('theFile').files[0];

			var readFile = new FileReader();
			readFile.readAsDataURL(file);
			readFile.addEventListener('load',function(){
				var image = document.getElementById('image');
				image.src = readFile.result;
				image.style.maxWidth = '300px';
				image.style.maxHeight = '300px';
			},false);
		}
		window.addEventListener('load',doFirst,false);
	</script>
	
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
			<h3>�e�i�ʪ���Ʒs�W - addAdoptani.jsp</h3>
			</td>
			<td>
			   <a href="select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
		    </td>
		</tr>
	</table>
	
	<h3>��ƭ��u:</h3>
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

	<FORM METHOD="post" ACTION="adoptani_photo.do" name="form1" enctype="multipart/form-data">
	<table border="0">
	
		<tr>
			<td>�e�i�ʪ��s��:</td>
			<td><input type="TEXT" name="adopt_Ani_Id" size="20" 	placeholder="8�X"
				value="<%= (adoptaniPhotoVO==null)? 40000001 : adoptaniPhotoVO.getAdopt_Ani_Id()%>" /></td>
		</tr>
		<tr>
			<td>�o���̷|���s��:</td>
			<td><input type="TEXT" name="mem_Id" size="20" placeholder="8�X"
				value="<%= (adoptaniPhotoVO==null)? 10000001 : adoptaniPhotoVO.getMem_Id()%>" /></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ��Ӥ��W��:</td>
			<td><input type="TEXT" name="ado_Pic_name" size="20" placeholder=""
				value="<%= (adoptaniPhotoVO==null)? "" : adoptaniPhotoVO.getAdo_Pic_name()%>" /></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ��Ӥ����ɦW:</td>
			<td><input type="TEXT" name="ado_Pic_nameEX" size="20" placeholder="�ߡB��...."
				value="<%= (adoptaniPhotoVO==null)? "" : adoptaniPhotoVO.getAdo_Pic_nameEX()%>" /></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ��Ӥ�����:</td>
			<td><input type="TEXT" name="ado_Pic_type" size="20" placeholder="�ߡB��...."
				value="<%= (adoptaniPhotoVO==null)? "" : adoptaniPhotoVO.getAdo_Pic_type()%>" /></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ��j�Y�K�Ӥ�:</td>
			<td><input type="file" name="ado_Ani_Pic" size="20" id="theFile" /></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ���ï�Ӥ�:</td>
			<td><input type="file" name="ado_Ani_Pic" size="20"  multiple/></td>
		</tr>
		<tr>
			<td>�e�i�ʪ��ʪ���ï�Ӥ��w��:</td>
			<td><img id="image"></td>
		</tr>
		
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
	</FORM>
</body>

</html>
