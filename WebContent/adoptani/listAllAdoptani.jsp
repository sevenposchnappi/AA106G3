<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptani.model.*"%>
<%@ page import="com.adoptani_photo.model.*"%>
<%@ page import="com.chung.tools.Tools"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	AdoptaniService adoptaniSvc = new AdoptaniService();
    List<AdoptaniVO> list = adoptaniSvc.getAll();
    pageContext.setAttribute("list",list);	//�n���scope�̭��~��o��C
    
    Tools tools = new Tools();
%>
<%-- <jsp:useBean id="tools" scope="request" class="com.chung.tools.Tools" /> --%>
<html>
<head>
<title>�Ҧ��e�i�ʪ���� - listAllAdoptani.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��e�i�ʪ���� - listAllAdoptani.jsp</h3>
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
		<th>�e�i�ʪ��s��</th>
		<th>�o���̷|���s��</th>
		<th>�e�i�ʪ��W�r</th>
		<th>�e�i�ʪ��ʪ�����</th>
		<th>�e�i�ʪ��ʧO</th>
		<th>�e�i�ʪ����d���p</th>
		<th>�e�i�ʪ��̭]����</th>
		<th>�e�i�ʪ����</th>
		<th>�e�i�ʪ��髬</th>
		<th>�e�i�ʪ��~��</th>
		<th>�e�i�ʪ��`�|</th>
		<th>�e�i�ʪ������s��</th>
		<th>�e�i�ɶ�</th>
		<th>�e�i�ʪ����󪬺A</th>
		<th>�e�i�ʪ��إ߮ɶ�</th>
		<th>�e�i�a�I�g��</th>
		<th>�e�i�a�I�n��</th>
		<th>��/��</th>
		<th>�m����</th>
		<th>�D����W����</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="adoptaniVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(adoptaniVO.adopt_Ani_Id==param.adopt_Ani_Id) ? 'bgcolor=#CCCCFF':''}>
			<td>${adoptaniVO.adopt_Ani_Id}</td> 
			<td>${adoptaniVO.mem_Id}</td>
			<td>${adoptaniVO.adopt_Ani_name}</td>
			<td>${adoptaniVO.adopt_Ani_type}</td>
			<c:set var="adopt_Ani_gender" value="${adoptaniVO.adopt_Ani_gender}" scope="request"></c:set>
			<td><%=tools.genderExchange((String) request.getAttribute("adopt_Ani_gender"))%></td>
			<td>${adoptaniVO.adopt_Ani_heal}</td>
			<td>${adoptaniVO.adopt_Ani_Vac}</td>
			<td>${adoptaniVO.adopt_Ani_color}</td>
			
			<td>${adoptaniVO.adopt_Ani_body}</td>
			<td>${adoptaniVO.adopt_Ani_age}</td>
			<td>${adoptaniVO.adopt_Ani_Neu}</td>
			<td>${adoptaniVO.adopt_Ani_chip}</td>
			<td>${adoptaniVO.adopt_Ani_date}</td>
			<c:set var="adopt_Ani_status" value="${adoptaniVO.adopt_Ani_status}" scope="request"></c:set>
			<td><%=tools.statusExchange((String) request.getAttribute("adopt_Ani_status"))%></td>
			<td>${adoptaniVO.adopt_Ani_CreDate}</td>
			<td>${adoptaniVO.adopt_Ani_FinLat}</td>
			<td>${adoptaniVO.adopt_Ani_FinLon}</td>
			<td>${adoptaniVO.adopt_Ani_city}</td>
			<td>${adoptaniVO.adopt_Ani_town}</td>
			<td>${adoptaniVO.adopt_Ani_road}</td>      
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani/adoptani.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="adoptani.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adoptani_photo/adoptani_photo.do">
			    <input type="submit" value="��ܷӤ�">
			    <input type="hidden" name="adopt_Ani_Id" value="${adoptaniVO.adopt_Ani_Id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="getOne_For_Display_From_listAllAdoptani.jsp"></FORM>
			</td>
			     
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
<br>




</body>
</html>