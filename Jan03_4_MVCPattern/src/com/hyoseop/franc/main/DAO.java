package com.hyoseop.franc.main;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.hyoseop.db.manager.HyoseopDBManager;
import com.hyoseop.franc.reservation.Reservation;
import com.hyoseop.franc.restaurant.Restaurant;

// java.util.Date - 주력(Spring에서는 이걸 원함)
// java.sql.Date - JDBC에서는 이걸 원함
// java.util.Date -> java.sql.Date
//			: new date(rsv.getwhen().getTime());

// java.util.Date -> java.util.Date : 알아서 바꿔줌
public class DAO {
	public static String book(Reservation rsv) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = HyoseopDBManager.connect();
			String sql = "insert into reservation "
					+ "values(reservation_seq.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rsv.getName());
			pstmt.setDate(2, new Date(rsv.getWhen().getTime()));
			pstmt.setString(3, rsv.getPhone());
			pstmt.setString(4, rsv.getLocation());
			
			if(pstmt.executeUpdate() == 1) {
				return "예약성공";
			}
			return "";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "예약실패";
		} finally {
			HyoseopDBManager.close(con, pstmt, null);
		}
	}
	public static String register(Restaurant res) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = HyoseopDBManager.connect();
			String sql = "insert into restaurant "
					+ "values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, res.getLocation());
			pstmt.setString(2, res.getOwner());
			pstmt.setInt(3, res.getSeat());
			if(pstmt.executeUpdate() == 1) {
				return "등록성공";
			}
			return "";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "등록실패";
		} finally {
			HyoseopDBManager.close(con, pstmt, null);
		}
	}
}











