package com.hyoseop.db.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HyoseopDBManager {
	public static Connection connect() throws SQLException{
		String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
		return DriverManager.getConnection(addr, "hyoseop2", "0303");
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();				//C,U,D때는 필요없고, R때만 필요
									//insert하게되면 NullPointerException 발생
		} catch (Exception e) {		//모든 Exception이 잡히도록 할건데
			// TODO: handle exception 
//			e.printStackTrace();
		}
		try {
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
