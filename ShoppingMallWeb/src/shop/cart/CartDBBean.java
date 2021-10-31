package shop.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDBBean {
	
	private static CartDBBean instance = new CartDBBean();
	
	public static CartDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// 장바구니(cart) 테이블에 값 추가하는 로직
	public int insertCart(CartBean cart) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		int number = 1;
		
		try {
			conn = getConnection();
			
			//현재 레코드 중에서 가장 큰 글 번호를 얻어낸다.(번호+1)
			sql = "select max(cart_num) from cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			sql = "insert into cart values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, cart.getUser_id());
			pstmt.setString(3, cart.getPro_name());
			pstmt.setInt(4, cart.getPro_num());
			pstmt.setInt(5, cart.getPro_price());
			pstmt.setInt(6, cart.getCart_stock());
			pstmt.setTimestamp(7, cart.getCart_regdate());
			pstmt.execute();
			re = 1;
			pstmt.close();
			conn.close();
			System.out.println("추가 성공");
		}catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		
		return re;
	}
	
	// 아이디 값을 받아, 해당 아이디가 보유한 장바구니 목록을 테이블에 가져오는 로직.
	public ArrayList<CartBean> listCart(String user_id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		ArrayList<CartBean> cartList = new ArrayList<CartBean>();
		try {
			conn = getConnection();
			sql = "select * from cart where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartBean cart = new CartBean();
				cart.setCart_num(rs.getInt("cart_num"));
				cart.setUser_id(rs.getString("user_id"));
				cart.setPro_name(rs.getString("pro_name"));
				cart.setPro_num(rs.getInt("pro_num"));
				cart.setPro_price(rs.getInt("pro_price"));
				cart.setCart_stock(rs.getInt("cart_stock"));
				cart.setCart_regdate(rs.getTimestamp("cart_regdate"));
				cartList.add(cart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cartList;
	}
	
	// 장바구니 내에서 수량을 조절하여 테이블에 연동하는 로직
	public int editCart(CartBean cart) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			
			sql = "update cart set cart_stock=? where cart_num=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cart.getCart_stock());
			pstmt.setInt(2, cart.getCart_num());
			pstmt.executeUpdate();
			re = 1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// 장바구니 페이지(cart.jsp)에서 해당 목록에 삭제를 누르면 그 상품만 삭제하는 로직
	public int deleteCart(int cart_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			sql="delete from cart where cart_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_num);
			pstmt.executeUpdate();
			re=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	// 장바구니 페이지(cart.jsp)에서 목록 전체의 상품을 삭제하는 로직.
	public int deleteAllCart(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			sql="delete from cart where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.executeUpdate();
			re=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
}
