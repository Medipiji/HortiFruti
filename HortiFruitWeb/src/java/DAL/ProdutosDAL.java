/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAL;

import MODEL.Produto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jr_ma
 */
public class ProdutosDAL {

    public List<Produto> getProdutos() throws SQLException, ClassNotFoundException {
        
        String query = "SELECT * FROM PRODUTOS";
        List<Produto> list = new ArrayList<>();
        Connection conn = ConnectionDAL.connectionOpen();
            Statement stmt = conn.createStatement();
                ResultSet res = stmt.executeQuery(query);
                while(res.next()){
                    Produto obj = new Produto();
                    obj.Id(Integer.parseInt(res.getString("ID")));
                    obj.Nome(res.getString("NOME"));
                    obj.Categoria(res.getString("CATEGORIA"));
                    obj.Preco(Double.parseDouble(res.getString("PRECO")));
                    obj.Quantidade(Integer.parseInt(res.getString("QUANTIDADE")));
                    list.add(obj);
                }
                res.close();
            stmt.close();
        conn.close();
        
        return list;
    }
    
    public boolean setProdutos(String nome, String categoria, String preco, int quantidade) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO PRODUTOS (NOME, CATEGORIA, PRECO, QUANTIDADE) VALUES ('"+nome+"','"+categoria+"','"+preco+"',"+quantidade+")";
        
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
    
     public boolean excluirProduto(String ID) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM PRODUTOS WHERE ID = "+ID;
        
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
    
    public boolean editarProduto(String idProduto, String idNmProduto,String idCategoria,String idEstoque, String idValor) throws SQLException, ClassNotFoundException {
        
        String table = "produtos";
        String values = "NOME='"+idNmProduto+"', CATEGORIA='"+idCategoria+"',PRECO='"+idValor+"',QUANTIDADE='"+idEstoque+"' WHERE ID = '"+idProduto+"'";
        String query = "UPDATE "+table+" SET "+values;
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
