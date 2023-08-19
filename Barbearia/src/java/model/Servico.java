package model;

/**
 *
 * @author Henrique
 */
public class Servico {
    private int idServico;
    private String nome;
    private String descricao;
    private double valor;

    public Servico() {
    }

    public Servico(int idServico, String nome, String descricao, double valor) {
        this.idServico = idServico;
        this.nome = nome;
        this.descricao = descricao;
        this.valor = valor;
    }
 
    


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getIdServico() {
        return idServico;
    }

    public void setIdServico(int idServico) {
        this.idServico = idServico;
    }

    @Override
    public String toString() {
        return "Servico{" + "nome=" + nome + '}';
    }
    
}
