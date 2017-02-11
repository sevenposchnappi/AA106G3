<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>
<%@ page import="com.chung.tools.Tools"%>

<%
//AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniVOServlet.java(Concroller), 存入req的adoptaniVO物件
//request.setAttribute("adoptaniVO",adoptaniVO);

    Tools tools = new Tools();

%>
<jsp:useBean id="adoptaniVO" scope="request" class="com.adoptani.model.AdoptaniVO" />
<html>
<head>
<link rel="stylesheet" href="js/listOneAdoptani.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>送養動物資料 - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <table border='1' cellpadding='5' cellspacing='0' width=''>
                <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
                    <td>
                    <h3>送養動物資料 - listOneAdoptani.jsp</h3>
                    <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
                    </td>
                </tr>
            </table>

            <table border='1' bordercolor='#CCCCFF' width=''>
                <tr width='100'>
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
                    <th>送養動物大頭照</th>     
                    <td  style=" "><div><img id='headPhoto' style=""  src="<%=request.getContextPath()%>/DBGifReader_AdoptaniPhoto/DBGifReader_AdoptaniPhoto.do?adopt_Ani_Id=<%= adoptaniVO.getAdopt_Ani_Id()%>&ado_Pic_type=0"></div></td>
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
            <!--        <td>      -->
            <%--    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do" > --%>
            <!--        <b>選擇送養動物編號:</b> -->
                   
            <%--        <input type="hidden" name="adopt_Ani_Id" value=<%= adoptaniVO.getAdopt_Ani_Id()%>> --%>
            <!--        <input type="submit" value="送出"> -->
            <!--        <input type="hidden" name="action" value="getOne_For_Display_From_listOneAdoptani.jsp"> -->
            <!--     </FORM>     -->
            <!--        </td> -->
                    <td>
						<button type="button" onclick="loadPhoto()">查看照片</button>
                    </td>
                    <td>
                    <td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani/adoptani.do">
						<input type="submit" value="修改">
						<input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}">
						<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
					</td>
                    </td>
                </tr>
            </table>
            <%-- <%if (request.getAttribute("oneAdoptAniPhotoList")!=null){%> --%>
            <%--        <jsp:include page="listOneAdoptaniAllPhoto.jsp" /> --%>
            <%-- <%} %> --%>
        </div>
        <div class="col-xs-12 col-sm-8">
            <div id="listPhoto"></div>
        </div>
    </div>
</div>







<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function loadPhoto(){
    
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        
        //List<AdoptaniPhotoVO> list = request.getAttribute("oneAdoptAniPhotoList", oneAdoptAniPhotoList);
     document.getElementById("listPhoto").innerHTML = xhttp.responseText;
     
    }else{
       // alert("xhttp.status:"+ xhttp.status );
     }
  //  alert("xhttp.readyState:"+ xhttp.readyState );
  };
  var adopt_Ani_Id = "adopt_Ani_Id=<%= adoptaniVO.getAdopt_Ani_Id()%>";
  var action = "action=getOne_For_Display_From_listOneAdoptani.jsp";
  var url = "<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do";
  xhttp.open("POST", url , true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send(action+"&"+adopt_Ani_Id);
//  xhttp.send(adopt_Ani_Id);
}
</script>
</body>
</html>



