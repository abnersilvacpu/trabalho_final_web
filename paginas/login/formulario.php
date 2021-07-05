<?php

if(isset($_SESSION["nome"])){
    header("Location: ?pg=area_restrita");
}

?>

<div id="div-form">
    
    <h1>Login</h1>

    <form method="POST" action="?pg=login/processar_formulario">
        <div>
            <label>e-mail</label>
            <input type="text" name="email" required placeholder="Digite seu e-mail..." />
        </div>
        <div>
            <label>Senha</label>
            <input type="password" name="senha" required placeholder="Digite sua senha..." />
        </div>
        <button type="submit" name="acao">Enviar</button>
    </form>
    
<div>