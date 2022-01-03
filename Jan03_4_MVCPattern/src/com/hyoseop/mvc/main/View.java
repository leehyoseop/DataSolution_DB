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
		System.out.println("==========�����쵿==========");
		System.out.println("1. �����ϱ�");
		System.out.println("2. ������");
		System.out.println("3. ��ü����Ȯ��");
		System.out.println("4. ��ü������ȸ");
		System.out.println("5. ����ã��");
		System.out.println("6. ����ã��");
		System.out.println("7. ������������");
		System.out.println("8. �������");
		System.out.println("9. ����");
		System.out.println("������ ��ȣ �Է� > ");
		return k.nextInt();
	}
	//1. �����ϱ�
	public static Reservation showRsvMenu() throws ParseException {
		Scanner k = new Scanner(System.in);
		System.out.println("������ : ");
		String name = k.next();
		
		System.out.println("��¥(YYYY-MM-DD/HH:MM) : ");
		String when = k.next();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd/hh:mm");
		Date when2 = sdf.parse(when);
		
		System.out.println("����ó : ");
		String phonenum = k.next();
		
		System.out.println("������ : ");
		String location = k.next();
		
		Reservation r = new Reservation(0, name, when2, phonenum, location);
		return r;
	}
	//2. ������
	public static Restaurant showResMenu() {
		Scanner k = new Scanner(System.in);
		System.out.println("���� �̸� : ");
		String location = k.next();
		
		System.out.println("���� �̸� : ");
		String name = k.next();
		
		System.out.println("�¼� �� : ");
		int seat = k.nextInt();
		
		Restaurant res = new Restaurant(location, name, seat);
		return res;
	}
}
