<?php
    include_once("../classes/Pet.php");

    $objCliente = new Cliente();
    $objCliente -> selecionarClientes();
    if ($objCliente -> retornoBD != null) {

        $objPet = new Pet();
        $objPet -> selecionarPorId(11);
        
        if (isset($_GET['id'])) {
            $objPet -> selecionarPorId($_GET['id']);
        }
        else if (isset($_POST['idClientePet'])) {
            $objPet -> selecionarPoridClientePet($_POST['idClientePet']);
        }
        else if (isset($_POST['nomePet'])) {
            $objPet -> selecionarPet($_POST['nomePet']);
        }
        else {
            $objPet -> selecionarPets();
        }

        if ($objPet -> retornoBD != null) {
?>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped table-hover">
                        <tr><br> <br>
                            <th width="10%">#</th>
                            <th width="25%">Nome</th>
                            <th width="20%">Raça</th>
                            <th width="25%">Observação</th>
                            <th width="20%">Cliente ID</th>
                        </tr>
                        <?php
                            while ($retorno = $objPet -> retornoBD -> fetch_object()) {
                                echo '<tr><td>' . $retorno -> id_pet . '</td><td>' .
                                $retorno -> nome_pet . '</td><td>' .
                                $retorno -> raca_pet . '</td><td>' .
                                $retorno -> observacao_pet . '</td><td>' .
                                $retorno -> id_cliente . '</td>';
                            }
                        ?>
                    </table>
                </div>
            </div>
            <br> <br><br> <br><br> <br>
<?php
    }}
    else {
        echo "<script>alert('Falha ao consultar no Banco de Dados!')</script>";
    }
?>