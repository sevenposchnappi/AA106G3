<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div id="carousel-id" class="carousel slide" data-ride="carousel">
	    <!-- 幻燈片小圓點區 -->
	    <ol class="carousel-indicators">
	        <li data-target="#carousel-id" data-slide-to="0" class=""></li>
	        <li data-target="#carousel-id" data-slide-to="1" class=""></li>
	        <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
	    </ol>
	    <!-- 幻燈片主圖區 -->
	    <div class="carousel-inner">
	        <div class="item">
	            <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
	            <div class="container">
	                <div class="carousel-caption">
	                    <h1>CSS可樂好喝超爽快</h1>
	                    <p>你喝過了嗎？</p>
	                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
	                </div>
	            </div>
	        </div>
	        <div class="item">
	            <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
	            <div class="container">
	                <div class="carousel-caption">
	                    <h1>CSS可樂的外掛真方便</h1>
	                    <p>你安裝了嗎？</p>
	                    <p><a class="btn btn-lg btn-primary" href="#" role="button">更多</a></p>
	                </div>
	            </div>
	        </div>
	        <div class="item active">
	            <img src="https://api.fnkr.net/testimg/2800x700/aaaaaa" alt="">
	            <div class="container">
	                <div class="carousel-caption">
	                    <h1>我是標題喔～自己改文案吧</h1>
	                    <p>我是內文喔，你可以把字打在這裡呦</p>
	                    <p><a class="btn btn-lg btn-primary" href="#" role="button">詳細內容</a></p>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- 上下頁控制區 -->
	    <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	    <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
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