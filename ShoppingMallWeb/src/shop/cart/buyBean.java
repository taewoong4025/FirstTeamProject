package shop.cart;

import java.sql.Timestamp;

public class buyBean {
	
	private String user_id;
	private String pro_name;
	private int pro_price;
	private int cart_stock;
	private Timestamp cart_regdate;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getCart_stock() {
		return cart_stock;
	}
	public void setCart_stock(int cart_stock) {
		this.cart_stock = cart_stock;
	}
	public Timestamp getCart_regdate() {
		return cart_regdate;
	}
	public void setCart_regdate(Timestamp cart_regdate) {
		this.cart_regdate = cart_regdate;
	}

}
