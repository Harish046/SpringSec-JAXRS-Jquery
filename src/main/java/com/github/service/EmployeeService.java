package com.github.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.github.dao.EmployeeDao;
import com.github.domain.Employee;

@Path("/employees")
public class EmployeeService  {
	
	private EmployeeDao employeeDao = new EmployeeDao();

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	public Employee addEmployee(@FormDataParam("username") String username, @FormDataParam("password") String password,
			@FormDataParam("name") String name, @FormDataParam("department") String dept, 
			@FormDataParam("gender") String gender, @FormDataParam("contact") String contact, 
			@FormDataParam("auth") String auth,@FormDataParam("file") InputStream inputStream,
			@FormDataParam("file") FormDataContentDisposition contentDisposition) throws IOException  {
		
		Employee employee = new Employee();
		employee.setName(name);
		employee.setUsername(username);
		employee.setPassword(password);
		employee.setDept(dept);
		employee.setGender(gender);
		employee.setContact(contact);
		employee.setAuth(auth);
		
		employeeDao.insertEmp(employee,inputStream);
		return employee;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Employee> getAllEmployees() {
		return employeeDao.fetchAllEmployee();
	}
	
	@GET
	@Path("/{username}")
	@Produces(MediaType.APPLICATION_JSON)
	public Employee getEmployeeDetails(@PathParam("username") String username) {
		return employeeDao.fetchEmployeeData(username);
	}
	
	
	
	@PUT
	@Produces(MediaType.TEXT_PLAIN)
	public String updateEmployee(@FormDataParam("id") int id, @FormDataParam("oldpassword") String oldpassword,
			@FormDataParam("newpassword") String newpassword, @FormDataParam("name") String name, 
			@FormDataParam("department") String dept, @FormDataParam("gender") String gender,
			@FormDataParam("contact") String contact) throws URISyntaxException {
		
		Employee employee = new Employee();
		employee.setId(id);
		employee.setName(name);

		employee.setPassword(newpassword);
		employee.setDept(dept);
		employee.setGender(gender);
		employee.setContact(contact);
		
		int i=employeeDao.updateEmployeeData(employee);
		if(i!=0)
			return "Update Success";
		else
			return "Update Failed";
	}
	
	@DELETE
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteEmployee(@QueryParam("id") int id) {
		int i = employeeDao.deleteEmployeeData(id);
		if(i!=0)
			return "Delete Success!!!";
		else
			return "Delete failed!!!";
	}
	
	@GET
	@Path("/download/{username}")
	public Response downloadFile(@PathParam("username") String username) {
		
		InputStream fileStream=employeeDao.fetchFileData(username);
		
		if(fileStream!=null)
		return Response
	                .ok(fileStream, MediaType.MULTIPART_FORM_DATA)
	                .header("content-disposition","attachment; filename = "+username+".txt")
	                .build();
		else
		{
			fileStream = new ByteArrayInputStream("NO FILE UPLOADED".getBytes(StandardCharsets.UTF_8));
			return Response
	                .ok(fileStream, MediaType.MULTIPART_FORM_DATA)
	                .header("content-disposition","attachment; filename = NOFILE.txt")
	                .build();
		}
	}

}
