<style>
.menu-container {
    text-align: center;
    padding: 20px;
}

.menu-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Más espacio entre botones */
    margin-top: 20px;
}

.menu-button {
    background-color: #ef5350;
    color: white;
    text-decoration: none;
    padding: 20px 30px; /* Aumentar padding */
    border-radius: 10px;
    font-size: 1.2rem; /* Aumentar tamaño de texto */
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column; /* Alinear imagen y texto verticalmente */
    width: 180px; /* Tamaño uniforme para los botones */
    height: 180px;
}

.menu-button:hover {
    background-color: #d32f2f;
    transform: scale(1.05);
}

.menu-button img {
    width: 80px; /* Aumentar tamaño de las imágenes */
    height: 80px;
    margin-bottom: 10px; /* Espacio entre imagen y texto */
}
</style>

<div class="menu-container">
    <h2>¡Explora la Pokémon App!</h2>
    <div class="menu-buttons">
        <g:link controller="main" action="abrirSobres" class="menu-button">
            <img src="${resource(dir: 'images', file: 'sobre.png')}" alt="Abrir Sobres"/> Abrir Sobres
        </g:link>
        <g:link controller="main" action="pokedex" class="menu-button">
            <img src="${resource(dir: 'images', file: 'pokedex.png')}" alt="Pokédex"/> Mi Pokédex
        </g:link>
        <g:link controller="battle" action="selectTeam" class="menu-button">
            <img src="${resource(dir: 'images', file: 'combate.png')}" alt="Combate"/> Combate
        </g:link>
        <g:link controller="trade" action="intercambios" class="menu-button">
            <img src="${resource(dir: 'images', file: 'intercambio.png')}" alt="Intercambio"/> Intercambio
        </g:link>
        <g:link controller="market" action="mercado" class="menu-button">
            <img src="${resource(dir: 'images', file: 'mercado.png')}" alt="Mercado"/> Mercado
        </g:link>
    </div>
</div>