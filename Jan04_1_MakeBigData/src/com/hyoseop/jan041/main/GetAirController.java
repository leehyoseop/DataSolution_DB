package com.hyoseop.jan041.main;

import java.util.ArrayList;

public class GetAirController {
	//"http://openAPI.seoul.go.kr:8088/"
	//"4f626857416f6c6c3632586a416843/xml/RealtimeCityAir/"
	//"1/25/";
	//실제 데이터를 받아서 -> 우리가 원하는 값만 -> DB에 넣어서 -> 파일에 옮겨 담고 싶음...!
	public static void main(String[] args) {
		ArrayList<Air> a = new ArrayList<Air>();
		a = AirDAO.getData();
		for (Air air : a) {
			AirDAO.writeAir(air);
		}
		
	}
}
