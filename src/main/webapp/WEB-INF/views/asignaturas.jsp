<%@ include file="../fragments/header.jspf"%>
<div class="page-header">
	<h1>${cabecera}</h1>
	<small></small>
</div>
<c:choose>
	<c:when test="${not empty votaciones}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>ID usuario:</h4>
				<small> ${idUsuario}</small>
			</div>
			<table class="table">
				<tr>
					<th>Nombre</th>
					<th>Grupo</th>
					<th>Año</th>
				<tr>
					<c:forEach items="${asignaturas}" var="asignaturas">
						<tr>
							<td>${asignaturas.nombre}</td>
							<td>${asignaturas.grupo}</td>
							<td>${asignaturas.anio}</td>
						</tr>
					</c:forEach>
			</table>
		</div>
	</c:when>
</c:choose>
<%@ include file="../fragments/footer.jspf"%>