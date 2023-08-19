
package model;

/**
 *
 * @author Henrique 19/05/23 - 19:23
 */
public class Menu {
    private int idMenu;
    private String titulo;
    private String link;
    private String icone;
    private int exibir;

    public Menu() {
    }
    
    public Menu(int idMenu, String titulo, String link, String icone, int exibir) {
        this.idMenu = idMenu;
        this.titulo = titulo;
        this.link = link;
        this.icone = icone;
        this.exibir = exibir;
    }

    
    public int getExibir() {
        return exibir;
    }

    public void setExibir(int exibir) {
        this.exibir = exibir;
    }



    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    @Override
    public String toString() {
        return "Menu{" + "titulo=" + titulo + '}';
    }
    
    
}
