<?php
// Página de teste da etapa 0: confirma a ligação à base de dados.
require 'includes/ligacao.php';

$resultado = mysqli_query($ligacao, 'SELECT COUNT(*) AS total FROM empresa');
$linha = mysqli_fetch_assoc($resultado);

$titulo = 'rapidSpot · Teste';
include 'includes/cabecalho.php';
?>
<main class="ecra-condutor p-4">
    <h1>Ligação OK</h1>
    <p class="texto-cinza">Empresas na base de dados: <?= $linha['total'] ?></p>
    <button class="btn btn-rapidspot w-100">Botão de teste</button>
</main>
<?php include 'includes/rodape.php'; ?>
