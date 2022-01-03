package com.hyoseop.mvc.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import com.hyoseop.franc.reservation.Reservation;
import com.hyoseop.franc.restaurant.Restaurant;

public class View {
	public static int showMainMenu() {
		Scanner k = new Scanner(System.in);
		System.out.println("==========역전우동==========");
		System.out.println("1. 예약하기");
		System.out.println("2. 매장등록");
		System.out.println("3. 전체예약확인");
		System.out.println("4. 전체매장조회");
		System.out.println("5. 매장찾기");
		System.out.println("6. 예약찾기");
		System.out.println("7. 예약정보수정");
		System.out.println("8. 예약취소");
		System.out.println("9. 종료");
		System.out.println("실행할 번호 입력 > ");
		return k.nextInt();
	}
	//1. 예약하기
	public static Reservation showRsvMenu() throws ParseException {
		Scanner k = new Scanner(System.in);
		System.out.println("예약자 : ");
		String name = k.next();
		
		System.out.println("날짜(YYYY-MM-DD/HH:MM) : ");
		String when = k.next();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd/hh:mm");
		Date when2 = sdf.parse(when);
		
		System.out.println("연락처 : ");
		String phonenum = k.next();
		
		System.out.println("지점명 : ");
		String location = k.next();
		
		Reservation r = new Reservation(0, name, when2, phonenum, location);
		return r;
	}
	//2. 매장등록
	public static Restaurant showResMenu() {
		Scanner k = new Scanner(System.in);
		System.out.println("지점 이름 : ");
		String location = k.next();
		
		System.out.println("사장 이름 : ");
		String name = k.next();
		
		System.out.println("좌석 수 : ");
		int seat = k.nextInt();
		
		Restaurant res = new Restaurant(location, name, seat);
		return res;
	}
}
