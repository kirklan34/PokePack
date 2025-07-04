<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 22/5/25
  Time: 9:25
--%>

<meta name="layout" content="main"/>
<h2>Selecciona una colección</h2>
<style>
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Increase card size */
    gap: 20px; /* Add more spacing between cards */
    padding: 10px;
}
.set-card {
    background-color: white;
    padding: 10px; /* Reducir padding */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 5px; /* Reducir espacio entre elementos */
    position: relative;
    overflow: hidden; /* Evitar desbordamiento */
}
.set-card img {
    width: 100%;
    height: 150px; /* Reducir altura de la imagen */
    object-fit: contain;
}
.set-card a {
    margin-top: 5px;
    background-color: #ffcb05;
    padding: 8px 10px; /* Ajustar padding */
    border-radius: 8px;
    text-decoration: none;
    font-weight: bold;
    color: #333;
    display: inline-block;
    width: 90%; /* Evitar que los botones se salgan */
    text-align: center;
    box-sizing: border-box; /* Incluir padding en el ancho */
}
.set-card .favorite-button {
    font-size: 20px; /* Reducir tamaño del ícono */
    color: gray;
    background: none;
    border: none;
    cursor: pointer;
    transition: color 0.3s ease;
    position: absolute;
    top: 5px; /* Ajustar posición */
    right: 5px;
}
.set-card .favorite-button.active {
    color: gold;
}
.search-bar {
    margin: 20px auto;
    text-align: center;
}
.search-bar input {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
}
</style>

<div class="search-bar">
    <input type="text" id="searchInput" placeholder="Buscar colección...">
</div>

<div class="grid" id="setGrid">
    <g:each in="${sets}" var="set">
        <div class="set-card">
            <button
                    data-set-id="${set.id}"
                    onclick="toggleFavorite(this)"
                    class="favorite-button ${set.isFavorite ? 'active' : ''}">
                ★
            </button>
            <img src="${set.logoUrl}" alt="${set.name}" onerror="this.src='/images/default.png'"/>
            <p>${set.name}</p>
            <p>Costo: 50 Pokémonedas</p>
            <g:link action="abrirSobre" params="[setId: set.id]"
                    onclick="return handleOpenPack(this, '${set.name}')">
                Abrir sobre
            </g:link>
            <g:link action="abrirDiezSobres" params="[setId: set.id]"
                    onclick="return confirm('¿Estás seguro de que deseas abrir 10 sobres de la colección ${set.name}?')">
                Abrir 10 sobres
            </g:link>
        </div>
    </g:each>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("searchInput");
        const setGrid = document.getElementById("setGrid");
        const setCards = setGrid.querySelectorAll(".set-card");

        searchInput.addEventListener("input", function () {
            const query = searchInput.value.toLowerCase();
            setCards.forEach(card => {
                const setName = card.querySelector("p").textContent.toLowerCase();
                card.style.display = setName.includes(query) ? "block" : "none";
            });
        });
    });

    function toggleFavorite(button) {
        const setId = button.getAttribute('data-set-id');
        fetch(`/main/toggleFavorite`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ setId })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    button.classList.toggle('active', data.isFavorite);
                    location.reload();
                } else {
                    alert(data.message || 'Error al actualizar el favorito.');
                }
            })
            .catch(() => alert('Error al conectar con el servidor.'));
    }

    function handleOpenPack(button, setName) {
        if (!confirm(`¿Estás seguro de que deseas abrir un sobre de la colección ${setName}?`)) {
            return false;
        }

        // Deshabilitar el botón y mostrar un mensaje de carga
        button.innerHTML = "Abriendo sobre...";
        button.style.pointerEvents = "none";
        button.style.opacity = "0.6";

        // Permitir que el enlace funcione
        return true;
    }

</script>
