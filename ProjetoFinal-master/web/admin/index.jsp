<%-- 
    Document   : index
    Created on : 30/03/2022, 10:34:41
    Author     : Sala305b
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
        <title>HOME</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="<%= caminho%>css/bootstrap.css" >
        <link rel="stylesheet" href="<%= caminho%>css/admin/estiloindex.css" >
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


    </head>
    <body>
        <div>
            <!--No lugar de "never bar" tem que colocar a logo-->
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
                        <li class="nav-item ">
                            <a class="nav-link" href="listarusuario.jsp"><h5>Listar Usuarios</h5> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="cadastroservico.jsp"><h5>Cadastrar Serviço</h5> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="listarservico.jsp"><h5>Listar Serviço</h5> <span class="sr-only">(current)</span></a>
                        </li>
                        <!--                        <li class="nav-item ">
                                                    <a class="nav-link" href="#"><h5>Contato</h5> <span class="sr-only">(current)</span></a>
                                                </li>-->
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

                <!--                    <form class="form-inline my-2 my-lg-0">
                                        <a class="btn btn-warning my-2 my-sm-0" href="../tela/loginmain.jsp">Entrar</a>
                                    </form>-->
            </nav> 



            <div class="table">
                <div class="container-fluid">
                    <!--Codigo para adicionar o conteudo na tela -->
                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6">
                            <h2 class="h2In"><center>BEM VINDO Á NEVERFAT</center></h2>
                            <p class="p" style="text-align: center;">
                                SOMOS UMA ACADEMIA FOCADA NA SUA SAÚDE,
                                VENHA FAZER PARTE DA NOSSA FAMILIA! 
                            </p> 
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <!--Aqui é o codigo das imagens para adicionar no site-->      
                    <div class="row">
                        <div class="imgfundo">
                            <img src="<%= caminho%>img/A.jpg"  alt="imagem-academia" />
                        </div>
                        <div class="col-12">
                            <div><h2><center>PROMOÇÕES</center></h2></div> 
                        </div>
                        <div class="img">
                            <img  class="C" src="<%= caminho%>img/B.png"  alt="imagem-C" />
                        </div>
                        <div class="img">
                            <img  class="D"  src="<%= caminho%>img/D.png"  alt="imagem-D" />
                            <div class="texto" >
                                QUALQUER MODALIDADE POR APENAS 79,99 
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div><h2 class="h2P"><center>PLANOS</center></h2></div> 
                        </div>
                    </div>
                    <div class="row">

                        <div class="img">
                            <img   class="E" src="<%= caminho%>img/E.png"  alt="imagem-E" />
                        </div>
                    </div>
                </div>
            </div>

            <!--Aqui é o roda pé e as informaçoes do roda pé-->
            <div class="row" style="margin-top: 39%;">

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

    </body>
</html>

