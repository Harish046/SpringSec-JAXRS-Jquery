<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
<style type="text/css">
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 70%;
}

th, td {
    padding: 15px;
}
</style>
<div class="topnav">
  <a class="active" href="/SpringSec-JAXRS-Jquery/home">Home</a>
  <a href="/SpringSec-JAXRS-Jquery/listusers">List Users</a>
  <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TECH')">
  <a href="/SpringSec-JAXRS-Jquery/adduser">Insert</a>
  </sec:authorize>
  <sec:authorize access="hasRole('ROLE_ADMIN')">
  <a href="/SpringSec-JAXRS-Jquery/delete">Delete</a>
  </sec:authorize>
   <a href="/SpringSec-JAXRS-Jquery/file/upload">File</a>
  <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TECH','ROLE_USER','ROLE_DBA')">
	  	<c:url value="/j_spring_security_logout"  var="logoutUrl"/>
	  	<form action="${logoutUrl}" method="post" id="logoutForm">
		</form>
	   <a href="javascript:formSubmit()">Logout</a>
   </sec:authorize>
  
</div>