<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani_photo.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%

 	List<AdoptaniPhotoVO> list = (List) request.getAttribute("oneAdoptAniPhotoList");
	pageContext.setAttribute("list",list);	//如果沒有setAttribute，JLTS的for each就沒辦法跑。
	
%>

<html>
<head>
<title>所有送養動物照片 - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>




<table border='1' bordercolor='#CCCCFF' >

<%-- 	<%@ include file="page1.file" %>  --%>
<%-- 	<c:forEach var="adoptaniPhotoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
			<c:forEach var="adoptaniPhotoVO" items="${list}" >
				
				
				<tr align='center' valign='middle'>

				<td height=200px width=200px style="table-layout:fixed"><div><img style="table-layout:fixed; max-height:200px; max-width:200px" src="<%=request.getContextPath()%>/DBGifReader_AdoptaniPhoto/DBGifReader_AdoptaniPhoto.do?ado_Ani_Pic_No=${adoptaniPhotoVO.ado_Ani_Pic_No}"></div></td>


   
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="ado_Ani_Pic_No" value="${adoptaniPhotoVO.ado_Ani_Pic_No}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
			     
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do"> --%>
<!-- 			    <input type="submit" value="刪除"> -->
<%-- 			    <input type="hidden" name="ado_Ani_Pic_No" value="${adoptaniPhotoVO.ado_Ani_Pic_No}"> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
<!-- 			</td> -->
				</tr>
			</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>