/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.*;

import MODEL.Usuario;
import DAL.ConnectionDAL;
/**
 *
 * @author jr_ma
 */
public class UsuarioDAL {
    
    public Usuario login(String email, String senha) throws SQLException, ClassNotFoundException {
        Usuario obj = new Usuario();
        String query = "SELECT * FROM USUARIO WHERE EMAIL = '"+email+"' AND SENHA = '"+senha+"'";
        
        Connection conn = ConnectionDAL.connectionOpen();
            Statement stmt = conn.createStatement();
                ResultSet res = stmt.executeQuery(query);
                while(res.next()){
                    obj.Nome(res.getString("NOME"));
                    obj.Email(res.getString("EMAIL"));
                    obj.Senha(res.getString("SENHA"));
                    obj.Admin(res.getString("ADMIN").equals("1"));
                }
                res.close();
            stmt.close();
        conn.close();
        return obj;
    }
    
    public boolean cadastro(String nome, String email, String senha, int admin) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO usuario(NOME, EMAIL, SENHA, ADMIN) VALUES ('"+nome+"','"+email+"','"+senha+"',"+admin+")";
        
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
    
    
}
