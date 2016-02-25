<%@ include file="../fragments/header.jspf"%>

<div class="container">
	<div class="page-header">
		<h1>Realizar votacion</h1>
	</div>
	<p id="hueco" class="lead"></p>
	<button id="boton1" class="btn btn-primary">añadirCategoria</button>
	<br></br>
	<form name="enviarVotacion" id="formularioVotacion"
		action="${e:forHtmlContent(prefix)}votacion${e:forHtmlContent(idvotacion)}"
		method="POST">
		<div class="control-group form-group">
			<div class="controls">
				<label>Mensaje:</label>
				<textarea rows="10" cols="100" class="form-control" id="comentario"
					name="mensaje" maxlength="999" style="resize: none"></textarea>
			</div>
		</div>
		<div id="success"></div>
		<!-- For success/fail messages -->
		<button type="submit" class="btn btn-primary">Enviar Votacion</button>
	</form>
</div>

<script>
	$("#boton1")
			.click(
					function() {
						var category = prompt(
								"Por favor introduce una categoria",
								"Categoria");
						var number = prompt(
								"Por favor introduce una valoracion numerica entre 0 y 5",
								"Valoracion");
						document.getElementById("hueco").innerHTML += "<b>"
								+ "Categoria: " + "</b>" + category + "<b>"
								+ " Valoracion: " + "</b>" + number
								+ "<br></br>";
					})
</script>

<%@ include file="../fragments/footer.jspf"%>