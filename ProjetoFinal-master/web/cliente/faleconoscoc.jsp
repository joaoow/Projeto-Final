<%-- 
    Document   : faleconosco
    Created on : 18/04/2022, 09:39:04
    Author     : sala305b
--%>
<%@page import="modelo.Usuario"%>
<%
    String responsavel = "", caminho="../";
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    responsavel = "Olá," + user.getResponsavel();
    
       
%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fale Conosco</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="<%= caminho %>css/bootstrap.css" >
        <link rel="stylesheet" href="<%= caminho %>css/cliente/estilofaleconoscocliente.css" >
      
   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

     
    </head>

    <body>
        <!--No lugar de "never bar" tem que colocar a logo-->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div style="display:inline; float: left;">
                <a class="navbar-brand" href="indexc.jsp"><img src="<%= caminho%>img/logoacademia128.png" width="128px" alt="imagem" /></a>
            </div>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--Aqui é o menu da parte de cima da página web-->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                     <li class="nav-item">
                        <a class="nav-link" href="<%= caminho%>cliente/empresac.jsp"><h5>Empresa</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a  class="nav-link" href="<%= caminho%>cliente/atividadesc.jsp"><h5>Atividade</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a  class="nav-link" href="<%=caminho%>cliente/planosc.jsp"><h5>Planos</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a  class="nav-link" href="<%= caminho%>cliente/telaagendamentoc.jsp"><h5>Agendamento</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a  class="nav-link" href="<%= caminho%>cliente/faleconoscoc.jsp"><h5>Fale Conosco</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <img class="user" src="<%=caminho%>img/user(4).png" width="50px" alt="imagem"> <span><%= responsavel%></span>

                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a class="btn btn-danger my-2 my-sm-0" href="../tela/index.jsp">Sair</a>
                </form>
            </div>

        </nav>  


        <form>
            <div class titulo>
                <h2 class="fc"><center>Mande-nos seu recado, sugestão, criticas, elogios</center></h2>
            </div>


            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">Username</label><p>
                        <div class="input-group mb-2">
                            <label class="icones">
                                <i class="fas fa-user"></i>
                            </label>
                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Username">
                        </div>
                    </div>
                </div>
                <div class="col-6">

                </div>
            </div>

            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">Email</label><p>
                        <div class="input-group mb-2">
                            <label class="icone2">
                                <i class="fas fa-envelope"></i>
                            </label>
                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Email">
                        </div>
                    </div>

                </div>
                <div class="col-6">

                </div>
            </div>

            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only"   for="inlineFormInputGroup">Tel</label><p>
                        <div class="input-group mb-2">
                            <label class="icone3">
                                <i class="fas fa-phone"></i>
                            </label>
                            <input type="text" id="txtDddTelefone" class="form-control" id="inlineFormInputGroup" placeholder="Tel">
                        </div>
                    </div>

                </div>
                <div class="col-6">

                </div>
            </div>

            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">UF</label><p>
                        <div class="input-group mb-2">

                            <div class="row">

                                <div class="col-1"> <i class="fas fa-map-marker-alt"></i></div>
                                <div class="col-5">
                                    <select class="form-control">
                                        <option>Selecione</option>
                                        <option>ES</option>
                                        <option>SP</option>
                                        <option>RJ</option>
                                        <option>MG</option>
                                        <option>PB</option>
                                        <option>AM</option>
                                        <option>SC</option>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Cidade">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-3">

                </div>
                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup"></label>
                        <div class="input-group mb-2">

                            <div class="row ">

                                <div style="padding-right: 0;" class="col-1"> </div>
                                <div style="padding-left: 0;" class="col-11">

                                    <textarea class="form-control" rows="7" cols="130">                               
                                    </textarea>

                                </div>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="col-3">

                </div>
            </div>


            <div class="row">
                <div class="col-8">
                </div>
                <div class="col-3" >
                    
                    <button id="btn" class="btn btn-primary" type="submit">Enviar</button>
                </div>
            </div>

            <!--Aqui é o roda pé e as informaçoes do roda pé-->
            <footer class="bg-dark text-light">
                <div class="container-fluid py-3" style="margin-top: 100px;">
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
                                            <img class="img" src="<%= caminho %>img/instagram (1).png" width="32px" alt="imagem">
                                            <a href="#">@NeverFatDf</a></li>
                                        <li class="nav-link">
                                            <img class="img" src="<%= caminho %>img/icons8-facebook-48.png" width="32px" alt="imagem">
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







        </form>




        <script type="text/javascript" src="<%= caminho %>js/jquery.js"></script>
        <script type="text/javascript" src="<%= caminho %>js/bootstrap.js"></script>
        <script type="text/javascript" src="<%= caminho %>js/jquery.mask.js"></script>
          <script type="text/javascript">

            jQuery(document).ready(function ($) {
                
                $("#txtDddTelefone").mask("(00) 00000-0000");

            });







        </script>
    </body>
</html>
