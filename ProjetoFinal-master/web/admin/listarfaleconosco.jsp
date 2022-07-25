<%-- 
    Document   : listarusuario
    Created on : 12/04/2022, 08:11:12
    Author     : sala305b
--%>

<%@page import="modelo.FaleConosco"%>
<%@page import="modelo.Servico"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idsfalac = String.valueOf(
            request.getAttribute("idservico"));

    List<FaleConosco> faleconosco = new FaleConosco().ListarTodos();

    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");

    String responsavel = "", caminho = "../";

    responsavel = "Olá," + user.getResponsavel();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTAGEM GERAL</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="<%= caminho%>css/bootstrap.css" >
        <link rel="stylesheet" href="<%= caminho%>css/admin/estilolistaradmin.css" >
    </head>
    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div style="display:inline; float: left;">
                    <a class="navbar-brand" href="index.jsp"><img src="<%= caminho%>img/logoacademia128.png" width="128px" alt="imagem" /></a>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--Aqui é o menu da parte de cima da página web-->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="listarusuario.jsp"><h5>Listar Usuarios</h5> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="cadastroservico.jsp"><h5>Cadastrar Serviço</h5> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="listarservico.jsp"><h5>Listar Serviço</h5> <span class="sr-only">(current)</span></a>
                        </li>

                    </ul>
                    <div class="dropdown">
                        <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">
                            <img class="user" src="<%= caminho%>img/user(4).png" width="50px" alt="imagem"><span><%=responsavel%></span>
                        </button>
                        <div class="lado dropdown-menu">
                            <a class="dropdown-item" href="#">Contato</a>
                            <div class="dropdown-divider"></div>
                            <a  class="cor dropdown-item" href="../tela/loginmain.jsp">Sair</a>
                        </div>
                    </div>
                </div>
            </nav>  
            <h1><center>Listar Serviço</center></h1>

            <table class="table table-bordered">
                <tr>
                    <td>ID</td>
                    <td>Nome</td>
                    <td>E-mail</td>
                    <td>(DDD) Telefone</td>
                    <td>UF</td>
                    <td>Cidade</td>
                    <td>Descrição</td>
                    <td>Data De Envio</td>
                    <td>Ações</td>

                </tr>           
                <%
                    for (FaleConosco p : faleconosco) {
                        out.print("<tr>");

                        out.print("<td>");
                        out.print(p.getId());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(p.getNome());
                        out.print("</td>");

                        out.print("<td>");
                        out.print(p.getEmail());
                        out.print("</td>");


                        out.print("<td>");
                        out.print(p.getDdd() + p.getTelefone());
                        out.print("</td>");
                        
                        out.print("<td>");
                        out.print(p.getUf());
                        out.print("</td>");
                        
                        out.print("<td>");
                        out.print(p.getCidade());
                        out.print("</td>");
                        
                        out.print("<td>");
                        out.print(p.getDescricao());
                        out.print("</td>");
                        
                        out.print("<td>");
                        out.print(p.getDatacadastro());
                        out.print("</td>");

                        out.print("<td>");
                        out.print("<div style='display:inline-block'>");
                        out.print("<form action='../tela/faleconosco.jsp' method='POST'>");
                        out.print("<input name='acao' type='hidden' value='Atualizar' />");
                        out.print("<input name='idfalec' type='hidden' value='" + p.getId() + "' />");
                        out.print("<button type='submit'>Vizualizar</button>");
                        out.print("</form>");
                        out.print("</div>");

                        out.print("&nbsp;");
                        out.print("&nbsp;");

                        out.print("<div style='display:inline-block'>");
                        out.print("<form action='../FaleConoscoServlet' method='POST'>");
                        out.print("<input name='acao' type='hidden' value='deletar' />");
                        out.print("<input name='idfalec' type='hidden' value='" + p.getId() + "' />");
                        out.print("<button type='submit'>Deletar</button>");
                        out.print("</form>");
                        out.print("</div>");

                        out.print("</tr>");
                    }
                %>
            </table>
            <div class="row" style="margin-top: 20%;">

                <div class="col-12">
                    <footer class="bg-dark text-light">
                        <div class="container-fluid py-3">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-4">
                                            <ul class="nav flex-column">
                                                <li class="nav-link"><h5>Contato</h5></li>
                                                <li class="nav-link"><a href="#">(27)99923-2453</a></li>
                                                <li class="nav-link"><a href="#">NeverFat@gmail.com</a></li>
                                                <li class="nav-link"><a href="#"></a></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <ul class="nav flex-column text-center">
                                                <li class="nav-link"><h5>Horário de Funcionamento</h5></li>
                                                <li class="nav-link"><a href="#">Segunda á Sexta</a></li>
                                                <li class="nav-link"><a href="#">7:00 ás 22:00 hrs</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <ul class="nav flex-column float-right">
                                                <li class="nav-link"><h5>Redes Sociais</h5></li>
                                                <li class="nav-link">
                                                    <img class="img" src="<%= caminho%>img/instagram (1).png" width="30px" alt="imagem">
                                                    <a href="#">@NeverFatDf</a></li>
                                                <li class="nav-link">
                                                    <img class="img" src="<%= caminho%>img/icons8-facebook-48.png" width="30x" alt="imagem">
                                                    <a href="#">NeverFatOf</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--finalização do roda pé com o ano atual -->
                        <div class="text-center" style="background-color: #333; padding: 20px;" >
                            Copyright © 2022 © Academia & Outsourcing | Todos os direitos reservados.
                        </div>
                    </footer>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="<%= caminho%>js/jquery.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/bootstrap.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/jquery.mask.js"></script>
        <script>
            jQuery(document).ready(function ($) {

            $("#txtcpf").mask("000.000.000-00");
                    $("#txtDddTelefone").mask("(00) 00000-0000");
            });
            }
            );
        </script>
    </body>
</html>
