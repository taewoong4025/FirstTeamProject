package shop.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import shop.product.ProductBean;

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
	
	// ��ٱ���(cart) ���̺� �� �߰��ϴ� ����
	public int insertCart(CartBean cart) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		int number = 1;
		
		// īƮ�ʿ��� �޾ƿ� ������ ����
		String user_id = cart.getUser_id();
		int pro_num = cart.getPro_num();
		int cart_stock = cart.getCart_stock();
		int MyCart_proNum = 0;
		int MyCart_stock;
	
		System.out.println("@@!!##++" + pro_num);
		
		try {
			conn = getConnection();
			sql = "SELECT pro_num, cart_stock FROM cart WHERE user_id=? AND pro_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, pro_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				MyCart_proNum = rs.getInt(1);
				MyCart_stock = rs.getInt(2);
				
				if(pro_num == MyCart_proNum) {
					MyCart_stock = MyCart_stock + cart_stock;
					sql = "update cart set cart_stock=? where pro_num=? AND user_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, MyCart_stock);
					pstmt.setInt(2, pro_num);
					pstmt.setString(3, user_id);
					pstmt.executeUpdate();
					
					pstmt.close();
					re = 1;	
				} 
			} 
			 
			if(pro_num != MyCart_proNum) {
				sql = "select max(cart_num) from cart WHERE user_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
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
			}
			
			//���� ���ڵ� �߿��� ���� ū �� ��ȣ�� ����.(��ȣ+1)
			System.out.println("��� �߰� ����");
		}catch (Exception e) {
			System.out.println("�߰� ����");
			e.printStackTrace();
		}
		
		return re;
	}


	
	public CartBean getCart(int cart_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql2 = "";
		CartBean cart = new CartBean();
		try {
			conn = getConnection();
			
			sql2 = "select * from cart where cart_num=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, cart_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart.setCart_num(rs.getInt(1));
				cart.setUser_id(rs.getString(2));
				cart.setPro_name(rs.getString(3));
				cart.setPro_num(rs.getInt(4));
				cart.setPro_price(rs.getInt(5));
				cart.setCart_stock(rs.getInt(6));
				cart.setCart_regdate(rs.getTimestamp(7));
				pstmt.execute();
			}
		} catch (Exception e) {
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
		return cart;
	}
	
	// ���̵� ���� �޾�, �ش� ���̵� ������ ��ٱ��� ����� ���̺� �������� ����.
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
	
	// ��ٱ��� ������ ������ �����Ͽ� ���̺� �����ϴ� ����
	public int editCart(CartBean cart) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			
			sql = "update cart set cart_stock=? where cart_num=?";
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
	
	// ��ٱ��� ������(cart.jsp)���� �ش� ��Ͽ� ������ ������ �� ��ǰ�� �����ϴ� ����
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
	
	// ��ٱ��� ������(cart.jsp)���� ��� ��ü�� ��ǰ�� �����ϴ� ����.
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
	
	public int myCartTotal(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int total = 0;
		
		try {
			conn = getConnection();
			sql="SELECT count(*) FROM cart WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			System.out.println(total);
			
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
		
		return total;
	}
	
	public void buytbl_insert(String user_id) {
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        String sql2 = "";

        try {
            conn = getConnection();
            stmt = conn.createStatement();
            sql="insert into buy(user_id,pro_name,pro_price,cart_stock) select user_id,pro_name,pro_price,cart_stock from cart";
            rs = stmt.executeQuery(sql);
            
            sql2="delete from cart where user_id = ?";
           	pstmt = conn.prepareStatement(sql2);
        	pstmt.setString(1, user_id);
			pstmt.executeUpdate();
            
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
	
	// ���̵� ���� �޾�, �ش� ���̵� ������ ��ٱ��� ����� ���̺� �������� ����.
		public ArrayList<buyBean> listBuy(String user_id){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			ArrayList<buyBean> buyList = new ArrayList<buyBean>();
			try {
				conn = getConnection();
				sql = "select * from buy where user_id=? order by \"buy_regdate\" desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					buyBean buy = new buyBean();
					buy.setUser_id(rs.getString("user_id"));
					buy.setPro_name(rs.getString("pro_name"));
					buy.setPro_price(rs.getInt("pro_price"));
					buy.setCart_stock(rs.getInt("cart_stock"));
					buy.setCart_regdate(rs.getTimestamp("buy_regdate"));
					buyList.add(buy);
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
			return buyList;
		}
	
}
