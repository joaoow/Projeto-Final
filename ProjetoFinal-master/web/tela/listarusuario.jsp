<%-- 
    Document   : listarusuario
    Created on : 12/04/2022, 08:11:12
    Author     : sala305b
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String iduser = String.valueOf(
            request.getAttribute("iduser"));
    List<Usuario> usuarios = new Usuario().ListarTodos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="css/bootstrap.css" >
    </head>
    <body>
        <h1>Listagem</h1>

        <table class="table table-bordered">
            <tr>
                <td>ID</td>
                <td>Login</td>
                <td>Responsavel</td>
                <td>CPF</td>
                <td>Data Nascimento</td>
                <td>(DDD)Telefone</td>
                <td>E-mail</td>
                <td>Data Cadastro</td>
                <td>Ações</td>

            </tr>           
            <%
                for (Usuario p : usuarios) {
                    out.print("<tr>");

                    out.print("<td>");
                    out.print(p.getId());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getLogin());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getResponsavel());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getCpf());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getDatanascimento());
                    out.print("</td>");

                    out.print("<td>");
                    out.print("(" + p.getDdd() + ")" + p.getTelefone());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getEmail());
                    out.print("</td>");

                    out.print("<td>");
                    out.print(p.getDatacadastro());
                    out.print("</td>");

                    out.print("<td>");
                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='tela/cadastrousuario.jsp' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='editar' />");
                    out.print("<input name='iduser' type='hidden' value='" + p.getId() + "' />");
                    out.print("<button type='submit'>Editar</button>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("&nbsp;");
                    out.print("&nbsp;");

                    out.print("<div style='display:inline-block'>");
                    out.print("<form action='UsuarioServlet' method='POST'>");
                    out.print("<input name='acao' type='hidden' value='deletar' />");
                    out.print("<input name='iduser' type='hidden' value='" + p.getId() + "' />");
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
