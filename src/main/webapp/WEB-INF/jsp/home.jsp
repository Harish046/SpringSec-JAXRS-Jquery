<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript">
 $(document).ready(function () {
	 $.ajax({
		 
			type: 'GET',
			url:  "/SpringSec-JAXRS-Jquery/api/employees/${username}",
			dataType: "json",
			success: function(data){
			            tr = $('<tr/>');
			            tr.append("<td>" + data.name + "</td>");
			            tr.append("<td>" + data.dept + "</td>");
			            tr.append("<td>" + (data.gender=='M'?'MALE':'FEMALE') + "</td>");
			            tr.append("<td>" + data.contact + "</td>");
			            tr.append("<td>" + data.auth + "</td>");
			            tr.append("<td> <a href='/SpringSec-JAXRS-Jquery/edituser'>Edit</a></td>");
			            $('table').append(tr);

			}
		});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h3>Your Details:</h3>
	<table>
		<tr>
			<th>Name</th>
			<th>Deptartment</th>
			<th>Gender</th>
			<th>Contact</th>
			<th>Authority</th>
	</table>
</body>
</html>