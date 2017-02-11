<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>
<%@ page import="com.chung.tools.Tools"%>

<%
//AdoptaniVO adoptaniVO = (AdoptaniVO) request.getAttribute("adoptaniVO"); //AdoptaniVOServlet.java(Concroller), �s�Jreq��adoptaniVO����
//request.setAttribute("adoptaniVO",adoptaniVO);

    Tools tools = new Tools();

%>
<jsp:useBean id="adoptaniVO" scope="request" class="com.adoptani.model.AdoptaniVO" />
<html>
<head>
<link rel="stylesheet" href="js/listOneAdoptani.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�e�i�ʪ���� - listOneAdoptani.jsp</title>
</head>
<body bgcolor='white'>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <table border='1' cellpadding='5' cellspacing='0' width=''>
                <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
                    <td>
                    <h3>�e�i�ʪ���� - listOneAdoptani.jsp</h3>
                    <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
                    </td>
                </tr>
            </table>

            <table border='1' bordercolor='#CCCCFF' width=''>
                <tr width='100'>
                    <th>�e�i�ʪ��s��</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_Id()%></td> 
                </tr>
                <tr>
                    <th>�o���̷|���s��</th>     
                    <td><%= adoptaniVO.getMem_Id()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��W�r</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_name()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��j�Y��</th>     
                    <td  style=" "><div><img id='headPhoto' style=""  src="<%=request.getContextPath()%>/DBGifReader_AdoptaniPhoto/DBGifReader_AdoptaniPhoto.do?adopt_Ani_Id=<%= adoptaniVO.getAdopt_Ani_Id()%>&ado_Pic_type=0"></div></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��ʪ�����</th> 
                    <td><%= adoptaniVO.getAdopt_Ani_type()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��ʧO</th>     
                    <td><%=  tools.genderExchange(adoptaniVO.getAdopt_Ani_gender())%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ����d���p</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_heal()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��̭]����</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_Vac() %></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ����</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_color()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��髬</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_body()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��~��</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_age()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��`�|</th>     
                    <td><%= tools.neuterExchange(adoptaniVO.getAdopt_Ani_Neu())%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ������s��</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_chip()%></td>
                </tr>
                <tr>
                    <th>�e�i�ɶ�</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_date()%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ����󪬺A</th>       
                    <td><%= tools.statusExchange(adoptaniVO.getAdopt_Ani_status())%></td>
                </tr>
                <tr>
                    <th>�e�i�ʪ��إ߮ɶ�</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_CreDate()%></td>
                </tr>
                <tr>
                    <th>�e�i�a�I�g��</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_FinLat()%></td>
                </tr>
                <tr>
                    <th>�e�i�a�I�n��</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_FinLon()%></td>
                </tr>
                <tr>
                    <th>��/��</th>        
                    <td><%= adoptaniVO.getAdopt_Ani_city()%></td>
                </tr>
                <tr>
                    <th>�m����</th>       
                    <td><%= adoptaniVO.getAdopt_Ani_town()%></td>
                </tr>
                <tr>
                    <th>�D����W����</th>     
                    <td><%= adoptaniVO.getAdopt_Ani_road()%></td>
                </tr>
                <tr>
            <!--        <td>      -->
            <%--    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do" > --%>
            <!--        <b>��ܰe�i�ʪ��s��:</b> -->
                   
            <%--        <input type="hidden" name="adopt_Ani_Id" value=<%= adoptaniVO.getAdopt_Ani_Id()%>> --%>
            <!--        <input type="submit" value="�e�X"> -->
            <!--        <input type="hidden" name="action" value="getOne_For_Display_From_listOneAdoptani.jsp"> -->
            <!--     </FORM>     -->
            <!--        </td> -->
                    <td>
						<button type="button" onclick="loadPhoto()">�d�ݷӤ�</button>
                    </td>
                    <td>
                    <td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani/adoptani.do">
						<input type="submit" value="�ק�">
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



