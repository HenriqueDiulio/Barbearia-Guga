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
import model.Servico;
import model.ServicoDAO;

/**
 *
 * @author Henrique
 */
public class GerenciarServico extends HttpServlet {

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
        String acao = request.getParameter("acao");
        
        String idServico = request.getParameter("idServico");
        String mensagem = "";
        try{
            Servico s = new Servico();
            ServicoDAO sDAO = new ServicoDAO();
            if(acao.equals("alterar")){
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    s = sDAO.getCarregaPorId(Integer.parseInt(idServico));
                    if(s.getIdServico()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_servico.jsp");
                        request.setAttribute("servico", s);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Serviço não encontrado!";
                    }
                //}else{
                 //   mensagem = "Acesso negado!";
                //}
            }
            if(acao.equals("deletar")){
                //if (GerenciarLogin.verificarPermissao(request, response)) {
                    s.setIdServico(Integer.parseInt(idServico));
                    if (sDAO.deletar(s)) {
                        mensagem = "Serviço excluído com sucesso!";
                    } else {
                        mensagem = "Erro ao excluir o Serviço do Banco de Dados";
                    }
               // }else{
                //    mensagem = "Acesso negado!";
               // }
            }
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_servico.jsp';");
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
        String idServico = request.getParameter("idServico");
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String valor = request.getParameter("valor");
        String mensagem = "";
        
        Servico s = new Servico();
        if(!idServico.isEmpty()){
            s.setIdServico(Integer.parseInt(idServico));
        }
        if(nome.equals("")||descricao.equals("")||valor.equals("")){
            mensagem = "Campos obrigatórios devem ser preenchidos!";
        }else{
            s.setNome(nome);
            s.setDescricao(descricao);
            s.setValor(Double.parseDouble(valor));
            try{
                ServicoDAO sDAO = new ServicoDAO();
                if(sDAO.gravar(s)){
                    mensagem = "Gravado com sucesso!";
                }else{
                    mensagem = "Erro ao gravar o serviço no Banco de Dados!";
                }
            }catch(Exception e){
                out.print(e);
                mensagem = "Erro ao executar";
            }
            out.println("<script type='text/javascript'>");
            out.println("alert('" + mensagem + "');");
            out.println("location.href='lista_servico.jsp';");
            out.println("</script>");
        } 
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
