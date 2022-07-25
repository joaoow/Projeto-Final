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
        <link rel="stylesheet" href="<%= caminho%>css/cliente/estiloagendamentocliente.css" >
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


    </head>

    <body style="color: white;">



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
                        <a class="nav-link" href="<%= caminho%>cliente/atividadesc.jsp"><h5>Atividades</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= caminho%>cliente/planosc.jsp"><h5>Planos</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="<%= caminho%>cliente/telaagendamentoc.jsp"><h5>Agendamento</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= caminho%>cliente/faleconoscoc.jsp"><h5>Fale Conosco</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <img class="user" src="<%= caminho%>img/user(4).png" width="50px" alt="imagem"> <span><%= responsavel%></span>

                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a  class="btn btn-danger my-2 my-sm-0" href="../tela/index.jsp">Sair</a>
                </form>
            </div>

        </nav>  


 <div class="container-fluid">
     <div class="row">
<div class="imgfundoagend">   
    <img src="<%=caminho%>img/peso.png" alt="imagem"/>
     </div>
     </div>
     <d67iv class="Meio">
                <div class="row">
                    <div class="col-12">
                        <h3>Selecione a atividade</h3> &nbsp;
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <select  id="atividade" class="form-control" onChange="valorDocumento()" style="font-size: 25px;">
                            <option >Seleciona a atividade</option>
                            <option value="j">Judô</option>
                            <option value="jj">Jiu Jitsu</option>
                            <option value="p">Pilates</option>
                            <option value="c">Crossfit</option>
                        </select>
                    </div> 
                    
                </div>
                            &nbsp;
                <div class="row">
                    <div class="col-12">
                        <h3>Preço:</h3>
                    </div>
                </div>
                           
                <div class="row">
                    <div class="col-12">
                        <span id="valor-servico" style="font-size: 25px;">R$ 50,00</span>
                    </div>
                </div>
                             &nbsp;

                <div class="row">
                    <div class="col-12">
                        <h3>Horário:</h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <span id="horario" style="font-size: 25px;">00:00</span>
                    </div>
                </div>
                             
                             &nbsp;
                             
                
                <form class="form-inline my-2 my-lg-0" >
                    <a class="btn btn-warning my-2 my-sm-0" href="" style="font-size: 25px;">Agendar</a>
                </form>
                
                     
            </div> 
            </div>
           
     
                <!--Aqui é o roda pé e as informaçoes do roda pé-->
                <div class="row" style="margin-top:25%;">

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
                <script type="text/javascript" src="<%= caminho%>js/jquery.js"></script>
                <script type="text/javascript" src="<%= caminho%>js/bootstrap.js"></script>
                <script type="text/javascript" src="<%= caminho%>js/jquery.mask.js"></script>
                <script type="text/javascript">
                            function valorDocumento() {
                                var atividade = document.getElementById("atividade");
                                var selecionado = atividade.options[atividade.selectedIndex].value;

                                if (selecionado === "j") {
                                    document.getElementById("valor-servico").innerHTML = 'R$49,99 Reais';
                                    document.getElementById("horario").innerHTML = '15:00 ás 16:00 (Vespertino)';
                                  


                                }
                                if (selecionado === "jj") {
                                    document.getElementById("valor-servico").innerHTML = 'R$49,99 Reais';
                                    document.getElementById("horario").innerHTML = '16:30 ás 17:30 (Vespertino)';
                                }
                                if (selecionado === "p") {
                                    document.getElementById("valor-servico").innerHTML = 'R$79,99 Reais';
                                    document.getElementById("horario").innerHTML = '8:30 ás 9:30 (Matutino)';
                                }
                                if (selecionado === "c") {
                                    document.getElementById("valor-servico").innerHTML = 'R$69,99 Reais';
                                    document.getElementById("horario").innerHTML = '18:00 ás 19:00 (Noturno)';
                                }

                            }
                            ;
                </script>
                


                </body>
                </html>

