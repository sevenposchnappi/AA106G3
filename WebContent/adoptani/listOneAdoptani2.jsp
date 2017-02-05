<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>

<%
AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniVOServlet.java(Concroller), 存入req的adoptaniVO物件

%>

<html>
<head>
<title>送養動物資料 - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>送養動物資料 - listOneAdoptani.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>送養動物編號</th>
		<th>發布者會員編號</th>
		<th>送養動物名字</th>
		<th>送養動物大頭照</th>
		<th>送養動物動物種類</th>
		<th>送養動物性別</th>
		<th>送養動物健康狀況</th>
		<th>送養動物疫苗接踵</th>
		<th>送養動物毛色</th>
		<th>送養動物體型</th>
		<th>送養動物年齡</th>
		<th>送養動物節育</th>
		<th>送養動物晶片編號</th>
		<th>送養時間</th>
		<th>送養動物物件狀態</th>
		<th>送養動物建立時間</th>
		<th>送養地點經度</th>
		<th>送養地點緯度</th>
		<th>縣/市</th>
		<th>鄉鎮市區</th>
		<th>道路街名村里</th>
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



