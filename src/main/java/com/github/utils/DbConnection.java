package com.github.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException exception) {
			exception.printStackTrace();
		}
		
		return con;
	}

}
