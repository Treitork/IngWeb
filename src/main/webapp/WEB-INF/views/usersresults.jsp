<%@ include file="../fragments/header.jspf"%>
<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">${cabecera}
				<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"></a></li>
				<li class="active"></li>
			</ol>
		</div>
	</div>
	<c:set var="counter" value="0" scope="page" />
	<div class="row">
		<c:forEach items="${pagedListUsuarios}" var="usuarios">
			<div class="col-md-4 img-portfolio">
				<img class="img-responsive img-hover"
					src="http://placehold.it/700x400" alt="">
				<h3>
					<a href="${prefix}perfilUsuario${usuarios.id}">${usuarios.nombre}
						${usuarios.apellidos}</a>
				</h3>
				<p>Pulsame para ver mas información</p>
			</div>
			<c:set var="counter" value="${count + 1}" scope="page" />
		</c:forEach>
	</div>
	<hr>

	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<!-- /.row -->

	<hr>

	<%@ include file="../fragments/footer.jspf"%>