<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptani.model.*"%>

<%=
	(AdoptaniVO) request.getAttribute("adoptaniVO")	
	//第一次進到此頁面是null，因為沒有這東西。
%>
<%
	AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO");	
	//預防錯誤輸入，而保留user所輸入的所有內容，送出後若錯誤不用全部重打。
%>


<html>
<head>
<title>送養動物資料新增 - addAdoptani.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link href="js/jquery-ui-timepicker-addon.css" rel="stylesheet"></link>
<script src="js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="js/jquery-ui-sliderAccess.js" type="text/javascript"></script>




<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
			<h3>送養動物資料新增 - addAdoptani.jsp</h3>
			</td>
			<td>
			   <a href="select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">回首頁</a>
		    </td>
		</tr>
	</table>
	
	<h3>送養動物資料:</h3>
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
			<td>送養動物名字:</td>
			<td><input type="TEXT" name="Adopt_Ani_name" size="20" 	placeholder="請輸入16字元內之名字"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_name()%>" /></td>
		</tr>
		<tr>
			<td>發布者會員編號:</td>
			<td><input type="TEXT" name="Mem_Id" size="20" placeholder="8碼"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getMem_Id()%>" /></td>
		</tr>
		<tr>
			<td>送養動物動物種類:</td>
			<td><input type="TEXT" name="Adopt_Ani_type" size="20" placeholder="貓、狗...."
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_type()%>" /></td>
		</tr>
		<tr>
			<td>送養動物性別:</td>
			<td><input type="radio" name="adopt_Ani_gender" 
				value="1"/>公
				<input type="radio" name="adopt_Ani_gender" 
				value="0"/>母
			</td>
		</tr>
		<tr>
			<td>送養動物健康狀況:</td>
			<td><input type="TEXT" name="Adopt_Ani_heal" size="20" placeholder="20字內描述"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_heal()%>" /></td>
		</tr>
		<tr>
			<td>送養動物疫苗接踵:</td>
			<td><input type="TEXT" name="Adopt_Ani_Vac" size="20" placeholder="20字內描述"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_Vac()%>" /></td>
		</tr>
		<tr>
			<td>送養動物毛色:</td>
			<td><input type="TEXT" name="Adopt_Ani_color" size="20" placeholder="20字元內描述"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_color()%>" /></td>
		</tr>
		<tr>
			<td>送養動物體型:</td>
			<td><input type="TEXT" name="Adopt_Ani_body" size="20" placeholder="20字元內描述"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_body()%>" /></td>
		</tr>

		<tr>
			<td>送養動物年齡:</td>
			<td><input type="TEXT" name="Adopt_Ani_age" size="20" placeholder="5字內描述"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_age()%>" /></td>
		</tr>
		<tr>
			<td>送養動物節育:</td>
			<td><input type="TEXT" name="Adopt_Ani_Neu" size="20" placeholder=""
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_Neu()%>" /></td>
		</tr>

		<tr>
			<td>送養動物晶片編號:</td>
			<td><input type="TEXT" name="Adopt_Ani_chip" size="20" placeholder="請輸入15碼晶片編號"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_chip()%>" /></td>
		</tr>
		
		<tr>
			<td>送養動物物件狀態:</td>
			<td><input type="TEXT" name="Adopt_Ani_status" size="45" placeholder="0:為隱藏，1:為顯示"
				value="<%= (adoptaniVO==null)? "" : adoptaniVO.getAdopt_Ani_status()%>" /></td>
		</tr>		

		<tr>
			<td>縣/市:</td>
			<td><input type="TEXT" name="Adopt_Ani_city" size="45"
				value="<%= (adoptaniVO==null)? "MANAGER" : adoptaniVO.getAdopt_Ani_city()%>" /></td>
		</tr>
		<tr>
			<td>鄉鎮市區:</td>
			<td><input type="TEXT" name="Adopt_Ani_town" size="45"
				value="<%= (adoptaniVO==null)? "MANAGER" : adoptaniVO.getAdopt_Ani_town()%>" /></td>
		</tr>
		<tr>
			<td>道路街名村里:</td>
			<td><input type="TEXT" name="Adopt_Ani_road" size="45"
				value="<%= (adoptaniVO==null)? "MANAGER" : adoptaniVO.getAdopt_Ani_road()%>" /></td>
		</tr>
		<tr>
			<td>送養地點經度:</td>
			<td><input type="TEXT" name="Adopt_Ani_FinLat" size="45"
				value="<%= (adoptaniVO==null)? "MANAGER" : adoptaniVO.getAdopt_Ani_FinLat()%>" /></td>
		</tr>
		<tr>
			<td>送養地點緯度:</td>
			<td><input type="TEXT" name="Adopt_Ani_FinLon" size="45"
				value="<%= (adoptaniVO==null)? "MANAGER" : adoptaniVO.getAdopt_Ani_FinLon()%>" /></td>
		</tr>
		<tr>
			<%java.sql.Timestamp date_SQL = new java.sql.Timestamp(System.currentTimeMillis());%>
			<td>送養時間:</td>
			<td bgcolor="#CCCCFF">
			    <input class="cal-TextBox"
				onFocus="this.blur()" size="9" readonly type="text" name="Adopt_Ani_date2" value="<%= (adoptaniVO==null)? date_SQL : adoptaniVO.getAdopt_Ani_date()%>">
				<a class="so-BtnLink"
				href="javascript:calClick();return false;"
				onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
				onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
				onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','Adopt_Ani_date','BTN_date');return false;">
			    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
			</td>
		</tr>  
		<tr>
			<td><input id="datetimepicker1" name="Adopt_Ani_date" type="text" value="<%=(adoptaniVO==null)? date_SQL : adoptaniVO.getAdopt_Ani_date() %>"  />
			</td>
			<td>
			
			</td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="送出新增">
	</FORM>
</body>

</html>

<script>
	var opt={dateFormat: 'yy-mm-dd',
	        timeFormat: 'HH:mm:ss'
	        };
	$('#datetimepicker1').datetimepicker(opt);
</script>
