<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of users</title>
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript">
 $(document).ready(function () {
	 $.ajax({
		 
			type: 'GET',
			url:  "/SpringSec-JAXRS-Jquery/api/employees",
			dataType: "json",
			success: function(data){
				 for (var i = 0; i < data.length; i++) {
			            tr = $('<tr/>');
			            tr.append("<td>" + data[i].name + "</td>");
			            tr.append("<td>" + data[i].dept + "</td>");
			            tr.append("<td>" + (data[i].gender=='M'?'MALE':'FEMALE') + "</td>");
			            tr.append("<td>" + data[i].contact + "</td>");
			            tr.append("<td>" + data[i].auth + "</td>");
			            $('table').append(tr);
			        }
			}
		});
});
</script>
</head>
<body>
		<jsp:include page="header.jsp" />
		<h3>List of users</h3>
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