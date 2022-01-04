package com.hyoseop.jan041.main;

public class Air {
	private int no; 
	private String msrste_nm;
	private int pm10;
	private int pm25;
	private float o3;
	
	public Air() {
		// TODO Auto-generated constructor stub
	}

	public Air(int no, String msrste_nm, int pm10, int pm25, float o3) {
		super();
		this.no = no;
		this.msrste_nm = msrste_nm;
		this.pm10 = pm10;
		this.pm25 = pm25;
		this.o3 = o3;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMsrste_nm() {
		return msrste_nm;
	}

	public void setMsrste_nm(String msrste_nm) {
		this.msrste_nm = msrste_nm;
	}

	public int getPm10() {
		return pm10;
	}

	public void setPm10(int pm10) {
		this.pm10 = pm10;
	}

	public int getPm25() {
		return pm25;
	}

	public void setPm25(int pm25) {
		this.pm25 = pm25;
	}

	public float getO3() {
		return o3;
	}

	public void setO3(float o3) {
		this.o3 = o3;
	}
	
	
}
