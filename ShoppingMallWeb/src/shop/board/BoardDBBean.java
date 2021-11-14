package shop.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number=1;
		int re=-1;
		
		int id = board.getId();
		int ref = board.getB_ref();
		int step = board.getB_step();
		int level = board.getB_level();
		
		try {
			conn = getConnection();
			
			sql = "select max(Id) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			System.out.println("@@@### id ===>"+id);
			
			if (id != 0) {
				sql="update board set b_step=b_step+1 where b_ref=? and b_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step=step+1;
				level=level+1;
			} else {
				ref=number;
				step=0;
				level=0;
			}
			sql="insert into board(Id, B_TITLE, B_CONTENT, B_DATE, B_IP, B_REF, B_STEP, B_LEVEL, password)"
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2,HanConv.toKor(board.getB_title()));
			pstmt.setString(3,HanConv.toKor(board.getB_content()));
			pstmt.setTimestamp(4, board.getB_date());
			pstmt.setInt(5, board.getB_hit());
//			pstmt.setString(6, board.getB_ip());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, level);
			pstmt.setString(9, board.getPassword());
			pstmt.executeUpdate();
			
			re=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public ArrayList<BoardBean> listBoard(String pageNumber){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		int absolutePage=1;
		int dbcount=0;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from board");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbcount / BoardBean.pageSize;
			} else {
				BoardBean.pageCount = dbcount / BoardBean.pageSize + 1;
			}
		
			if (pageNumber != null) {
				System.out.println("@@@### pageNumber ===>"+pageNumber);
				
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (BoardBean.pageNum-1) * BoardBean.pageSize+1;
			}
			
			//stmt = conn.createStatement();
			String sql="select * from board order by b_ref desc, b_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count=0;
				
				while (count < BoardBean.pageSize) {
					BoardBean board=new BoardBean();
					board.setId(rs.getInt(1)); 
					board.setB_title(rs.getString(2));
					board.setB_content(rs.getString(3));
					board.setB_date(rs.getTimestamp(4));
					board.setB_hit(rs.getInt(5));
					board.setB_ip(rs.getString(6));
					board.setB_ref(rs.getInt(7));
					board.setB_step(rs.getInt(8));
					board.setB_level(rs.getInt(9));
					board.setPassword(rs.getString(10));
					boardList.add(board);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
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
		
		return boardList;
	}
	
	public BoardBean getBoard(int id, boolean hitadd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean board=null;
		
		try {
			conn = getConnection();
			
			if (hitadd == true) {
				sql="update board set b_hit=b_hit+1 where Id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql="select * from board where Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new BoardBean();
				board.setId(rs.getInt(1));
				board.setB_title(rs.getString(2));
				board.setB_content(rs.getString(3));
				board.setB_date(rs.getTimestamp(4));
				board.setB_hit(rs.getInt(5));
				board.setB_ip(rs.getString(6));
				board.setB_ref(rs.getInt(7));
				board.setB_step(rs.getInt(8));
				board.setB_level(rs.getInt(9));
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
		
		return board;
	}
	
	public int deleteBoard(int Id, String password) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String password1="";
		
		try {
			conn = getConnection();
			sql="select password from board where Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				password1 = rs.getString(1);
				
				if (!password1.equals(password)) {
					re=0;
				}else {
					sql="delete board where Id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Id);
					pstmt.executeUpdate();
					re=1;
				}
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
		return re;
	}
	
	public int editBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String password="";
		
		try {
			conn = getConnection();
			sql="select password from board where Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getId());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				password = rs.getString(1);
				
				if (!password.equals(board.getPassword())) {
					re=0;
				}else {
					sql="update board set b_title=?, b_content=? where Id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getB_title()));
					pstmt.setString(2, HanConv.toKor(board.getB_content()));
					pstmt.setInt(3, board.getId());
					pstmt.executeUpdate();
					re=1;
				}
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
		
		return re;
	}
}