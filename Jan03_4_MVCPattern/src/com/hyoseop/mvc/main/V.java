package com.hyoseop.mvc.main;

import java.util.Scanner;

//View - �����̳�
//		������� ���� ���̰�!
public class V {
	public static int getX() {
		Scanner k = new Scanner(System.in);
		System.out.println("x : ");
		int x = k.nextInt();
		return x;
	}
	public static int getY() {
		Scanner k = new Scanner(System.in);
		System.out.println("y : ");
		int y = k.nextInt();
		return y;
	}
	public static void printResult(int z) {
		System.out.println(z);
	}
}
