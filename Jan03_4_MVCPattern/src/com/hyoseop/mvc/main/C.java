package com.hyoseop.mvc.main;
//Controller - ���� ������
//		��Ȳ�Ǵ� -> M / V�� ��ȯ
//		��������!

public class C {
	public static void main(String[] args) {
		int x = V.getX();
		int y = V.getY();
		int z = M.add(x,y);
		V.printResult(z)   ;
	}
}
