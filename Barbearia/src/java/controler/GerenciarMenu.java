package controler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Menu;
import model.MenuDAO;


/**
 *
 * @author Henrique
 */
public class GerenciarMenu extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String mensagem = "";
        
        String acao = request.getParameter("acao");
        String idMenu = request.getParameter("idMenu");
        
        Menu m = new Menu();
        
        try{
            MenuDAO mDAO = new MenuDAO();
            if(acao.equals("alterar")){
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    m = mDAO.getCarregaPorId(Integer.parseInt(idMenu));
                    if(m.getIdMenu()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu.jsp");
                        request.setAttribute("menu", m);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Menu não foi encontrado";
                    }
              //}else{
              //     mensagem = "Acesso negado!";
              // }
            }
            if(acao.equals("deletar")){
              //  if(GerenciarLogin.verificarPermissao(request, response)){
                    m.setIdMenu(Integer.parseInt(idMenu));
                    if(mDAO.deletar(m)){
                        mensagem = "Menu excluído com sucesso!";
                    }else{
                        mensagem = "Erro ao excluir o menu";
                    }
              //  }else{
              //      mensagem = "Acesso negado!";
              //  }
            }
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_menu.jsp';");
        out.println("</script>");
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        String idMenu = request.getParameter("idMenu");
        String titulo = request.getParameter("titulo");
        String link = request.getParameter("link");
        String icone = request.getParameter("icone");
        String exibir = request.getParameter("exibir");
        
        String mensagem = "";
        
        Menu m = new Menu();
        
        try{
            MenuDAO mDAO = new MenuDAO();
            if(!idMenu.isEmpty()){
                m.setIdMenu(Integer.parseInt(idMenu));
            }
            if(titulo.equals("")||link.equals("")||exibir.equals("")){
                mensagem = "Campos obrigatórios deverão ser preenchidos!";
                }else{
                    m.setTitulo(titulo);
                    m.setLink(link);
                    m.setIcone(icone);
                    m.setExibir(Integer.parseInt(exibir));
                    if(mDAO.gravar(m)){
                        mensagem = "Gravado com sucesso";
                    }else{
                        mensagem = "Erro ao gravar o menu";
                    }
                }
        }catch(Exception e){
          out.print(e);
          mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_menu.jsp';");
        out.println("</script>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
