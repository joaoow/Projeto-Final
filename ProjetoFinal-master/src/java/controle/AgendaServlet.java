/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Agendamento;

/**
 *
 * @author sala303b
 */
@WebServlet(name = "AgendaServlet", urlPatterns = {"/AgendaServlet"})
public class AgendaServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            if (request.getParameter("acao") != null) {

            if (request.getParameter("acao").equals("cadastrar")) {

              
                Time horainicio = (Time.valueOf(request.getParameter("horainicio")));
                Time horafim = (Time.valueOf(request.getParameter("horafim")));
                
                Double preco = (Double.parseDouble(request.getParameter("preco")));
                
                Agendamento ag = new Agendamento();
                
                ag.setHorainicio(horainicio);
                ag.setHorafim(horafim);
                ag.setPreco(preco);
                
                long cadastrou = ag.Cadastrar();
                if (cadastrou > 0) {
                    
                response.sendRedirect("listaragendamento.jsp");
                    } else {
                        String mensagem
                        = "<h1>Cadastro não Efetuado</h1>";
                response.getWriter().print(mensagem);
                    }
                

            } else if (request.getParameter("acao").equals("editar")) {
                
                 Time horainicio = (Time.valueOf(request.getParameter("horainicio")));
                Time horafim = (Time.valueOf(request.getParameter("horafim")));
                
                Double preco = (Double.parseDouble(request.getParameter("preco")));
                
                Agendamento ag = new Agendamento();
                
                ag.setHorainicio(horainicio);
                ag.setHorafim(horafim);
                ag.setPreco(preco);
                
                 boolean atualizou = ag.Atualizar();

            if (atualizou) {
//            idproduto = 1,ou 2,ou 3, etc.
//            request.setAttribute("idproduto", novoId);
//            request.getRequestDispatcher("listar.jsp")
//                    .forward(request, response);
                response.sendRedirect("admin/listaragendamento.jsp");
            } else {
                String mensagem
                        = "<h1>Atualização não Efetuado</h1>";
                response.getWriter().print(mensagem);
               
            }

                

            } else if (request.getParameter("acao").equals("deletar")) {

               Agendamento ag = new Agendamento();
                ag.setId(Long.parseLong(request.getParameter("iduser")));

                boolean apagou = ag.Excluir();

                if (apagou) {
                    response.sendRedirect("admin/listaragendamento.jsp");
                } else {
                    String mensagem
                            = "<h1>Exclusão não Efetuado</h1>";
                    response.getWriter().print(mensagem);
                }
            }
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
