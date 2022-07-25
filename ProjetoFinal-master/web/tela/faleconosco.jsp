<%-- 
    Document   : faleconosco
    Created on : 18/04/2022, 09:39:04
    Author     : sala305b
--%>
<%@page import="modelo.FaleConosco"%>
<%
   String acao = "Enviar", idfalec = "", nome = "",email = "", ddd = "", telefone = "", uf = "", cidade = "", descricao = "", caminhoacao = "../FaleConoscoServlet", dir = "../";
    String caminho = " ../";

    FaleConosco fc = new  FaleConosco ();
    if (request.getParameter("acao") != null) {

        if (request.getParameter("acao").equals("Atualizar")) {

            dir = "../";

            idfalec = request.getParameter("idfalec");
            caminhoacao = "../ServicoServlet";
            boolean achou = fc.BuscarPorId(idfalec);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Fale Conosco não Encontrado');"
                        + "</script>");
            } else {
                acao = "Atualizar";
               idfalec = String.valueOf(fc.getId());
                nome = fc.getNome();
                email = fc.getEmail();
                ddd = fc.getDdd();
                telefone = fc.getTelefone();
                uf = fc.getUf();
                cidade = fc.getCidade();
                descricao = fc.getDescricao();
            }

        }

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fale Conosco</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="<%= caminho%>css/bootstrap.css" >
        <link rel="stylesheet" href="<%= caminho%>css/padrao/estilofaleconosco.css" >
        <!--        <link rel="stylesheet" href="css/padrao/estiloindex.css" >-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


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
                        <a class="nav-link" href="empresa.jsp"><h5>Empresa</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="atividades.jsp"><h5>Atividades</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="planos.jsp"><h5>Planos</h5> <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="faleconosco.jsp"><h5>Fale Conosco</h5> <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <img class="user" src="<%= caminho%>img/user(4).png" width="50px" alt="imagem"> <span></span>

                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a id="btnEntrar" class="btn btn-warning my-2 my-sm-0" href="loginmain.jsp">Entrar</a>
                </form>
            </div>

        </nav>  



        <div class titulo>
            <h2 class="fc"><center>Mande-nos seu recado, sugestão, criticas, elogios</center></h2>
        </div>

        <form action="../FaleConoscoServlet" method="POST">
            <input type="hidden" name="acao" value="<%=acao%>">
                <input  type="hidden"value="<%= idfalec%>" name="idfalec"/> 
            <div class="row">
                <div class="col-3">

                </div>

                <div class="col-6">
                    <div class="col-auto">
                        <label class="sr-only" for="inlineFormInputGroup">Nome Completo</label><p>
                        <div class="input-group mb-2">
                            <label class="icones">
                                <i class="fas fa-user"></i>
                            </label>
                            <input type="text" value="<%=nome%>" name="nome" class="form-control" id="inlineFormInputGroup" placeholder="Nome Completo">
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
                        <label class="sr-only" for="inlineFormInputGroup">E-mail</label><p>
                        <div class="input-group mb-2">
                            <label class="icone2">
                                <i class="fas fa-envelope"></i>
                            </label>
                            <input type="text" value="<%=email%>" name="email" class="form-control" id="inlineFormInputGroup" placeholder="E-mail">
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
                        <label class="sr-only"   for="inlineFormInputGroup">Telefone/Celular</label><p>
                        <div class="input-group mb-2">
                            <label class="icone3">
                                <i class="fas fa-phone"></i>
                            </label>
                            <input type="text" value="<%=ddd + telefone%>" name="dddtelefone" id="txtDddTelefone" class="form-control" id="inlineFormInputGroup" placeholder="Tel">
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
                                    <select name="uf" class="form-control">
                                        <option <%= uf.equals("") ? "selected" : ""%>
                                            value="">Selecione</option>
                                        <option <%= uf.equals("AC") ? "selected" : ""%>
                                            value="AC">Acre</option>
                                        <option <%= uf.equals("AL") ? "selected" : ""%>
                                            value="AL">Alagoas</option>
                                        <option <%= uf.equals("AP") ? "selected" : ""%>
                                            value="AP">Amapá</option>
                                        <option <%= uf.equals("AM") ? "selected" : ""%>
                                            value="AM">Amazonas</option>
                                        <option <%= uf.equals("BA") ? "selected" : ""%>
                                            value="BA">Bahia</option>
                                        <option <%= uf.equals("CE") ? "selected" : ""%>
                                            value="CE">Ceará</option>
                                        <option <%= uf.equals("DF") ? "selected" : ""%>
                                            value="DF">Distrito Federal</option>
                                        <option <%= uf.equals("ES") ? "selected" : ""%>
                                            value="ES">Espirito Santo</option>
                                        <option <%= uf.equals("GO") ? "selected" : ""%>
                                            value="GO">Goiás</option>
                                        <option <%= uf.equals("MA") ? "selected" : ""%>
                                            value="MA">Maranhão</option>
                                        <option <%= uf.equals("MS") ? "selected" : ""%>
                                            value="MS">Mato Grosso do Sul</option>
                                        <option <%= uf.equals("MT") ? "selected" : ""%>
                                            value="MT">Mato Grosso</option>
                                        <option <%= uf.equals("MG") ? "selected" : ""%>
                                            value="MG">Minas Gerais</option>
                                        <option <%= uf.equals("PA") ? "selected" : ""%>
                                            value="PA">Pará</option>
                                        <option <%= uf.equals("PB") ? "selected" : ""%>
                                            value="PB">Paraíba</option>
                                        <option <%= uf.equals("PR") ? "selected" : ""%>
                                            value="PR">Paraná</option>
                                        <option <%= uf.equals("PE") ? "selected" : ""%>
                                            value="PE">Pernambuco</option>
                                        <option <%= uf.equals("PI") ? "selected" : ""%>
                                            value="PI">Piauí</option>
                                        <option <%= uf.equals("RJ") ? "selected" : ""%>
                                            value="RJ">Rio de Janeiro</option>
                                        <option <%= uf.equals("RN") ? "selected" : ""%> 
                                            value="RN">Rio Grande do Norte</option>
                                        <option <%= uf.equals("RS") ? "selected" : ""%> 
                                            value="RS">Rio Grande do Sul</option>
                                        <option <%= uf.equals("RO") ? "selected" : ""%> 
                                            value="RO">Rondônia</option>
                                        <option <%= uf.equals("RR") ? "selected" : ""%> 
                                            value="RR">Roraima</option>
                                        <option <%= uf.equals("SC") ? "selected" : ""%> 
                                            value="SC">Santa Catarina</option>
                                        <option <%= uf.equals("SP") ? "selected" : ""%> 
                                            value="SP">São Paulo</option>
                                        <option <%= uf.equals("SE") ? "selected" : ""%>
                                            value="SE">Sergipe</option>
                                        <option <%= uf.equals("TO") ? "selected" : ""%> 
                                            value="TO">Tocantins</option>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <input type="text"     value="<%=cidade%>" name="cidade" class="form-control" id="inlineFormInputGroup" placeholder="Cidade">
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
                                <div style="padding-left: 0;" class="col-12">
                                    <textarea   name="descricao" class="txt form-control" rows="8" cols="130"> 
                               <%=descricao%>
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

                    <input id="btn" class="btn btn-primary" type="submit" value="<%=acao%>"/>
                </div>
            </div>
        </form>

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
        <script type="text/javascript">

            jQuery(document).ready(function ($) {

                $("#txtDddTelefone").mask("(00) 00000-0000");
            });








        </script>
    </body>
</html>
