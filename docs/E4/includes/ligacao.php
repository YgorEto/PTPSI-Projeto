<?php
// Abre a ligação à base de dados. Usar com: require 'includes/ligacao.php';
require __DIR__ . '/../config.php';

// Desliga os avisos automáticos para tratarmos o erro nós mesmos
mysqli_report(MYSQLI_REPORT_OFF);

$ligacao = mysqli_connect($BD_SERVIDOR, $BD_UTILIZADOR, $BD_PASSE, $BD_NOME);

if (!$ligacao) {
    die('Erro de ligação à base de dados.');
}

// Para os acentos aparecerem bem
mysqli_set_charset($ligacao, 'utf8mb4');
