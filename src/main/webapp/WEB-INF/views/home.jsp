<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>
			Hola Cerda!  
		</h1>
	</div>
	<p>La hora local es ${serverTime}. </p>
	
	<p>Y ahora, una enumeración tonta</p>
	<ul>
	<a href = "prueba">Ir a Prueba</a>
	<c:forEach var="i" items="${elementos}">
		<li>${i}</li>
	</c:forEach>
	</ul>
</div>

<%@ include file="../fragments/footer.jspf" %>