package com.hyoseop.mvc.main;

import java.util.Scanner;

import com.hyoseop.franc.main.DAO;
import com.hyoseop.franc.reservation.Reservation;
import com.hyoseop.franc.restaurant.Restaurant;
//매장찾기 최소좌석수를 입력하면 그 이상인 매장조회
//예약자 이름을 입력하면 그 예약 정보가 조회
//예약번호를 입력하면 연락처를 변경할 수 있게
//예약번호로 취소
public class Controller {
	public static void main(String[] args) {
		int menu = 0;
		Reservation rsv = null;
		Restaurant rst = null;
		String result = null;
		
		while (true) {
			try {
				menu = View.showMainMenu();
				if (menu == 9) {
					System.out.println("종료합니다");
					break;
				} else if (menu == 1) {
					rsv = View.showRsvMenu();
					result=DAO.book(rsv);
					System.out.println(result);
				} else if (menu == 2) {
					rst = View.showResMenu();
					result = DAO.register(rst);
					System.out.println(result);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
