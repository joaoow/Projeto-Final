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
import modelo.Usuario;

/**
 *
 * @author sala305b
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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

        if (request.getParameter("login") != null
                && request.getParameter("senha") != null) {

            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            Usuario user = new Usuario();
            user.setLogin(login);
            user.setSenha(senha);
            boolean talogado = user.TemUsuario();

            //talogado == true
            if (talogado) {

                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (user.getAdmin().equals("C")) {
                    response.sendRedirect("cliente/indexc.jsp");

                } else if (user.getAdmin().equals("A")) {
                    response.sendRedirect("admin/index.jsp");
                }

            } else {
                response.sendRedirect("tela/loginmain.jsp?auth=false");
            }
        } else if (request.getParameter("acao").equals("editar")) {

            long iduser = Long.parseLong(request.getParameter("iduser"));
            String responsavel = request.getParameter("responsavel");
            String login = request.getParameter("logincad");
            String senha = request.getParameter("senhacad");
            String cpf = request.getParameter("cpf");
            String dddtelefone = request.getParameter("dddtelefone");
            String email = request.getParameter("email");
            Date dtnascimento = Date.valueOf(
                    request.getParameter("datanascimento"));

            Usuario cli = new Usuario();
            cli.setId(iduser);
            cli.setResponsavel(responsavel);
            cli.setLogin(login);
            cli.setSenha(senha);
            cli.setCpf(cpf);
            cli.setDatanascimento(dtnascimento);
            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);
            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }
            cli.setDdd(ddd);
            cli.setTelefone(telefone);
            cli.setEmail(email);
            boolean atualizou = cli.Atualizar();

            if (atualizou) {
//            idproduto = 1,ou 2,ou 3, etc.
//            request.setAttribute("idproduto", novoId);
//            request.getRequestDispatcher("listar.jsp")
//                    .forward(request, response);
                response.sendRedirect("admin/listarusuario.jsp");
            } else {
                String mensagem
                        = "<h1>Atualização não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }

        } else if (request.getParameter("acao").equals("deletar")) {

            Usuario cli = new Usuario();
            cli.setId(Long.parseLong(request.getParameter("iduser")));

            boolean apagou = cli.Excluir();

            if (apagou) {
                response.sendRedirect("admin/listarusuario.jsp");
            } else {
                String mensagem
                        = "<h1>Exclusão não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        } else {
            String responsavel = request.getParameter("responsavel");
            String login = request.getParameter("logincad");
            String senha = request.getParameter("senhacad");
            String cpf = request.getParameter("cpf");
            String dddtelefone = request.getParameter("dddtelefone");
            String email = request.getParameter("email");
            Date dtnascimento = Date.valueOf(
                    request.getParameter("datanascimento"));

            Usuario cli = new Usuario();
            cli.setResponsavel(responsavel);
            cli.setLogin(login);
            cli.setSenha(senha);
            cli.setCpf(cpf);
            cli.setDatanascimento(dtnascimento);
            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);
            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }
            cli.setDdd(ddd);
            cli.setTelefone(telefone);
            cli.setEmail(email);
            cli.setAdmin("C");

            long novoId = cli.Cadastrar();
            //cadastrou == true 

            if (novoId > 0) {
                request.setAttribute("iduser", cli.getId());
                response.sendRedirect("tela/loginmain.jsp");

            } else {
                request.setAttribute("iduser", cli.getId());
                request.getRequestDispatcher("tela/cadastrousuario.jsp")//"tela/cadastrar.jsp"
                        .forward(request, response);
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
