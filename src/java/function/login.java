/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

/**
 *
 * @author HP
 */
import java.sql.*;
public class login {
    public static String loginCheck(flogin gt){
        String query = "select * from user where username=? AND password=?";
         try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from "
                    + "`user` where username=? AND password=?");
            ps.setString(1,gt.getUsername());
            ps.setString(2,gt.getPassword());
            ResultSet rs=ps.executeQuery();
             if(rs.next()){
                 return "true";
             }
             else {
                 return "false";
             }
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return "error";
    }
}