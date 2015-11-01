<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>
			Hola mundo!  
		</h1>
	</div>
	<p>La hora local es ${serverTime}. </p>
	
	<p>Y ahora, una enumeraci�n tonta</p>
	<ul>
	<c:forEach var="i" items="${elementos}">
		<li>${i}</li>
	</c:forEach>
	</ul>
</div>

<%@ include file="../fragments/footer.jspf" %>