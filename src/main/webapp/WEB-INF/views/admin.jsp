<%@ include file="../fragments/header_admin.jspf"%>

<!-- faltan añadir añadair, modificar y eleminar una categoria, votaciones y mensajes-->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="resources/js/paginacion.js" type="text/javascript"></script>
<aside id="sidebar" class="column" style="height: 1700px;">
	<form class="quick_search">
		<input type="text" value="Quick Search"
			onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
	</form>
	<hr>
	<h3>Asignaturas</h3>
	<ul class="toggle">
		<li class="icn_new_article"><a href="#NuevoAsignatura">Añadir
				Asignatura</a></li>
		<li class="icn_edit_article"><a href="#EditarAsignatura">Editar
				Asignatura</a></li>
		<li class="icn_categories"><a href="#listaAsignaturas">Ver
				Asignaturas</a></li>
	</ul>

	<h3>Usuarios</h3>
	<ul class="toggle">
		<li class="icn_add_user"><a href="#NuevoUsuario">Añadir
				Usuario</a></li>
		<li class="icn_profile"><a href="#EditarUsuarios">Editar
				Usuario</a></li>
		<li class="icn_view_usersicn_profile"><a href="#listaUsuarios">Lista
				Usuarios</a></li>
	</ul>

	<h3>Votos y Mensajes</h3>
	<ul class="toggle">
		<li class="icn_new_article"><a href="#">New Vote</a></li>
		<li class="icn_edit_article"><a href="#">Edit Vote</a></li>
		<li class="icn_categories"><a href="#listaVotaciones">Lista
				Votaciones</a></li>
		<li class="icn_categories"><a href="#table_Mensajes">Mensajes
				moderación</a></li>
	</ul>

	<h3>Admin</h3>
	<ul class="toggle">
		<li class="icn_settings"><a href="#">Options</a></li>
		<li class="icn_security"><a href="#">Security</a></li>
	</ul>
</aside>
<!-- end of sidebar -->

<section id="main" class="column" style="height: 1700px;">

	<article class="module width_full">
		<header>
			<h3>Stats</h3>
		</header>
		<div class="module_content">
			<article class="stats_graph">
				<img
					src="http://chart.apis.google.com/chart?chxr=0,0,3000&amp;chxt=y&amp;chs=520x140&amp;cht=lc&amp;chco=76A4FB,80C65A&amp;chd=s:Tdjpsvyvttmiihgmnrst,OTbdcfhhggcTUTTUadfk&amp;chls=2|2&amp;chma=40,20,20,30"
					width="520" height="140" alt="">
			</article>

			<article class="stats_overview">
				<div class="overview_today">
					<p class="overview_day">Today</p>
					<p class="overview_count">1,876</p>
					<p class="overview_type">Hits</p>
					<p class="overview_count">2,103</p>
					<p class="overview_type">Views</p>
				</div>
				<div class="overview_previous">
					<p class="overview_day">Yesterday</p>
					<p class="overview_count">1,646</p>
					<p class="overview_type">Hits</p>
					<p class="overview_count">2,054</p>
					<p class="overview_type">Views</p>
				</div>
			</article>
			<div class="clear"></div>
		</div>
	</article>
	<!-- end of stats article -->

	<!-- añadir asignatura-->
	<article class="module width_full2" id="NuevoAsignatura">
		<header>
			<h3>Nueva Asignatura</h3>
		</header>
		<form class="form-horizontal" action="adminAddAsignatura"
			method="POST">
			<input type="hidden" id="csrf" name="csrf"
				value="${e:forHtmlAttribute(csrf_token)}" /> <input type="hidden"
				id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" />

			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Asignatura"
						id="Asignatura" placeholder="Nombre asignatura">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Curso</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Curso" id="Curso"
						placeholder="Ejemplo: INFORMATICA 2ºA">
				</div>
			</div>

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Año</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="Anio" id="Anio">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default"
						href="#listaAsignaturas">Añadir</button>
					<button type="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
				</div>
			</div>
		</form>
	</article>
	<!-- fin añadir asignatura-->

	<!-- editar asignatura-->

	<article class="module width_full2" id="EditarAsignatura">
		<header>
			<h3>Editar Asignatura</h3>
		</header>
		<form class="form-horizontal" action="adminEditAsignatura"
			method="POST">
			<input type="hidden" id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" /> <input
				type="hidden" id="csrf" name="csrf"
				value="${e:forHtmlAttribute(csrf_token)}" />

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Id</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="Id" id="editId"
						value=" ">
				</div>
			</div>

			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">Asignatura</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Asignatura"
						id="editAsignatura" placeholder=" ">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Curso</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Curso" id="editCurso"
						placeholder=" ">
				</div>
			</div>

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Nuevo
					año</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="Anio" id="editAnio"
						placeholder=" ">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Editar</button>
					<button type="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
				</div>
		</form>
	</article>
	<!--  fin editar asignatura-->

	<!-- listas de todas las asignaturas -->
	<article class="module width_3_quarter" id="listaAsignaturas">
		<header>
			<h3 class="tabs_involved">Lista de Asignaturas</h3>
		</header>
		<div class="tab_container" id="tabAsignaturas">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="table_Asignaturas" class="tablesorter" cellspacing="0">
					<thead>
						<tr>

							<th class="header">Id</th>
							<th class="header">Nombre</th>
							<th class="header">Curso</th>
							<th class="header">Año</th>
							<th class="header">Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${TodasAsignaturas}" var="asignaturas">
							<tr>
								<td>${asignaturas.id}</td>
								<td>${asignaturas.nombre}</td>
								<td>${asignaturas.grupo}</td>
								<td>${asignaturas.anio}</td>
								<td><a href="#EditarAsignatura"><input type="image"
										src="resources/img/img_admin/icn_edit.png" id="editAsignatura"
										onclick="editAsig('${requestScope['javax.servlet.forward.servlet_path']}','${e:forJavaScript(asignaturas.id)}','${e:forJavaScript(asignaturas.nombre)}','${e:forJavaScript(asignaturas.grupo)}','${e:forJavaScript(asignaturas.anio)}')"
										title="Edit"></a> <input type="image"
									src="resources/img/img_admin/icn_trash.png"
									id="eliminarAsignatura"
									onclick="deleteAsig('${requestScope['javax.servlet.forward.servlet_path']}','${e:forJavaScript(asignaturas.id)}','${e:forJavaScript(asignaturas.nombre)}','${e:forJavaScript(asignaturas.grupo)}','${e:forJavaScript(asignaturas.anio)}','${e:forJavaScript(csrf_token)}')"
									title="Trash"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- end of #tab1 -->
		</div>
		<!-- final de lista de asignaturas -->
	</article>

	<!-- Inicio añadir usuario -->
	<article class="module width_3_quarter" id="NuevoUsuario">
		<header>
			<h3 class="tabs_involved">Nuevo Usuario</h3>
		</header>
		<form class="form-horizontal" action="adminAddUser" method="POST">
			<input type="hidden" id="csrf" name="csrf"
				value="${e:forHtmlAttribute(csrf_token)}" /> <input type="hidden"
				id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" />
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="firstName"
						id="nombre" placeholder="Nombre">
				</div>
			</div>

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Apellidos</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="lastName"
						id="apellidos" placeholder="Apellidos">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="Email">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">Contraseña</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="pass" id="pass"
						placeholder="Contraseña">
				</div>
			</div>
			<div class="form-group">
				<label for="inputRepassword" class="col-sm-2 control-label">Rol</label>
				<div class="col-lg-6">
					<div class="input-group">
						<input type="radio" name="sex" value="Profesor">Profesor <input
							type="radio" name="sex" value="Alumno">Alumno
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Registrar</button>
					<button value="reset" id="asignaturas-reset"
						class="btn btn-default">Reset</button>
				</div>
			</div>
		</form>
	</article>
	<!-- final añadir usuario -->


	<!-- Inicio editar usuario -->
	<!--
	<article class="module width_3_quarter" id="#EditarUsuarios">
		<header>
			<h3 class="tabs_involved">Editar Usuario</h3>
		</header>
		<form class="form-horizontal" action="adminAddUser" method="POST">
		  <input type="hidden" id="csrf" name="csrf"
			value="${e:forHtmlAttribute(csrf_token)}" />
			<input type="hidden" id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" />
				
			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Id</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="editIdUsuario"
						id="editIdUsuario"  value=" ">
				</div>
			</div>	
				
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="editNombreUsuario"
						id="editNombreUsuario" placeholder="Nombre">
				</div>
			</div>

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Apellidos</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="editApellidosUsuario"
						id="editApellidosUsuario" placeholder="Apellidos">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="editEmailUsuario" id="editEmailUsuario"
						placeholder="Email">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">Contraseña</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="editPassUsuario" id="editPassUsuario"
						placeholder="Contraseña">
				</div>
			</div>
			<div class="form-group">
				<label for="inputRepassword" class="col-sm-2 control-label">Rol</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input type="radio" class="form-control" name="editRolUsuario"  id ="editRolUsuario" >
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Registrar</button>
					<button type="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
				</div>
			</div>
		</form>
	</article>
	 -->
	<!-- final editar usuario -->


	<!-- Lista usuarios -->
	<article class="module width_3_quarter" id="listaUsuarios">
		<header>
			<h3 class="tabs_involved">Lista Usuarios</h3>
		</header>
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="table_Usuarios" class="tablesorter" cellspacing="0">
					<thead>
						<tr>
							<th class="header">Id</th>
							<th class="header">Nombre</th>
							<th class="header">Apellidos</th>
							<th class="header">email</th>
							<th class="header">Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${todosUsuarios}" var="usuarios">
							<tr>
								<td>${usuarios.id}</td>
								<td>${usuarios.nombre}</td>
								<td>${usuarios.apellidos}</td>
								<td>${usuarios.email}</td>
								<td><a> <input type="image"
										src="resources/img/img_admin/icn_trash.png" id="eliminar"
										onclick="deleteUsuario('${requestScope['javax.servlet.forward.servlet_path']}','${e:forJavaScript(usuarios.id)}','${e:forJavaScript(csrf_token)}')"
										title="Trash"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- end of #tab1 -->
		</div>
		<!-- final de lista de usuarios -->
	</article>
	<!-- final lista de usuarios -->

	<!-- Lista votaciones -->
	<article class="module width_3_quarter" id="listaVotaciones">
		<header>
			<h3 class="tabs_involved">Lista Votaciones</h3>
		</header>
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="table_Votacion" class="tablesorter" cellspacing="0">
					<thead>
						<tr>
							<th class="header">Id Votación</th>
							<th class="header">Id emisor</th>
							<th class="header">Id receptor</th>
							<th class="header">Comentario</th>
							<th class="header">Fecha</th>
							<th class="header">Puntuación media</th>
							<th class="header">Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${todasVotaciones}" var="votacion">
							<tr>
								<td>${votacion.id}</td>
								<td>${votacion.id_emisor}</td>
								<td>${votacion.id_receptor}</td>
								<td>${votacion.comentario}</td>
								<td>${votacion.fecha}</td>
								<td>${votacion.puntuacionMedia}</td>
								<td><a> <input type="image"
										src="resources/img/img_admin/icn_trash.png" id="eliminar"
										onclick="deleteVotacion('${requestScope['javax.servlet.forward.servlet_path']}','${e:forJavaScript(votacion.id)}','${e:forJavaScript(votacion.id_receptor)}','${e:forJavaScript(csrf_token)}')"
										title="Trash"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</article>
	<!-- final lista de votaciones -->
	<div class="clear"></div>

	<!-- Lista mensajes -->
	<article class="module width_3_quarter" id="listaVotaciones">
		<header>
			<h3 class="tabs_involved">Mensajes Moderación</h3>
		</header>
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="table_Mensajes" class="tablesorter" cellspacing="0">
					<thead>
						<tr>
							<th class="header">Id Mensaje</th>
							<th class="header">Id Votacion</th>
							<th class="header">Id usuario emisor</th>
							<th class="header">Motivo</th>
							<th class="header">Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${todosMensajes}" var="mensaje">
							<tr>
								<td>${mensaje.id}</td>
								<td>${mensaje.idVotacion}</td>
								<td>${mensaje.idEmisor}</td>
								<td>${mensaje.motivo}</td>
								<td><a><input type="button" href="contenidoMensaje"
										value="Ver Contenido"
										onclick="mostrarMensaje('mostrarMensaje','${e:forJavaScript(mensaje.mensaje)}')"
										title="Ver"> </a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</article>
	<!-- final mensajes de votaciones -->

	<%@ include file="../fragments/footer.jspf"%>