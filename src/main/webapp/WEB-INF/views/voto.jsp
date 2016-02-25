<%@ include file="../fragments/header.jspf"%>
<div class="container">
	<div class="page-header">
		<h1>Votaci�n</h1>
		<small>${usuariovotacion}</small>
	</div>
	<c:choose>
		<c:when test="${not empty valoraciones}">
			<table class="table">
				<tr>
					<th>Categor�a</th>
					<th>Puntuaci�n</th>
				<tr>
					<c:forEach items="${valoraciones}" var="valoraciones">
						<tr>
							<td>${e:forHtmlContent(valoraciones.categoria)}</td>
							<td>${e:forHtmlContent(valoraciones.puntuacion)}</td>
						</tr>
					</c:forEach>
			</table>
			<br>
		</c:when>
	</c:choose>
	<form action="${prefix}realizarValoracion" method="GET">
		<button type="submit" class="btn btn-primary">A�adir
			Valoracion</button>
	</form>
	<br /> <br>
	<form name="realizarVotacion" id="realizarVotacion"
		action="${e:forHtmlContent(prefix)}realizarVotacion" method="POST">
		<input type="hidden" id="csrf" name="csrf"
			value="${e:forHtmlAttribute(csrf_token)}" />
		<div class="control-group form-group">
			<div class="controls">
				<label>Comentario</label>
				<textarea rows="10" cols="100" class="form-control" id="comentario"
					name="comentario" maxlength="999" style="resize: none"></textarea>
			</div>
		</div>
		<div id="success"></div>
		<!-- For success/fail messages -->
		<button type="submit" class="btn btn-primary">Enviar votacion</button>
	</form>
</div>
<%@ include file="../fragments/footer.jspf"%>