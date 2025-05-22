<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 22/5/25
  Time: 9:22
--%>

<meta name="layout" content="main"/>
<h2 class="page-title">Amigos</h2>

<style>
.section {
    margin: 20px 0;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.section h3 {
    margin-bottom: 15px;
    color: #333;
    font-size: 1.5rem;
}

.form-container {
    display: flex;
    gap: 10px;
    align-items: center;
}

.form-container input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
}

.form-container button {
    background-color: #ef5350;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.form-container button:hover {
    background-color: #d32f2f;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #eee;
}

li:last-child {
    border-bottom: none;
}

.alert {
    background-color: #ffeb3b;
    color: #333;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 15px;
    text-align: center;
}

.action-buttons button {
    background-color: #4caf50;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 0.9rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.action-buttons button:hover {
    background-color: #388e3c;
}

.action-buttons .delete-button {
    background-color: #f44336;
}

.action-buttons .delete-button:hover {
    background-color: #d32f2f;
}
</style>

<div class="section">
    <h3>Enviar solicitud de amistad</h3>
    <g:if test="${flash.message}">
        <div class="alert">
            ${flash.message}
        </div>
    </g:if>
    <form class="form-container" action="${createLink(controller: 'friend', action: 'sendRequest')}" method="post">
        <input type="text" name="username" placeholder="Nombre de usuario" required />
        <button type="submit" onclick="return confirm('¿Estás seguro de que deseas enviar esta solicitud de amistad?')">Enviar</button>
    </form>
</div>
<div class="section">
    <h3>Solicitudes recibidas</h3>
    <ul>
        <g:each in="${receivedRequests}" var="request">
            <li>
                <span>${request.sender.username}</span>
                <form class="action-buttons" action="${createLink(controller: 'friend', action: 'acceptRequest', params: [requestId: request.id])}" method="post" style="display:inline;">
                    <button type="submit" onclick="return confirm('¿Estás seguro de que deseas aceptar esta solicitud de amistad?')">Aceptar</button>
                </form>
            </li>
        </g:each>
    </ul>
</div>
<div class="section">
    <h3>Solicitudes enviadas</h3>
    <ul>
        <g:each in="${sentRequests}" var="request">
            <li>
                ${request.receiver.username} <span>(Pendiente)</span>
                <form class="action-buttons" action="${createLink(controller: 'friend', action: 'deleteRequest', params: [requestId: request.id])}" method="post" style="display:inline;">
                    <button type="submit" class="delete-button" onclick="return confirm('¿Estás seguro de que deseas cancelar esta solicitud de amistad?')">Cancelar</button>
                </form>
            </li>
        </g:each>
    </ul>
</div>

<div class="section">
    <h3>Lista de amigos</h3>
    <ul>
        <g:each in="${friends}" var="friend">
            <li>
                <span>
                    <g:if test="${friend.sender.id == currentUser.id}">
                        ${friend.receiver.username}
                    </g:if>
                    <g:if test="${friend.receiver.id == currentUser.id}">
                        ${friend.sender.username}
                    </g:if>
                </span>
                <form class="action-buttons" action="${createLink(controller: 'friend', action: 'deleteFriend', params: [friendId: (friend.sender.id == currentUser.id ? friend.receiver.id : friend.sender.id)])}" method="post" style="display:inline;">
                    <button type="submit" class="delete-button" onclick="return confirm('¿Estás seguro de que deseas eliminar a este amigo?')">Eliminar</button>
                </form>
            </li>
        </g:each>
    </ul>
</div>