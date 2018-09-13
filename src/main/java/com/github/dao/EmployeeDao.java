package com.github.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.github.domain.Employee;
import com.github.utils.DbConnection;


public class EmployeeDao {
	
	private Connection con= null;
	
	public Employee insertEmp(Employee employee,InputStream inputStream) {
		
		try {
			con=DbConnection.getConnection();
			String sql1="insert into employee(USERNAME,PWD,NAME,DEPARTMENT,GENDER,CONTACT,AUTH,ENABLED,FILE) VALUES(?,?,?,?,?,?,?,?,?)";
			String sql2 ="select id from employee where username = ?";
			
			PreparedStatement pInsertstmt = con.prepareStatement(sql1);
			pInsertstmt.setString(1, employee.getUsername());
			pInsertstmt.setString(2, employee.getPassword());
			pInsertstmt.setString(3, employee.getName());
			pInsertstmt.setString(4, employee.getDept());
			pInsertstmt.setString(5, employee.getGender());
			pInsertstmt.setString(6, employee.getContact());
			pInsertstmt.setString(7, employee.getAuth());
			pInsertstmt.setBoolean(8, true);
			pInsertstmt.setBlob(9, inputStream);
			int i = pInsertstmt.executeUpdate();
			
			PreparedStatement pSelectStmt = con.prepareStatement(sql2);
			pSelectStmt.setString(1, employee.getUsername());
			ResultSet resultSet = pSelectStmt.executeQuery();
			while(resultSet.next()){
				employee.setId(resultSet.getInt(1));
			}
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return employee;
	}
	
	public List<Employee> fetchAllEmployee() {
		
		List<Employee> list = new ArrayList<Employee>();
		try {
			con=DbConnection.getConnection();
			String sql1="select * from employee";
			PreparedStatement stmt=con.prepareStatement(sql1);  
			ResultSet rs=stmt.executeQuery();  
			while(rs.next()){
				Employee employee = new Employee();
				employee.setId(rs.getInt(1));
				employee.setName(rs.getString(4));
				employee.setDept(rs.getString(5));
				employee.setGender(rs.getString(6));
				employee.setContact(rs.getString(7));
				employee.setAuth(rs.getString(8));
				list.add(employee);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int updateEmployeeData(Employee employee) {
		try {
			con=DbConnection.getConnection();
			String sql1="update employee set PWD=?,NAME=?,DEPARTMENT=?,GENDER=?,CONTACT=? where id=?";
			
			PreparedStatement pInsertstmt = con.prepareStatement(sql1);
			pInsertstmt.setString(1, employee.getPassword());
			pInsertstmt.setString(2, employee.getName());
			pInsertstmt.setString(3, employee.getDept());
			pInsertstmt.setString(4, employee.getGender());
			pInsertstmt.setString(5, employee.getContact());
			pInsertstmt.setInt(6, employee.getId());
			int i = pInsertstmt.executeUpdate();
			return i;
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public int deleteEmployeeData(int id) {
		
		try {
			con=DbConnection.getConnection();
			String sql1="delete from employee where id=?";
			
			PreparedStatement pInsertstmt = con.prepareStatement(sql1);
			pInsertstmt.setInt(1, id);
			int i = pInsertstmt.executeUpdate();
			
			return i;
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public Employee fetchEmployeeData(String username) {
		
		try {
			con=DbConnection.getConnection();
			String sql1="select * from employee where username=?";
			
			PreparedStatement pInsertstmt = con.prepareStatement(sql1);
			pInsertstmt.setString(1, username);
			ResultSet resultSet = pInsertstmt.executeQuery();
			Employee employee = new Employee();
			while(resultSet.next()){
				
				employee.setId(resultSet.getInt(1));
				employee.setPassword(resultSet.getString(3));
				employee.setName(resultSet.getString(4));
				employee.setDept(resultSet.getString(5));
				employee.setGender(resultSet.getString(6));
				employee.setContact(resultSet.getString(7));
				employee.setAuth(resultSet.getString(8));
			}
			return employee;
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
public InputStream fetchFileData(String username) {
		
		InputStream inputStream=null;
		try {
			con=DbConnection.getConnection();
			String sql1="select file from employee where username=?";
			
			PreparedStatement pInsertstmt = con.prepareStatement(sql1);
			pInsertstmt.setString(1, username);
			ResultSet resultSet = pInsertstmt.executeQuery();

			while(resultSet.next()){
				
				Blob blob = resultSet.getBlob(1);
				inputStream = (blob!=null)?blob.getBinaryStream():null;
			}
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return inputStream;
	}

}
