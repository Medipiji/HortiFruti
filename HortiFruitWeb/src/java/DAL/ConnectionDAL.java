/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import java.sql.*;

/**
 *
 * @author jr_ma
 */
public class ConnectionDAL {
    
    public static Connection connectionOpen() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_hortifruiti", "root", ""); // Abre a conexão
        return conn;

    } 
}
