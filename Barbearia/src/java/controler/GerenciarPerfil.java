/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.PerfilDAO;

/**
 *
 * @author Henrique
 */
public class GerenciarPerfil extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        String idPerfil = request.getParameter("idPerfil");

        Perfil p = new Perfil();

        try {
            PerfilDAO pDAO = new PerfilDAO();
            if (acao.equals("alterar")) {
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    p = pDAO.getCarregaPorId(Integer.parseInt(idPerfil));
                    if (p.getIdPerfil() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_perfil.jsp");
                        request.setAttribute("perfil", p);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Perfil não encontrado";
                    }
                //}else{
                 //   mensagem = "Acesso negado!";
                //}
            }
            if (acao.equals("deletar")) {
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    p.setIdPerfil(Integer.parseInt(idPerfil));
                    if (pDAO.deletar(p)) {
                        mensagem = "Excluído com sucesso!";
                    }else{
                        mensagem = "Erro ao excluir o perfil";
                    }
               // }else{
                 //   mensagem = "Acesso negado!";
                //}
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_perfil.jsp';");
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
        String idPerfil = request.getParameter("idPerfil");
        String nome = request.getParameter("nome");

        String mensagem = "";

        Perfil p = new Perfil();
        try {
            PerfilDAO pDAO = new PerfilDAO();
            if (!idPerfil.isEmpty()) {
                p.setIdPerfil(Integer.parseInt(idPerfil));
            }

            if (nome.equals("") | nome.isEmpty()) {
                mensagem = "Campos obragatórios deverão ser preenchidos";
            } else {
                p.setNome(nome);
                if (pDAO.gravar(p)) {  
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_perfil.jsp';");
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
    }// </editor-fold
}