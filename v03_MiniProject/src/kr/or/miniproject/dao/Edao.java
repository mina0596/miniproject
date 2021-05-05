package kr.or.miniproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.or.miniproject.driverdb.DriverDB;

public class Edao {
    
    PreparedStatement pstmt = null;
    Connection conn = null;
    ResultSet rs = null;
    
    public String[] mEventContents(String event_code) throws SQLException, ClassNotFoundException{
        
        String EventContents[] = new String[5];
        
        DriverDB db = new DriverDB();
        
        conn = db.driverDbcon();
        
        pstmt = conn.prepareStatement("SELECT event_id, event_title, event_cate, event_content, event_reg_date FROM event_board where event_code=?");
        
        pstmt.setString(1, event_code);
        
        rs = pstmt.executeQuery();
        
        if(rs.next()){
            for(int i = 0; i < EventContents.length; i++){
                EventContents[i] = rs.getString(i+1);
            }
        }
        rs.close();
        pstmt.close();
		conn.close();
        
        return EventContents;
    }
    
    public ArrayList<String[]> mEventSearch(String searchKeyword, String searchValue) throws SQLException, ClassNotFoundException{
        
        ArrayList<String[]> getEventCode = new ArrayList<String[]>();
         
        DriverDB db = new DriverDB();
        
        conn = db.driverDbcon();
        
        String sort = " order by num*1 desc;";
        
        if(searchKeyword.equals("event_title")){
            String query = "event_title like '%"+ searchValue +"%'";
            
            pstmt = conn.prepareStatement("SELECT substring(event_code, 6) as 'num', event_cate, event_title, event_id, event_reg_date FROM event_board where " + query + sort);
            
        }else{
            
            pstmt = conn.prepareStatement("SELECT substring(event_code, 6) as 'num', event_cate, event_title, event_id, event_reg_date FROM event_board where " + searchKeyword  + "=?" + sort);
        
        pstmt.setString(1, searchValue);
        }
        
        System.out.println(pstmt);
        rs = pstmt.executeQuery();
        
        while(rs.next()){
            getEventCode.add(new String[]{rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4) , rs.getString(5)});
        }
        
        rs.close();
        pstmt.close();
		conn.close();
        
        return getEventCode;
    }
            
}
    
   










