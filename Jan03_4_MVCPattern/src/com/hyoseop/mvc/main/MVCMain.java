package com.hyoseop.mvc.main;

import java.util.Scanner;

//프로그램 개발
//		유지보수
//		협업
//프로젝트
//		고객
//		PM(Project Manager)
//		PL(Project Leader)
//		개발자A - back-end
//		개발자B - front-end
//		디자이너 A
//		디자이너 B

//MVC패턴
//		파일을 나눠서 작업, 어떤 파일 하나는 하나의 역할만!
//		M - Model : 실제 업무 비즈니스 로직(계산 ...)
//		V - View : 실제로 사용자가 보는 파일(입력 / 출력)
//		C - Controller : 상황판단을 해서 M or V 소환 얘가 실행파일
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
