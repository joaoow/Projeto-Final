/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Servico;
import modelo.Usuario;

/**
 *
 * @author sala305b
 */
@WebServlet(name = "ServicoServlet", urlPatterns = {"/ServicoServlet"})
public class ServicoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        if (request.getParameter("login") != null
//                && request.getParameter("senha") != null) {
//
//            String login = request.getParameter("login");
//            String senha = request.getParameter("senha");
//
//           Servico user = newServico();
//            user.setLogin(login);
//            user.setSenha(senha);
//            boolean talogado = user.TemUsuario();
//
//            //talogado == true
//            if (talogado) {
//
//                if (user.getAdmin().equals("C")) {
//                    request.setAttribute("id", user.getId());
//                    request.setAttribute("responsavel", user.getResponsavel());
//                    request.getRequestDispatcher("cliente/indexc.jsp").forward(request, response);
//                    
//                } else if (user.getAdmin().equals("A")) {
//
//                    request.setAttribute("id", user.getId());
//                    request.setAttribute("responsavel", user.getResponsavel());
//                    request.getRequestDispatcher("admin/index.jsp").forward(request, response);
//                }
//
//            } else {
//                response.sendRedirect("tela/loginmain.jsp?auth=false");
//            }
//        } if (request.getParameter("acao").equals("editar")) {;
        if (request.getParameter("acao").equals("editar")) {
            long idservico = Long.parseLong(request.getParameter("idservico"));
            String modalidade = request.getParameter("modalidade");
            double preco = Double.parseDouble(request.getParameter("preco"));
            String descricao = request.getParameter("descricao");
            int vagas = Integer.parseInt(request.getParameter("vagas"));

            Servico ser = new Servico();
            ser.setId(idservico);
            ser.setModalidade(modalidade);
            ser.setPreco(preco);
            ser.setDescricao(descricao);
            ser.setVagas(vagas);

            boolean atualizou = ser.Atualizar();

            if (atualizou) {
//            idproduto = 1,ou 2,ou 3, etc.
//            request.setAttribute("idproduto", novoId);
//            request.getRequestDispatcher("listar.jsp")
//                    .forward(request, response);
                response.sendRedirect("admin/listarservico.jsp");
            } else {
                String mensagem
                        = "<h1>Atualização não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }

        } else if (request.getParameter("acao").equals("deletar")) {

            Servico ser = new Servico();
            ser.setId(Long.parseLong(request.getParameter("idservico")));

            boolean apagou = ser.Excluir();

            if (apagou) {
                response.sendRedirect("admin/listarservico.jsp");
            } else {
                String mensagem
                        = "<h1>Exclusão não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        } else {
//            long idservico = Long.parseLong(request.getParameter("idservico"));
            String modalidade = request.getParameter("modalidade");
            double preco = Double.parseDouble(request.getParameter("preco"));
            String descricao = request.getParameter("descricao");
             int vagas = Integer.parseInt(request.getParameter("vagas"));

            Servico ser = new Servico();
//            ser.setId(idservico);
            ser.setModalidade(modalidade);
            ser.setPreco(preco);
            ser.setDescricao(descricao);
             ser.setVagas(vagas);

            long novoId = ser.Cadastrar();
            //cadastrou == true 

            if (novoId > 0) {
                request.setAttribute("idservico", ser.getId());
                response.sendRedirect("admin/index.jsp");
                

            } else {
                request.setAttribute("idservico", ser.getId());
//                request.getRequestDispatcher("admin/index.jsp")//"tela/cadastrar.jsp"
//                        .forward(request, response);
                 response.sendRedirect("admin/cadastroservico.jsp?auth=false");
            }

        }

    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
