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
			rs.close();				//C,U,D���� �ʿ����, R���� �ʿ�
									//insert�ϰԵǸ� NullPointerException �߻�
		} catch (Exception e) {		//��� Exception�� �������� �Ұǵ�
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
