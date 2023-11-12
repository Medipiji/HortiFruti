/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jr_ma
 */
public class PedidoDAL {
    
     public boolean gerarCadastro() throws SQLException, ClassNotFoundException {        
        String query = "INSERT INTO pedido (DATA_PEDIDO, VALOR_FINAL) VALUES (CURRENT_DATE,0)";      
        try{
            Connection conn = ConnectionDAL.connectionOpen();
                Statement  stmt = conn.createStatement();
                    stmt.executeUpdate(query);
                stmt.close();
            conn.close();
            
            return true;
        } catch(Exception e){
            return false;
        }
    }
     
    public String pegarCadastro() throws SQLException, ClassNotFoundException {
        String query = "SELECT ID_PEDIDO FROM `pedido` ORDER BY ID_PEDIDO DESC LIMIT 1";
        String pedido = "";
        Connection conn = ConnectionDAL.connectionOpen();
            Statement stmt = conn.createStatement();
                ResultSet res = stmt.executeQuery(query);
                while(res.next()){
                    pedido = res.getString("ID_PEDIDO");
                }
                res.close();
            stmt.close();
        conn.close();
        return pedido;
    }
     
}
