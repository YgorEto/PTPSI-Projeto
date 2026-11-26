<?php
// Inicia a sessão e protege as páginas internas.
session_start();

// Só deixa continuar quem tem sessão iniciada com o perfil certo.
// $perfil: 'condutor' ou 'administrador'
function exigir_perfil($perfil)
{
    if (!isset($_SESSION['perfil']) || $_SESSION['perfil'] !== $perfil) {
        if ($perfil === 'administrador') {
            header('Location: /admin/login.php');
        } else {
            header('Location: /condutor/login.php');
        }
        exit;
    }
}
