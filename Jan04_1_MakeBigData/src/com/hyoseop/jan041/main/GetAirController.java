package com.hyoseop.jan041.main;

import java.util.ArrayList;

public class GetAirController {
	//"http://openAPI.seoul.go.kr:8088/"
	//"4f626857416f6c6c3632586a416843/xml/RealtimeCityAir/"
	//"1/25/";
	//���� �����͸� �޾Ƽ� -> �츮�� ���ϴ� ���� -> DB�� �־ -> ���Ͽ� �Ű� ��� ����...!
	public static void main(String[] args) {
		ArrayList<Air> a = new ArrayList<Air>();
		a = AirDAO.getData();
		for (Air air : a) {
			AirDAO.writeAir(air);
		}
		
	}
}
