<%-- 
    Document   : listarusuario
    Created on : 12/04/2022, 08:11:12
    Author     : sala305b
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Agendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String iduser  = String.valueOf(
            request.getAttribute("iduser"));
    List<Agendamento> agendamentos = new Agendamento().ListarTodos();
    
       session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");

    String responsavel = "", caminho = "../";

        responsavel = "Olá," + user.getResponsavel();
     
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="css/bootstrap.css" >
    </head>
    <body>
        <h1>Listagem</h1>

        <table class="table table-bordered">
            <tr>
                <td>ID</td>
                <td>Hora de inicio</td>
                <td>Hora final</td>
                <td>Preço:</td>
                <td>ID Serviço</td>
                <td>Data de cadastro</td>
               
                <td>Ações</td>

            </tr>           
            <%
                for (Agendamento agenda : agendamentos) {
                    out.print("<tr>");

                    out.print("<td>");
                    out.print(agenda.getId());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(agenda.getHorainicio());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(agenda.getHorafim());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(agenda.getPreco());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(agenda.getIdservico());
                    out.print("</td>");

                   

                    out.print("<td>");
                    out.print(agenda.getDatacadastro());
                    out.print("</td>");

                    out.print("<td>");
                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='tela/telaagendamento.jsp' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='editar' />");
                    out.print("<input name='iduser' type='hidden' value='" + agenda.getId() + "' />");
                    out.print("<button type='submit'>Editar</button>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("&nbsp;");
                    out.print("&nbsp;");

                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='AgendaServlet' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='deletar' />");
                    out.print("<input name='iduser' type='hidden' value='" + agenda.getId() + "' />");
                    out.print("<button type='submit'>Deletar</button>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("</tr>");
                }
            %>
        </table>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#txtcpf").mask("000.000.000-00");
                $("#txtDddTelefone").mask("(00) 00000-0000");
                

                });


            });
        </script>
    </body>
</html>