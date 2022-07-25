<%-- 
    Document   : login
    Created on : 13/04/2022, 09:37:04
    Author     : sala305b
--%>
<%
    String responsavel = "", caminho = "../";
   

%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <head>
        <link  rel="stylesheet" href="<%= caminho%>css/bootstrap.css"/>
        <link rel="stylesheet" href="<%= caminho%>css/padrao/estilologin.css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

    </head>
    <body>
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
                    <li class="nav-item">
                        <a class="nav-link" href="<%= caminho%>tela/empresa.jsp"><h5>Empresa</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= caminho%>tela/atividades.jsp"><h5>Atividades</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%=caminho%>tela/planos.jsp"><h5>Planos</h5> <span class="sr-only">(current)</span></a>
                    </li>
                  
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= caminho%>tela/faleconosco.jsp"><h5>Fale Conosco</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <img class="user" src="<%= caminho%>img/user(4).png" width="50px" alt="imagem"> <span><%= responsavel%></span>

                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a id="btn" class="btn btn-warning my-2 my-sm-0" href="<%= caminho%>tela/loginmain.jsp">Entrar</a>
                </form>
            </div>

        </nav>  



        <div class="imgfundo">   
            <img src="<%= caminho%>img/03 academia.jpg" alt="imagem-academia"/>
        </div>


        <div class="container"> 

            <div class="row">
                <div class="col-6 mx-auto p-4 m-5 border-light shadow-sm">
                    <h3 class="pb-3">Login </h3>

                    <div class="form-style">

                        <form action="<%= caminho%>UsuarioServlet" method="POST">
                            <div class="form-group pb-3">    
                                <input required="" type="text" placeholder="Email" class="form-control"  name="login" id="exampleInputEmail1" aria-describedby="emailHelp">   
                            </div>
                            <div class="form-group pb-3">   
                                <input required="" type="password" placeholder="Senha"  name="senha" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="d-flex align-items-center justify-content-between">

                                <div><a href="#" class="mudarcor">Esqueceu a senha?</a></div>
                            </div>
                            <div class="pb-2">
                                <button type="submit" class="btn btn-dark w-100 font-weight-bold mt-2">Entrar</button>
                            </div>

                            <div class="pt-3 text-center">
                                Crie sua conta aqui: <a href="cadastrousuario.jsp">Criar conta</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <!--Aqui é o roda pé e as informaçoes do roda pé-->

        <footer class="bg-dark text-light" >
            <div class="container-fluid py-3" >

                <div class="row" >

                    <div class="col-12">

                        <div class="row" >
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
                                        <img class="img" src="<%= caminho%>img/instagram (1).png" width="32px" alt="imagem">
                                        <a href="#">@NeverFatDf</a></li>
                                    <li class="nav-link">
                                        <img class="img" src="<%= caminho%>img/icons8-facebook-48.png" width="32px" alt="imagem">
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

        <script type="text/javascript" src="<%= caminho%>js/jquery.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/bootstrap.js"></script>
        <script type="text/javascript" src="<%= caminho%>js/jquery.mask.js"></script>
    </form>
</body>
</html>
