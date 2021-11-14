package shop.reviewBoard;

import java.sql.Timestamp;

public class reviewBoardBean {
	private int id;
	private String b_name;
	private String b_title;
	private String b_content;
	private Timestamp b_date;
	private int b_hit;
	private String b_img;
	private int b_ref = 0;
	private int b_step = 0;
	private int b_level = 0;
	private String password;


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static int pageSize = 5;
	public static int pageCount = 1;
	public static int pageNum = 1;

	public static String pageNumer(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;

		if ((startPage - limit) > 0) {
			str = "<a href='reviewList.jsp?pageNum=" + (startPage - 1) + "'>[이전]</a>&nbsp;&nbsp;";
		}

		for (int i = startPage; i < (startPage + limit); i++) {
			if (i == pageNum) {
				str += "[" + i + "]&nbsp;&nbsp;";
			} else {
				str += "<a href='reviewList.jsp?pageNum=" + i + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}

		if ((startPage + limit) <= pageCount) {
			str += "<a href='reviewList.jsp?pageNum=" + (startPage + limit) + "'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}

	public int getB_ref() {
		return b_ref;
	}

	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}

	public int getB_step() {
		return b_step;
	}

	public void setB_step(int b_step) {
		this.b_step = b_step;
	}

	public int getB_level() {
		return b_level;
	}

	public void setB_level(int b_level) {
		this.b_level = b_level;
	}


	public int getB_hit() {
		return b_hit;
	}

	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}

	public Timestamp getB_date() {
		return b_date;
	}

	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	
}