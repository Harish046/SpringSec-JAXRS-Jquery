package com.github.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.github.utils.DbConnection;

public class FileDao {
	
	Connection connection = null;
	
	public int addFile(InputStream inputStream,String username) {
		try {
			connection = DbConnection.getConnection();
			String sql = "UPDATE EMPLOYEE SET FILE = ? WHERE USERNAME =?";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setBlob(1, inputStream);
			pst.setString(2, username);
			int i = pst.executeUpdate();
			return i;
		} catch(SQLException exception) {
			exception.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

}
