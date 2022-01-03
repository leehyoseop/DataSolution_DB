package com.hyoseop.jan013.main;

public class Human {
	public void ready() {
		// TODO Auto-generated method stub
		System.out.println("씻기");
		System.out.println("옷입기");
		System.out.println("신발신기");
	}
	public void goMart() {
		// TODO Auto-generated method stub
		ready();
		System.out.println("집밖에 나와 걸어서");
		System.out.println("마트에 도착");
	}
	public void goWork() {
		ready();
		System.out.println("버스타고, 지하철타고");
		System.out.println("직장에 도착");
	}
}	
