<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

require("bd/conexao.php");

date_default_timezone_set('America/Sao_Paulo');

?>

<html>

    <head>
        <meta charset="UTF-8">
        <title>Site</title>

        <link rel="stylesheet" type="text/css" href="css/estilo.css" />
    </head>

    <body>

        <div class="container">

            <header>
                <h1>Mercado digital</h1>
            </header>

            <div class="menu">
                <ul>
                    <a href="?pg=inicio"><li>Início</li></a>
                    <?php 
                        if(!isset($_SESSION["nome"])){
                    ?>
                        <a href="?pg=sobre"><li>Sobre</li></a>
                        <a href="?pg=usuario/cadastrar_usuario"><li>Usuários</li></a>
                        <a href="?pg=contato/formulario"><li>Contato</li></a>
                        <a href="?pg=login/formulario"><li>Login</li></a>
                        
                    <?php
                        }
                        else{
                    ?>
                        <a href="?pg=area_restrita"><li>Área restrita</li></a>
                        <a href="?pg=itens/cadastrar_itens"><li>Cadastro de itens</li></a>
                        <a href="?pg=itens/itens_listar"><li>Listar itens</li></a>
                        <a href="?pg=categorias/cadastrar_categoria"><li>Cadastros de categorias</li></a>
                        
                    <?php
                        }
                    ?>
                </ul>
            </div>

            <main>
            
                <?php
                    $pg = (isset($_GET["pg"]) && !empty($_GET["pg"])) ? $_GET["pg"] : "inicio";

                    include("paginas/".$pg.".php");

                ?>

            </main>

            <footer>
                <h4>Copyright &copy; 2021 - Programação e design para Web - Abner da Silva Luiz</h4>
            </footer>

        </div>

    </body>
    
</html>