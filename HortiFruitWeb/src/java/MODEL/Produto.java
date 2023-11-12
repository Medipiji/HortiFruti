/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author jr_ma
 */
public class Produto {
    int id, quantidade;
    String nome, categoria;
    double preco;
    
    public int Id(){return this.id;} public void Id(int param){ this.id = param;}
    public int Quantidade(){return this.quantidade;} public void Quantidade(int param){ this.quantidade = param;}
    public String Nome(){return this.nome;} public void Nome(String param){ this.nome = param;}
    public String Categoria(){return this.categoria;} public void Categoria(String param){ this.categoria = param;}
    public double Preco(){return this.preco;} public void Preco(double param){ this.preco = param;}
}
