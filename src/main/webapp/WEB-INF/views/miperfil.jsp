<%@ include file="../fragments/header.jspf"%>
<!-- Page Content -->
<!-- jQuery -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="resources/js/grafica.js"></script>



<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<h1 class="page-header">
			Mi perfil <small><c:choose>
					<c:when test="${e:forHtmlContent(user.rol)=='user'}">alumno</c:when>
					<c:otherwise>${e:forHtmlContent(user.rol)}</c:otherwise>
				</c:choose></small>
		</h1>
		<div class="col-md-3 ">
			<img src="resources/img/Anonimo.jpg" alt="foto perfil">
		</div>
		<div class="col-md-3 ">
			<ul class="list-group">
				<li class="list-group-item"><b>Nombre:</b>
					${e:forHtmlContent(user.nombre)}</li>
				<li class="list-group-item"><b>Correo:</b>
					${e:forHtmlContent(user.email)}</li>
				<li class="list-group-item"><b>Rol:</b>
					${e:forHtmlContent(user.rol)}</li>
				<li class="list-group-item"><b>Puntuación:</b>
					${e:forHtmlContent(user.puntuacion)}</li>
				<form action="${prefix}mensajeModeracion" method="GET">
					<button type="submit" class="btn btn-primary">Mensaje de
						Moderación</button>
				</form>

			</ul>
		</div>
	</div>
	<c:forEach items="${lista}" var="votacion">

		<h1>PROBANDOOOOOO</h1>

	</c:forEach>
	<!-- /.row -->

	<!-- Image Header -->
	<div class="row">

		<div id="chart_div"></div>
		<input type="button" value="Inicial" onclick="drawInitial()" />
	</div>
	<!-- /.row -->

	<%@ include file="../fragments/footer.jspf"%>