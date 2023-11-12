/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import MODEL.Carrinho;
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
public class CarrinhoDAL {
    
    public List<Carrinho> getCarrinho(int id) throws SQLException, ClassNotFoundException {
        String query = "SELECT * FROM carrinho WHERE ID_PEDIDO="+id;
        List<Carrinho> list = new ArrayList<>();
        Connection conn = ConnectionDAL.connectionOpen();
            Statement stmt = conn.createStatement();
                ResultSet res = stmt.executeQuery(query);
                while(res.next()){
                    Carrinho obj = new Carrinho();
                    obj.Id(Integer.parseInt(res.getString("ID")));
                    obj.Id_pedido(Integer.parseInt(res.getString("ID_PRODUTO")));
                    obj.Id_produto(Integer.parseInt(res.getString("ID_PEDIDO")));
                    obj.Nm_produto(res.getString("NM_PRODUTO"));
                    obj.Quantidade(Integer.parseInt(res.getString("QUANTIDADE")));
                    obj.Valor(Double.parseDouble(res.getString("VALOR")));
                    
                    list.add(obj);
                }
                res.close();
            stmt.close();
        conn.close();
        
        return list;
    }
    
    public boolean insertCarrinho(String idCarrinho, String idProduto, String idNmProduto, String idEstoque, String idValor, int quantidade) throws SQLException, ClassNotFoundException {
        double valorFinal = Double.parseDouble(idValor) * quantidade;
        
        String query = "INSERT INTO `carrinho`(ID_PRODUTO, ID_PEDIDO, NM_PRODUTO, QUANTIDADE, VALOR) VALUES ('"+idProduto+"','"+idCarrinho+"','"+idNmProduto+"','"+quantidade+"','"+valorFinal+"')";
        if(quantidade > Integer.parseInt(idEstoque)){
            return false;
        }
        
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
    
    public boolean excluirProduto(String idCarrinho) throws SQLException, ClassNotFoundException {

        String query = "DELETE FROM `carrinho` WHERE ID = "+idCarrinho;
        
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
    
    
    public boolean finalizarPedido(String idPedido) throws SQLException, ClassNotFoundException {

        String query = "UPDATE produtos AS PRD " +
        "INNER JOIN carrinho AS B ON PRD.ID = B.ID_PRODUTO " +
        "SET PRD.QUANTIDADE = PRD.QUANTIDADE - B.QUANTIDADE " +
        "WHERE B.ID_PEDIDO = "+idPedido;
        
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
