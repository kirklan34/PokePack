<meta name="layout" content="main"/>
<h2 class="page-title">Registro</h2>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}
.page-title {
    text-align: center;
    color: #333;
    margin-top: 20px;
    font-size: 2rem;
}
.login-form {
    max-width: 400px;
    margin: 20px auto;
    background: white;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}
input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 1rem;
    box-sizing: border-box;
}
input[type="submit"] {
    background-color: #ffcb05;
    border: none;
    padding: 12px;
    width: 100%;
    border-radius: 6px;
    font-size: 1rem;
    color: #333;
    cursor: pointer;
    transition: background-color 0.3s;
}
input[type="submit"]:hover {
    background-color: #ef5350;
    color: white;
}
label {
    font-weight: bold;
    color: #555;
}
.error-message {
    color: red;
    font-size: 0.9rem;
    margin-bottom: 10px;
    text-align: center;
}
</style>
<div class="login-form">
    <g:if test="${flash.message}">
        <div class="error-message">${flash.message}</div>
    </g:if>
    <g:form action="saveUser">
        <label>Usuario:</label><br/>
        <input type="text" name="username" placeholder="Ingresa tu usuario"/><br/>
        <label>Contraseña:</label><br/>
        <input type="password" name="password" placeholder="Ingresa tu contraseña"/><br/>
        <input type="submit" value="Registrar"/>
    </g:form>
</div>
