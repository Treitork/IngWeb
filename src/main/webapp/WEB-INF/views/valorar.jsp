<%@ include file="../fragments/header.jspf"%>

<div class="container">
	<div class="page-header">
		<h1 class="list-group">Selecciona el usuario a valorar:</h1>
	</div>

	<ul class="list-group">
		<c:forEach var="i" items="${elementos}">
			<li class="list-group-item list-group-item-success"><h3>Usuario
					${i}</h3></li>
			<button type="button" class="btn btn-primary">Valorar</button>
			<button type="button" class="btn btn-info">Visitar Perfil</button>
			<button type="button" class="btn btn-warning">Cambiar
				Categorias</button>
			<br>

		</c:forEach>

	</ul>
	
</div>

<%@ include file="../fragments/footer.jspf"%>