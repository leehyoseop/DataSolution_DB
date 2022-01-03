package com.hyoseop.mvc.main;

import java.sql.Connection;
import java.sql.DriverManager;

public class Model {
	public static void reservation() {
		Connection con = null;
		
		try {
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
//			con = DriverManager.getConnection(addr, "hyosoep2", "0303");
//			String sql = "insert into reservation "
//					+ "values(?, ?, to_date('2022-01-13 18', 'YYYY-MM-DD HH24'), '010-1111-2222', '°­³²Á¡');	
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
