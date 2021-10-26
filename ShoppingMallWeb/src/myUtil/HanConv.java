package myUtil;

import java.net.URLEncoder;

public class HanConv {
	public static String toKor(String str) { // jsp에서는 한글을 받을 때, 서블릿에서 한글 변환
		if (str == null || str.equals("null")) {
			return str;
		}
		try {
			return new String(str.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
	
	public static String toKorTwo(String str) { //jsp 에서 한글 넘길 때
		if (str == null || str.equals("null")) {
			return str;
		}
		
		try {
			String result = "";
			result = URLEncoder.encode(str,"euc-kr");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
}
