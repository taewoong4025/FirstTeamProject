package shop.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.*;


public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public Date stringToDate(MemberBean member) // StringŸ������ ���� �� �� ���� DateŸ������ ��ȯ���ִ� �޼ҵ�
    {
        String year = member.getYy();
        String month = member.getMm();
        String day = member.getDd();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    } 
	/*
	 * public String addr(MemberBean member) { return
	 * member.getAddress1()+""+member.getAddress2(); }
	 */
	
	public String phone(MemberBean member) {
		return member.getPhone1()+"-"+member.getPhone2()+"-"+member.getPhone3();
	}
	
	public int insertMember(MemberBean member) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql= "";
		int re=-1;
		
		try {
			conn = getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, HanConv.toKor(member.getName()));
			pstmt.setString(4, HanConv.toKor(member.getGender()));
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail());
			pstmt.setString(7, phone(member));
			pstmt.setString(8, HanConv.toKor(member.getAddress1()));	
			pstmt.setString(9, HanConv.toKor(member.getAddress2()));	
			pstmt.setTimestamp(10, member.getReg());
			pstmt.setInt(11, 1);
			pstmt.executeUpdate();
			
			re = 1;
			pstmt.close();
			conn.close();
			System.out.println("�߰� ����");
		} catch (Exception e) {
			System.out.println("�߰� ����");
			e.printStackTrace();
		}
		
		return re;
	}
	public int confirmID(String id) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select id from MEMBERT where id=?";
		int re=-1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public int userCheck(String id, String pwd) throws Exception{ // ����� ������ ����ϴ� �޼ҵ�
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String db_password = "";
		String sql = "select password from member where id=?";
		int re = -1;
		
		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_password = rs.getString("password");
				if(db_password.equals(pwd)) { //db�� �ִ� ��й�ȣ�� �Է��� ��й�ȣ�� ������
					re=1; //�н����嵵 ��ġ
				}
				else {
					re=0; //�н����尡 ����ġ
				}
			}else {
				re=-1; //�ش� ���̵� �������� ����
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return re;
	}
	
	public MemberBean getMember(String id) throws Exception{ // ���̵� ��ġ�ϴ� ����� ������ ������ �޼ҵ�
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id=?";
		MemberBean member = null;
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				String birthday = rs.getDate("birth").toString();
				String year = birthday.substring(0,4);
				String month = birthday.substring(5,7);
				String day = birthday.substring(8,10);
				
				String phone = rs.getString("phone");
				String phone1 = phone.substring(0,3);
				String phone2 = phone.substring(4,8);
				String phone3 = phone.substring(9,13);
				
				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setYy(year);
				member.setMm(month);
				member.setDd(day);
				member.setMail(rs.getString("mail"));
				member.setPhone1(phone1);
				member.setPhone2(phone2);
				member.setPhone3(phone3);
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setReg(rs.getTimestamp("reg"));
				member.setUser_level(rs.getInt("user_level"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	return member;
	}
	
	  public void updateMember(MemberBean member) throws Exception{
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	 
	        try {
	 
	            StringBuffer query = new StringBuffer();
	            query.append("UPDATE MEMBER SET");
	            query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS1=?, ADDRESS2=?");
	            query.append(" WHERE ID=?");
	 
	            conn = getConnection();
	            pstmt = conn.prepareStatement(query.toString());
	 
	            pstmt.setString(1, member.getPassword());
	            pstmt.setString(2, member.getMail());
	            pstmt.setString(3, phone(member));
	            pstmt.setString(4, HanConv.toKor(member.getAddress1()));
	            pstmt.setString(5, HanConv.toKor(member.getAddress2()));
	            pstmt.setString(6, member.getId());
	 
	            pstmt.executeUpdate();
	                        
	        } catch (Exception sqle) {
	            conn.rollback(); // ������ �ѹ�
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end updateMember


	
	
	
	 public int deleteMember(String id, String pw) 
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	 
	        String dbpw = ""; // DB���� ��й�ȣ�� ��Ƶ� ����
	        int x = -1;
	 
	        try {
	            // ��й�ȣ ��ȸ
	            StringBuffer query1 = new StringBuffer();
	            query1.append("SELECT PASSWORD FROM MEMBER WHERE ID=?");
	 
	            // ȸ�� ����
	            StringBuffer query2 = new StringBuffer();
	            query2.append("DELETE FROM MEMBER WHERE ID=?");
	 
	            conn = getConnection();
	 
	            // �ڵ� Ŀ���� false�� �Ѵ�.
	            conn.setAutoCommit(false);
	            
	            // 1. ���̵� �ش��ϴ� ��й�ȣ�� ��ȸ�Ѵ�.
	            pstmt = conn.prepareStatement(query1.toString());
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	 
	            if (rs.next()) 
	            {
	                dbpw = rs.getString("password");
	                if (dbpw.equals(pw)) // �Էµ� ��й�ȣ�� DB��� ��
	                {
	                    // ������� ȸ������ ����
	                    pstmt = conn.prepareStatement(query2.toString());
	                    pstmt.setString(1, id);
	                    pstmt.executeUpdate();
	                    conn.commit(); 
	                    x = 1; // ���� ����
	                } else {
	                    x = 0; // ��й�ȣ �񱳰�� - �ٸ�
	                }
	            }
	 
	            return x;
	 
	        } catch (Exception sqle) {
	            try {
	                conn.rollback(); // ������ �ѹ�
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end deleteMember
	    
}
