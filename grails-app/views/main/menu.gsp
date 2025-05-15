<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pokémon App</title>
    <style>
    .menu-container {
        text-align: center;
        padding: 20px;
    }

    .menu-buttons {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }

    .menu-button {
        background-color: #ef5350;
        color: white;
        text-decoration: none;
        padding: 20px 30px;
        border-radius: 10px;
        font-size: 1.2rem;
        font-weight: bold;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        width: 180px;
        height: 180px;
        cursor: default; /* Evita el cursor de enlace si no quieres clic */
    }

    .menu-button:hover {
        background-color: #d32f2f;
        transform: scale(1.05);
    }

    .menu-button img {
        width: 80px;
        height: 80px;
        margin-bottom: 10px;
    }
    </style>
</head>
<body>
<div class="menu-container">
    <h2>¡Explora la Pokémon App!</h2>
    <div class="menu-buttons">
        <a href="javascript:void(0);" class="menu-button">
            <img src="images/sobre.png" alt="Abrir Sobres"/> Abrir Sobres
        </a>
        <a href="javascript:void(0);" class="menu-button">
            <img src="images/pokedex.png" alt="Pokédex"/> Mi Pokédex
        </a>
        <a href="javascript:void(0);" class="menu-button">
            <img src="images/combate.png" alt="Combate"/> Combate
        </a>
        <a href="javascript:void(0);" class="menu-button">
            <img src="images/intercambio.png" alt="Intercambio"/> Intercambio
        </a>
        <a href="javascript:void(0);" class="menu-button">
            <img src="images/mercado.png" alt="Mercado"/> Mercado
        </a>
    </div>
</div>
</body>
</html>
