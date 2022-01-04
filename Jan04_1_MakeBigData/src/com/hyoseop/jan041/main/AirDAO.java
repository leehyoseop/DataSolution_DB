package com.hyoseop.jan041.main;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.hyoseop.db.manager.HyoseopDBManager;
import com.hyoseop.dec224.httpclient.HSHTTPclient;

public class AirDAO {
	public static ArrayList<Air> getData() {
		//BufferedWriter bw = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
		try {
			String address = "http://openAPI.seoul.go.kr:8088/"
					+ "4f626857416f6c6c3632586a416843/xml/RealtimeCityAir/"
					+ "1/25/";
			//FileWriter fw = new FileWriter("C:\\Users\\wtime\\Desktop\\"
			//		+ "java\\AirData.txt", true);
			InputStream is = HSHTTPclient.download(address);
			XmlPullParserFactory xppf = XmlPullParserFactory.newInstance();
			XmlPullParser xpp = xppf.newPullParser();
			xpp.setInput(is, "utf-8");
			int type = xpp.getEventType();
			String tagName = null;
			
			Air a = null;
			
//			con = HyoseopDBManager.connect();			
//			String sql = "insert into Air values(air_seq.nextval, ?, ?, ?, ?)";
//			pstmt = con.prepareStatement(sql);
			ArrayList<Air> airs = new ArrayList<Air>();
			//bw = new BufferedWriter(fw);
			while (type != XmlPullParser.END_DOCUMENT) {
				if (type == XmlPullParser.START_TAG) {
					tagName = xpp.getName();
					if(tagName.equals("row")) {
						a = new Air();
					}
					//System.out.println(tagName);
				} else if (type == XmlPullParser.TEXT) {
					if (tagName.equals("MSRSTE_NM")) {
						System.out.println(xpp.getText());
						a.setMsrste_nm(xpp.getText());
						//pstmt.setString(1, xpp.getText());
						//pstmt.executeUpdate();
						//bw.write(xpp.getText()+",");
					} else if (tagName.equals("PM10")) {
						System.out.println(xpp.getText());
						a.setPm10(Integer.parseInt(xpp.getText()));
						//pstmt.setInt(2, Integer.parseInt(xpp.getText()));
						//pstmt.executeUpdate();
						//bw.write(xpp.getText()+",");
					} else if (tagName.equals("PM25")) {
						System.out.println(xpp.getText());
						a.setPm25(Integer.parseInt(xpp.getText()));
						//pstmt.setInt(3, Integer.parseInt(xpp.getText()));
						//pstmt.executeUpdate();
						//bw.write(xpp.getText()+",");
					} else if (tagName.equals("O3")) {
						a.setO3(Float.parseFloat(xpp.getText()));
						//System.out.println(xpp.getText());
						//pstmt.setFloat(4, Float.parseFloat(xpp.getText()));
						//pstmt.executeUpdate();
						//bw.write(xpp.getText()+",");
						//bw.flush();
					}
					airs.add(a);
					//pstmt.executeUpdate();
				} else if (type == XmlPullParser.END_TAG) {
					tagName = "";
				}
				//pstmt.executeUpdate();
				xpp.next();
				type = xpp.getEventType();
				
			}
			//bw.close();
			return airs;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static String writeAir(Air a) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = HyoseopDBManager.connect();
			String sql = "insert into Air values(air_seq.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a.getMsrste_nm());
			pstmt.setInt(2, a.getPm10());
			pstmt.setInt(3, a.getPm25());
			pstmt.setFloat(4, a.getO3());
			
			if (pstmt.executeUpdate() >= 1) {
				return "����!";
			}
			return "";
		} catch (Exception e) {
			// TODO: handle exception
			return "����!";
		}
	}
	//3. DB�� ���� ������ �ҷ�����
	public static ArrayList<Air> getMyAir() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = HyoseopDBManager.connect();
			String sql = "select * from air";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Air> airs = new ArrayList<Air>();
			Air a = null;
			while (rs.next()) {
				a = new Air();
				a.setNo(rs.getInt("no"));
				a.setMsrste_nm(rs.getString("msrste_nm"));
				a.setPm10(rs.getInt("pm10"));
				a.setPm25(rs.getInt("pm25"));
				a.setO3(rs.getFloat("o3"));
				airs.add(a);
			}
			return airs;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		} finally {
			HyoseopDBManager.close(con, pstmt, rs);
		}
	}
	//4.���Ͽ� �ű��
	//���ϸ�.Ȯ����
	//Ȯ����-MS���� �ִ� ����
	//������� ���� ���ϰ� �� �ͻ�
	//������������ Ȯ���ڰ� ����
	//air_poll.txt
	//�ؽ�Ʈ ����
	//�޸����̶�� ���α׷����� �� ������ ����
	//csv
	//�� ������ ,�� ���еǾ�����
	public static void writeAirToFile(ArrayList<Air> Airs) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("C:\\Users\\wtime\\Desktop\\java\\air_pollution.csv", true);
			OutputStreamWriter osw = new OutputStreamWriter(fos, "utf-8");
			BufferedWriter bw = new BufferedWriter(osw);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy,MM,dd,kk,mm");
			for (Air a : Airs) {
				bw.write(a.getMsrste_nm() + ",");
				bw.write(a.getPm10() + ",");
				bw.write(a.getPm25() + ",");
				bw.write(a.getO3() + "\n");
				bw.flush();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
