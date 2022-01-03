package com.hyoseop.mvc.main;
//Controller - 높은 개발자
//		상황판단 -> M / V를 소환
//		교통정리!

public class C {
	public static void main(String[] args) {
		int x = V.getX();
		int y = V.getY();
		int z = M.add(x,y);
		V.printResult(z)   ;
	}
}
