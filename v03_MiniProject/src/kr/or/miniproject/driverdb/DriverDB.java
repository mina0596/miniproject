package kr.or.miniproject.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {

	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		Connection reconn = null;
        
		Class.forName("com.mysql.jdbc.Driver");
        
		String jdbcDriver = "jdbc:mysql://54.180.108.17:57236/test?" +
				"useUnicode=true&characterEncoding=utf8";
		String dbUser = "testid";
		String dbPass = "testpw";
		
		reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		return reconn;
		
	}
}
