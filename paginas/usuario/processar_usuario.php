<?php


if(!empty($_POST)){
    
    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $telefone = $_POST["telefone"];
    $senha = $_POST["senha"];
    $user= $_SESSION["nome"];


    $stmt = $conn->prepare("INSERT INTO usuario (nome, email, telefone, senha) VALUES (:nome, :email, :telefone, :senha)");
   
    $bind_param = ["nome" => $nome, "email" => $email, "telefone" => $telefone, "senha" => md5($senha),];
    

    try {
        $conn->beginTransaction();
        $stmt->execute($bind_param);
        $last_id = $conn->lastInsertId();
        echo '<div class="msg-cadastro-contato msg-cadastro-sucesso">Registro ' . $last_id . ' inserido no banco!</div>';
        $conn->commit();
    } catch(PDOExecption $e) {
        $conn->rollback();
        echo '<div class="msg-cadastro-contato msg-cadastro-erro">Erro ao inserir registro no banco: ' . $e->getMessage() . '</div>';
    }

}

?>

<div id="btn-limpar-sessao">
    <a href="?pg=usuario/cadastrar_usuario">Voltar</a>
</div>