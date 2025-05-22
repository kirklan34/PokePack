<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 22/5/25
  Time: 9:26
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<h2 class="page-title">Iniciar Intercambio</h2>
<style>
.page-title {
    text-align: center;
    color: #333;
    margin-top: 20px;
    font-size: 2rem;
}
.form-container {
    max-width: 400px;
    margin: 30px auto;
    background: #fff;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
}
label {
    font-weight: bold;
    margin-top: 10px;
    display: block;
}
select, button {
    width: 100%;
    padding: 10px;
    margin-top: 8px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 1rem;
}
button, .g-submitButton {
    background: #ef5350;
    color: #fff;
    font-weight: bold;
    border: none;
    cursor: pointer;
    margin-top: 18px;
    transition: background 0.2s;
}
button:hover, .g-submitButton:hover {
    background: #ffcb05;
    color: #333;
}
input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 8px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 1rem;
    box-sizing: border-box; /* Asegura que el tamaño sea consistente */
}
</style>
<div class="form-container">
    <g:form controller="trade" action="cargarCartasIntercambio" method="get">
        <label>Selecciona el usuario con quien intercambiar:</label>
        <g:select name="targetUserId" from="${usuarios}" optionKey="id" optionValue="username" required="true"/>

        <label>Selecciona el set:</label>
        <div style="position: relative;">
            <input type="text" id="searchSetInput" placeholder="Buscar set..." style="width: 100%; padding: 10px; margin-bottom: 8px; border-radius: 6px; border: 1px solid #ccc; font-size: 1rem;" oninput="filterSets()" />
            <div id="setDropdownContainer" style="position: absolute; width: 100%; background: #fff; border: 1px solid #ccc; border-radius: 6px; max-height: 200px; overflow-y: auto; display: none; z-index: 1000;">
                <ul id="setDropdown" style="list-style: none; margin: 0; padding: 0;">
                    <g:each in="${sets}" var="set">
                        <li style="padding: 10px; cursor: pointer; display: flex; align-items: center;" onclick="selectSet('${set.setId}', '${set.name}')">
                            <img src="${set.logoUrl}" alt="${set.name}" style="width: 20px; height: 20px; margin-right: 10px;" />
                            ${set.name}
                        </li>
                    </g:each>
                </ul>
            </div>
            <input type="hidden" id="selectedSetId" name="setId" />
        </div>
        <button type="submit" class="g-submitButton">Siguiente</button>
    </g:form>
</div>
<script>
    function filterSets() {
        const input = document.getElementById('searchSetInput').value.toLowerCase();
        const dropdownContainer = document.getElementById('setDropdownContainer');
        const dropdown = document.getElementById('setDropdown');
        const items = dropdown.querySelectorAll('li');

        let hasVisibleItems = false;
        items.forEach(item => {
            const text = item.textContent.toLowerCase();
            const isVisible = text.includes(input);
            item.style.display = isVisible ? '' : 'none';
            if (isVisible) hasVisibleItems = true;
        });

        dropdownContainer.style.display = hasVisibleItems ? 'block' : 'none';
    }

    function selectSet(setId, setName) {
        document.getElementById('searchSetInput').value = setName;
        document.getElementById('selectedSetId').value = setId;
        document.getElementById('setDropdownContainer').style.display = 'none';
    }

    document.addEventListener('click', function (event) {
        const dropdownContainer = document.getElementById('setDropdownContainer');
        if (!dropdownContainer.contains(event.target) && event.target.id !== 'searchSetInput') {
            dropdownContainer.style.display = 'none';
        }
    });
</script>

