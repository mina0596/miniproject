package kr.or.miniproject.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.miniproject.driverdb.DriverDB;
import kr.or.miniproject.dto.Post;
import kr.or.miniproject.dto.Member;

public class Mdao {
	ArrayList<Post> alm = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Member m = null;
	//이벤트 첫페이지 검색
    
	//회원정보 수정
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("02 수정 처리 메서드 mUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE regular_member SET regular_pw=?,regular_name=?,regular_gender=?,regular_phone=?,regular_email=?,regular_addr=? WHERE regular_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, m.getRegular_pw());
		pstmt.setString(2, m.getRegular_name());
		pstmt.setString(2, m.getRegular_gender());
		pstmt.setString(2, m.getRegular_phone());
		pstmt.setString(3, m.getRegular_email());
		pstmt.setString(3, m.getRegular_addr());
		pstmt.setString(4, m.getRegular_id());
		
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
    public void mInsert(Member regular) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
        DriverDB db =new DriverDB();
        
        conn = db.driverDbcon();
        
        pstmt = conn.prepareStatement("insert into regular_member values(?,?,?,?,'1',?,?,?,now())");
        
        System.out.println(new String(regular.getRegular_gender()));
        
        pstmt.setString(1, regular.getRegular_id());
        pstmt.setString(2, regular.getRegular_pw());
        pstmt.setString(3, regular.getRegular_name());
        pstmt.setString(4, regular.getRegular_gender());
        pstmt.setString(5, regular.getRegular_phone());
        pstmt.setString(6, regular.getRegular_email());
        pstmt.setString(7, regular.getRegular_addr());
        
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
    }
    
    public ArrayList<Post> pSearch(String sk, String sv) throws ClassNotFoundException, SQLException{
		System.out.println(sk + sv + "이벤트 페이지 검색");
		alm = new ArrayList<Post>();
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		String selectQuery = "select * from post";
		if(sk == null & sv == null){
			System.out.println("sk, sv 둘다 null");
			pstmt = conn.prepareStatement(selectQuery);
		}else if(sk != null & sv.equals("")){
			System.out.println("sk null sv 공백");
			pstmt = conn.prepareStatement(selectQuery);
		}else if(sk != null & sv != null){
			System.out.println("sk,sv 둘다 null 아님");
			pstmt = conn.prepareStatement(selectQuery+" WHERE "+sk+"=?");
			pstmt.setString(1, sv);
		}
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Post p = new Post();
			p.setPost_code(rs.getString("post_code"));
			p.setPost_title(rs.getString("post_title"));;
			p.setPost_cate(rs.getString("post_cate"));;
			p.setPost_id(rs.getString("post_id"));;
			alm.add(p);
			System.out.println(alm + "<-- alm pSearch Mdao.java");
		}
		pstmt.close();
		rs.close();
		conn.close();
		
		return alm;
    }
    
    public String[] mLogin(String sk, String id, String pw) throws ClassNotFoundException, SQLException{
        
        String loginInfo[] = new String[4];
        
        DriverDB db = new DriverDB();
        
        conn = db.driverDbcon();
        
        if(sk.equals("regular")){
            pstmt = conn.prepareStatement("select regular_id, regular_pw, regular_name, regular_grade_num from regular_member where regular_id=?");
            
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                if(rs.getString(2).equals(pw)){
                    loginInfo[0] = rs.getString(1);
                    loginInfo[1] = rs.getString(3);
                    loginInfo[2] = rs.getString(4);
                    loginInfo[3] = "regular";
                }
            }
            
        }else if(sk.equals("firm")){
            pstmt = conn.prepareStatement("select firm_id, firm_pw, firm_m_name, firm_name from regular_member where firm_id=?");
            
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                if(rs.getString(2).equals(pw)){
                    loginInfo[0] = rs.getString(1);
                    loginInfo[1] = rs.getString(3);
                    loginInfo[2] = rs.getString(4);
                    loginInfo[3] = "firm";
                }
            }
            
        }else if(sk.equals("admin")){
            pstmt = conn.prepareStatement("select adm_id, adm_pw, adm_name from admin where adm_id=?");
            
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                if(rs.getString(2).equals(pw)){
                    loginInfo[0] = rs.getString(1);
                    loginInfo[1] = rs.getString(3);
                    loginInfo[3] = "admin";
                }
            }
            
        }
        
        rs.close();
        pstmt.close();
		conn.close();
        
        return loginInfo;
    }
    
    public Member mSelect(String mid) throws ClassNotFoundException, SQLException{
        DriverDB db = new DriverDB();
        conn = db.driverDbcon();
        pstmt = conn.prepareStatement("SELECT regular_id, regular_pw, regular_name, regular_gender, regular_grade_num, regular_phone, regular_email, regular_addr, regular_reg_date FROM regular_member WHERE regular_id = ? ");
        pstmt.setString(1, mid);
       
        rs = pstmt.executeQuery();
        
        Member m = new Member();
        
        if(rs.next()){
            m.setRegular_id(rs.getString("regular_id"));
            m.setRegular_pw(rs.getString("regular_pw"));
            m.setRegular_name(rs.getString("regular_name"));
            m.setRegular_pw(rs.getString("regular_pw"));
            m.setRegular_gender(rs.getString("regular_gender"));
            m.setRegular_phone(rs.getString("regular_phone"));
            m.setRegular_email(rs.getString("regular_email"));
            m.setRegular_addr(rs.getString("regular_addr"));
            m.setRegular_reg_date(rs.getString("regular_reg_date"));
            
        }
        rs.close();
        pstmt.close();
		conn.close();
        return m;
        
         
    }
    
    public boolean idCheck(String getId) throws ClassNotFoundException, SQLException{
        DriverDB db = new DriverDB();
        conn = db.driverDbcon();
        pstmt = conn.prepareStatement("select regular_id from regular_member where regular_id = ?");
        
        pstmt.setString(1, getId);
       
        rs = pstmt.executeQuery();
        
        if(rs.next()){
            
            rs.close();
            pstmt.close();
		    conn.close();
            
            return false;
        }
        
        rs.close();
        pstmt.close();
		conn.close();
        
        return true;
   
    }

    
}
