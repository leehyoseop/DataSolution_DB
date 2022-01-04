package com.hyoseop.mvc.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	//3. 전체 예약 확인
	public static void showRsvResult(ArrayList<Reservation> rsvs) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd E a hh:mm");
		for (Reservation r : rsvs) {
			System.out.print(r.getNo()+" ");
			System.out.print(r.getName()+" ");
			System.out.print(r.getPhone()+" ");
			System.out.print(r.getLocation()+" ");
			System.out.print(sdf.format(r.getWhen())+"\n");
		}
	}
	//4. 전체 매장 조회
	public static void showResResult(ArrayList<Restaurant> res) {
		for (Restaurant r : res) {
			System.out.print(r.getLocation()+" ");
			System.out.print(r.getOwner()+" ");
			System.out.print(r.getSeat()+"\n");
		}
	}
	//5. 매장 찾기(최소 좌석수를 입력하면 그 이상인 매장 조회)
	public static Restaurant showSearchRes() {
		Scanner k = new Scanner(System.in);
		System.out.println("최소좌석수 입력 : ");
		int seat = k.nextInt();
		return new Restaurant(null, null, seat);
	}
	//6.예약 찾기
	public static Reservation showSearchRsvMenu() {
		Scanner k = new Scanner(System.in);
		System.out.println("예약자명 : ");
		String name = k.next();
		return new Reservation(0, name, null, null, null);
	}
	//7.예약정보수정(예약 번호를 입력하면 연락처를 변경할 수 있게)
	public static Reservation updateInfo() {
		Scanner k = new Scanner(System.in);
		System.out.println("수정하고 싶은 예약번호 : ");
		int no = k.nextInt();
		System.out.println("핸드폰 번호 수정(000-0000-0000) : ");
		String phonenum = k.next();
		return new Reservation(no, null, null, phonenum, null);
	}
	//8.예약취소(예약 번호를 입력하면 취소할수있게)
	public static Reservation deleteInfo() {
		Scanner k = new Scanner(System.in);
		System.out.println("취소하고 싶은 예약번호 : ");
		int no = k.nextInt();
		return new Reservation(no, null, null, null, null);
	}
}
