package com.hyoseop.jan013.main;
//PP(Procedural Programming) : 절차 지향 프로그래밍
//							순서대로 잘 써서 실행이 잘 되길..!
///////////////////////////////////////////////////////
//OOP(Object Oriented Programming) : 객체 지향 프로그래밍
//							유지보수에 용이하게 실생활스럽게 코드를 짜자!
///////////////////////////////////////////////////////
//AOP(Aspect Oriented Programming) : 관점 지향 프로그래밍
//							다른 관점에서 OOP기법 -> 공통된걸 정리
public class AMain {
	public static void main(String[] args) {
		Human h = new Human();
		h.goMart();
		System.out.println("--------------");
		h.goWork();
	}
}
