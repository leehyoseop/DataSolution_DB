package com.hyoseop.mvc.main;

import java.util.Scanner;

//���α׷� ����
//		��������
//		����
//������Ʈ
//		��
//		PM(Project Manager)
//		PL(Project Leader)
//		������A - back-end
//		������B - front-end
//		�����̳� A
//		�����̳� B

//MVC����
//		������ ������ �۾�, � ���� �ϳ��� �ϳ��� ���Ҹ�!
//		M - Model : ���� ���� ����Ͻ� ����(��� ...)
//		V - View : ������ ����ڰ� ���� ����(�Է� / ���)
//		C - Controller : ��Ȳ�Ǵ��� �ؼ� M or V ��ȯ �갡 ��������
public class MVCMain {
	public static void main(String[] args) {
		Scanner k = new Scanner(System.in);
		
		System.out.println("x : ");
		int x = k.nextInt();
		
		System.out.println("y : ");
		int y = k.nextInt();
		
		int z = x+y;
		System.out.println(z);
		
	}
}
