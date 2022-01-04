package com.hyoseop.franc.main;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import com.hyoseop.db.manager.HyoseopDBManager;
import com.hyoseop.franc.reservation.Reservation;
import com.hyoseop.franc.restaurant.Restaurant;

// java.util.Date - 주력(Spring에서는 이걸 원함)
// java.sql.Date - JDBC에서는 이걸 원함
// java.util.Date -> java.sql.Date
//			: new date(rsv.getwhen().getTime());

// java.util.Date -> java.util.Date : 알아서 바꿔줌
public class DAO {
	//1.
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
	//2.
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
	//3.
	public static ArrayList<Reservation> getAllReserve() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			//table or view does not exist
			//부적합한 열 인덱스 : 1111 => 오타
			String sql = "select * from reservation order by r_no";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Reservation> rsvs = new ArrayList<Reservation>();
			Reservation r = null;
			while(rs.next()) {
				r = new Reservation();
				r.setNo(rs.getInt("r_no"));
				r.setName(rs.getString("r_name"));
				r.setWhen(rs.getDate("r_time"));
				r.setPhone(rs.getString("r_phonenum"));
				r.setLocation(rs.getString("r_location"));
				rsvs.add(r);
			}
			return rsvs;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			HyoseopDBManager.close(con, pstmt, null);
		}
	}
	//4.
	public static ArrayList<Restaurant> getAllRestaurant() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			//table or view does not exist
			//부적합한 열 인덱스 : 1111 => 오타
			String sql = "select * from restaurant order by r_location";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Restaurant> res = new ArrayList<Restaurant>();
			Restaurant r = null;
			while(rs.next()) {
				r = new Restaurant();
				r.setLocation(rs.getString("r_location"));
				r.setOwner(rs.getString("r_name"));
				r.setSeat(rs.getInt("r_seat"));
				res.add(r);
			}
			return res;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			HyoseopDBManager.close(con, pstmt, null);
		}
	}
	//5.
	public static ArrayList<Restaurant> searchRestaurant(Restaurant restaurant) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			String sql = "select * from restaurant "
					+"where r_seat >= ? "
					+"order by r_location";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, restaurant.getSeat());
			rs = pstmt.executeQuery();
			ArrayList<Restaurant> res = new ArrayList<Restaurant>();
			Restaurant r = null;
			while(rs.next()) {
				r = new Restaurant();
				r.setLocation(rs.getString("r_location"));
				r.setOwner(rs.getString("r_name"));
				r.setSeat(rs.getInt("r_seat"));
				res.add(r);
			}
			return res;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			HyoseopDBManager.close(con, pstmt, rs);
		}
	}
	//6.
	public static ArrayList<Reservation> searchReserve(Reservation rsv) {//에약자 이름
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			String sql = "select * from reservation "
					+"where r_name like '%'||?||'%' "
					+"order by r_no";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rsv.getName());
			rs = pstmt.executeQuery();
			
			ArrayList<Reservation> rsvs = new ArrayList<Reservation>();
			Reservation r = null;
			while(rs.next()) {
				r = new Reservation();
				r.setNo(rs.getInt("r_no"));
				r.setName(rs.getString("r_name"));
				r.setWhen(rs.getDate("r_time"));
				r.setPhone(rs.getString("r_phonenum"));
				r.setLocation(rs.getString("r_location"));
				rsvs.add(r);
			}
			return rsvs;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			HyoseopDBManager.close(con, pstmt, rs);
		}
	}
	//7.
	public static String updateReservation(Reservation rsv) {//에약자 이름
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			String sql = "update reservation "
					+"set r_phonenum = ? "
					+"where r_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rsv.getPhone());
			pstmt.setInt(2, rsv.getNo());
			if(pstmt.executeUpdate() == 1) {
				return "수정 성공";
			}
			return " ";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "수정 실패";
		} finally {
			HyoseopDBManager.close(con, pstmt, rs);
		}
	}
	//8.
		public static String deleteReservation(Reservation rsv) {//에약자 이름
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = HyoseopDBManager.connect();
				String sql = "delete from reservation "
						+"where r_no = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rsv.getNo());
				if(pstmt.executeUpdate() == 1) {
					return "삭제 성공";
				}
				return " ";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "삭제 실패";
			} finally { 
				HyoseopDBManager.close(con, pstmt, rs);
			}
		}
}











