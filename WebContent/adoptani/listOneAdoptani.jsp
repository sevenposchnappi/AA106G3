<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>
<%@ page import="com.chung.tools.Tools"%>

<%
    Tools tools = new Tools();
%>

<jsp:useBean id="adoptaniVO" scope="request" class="com.adoptani.model.AdoptaniVO" />

<!-- <html> -->
<!-- <head> -->
<!-- <link rel="stylesheet" href="js/listOneAdoptani.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <title>送養動物資料 - listOneAdoptani.jsp</title> -->
<!-- </head> -->
<!-- <body bgcolor='white'> -->





            <table border='1' bordercolor='#CCCCFF' >
				<tr>
                    <th>送養動物編號</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_Id()%></td> 
                </tr>
                <tr>
                    <th>發布者會員編號</th>     
                    <td><%= adoptaniVO.getMem_Id()%></td>
                </tr>
                <tr>
                    <th>送養動物名字</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_name()%></td>
                </tr>
                <tr>
                    <th>送養動物動物種類</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_type()%></td>
                </tr>
                <tr>
                    <th>送養動物性別</th>     
                    <td><%=  tools.genderExchange(adoptaniVO.getAdopt_Ani_gender())%></td>
                </tr>
                <tr>
                    <th>送養動物健康狀況</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_heal()%></td>
                </tr>
                <tr>
                    <th>送養動物疫苗接踵</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_Vac() %></td>
                </tr>
                <tr>
                    <th>送養動物毛色</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_color()%></td>
                </tr>
                <tr>
                    <th>送養動物體型</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_body()%></td>
                </tr>
                <tr>
                    <th>送養動物年齡</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_age()%></td>
                </tr>
                <tr>
                    <th>送養動物節育</th>     
                    <td><%= tools.neuterExchange(adoptaniVO.getAdopt_Ani_Neu())%></td>
                </tr>
                <tr>
                    <th>送養動物晶片編號</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_chip()%></td>
                </tr>
                <tr>
                    <th>送養時間</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_date()%></td>
                </tr>
                <tr>
                    <th>送養動物物件狀態</th>       
                    <td><%= tools.statusExchange(adoptaniVO.getAdopt_Ani_status())%></td>
                </tr>
                <tr>
                    <th>送養動物建立時間</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_CreDate()%></td>
                </tr>
                <tr>
                    <th>送養地點經度</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_FinLat()%></td>
                </tr>
                <tr>
                    <th>送養地點緯度</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_FinLon()%></td>
                </tr>
                <tr>
                    <th>縣/市</th>        
                    <td><%= adoptaniVO.getAdopt_Ani_city()%></td>
                </tr>
                <tr>
                    <th>鄉鎮市區</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_town()%></td>
                </tr>
                <tr>
                    <th>道路街名村里</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_road()%></td>
                </tr>
                <tr>

                    <td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani/adoptani.do">
						<input type="submit" value="修改">
						<input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}">
						<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
					</td>
                    
                </tr>
            </table>
            <%-- <%if (request.getAttribute("oneAdoptAniPhotoList")!=null){%> --%>
            <%--        <jsp:include page="listOneAdoptaniAllPhoto.jsp" /> --%>
            <%-- <%} %> --%>









<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- </body> -->
</html>



