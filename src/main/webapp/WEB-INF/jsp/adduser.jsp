<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript">
$(document).ready(function () {
	$("#addUserBtn").click(function(){

		var form = $('#addform')[0];
		var formData = new FormData(form);
		$.ajax({
			type: "POST",
			url: "/SpringSec-JAXRS-Jquery/api/employees",
			data: formData,
			contentType: false,
			processData: false,
	
			dataType: "json",
	        success: function(resultData) { alert("Save Complete"); $("#addform")[0].reset(); },
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(' Error in processing! '+textStatus);
				alert("Error!!!")
			}
		});
	});
});
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>Enter User Details:</h3>
<form action="/SpringSec-JAXRS-Jquery/api/employees" method="POST" id="addform" enctype="multipart/form-data">
	<table>
		<tr>
			<th>UserName:</th>
			<td><input id="uname" type="text" name="username"/></td>
		</tr>
		<tr>
			<th>Password:</th>
			<td><input id="pwd" type="password" name="password"/></td>
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
			<th>Authority:</th>
			<td><select name="auth" id="auth">
	  				<option value="ROLE_ADMIN">ADMIN</option>
	  				<option value="ROLE_TECH">TECHNICAL</option>
	  				<option value="ROLE_DBA">DBA</option>
	  				<option value="ROLE_USER">USER</option>
				</select>
		</tr>
		 <tr>
			<th>File:</th>
			<td><input type = "file" name = "file" accept=".txt"/></td>
		</tr>
		<tr>
			<td><button id="addUserBtn" type="button" name="adduser">Add</button>
	</table>
</form>
</body>
</html>