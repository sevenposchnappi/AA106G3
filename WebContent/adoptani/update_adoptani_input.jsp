<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani.model.*"%>
<%
	AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniServlet.java (Concroller), 存入req的adoptaniVO物件 (包括幫忙取出的adoptaniVO, 也包括輸入資料錯誤時的adoptaniVO物件)
%>
<html>
<head>
<title>送養動物資料修改 - update_adoptani_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>員工資料修改 - update_adoptani_input.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>資料修改:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
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
		<td>送養動物名字</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_name" size="20" value="<%=adoptaniVO.getAdopt_Ani_name()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物動物種類</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_type" size="1" value="<%=adoptaniVO.getAdopt_Ani_type()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物性別</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_gender" size="20" value="<%=adoptaniVO.getAdopt_Ani_gender()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物健康狀況</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_heal" size="20" value="<%=adoptaniVO.getAdopt_Ani_heal()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物疫苗接踵</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_Vac" size="20" value="<%=adoptaniVO.getAdopt_Ani_Vac()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物毛色</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_color" size="20" value="<%=adoptaniVO.getAdopt_Ani_color()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物體型</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_body" size="20" value="<%=adoptaniVO.getAdopt_Ani_body()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物年齡</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_age" size="20" value="<%=adoptaniVO.getAdopt_Ani_age()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物節育</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_Neu" size="20" value="<%=adoptaniVO.getAdopt_Ani_Neu()%>">
		</td>
	</tr>
	<tr>
		<td>送養動物晶片編號</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_chip" size="15" value="<%=adoptaniVO.getAdopt_Ani_chip()%>">
		</td>
	</tr>
	<tr>
		<td>送養時間:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="Adopt_Ani_date" value="<%=adoptaniVO.getAdopt_Ani_date()%> ">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>送養動物物件狀態</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_status" size="1" value="<%=adoptaniVO.getAdopt_Ani_status()%>">
		</td>
	</tr>

	<tr>
		<td>送養地點經度</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_FinLat" size="20" value="<%=adoptaniVO.getAdopt_Ani_FinLat()%>">
		</td>
	</tr>
	<tr>
		<td>送養地點緯度</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_FinLon" size="20" value="<%=adoptaniVO.getAdopt_Ani_FinLon()%>">
		</td>
	</tr>
	<tr>
		<td>縣/市</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_city" size="20" value="<%=adoptaniVO.getAdopt_Ani_city()%>">
		</td>
	</tr>
	<tr>
		<td>鄉鎮市區</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_town" size="20" value="<%=adoptaniVO.getAdopt_Ani_town()%>">
		</td>
	</tr>
	<tr>
		<td>道路街名村里</td>
		<td>
			<input type="TEXT" name="Adopt_Ani_road" size="20" value="<%=adoptaniVO.getAdopt_Ani_road()%>">
		</td>
	</tr>
	

</table>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="adopt_Ani_Id" value="<%=adoptaniVO.getAdopt_Ani_Id()%>">
<input type="hidden" name="Mem_Id" value="<%=adoptaniVO.getMem_Id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--用於:istAllEmp.jsp 與 複合查詢 listEmps_ByCompositeQuery.jsp-->
<input type="submit" value="送出修改"></FORM>


<br>送出修改的來源網頁路徑:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (此範例目前用於:istAllEmp.jsp 與 複合查詢 listEmps_ByCompositeQuery.jsp)</b>
</body>
</body>
</html>
