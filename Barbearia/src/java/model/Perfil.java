
package model;

import java.util.ArrayList;

/**
 * CLASSE BIN
 * @author Henrique
 */
public class Perfil {
    private int idPerfil;
    private String nome;
    private String descricao;
    private ArrayList<Menu> menus;
    private ArrayList<Menu> naoMenus;

    public Perfil() {
    }

    public Perfil(int idPerfil, String nome, String descricao) {
        this.idPerfil = idPerfil;
        this.nome = nome;
        this.descricao = descricao;
    }

    
    public ArrayList<Menu> getMenus() {
        return menus;
    }

    public void setMenus(ArrayList<Menu> menus) {
        this.menus = menus;
    }

    public ArrayList<Menu> getNaoMenus() {
        return naoMenus;
    }

    public void setNaoMenus(ArrayList<Menu> naoMenus) {
        this.naoMenus = naoMenus;
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

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    @Override
    public String toString() {
        return "Perfil{" + "nome=" + nome + '}';
    }
    
}
