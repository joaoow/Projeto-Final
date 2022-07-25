<%-- 
    Document   : telaservicos
    Created on : 18/04/2022, 08:45:35
    Author     : sala305b
--%>
<%@page import="modelo.Usuario"%>
<%
    String responsavel = "", caminho = "../";
    
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    responsavel = "Olá," + user.getResponsavel();
%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ATIVIDADES</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="<%=caminho%>css/bootstrap.css" >
        <link rel="stylesheet" href="<%=caminho%>css/cliente/estiloatividadecliente.css" >
      
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
                    <li class="nav-item active ">
                        <a  class="nav-link" href="<%= caminho%>cliente/atividadesc.jsp"><h5>Atividade</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a  class="nav-link" href="<%=caminho%>cliente/planosc.jsp"><h5>Planos</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a  class="nav-link" href="<%= caminho%>cliente/telaagendamentoc.jsp"><h5>Agendamento</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
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

        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <h1 class="servico">Atividades</h1>
                </div>
            </div>


            <div class="jiujitsu"  style="padding: 50px;">
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <img src="<%=caminho%>img/jiujitsu.png" alt="imagem">
                            </div>
                            <div class="col-6">
                                <h3 >Jiu Jitsu</h3>
                                <h4 class="jiujutso">Jiu Jitsu é uma arte marcial japonesa
                                    que utiliza uma série de diferentes 
                                    técnicas e golpes corporais com 
                                    o objetivo de derrotar ou imobilizar o oponente.
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-4"></div>
                </div>
            </div>





            <div class="judo" style="padding: 50px;">
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <img src="<%=caminho%>img/judo.pg.jpg" alt="imagem">
                            </div>
                            <div class="col-6">
                                <h3 >Judô</h3>
                                <h4 class="judo">
                                    Esse esporte de defesa pessoal tem como 
                                    objetivos melhorar a coordenação motora, a concentração, a 
                                    autoconfiança, além de fortalecer o físico, o espírito e a mente.
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-4"></div>
                </div>
            </div>




            <div class="cross"  style="padding: 25px;">
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <img src="<%=caminho%>img/crossfit-emagrece.jpg" alt="imagem">
                            </div>
                            <div class="col-6">
                                <h3>Crossfit</h3>
                                <h4 class="cross">
                                    O CrossFit é promovido como uma filosofia 
                                    de exercício físico e um esporte competitivo, incorporando 
                                    elementos de treinamento intervalado de alta intensidade.
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-4"></div>
                </div>
            </div>

            <div class="pilates"  style="padding: 25px;">
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="col-6">
                                <img src="<%=caminho%>img/pilates.jpg" alt="imagem">
                            </div>
                            <div class="col-6">
                                <h3 >Pilates</h3>
                                <h4 class="pilates">
                                    Pilates é um método de exercícios que visa trabalhar 
                                    a conexão entre mente e corpo, como uma unidade, de 
                                    modo a melhorar a consciência corporal e dessa 
                                    forma promover outros benefícios.
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-4"></div>
                </div>
            </div>








        </div>



        <!--Aqui é o roda pé e as informaçoes do roda pé-->
        <div class="row" >

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
                                            <li class="nav-link"><h5>Redes Socias</h5></li>

                                            <li class="nav-link">
                                                <img class="img" src="<%=caminho%>img/instagram (1).png" width="32px" alt="imagem">
                                                <a href="#">@NeverFatDf</a></li>
                                            <li class="nav-link">
                                                <img class="img" src="<%=caminho%>img/icons8-facebook-48.png" width="32px" alt="imagem">
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

        <script type="text/javascript" src="<%= caminho%>js/jquery.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/bootstrap.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/jquery.mask.js"></script>

    </body>
</html>
