package shop.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class ProductDBBean {
	private static ProductDBBean instance = new ProductDBBean();
	
	public static ProductDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertProduct(ProductBean product) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		int re = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPro_num());
			pstmt.setString(2, product.getPro_name());
			pstmt.setString(3, product.getPro_code());
			pstmt.setInt(4, product.getPro_stock());
			pstmt.setInt(5, product.getPro_price());
			pstmt.setString(6, product.getPro_description());
			pstmt.setString(7, product.getPro_img());
			pstmt.setTimestamp(8, product.getPro_regdate());
			pstmt.setInt(9, product.getPro_hit());
			pstmt.execute();
			re = 1;
			pstmt.close();
			conn.close();
			System.out.println("�߰� ����");
		}catch (Exception e) {
			System.out.println("�߰� ����");
			e.printStackTrace();
		}
		
		return re;
	}
	
	public ArrayList<ProductBean> listProduct(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			sql = "select * from product order by pro_num";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductBean product = new ProductBean();
				product.setPro_num(rs.getInt(1));
				product.setPro_name(rs.getString(2));
				product.setPro_code(rs.getString(3));
				product.setPro_stock(rs.getInt(4));
				product.setPro_price(rs.getInt(5));
				product.setPro_description(rs.getString(6));
				product.setPro_img(rs.getString(7));
				product.setPro_regdate(rs.getTimestamp(8));
				product.setPro_hit(rs.getInt(9));
				productList.add(product);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return productList;
	}
	
	public ProductBean getProduct(int pro_num) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String sql1 = "";
		String sql2 = "";
		ProductBean product = new ProductBean();
		try {
			conn = getConnection();
			
			sql1 = "update product set pro_hit = pro_hit + 1 where pro_num=?";
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, pro_num);
			pstmt1.executeUpdate();
			
			sql2 = "select * from product where pro_num=?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, pro_num);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				System.out.println("!!@@##$$" + rs.getInt(1));
				product.setPro_num(rs.getInt(1));
				product.setPro_name(rs.getString(2));
				product.setPro_code(rs.getString(3));
				product.setPro_stock(rs.getInt(4));
				product.setPro_price(rs.getInt(5));
				product.setPro_description(rs.getString(6));
				product.setPro_img(rs.getString(7));
				product.setPro_regdate(rs.getTimestamp(8));
				product.setPro_hit(rs.getInt(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt1 != null) pstmt1.close();
				if(pstmt2 != null) pstmt2.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return product;
	}
	
	public int editProduct(ProductBean product) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			
			sql = "update product set pro_name=?,pro_code=?,pro_stock=?,pro_price=?,pro_description=?,pro_img=? where pro_num=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product.getPro_name());
			pstmt.setString(2, product.getPro_code());
			pstmt.setInt(3, product.getPro_stock());
			pstmt.setInt(4, product.getPro_price());
			pstmt.setString(5, product.getPro_description());
			pstmt.setString(6, product.getPro_img());
			pstmt.setInt(7, product.getPro_num());
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
	
	public int deleteProduct(int pro_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re =-1;
		
		try {
			conn = getConnection();
			sql="delete from product where pro_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_num);
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
		
	public ArrayList<ProductBean> rankProduct() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			sql = "select pro_num, pro_name, pro_code, pro_stock, pro_price, pro_description,"
					+ "pro_img, rank() over(order by pro_hit desc) from product";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductBean product = new ProductBean();
				product.setPro_num(rs.getInt(1));
				product.setPro_name(rs.getString(2));
				product.setPro_code(rs.getString(3));
				product.setPro_stock(rs.getInt(4));
				product.setPro_price(rs.getInt(5));
				product.setPro_description(rs.getString(6));
				product.setPro_img(rs.getString(7));
				product.setPro_hit(rs.getInt(8));
				productList.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return productList;
	}
}
