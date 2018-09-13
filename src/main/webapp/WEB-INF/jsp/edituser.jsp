<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript">

 $(document).ready(function () {
	 var oldpwd;
	 $.ajax({
		 
			type: 'GET',
			url:  "/SpringSec-JAXRS-Jquery/api/employees/${username}",
			dataType: "json",
			success: function(data){
				oldpwd = data.password;
				$("#id").val(data.id);
				$("#name").val(data.name);
				$("#dept").val(data.dept);
				$("input[name='gender'][value='"+data.gender+"']").prop('checked', true);
				$("#contact").val(data.contact);
				$("#auth").val(data.auth);
			}
		});
	 $("#updUserBtn").click(function(){
		 $("#check").text("");
		 if($("#oldpwd").val()!=oldpwd){
		 	$("#check").text("Old password Invalid");
		 	$("#oldpwd").val("");
		 	$("#newpwd").val("");
		 	$("#oldpwd").focus();
		 }else {
			var form = $('#udtform')[0];
			var formData = new FormData(form);
			$.ajax({
				type: 'PUT',
				url:  "/SpringSec-JAXRS-Jquery/api/employees",
				data: formData,
				contentType: false,
				processData: false,
				dataType: "text",
				success: function(resultData) { alert("Update Complete"); $("#udtform")[0].reset(); },
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(' Error in processing! '+textStatus);
					alert("Error!!!")
				}
			});
		 }
	 });
});
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<form action="/SpringSec-JAXRS-Jquery/api/employees" method="POST" id="udtform">
	<span id="check" style="color:red"></span>
	<input type="hidden" name="id" id="id" value=""/>
	<table>
		<tr>
			<th>Old Password:</th>
			<td><input id="oldpwd" type="password" name="curpassword"/></td>
		</tr>
		<tr>
			<th>New Password:</th>
			<td><input id="newpwd" type="password" name="newpassword"/></td>
		</tr>
		<tr>
			<th>Name:</th>
			<td><input id="name" type="text" name="name"/></td>
		</tr>
		<tr>
			<th>Department:</th>
			<td><input id="dept" type="text" name="department"/></td>
		</tr>
		<tr>
			<th>Gender:</th>
			<td><input  type="radio" name="gender" value="M"/>Male<br/>
			<input type="radio" name="gender" value="F"/>Female</td>
		</tr>
		<tr>
			<th>Contact:</th>
			<td><input id="contact" type="text" name="contact"></td>
		</tr>
		<tr>
			<td><input id="updUserBtn" type="button" name="updBtn" value="Update"/></td>
		</tr>
	</table>
</form>
</body>
</html>