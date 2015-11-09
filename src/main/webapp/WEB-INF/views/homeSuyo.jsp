<%@ include file="../fragments/header.jspf" %>
<div id="principal">

<h1>Aplicaci�n de ejemplo de IW</h1>

<h3>En esta versi�n: algo de AJAX</h3>
<ul>
	<li>el c�digo de <code>src/main/webapp/WEB-INF/header.jspf</code>: una cabecera "rica", 
		uso de control de flujo JSP v�a "tags" de la JSP Standard Tag Library (JSTL): 
		if, choose/when/otherwise, uso de condiciones JSP Expression Language (EL))</li>
	<li>el c�digo de <code>src/main/webapp/WEB-INF/footer.jspf</code>: informaci�n de "debug" sobre contextos, 
		e iteraci�n sobre mapas usando EL</li>
	<li>si pulsas "m�s informaci�n" en el "footer" se pone una bandera "debug" en la sesi�n</li>
	<li>los recursos en <code>src/main/webapp/resources</code> est�n accesibles bajo 
		<code>mi-contexto/resources</code>; 
		aquellos bajo <code>src/main/webapp/WEB-INF</code> s�lo se pueden acceder desde dentro del JSP 
		(pero no externamente: no puedes acceder a 'header.jspf' cambiando la URL del navegador)</li>
	<li>usuarios existentes: admin, user, test (<b>contrase�a: "bbbb"</b>)</li>
	<li>usuario inexistente con contrase�a de <b>4</b> caracteres: crea el usuario</li>
	<li>si no crea usuario, y login � contrase�a no corresponden a un usuario existente, no permite login</li>
	<li>si pulsas en <a href="logout">logout</a> se cierra la sesi�n</li>
	<li>un <a href="book/1">libro</a> y sus autores (�usa <b>Ajax</b>!)</li>
	<li>un <a href="books">lista de libros</a> y sus autores (�tambi�n usa <b>Ajax</b>!)</li>
	<li>un <a href="author/1">autor</a> y sus libros - �ser�as capaz de hacer que se viesen de forma bonita y con enlaces?</li>
</ul>

Pulsa en <a href="about">este enlace</a> para saber m�s sobre esta aplicaci�n, y ver una tabla de usuarios.

</div>
<%@ include file="../fragments/footer.jspf" %>
