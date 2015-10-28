<%@ include file="../fragments/header.jspf"%>

<div class="container">
	<div class="page-header">
		<h1 class="list-group">Bienvenido al top 10:</h1>
	</div>

	<ol class="list-group">
		<c:forEach var="i" items="${elementos}">
			<li class="list-group-item list-group-item-success"><h3>Usuario TOP
					${i+1}</h3></li>
			<button type="button" class="btn btn-info">Visitar Perfil</button>
			<br>

		</c:forEach>

	</ol>
	
</div>

<%@ include file="../fragments/footer.jspf"%>