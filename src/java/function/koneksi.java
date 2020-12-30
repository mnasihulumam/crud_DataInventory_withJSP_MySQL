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
public class koneksi {
    public static Connection getKoneksi(){
        Connection con=null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                + "inventaris_uniku","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
}