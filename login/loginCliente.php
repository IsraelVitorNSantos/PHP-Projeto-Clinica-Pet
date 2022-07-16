<?php
    include("../classes/Conexao.php");
    include("../classes/Utilidades.php");

    session_start();

    if (isset($_POST['login'])) {
        $objConexao = new Conexao();
        $conexaoBD = $objConexao -> getConexao();
        $utilidades = new Utilidades();

        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $sql = "select * from cliente where email_cliente='$email' and cpf_cliente='$senha'";
        $retornoBD = $conexaoBD -> query($sql);
        $total = @mysqli_num_rows($retornoBD);

        if (!$total) {
            $utilidades -> redireciona("../indexCliente.html");
        }
        else {
            $_SESSION["administrador"] = false;
            $utilidades -> redireciona("../dashboard/dashboardCLiente.php");
        }
    }
