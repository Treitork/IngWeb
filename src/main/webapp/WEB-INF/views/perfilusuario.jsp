<%@ include file="../fragments/header.jspf"%>
<!-- Page Content -->
<!-- jQuery -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="resources/js/grafica.js"></script>



<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<h1 class="page-header">
			Perfil <small><c:choose>
					<c:when test="${e:forHtmlContent(usuarioSelec.rol)=='user'}">alumno</c:when>
					<c:otherwise>${e:forHtmlContent(usuarioSelec.rol)}</c:otherwise>
				</c:choose></small>
		</h1>
		<div class="col-md-3 ">
			<img src="resources/img/Anonimo.jpg" alt="foto perfil">
		</div>

		<div class="col-md-3 ">
			<ul class="list-group">
				<li class="list-group-item"><b>Nombre:</b>
					${e:forHtmlContent(usuarioSelec.nombre)}</li>
				<li class="list-group-item"><b>Correo:</b>
					${e:forHtmlContent(usuarioSelec.email)}</li>
				<li class="list-group-item"><b>Rol:</b> ${e:forHtmlContent(usuarioSelec.rol)}</li>
				<li class="list-group-item"><b>Puntuación:</b>
					${e:forHtmlContent(usuarioSelec.puntuacion)}</li>

			</ul>
		</div>
	</div>
	<!-- /.row -->

	<!-- Image Header -->
	<div class="row">

		<div id="chart_div"></div>
		<!--  	<input type="button" value="Inicial" onclick="drawInitial()" /> -->
	</div>
	<!-- /.row -->

	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Panel de Servicios</h2>
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x text-primary"></i> <i
						class="fa fa-tree fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<div class="panel-body">
					<h4>Votar a este Usuario</h4>
					<p>Valora los aspectos que debo mejorar.</p>
					<form action="${e:forHtmlContent(prefix)}realizarVotacion${e:forHtmlContent(usuarioSelec.id)}"
						method="GET">
						<button type="submit" class="btn btn-primary">Realizar
							valoracion</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x text-primary"></i> <i
						class="fa fa-car fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<div class="panel-body">
					<h4>Votaciones recibidas</h4>
					<p>Consulta las votaciones que he recibido.</p>
					<form
						action="${e:forHtmlContent(prefix)}mostrarVotacionesRecibidas${e:forHtmlContent(usuarioSelec.id)}"
						method="GET">
						<button type="submit" class="btn btn-primary">Ver
							valoraciones</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x text-primary"></i> <i
						class="fa fa-support fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<div class="panel-body">
					<h4>Votaciones realizadas</h4>
					<p>Consulta las votaciones que he realizado.</p>
					<form
						action="${e:forHtmlContent(prefix)}mostrarVotacionesRealizadas${e:forHtmlContent(usuarioSelec.id)}"
						method="GET">
						<button type="submit" class="btn btn-primary">Ver
							valoraciones</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x text-primary"></i> <i
						class="fa fa-database fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<div class="panel-body">
					<h4>Asignaturas matriculadas</h4>
					<p>Consulta mis asignaturas matriculadas</p>
					<form action="${e:forHtmlContent(prefix)}mostrarAsignaturas${e:forHtmlContent(usuarioSelec.id)}"
						method="GET">
						<button type="submit" class="btn btn-primary">Ver
							asignaturas</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../fragments/footer.jspf"%>