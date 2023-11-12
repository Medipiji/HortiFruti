/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author jr_ma
 */
public class Carrinho {
    
    int id, id_produto, id_pedido, quantidade;
    double valor;
    String nm_produto;
    
    public int Id(){ return this.id; } public void Id(int param){ this.id = param; }
    public int Id_produto(){ return this.id_produto; } public void Id_produto(int param){ this.id_produto = param; }
    public int Id_pedido(){ return this.id_pedido; } public void Id_pedido(int param){ this.id_pedido = param; }
    public int Quantidade(){ return this.quantidade; } public void Quantidade(int param){ this.quantidade = param; }
    public double Valor(){ return this.valor; } public void Valor(double param){ this.valor = param; }
    public String Nm_produto(){ return this.nm_produto; } public void Nm_produto(String param){ this.nm_produto = param; } 
    
}
