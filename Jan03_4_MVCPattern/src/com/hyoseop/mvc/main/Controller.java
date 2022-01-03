package com.hyoseop.mvc.main;

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
		
		while (true) {
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
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
