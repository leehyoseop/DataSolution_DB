package com.hyoseop.mvc.main;

import java.util.ArrayList;
import java.util.Scanner;

import com.hyoseop.franc.main.DAO;
import com.hyoseop.franc.reservation.Reservation;
import com.hyoseop.franc.restaurant.Restaurant;
//����ã�� �ּ��¼����� �Է��ϸ� �� �̻��� ������ȸ
//������ �̸��� �Է��ϸ� �� ���� ������ ��ȸ
//�����ȣ�� �Է��ϸ� ����ó�� ������ �� �ְ�
//�����ȣ�� ���
public class Controller {
	public static void main(String[] args) {
		int menu = 0;
		Reservation rsv = null;
		Restaurant rst = null;
		String result = null;
		ArrayList<Reservation> rsvResult = null;
		ArrayList<Restaurant> resResult = null;
		a : while (true) {
			try {
				menu = View.showMainMenu();
				if (menu == 9) {
					System.out.println("�����մϴ�");
					break;
				} else if (menu == 1) {
					rsv = View.showRsvMenu();
					result=DAO.book(rsv);
					System.out.println(result);
				} else if (menu == 2) {
					rst = View.showResMenu();
					result = DAO.register(rst);
					System.out.println(result);
				} else if (menu == 3) {
					rsvResult = DAO.getAllReserve();
					View.showRsvResult(rsvResult);
				} else if (menu == 4) {
					View.showResResult(DAO.getAllRestaurant());
				} else if (menu == 5) {
					resResult = DAO.searchRestaurant(View.showSearchRes());
					View.showResResult(resResult);
				} else if (menu == 6) {
					rsvResult = DAO.searchReserve(View.showSearchRsvMenu());
					View.showRsvResult(rsvResult);
				} else if (menu == 7) {
					 String res = DAO.updateReservation(View.updateInfo()); 
					 System.out.println(res);
				} else if (menu == 8) {
					String res2 = DAO.deleteReservation(View.deleteInfo());
					System.out.println(res2);
				} else if (menu == 9) {
					break a;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
