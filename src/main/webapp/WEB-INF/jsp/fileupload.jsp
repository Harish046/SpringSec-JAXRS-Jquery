<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.green{
	color:green;
	font-size:20px;
}
.red{
color:red;
	font-size:20px;
}
</style>
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<script type="text/javascript">
 
$(document).ready(function () {

    $("#uploadBtn").click(function (event) {
    	$("#result").hide();
        event.preventDefault();

        var form = $('#fileUploadForm')[0];

        var data = new FormData(form);
     
        if($('#file').val()==""){
        	alert("Select a file");
        }
        else{
        	   $("#uploadBtn").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/SpringSec-JAXRS-Jquery/api/files",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
            	$("#result").show();
                $("#result").text(data);
                $("#result").addClass('green');
                console.log("SUCCESS : ", data);
                $("#uploadBtn").prop("disabled", false);
                $('#file').val('');
            },
            error: function (e) {
            	$("#result").show();
                $("#result").text(e.responseText);
                $("#result").addClass('red');
                console.log("ERROR : ", e);
                $("#uploadBtn").prop("disabled", false);
            }
        });
        }
    });
});
        </script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<h3>File Upload</h3>
	<form id="fileUploadForm" action="/SpringSec-JAXRS-Jquery/api/files" method="post"  enctype="multipart/form-data">
	<table>
		<tr>
			<th>Select a file:</th>
			<td><input type="file" id="file" name="file" accept=".txt"/></td>
		</tr>
		<tr>
			<td><input id="uploadBtn" type="button" value="Upload" /></td>
		</tr>
	</table>
	</form>
	<span id="result" class=""></span>
	<h3>File Download</h3>
	<div>
		<a id="downloadfile" href="<c:url value='/api/employees/download/${username}' />">Download</a>
	</div>
</body>
</html>