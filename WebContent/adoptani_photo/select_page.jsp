<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>AnimalMAP AdoptAni: Home</title></head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>AnimalMAP AdoptAni Photo: Home</h3>	<font color=red>( MVC )</font></td></tr></table>

<p>This is the Home page for AnimalMAP AdoptAni Photo: Home</p>

<h3>��Ƭd��:</h3>
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

<ul>
  <li><a href='listAllAdoptaniPhoto.jsp'>List</a> all Adopt Animals. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="adoptani_photo.do" >
        <b>��ܰe�i�ʪ��s�� :</b>
        <input type="text" name="adopt_Ani_Id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="adoptaniPhotoSvc" scope="page" class="com.adoptani_photo.model.AdoptaniPhotoService" />
  
   
  <li>
     <FORM METHOD="post" ACTION="adoptani_photo.do" >
       <b>��ܰe�i�ʪ��s��:</b>
       <select size="1" name="adopt_Ani_Id">
       
         <c:forEach var="adoptaniPhotoVO" items="${adoptaniPhotoSvc.all}" > 
         	
          <option value="${adoptaniPhotoVO.adopt_Ani_Id}">${adoptaniPhotoVO.adopt_Ani_Id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="adoptani_photo.do" >
       <b>��ܰe�i�ʪ��W�r:</b>
       <select size="1" name="adopt_Ani_Id">
         <c:forEach var="adoptaniVO" items="${adoptaniSvc.all}" > 
          <option value="${adoptaniVO.adopt_Ani_Id}">${adoptaniVO.adopt_Ani_name}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addAdoptaniPhoto.jsp'>Add</a> a new Adoptani.</li>
</ul>

</body>

</html>