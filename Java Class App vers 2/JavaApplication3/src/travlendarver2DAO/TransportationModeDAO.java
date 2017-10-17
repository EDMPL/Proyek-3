/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package travlendarver2DAO;

import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import travlendarver2.TransportationMode;

/**
 *
 * @author kivla
 */
public class TransportationModeDAO extends DAO{
//    public static Connection getConnection(){
//        Connection con = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/travlendar", "root", "");
//        } catch (ClassNotFoundException | SQLException ex){
//            System.out.println(ex);
//        }
//        return con;
//    }
    
    public static List<TransportationMode> getAll(){
        List<TransportationMode> transports = new ArrayList<>();
        try {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM transportation");
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            TransportationMode transport = new TransportationMode();
            transport.setTransportation_Code(rs.getString("Transportation_Code"));
            transport.setTransportation(rs.getString("Transportation_Name"));
            transport.setVelocity(rs.getInt("Transportation_Velocity"));
            transports.add(transport);
        }
        } catch (SQLException ex){
            System.out.println(ex);
        }
        disconnect();
        return transports;
    }
    
    public static int save(TransportationMode _transport){
        int stats = 0;
        try{
            Connection con = getConnection();
            Statement st = con.createStatement();
            
            String transCode = _transport.getTransportation_Code();
            String transName = _transport.getTransportation();
            int transVelocity = _transport.getVelocity();
            
            String sql = "INSERT INTO transportation VALUES(\""+ transCode +"\",\"" + transName + "\",\"" + transVelocity +"\");";
            stats = st.executeUpdate(sql);
        } catch (Exception ex){
            System.out.println(ex);
        }
        disconnect();
        return stats;
    }
}