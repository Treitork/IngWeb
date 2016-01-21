<%@ include file="../fragments/header_admin.jspf"%>

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
		<li class="icn_edit_article"><a href="#">Editar Asignatura</a></li>
		<li class="icn_categories"><a href="#listaAsignaturas">Ver
				Asignaturas</a></li>
	</ul>
	<h3>Mensajes</h3>
	<ul class="toggle">
		<li class="icn_new_article"><a href="#clear">Nuevo Mensaje</a></li>
		<li class="icn_edit_article"><a href="#">Edit Message</a></li>
		<li class="icn_categories"><a href="#tab1">List Messages</a></li>
	</ul>
	<h3>Votos</h3>
	<ul class="toggle">
		<li class="icn_new_article"><a href="#">New Vote</a></li>
		<li class="icn_edit_article"><a href="#">Edit Vote</a></li>
		<li class="icn_categories"><a href="#votes">List Votes</a></li>
	</ul>
	<h3>Usuarios</h3>
	<ul class="toggle">
		<li class="icn_add_user"><a href="#NuevoUsuario">Añadir
				Usuario</a></li>
		<li class="icn_view_users"><a href="#listaUsuarios">Lista de
				Usuarios</a></li>
		<li class="icn_profile"><a href="#">Your Profile</a></li>
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
	<article class="module width_full2" id ="NuevoAsignatura">
		<header>
			<h3>Nueva Asignatura</h3>
		</header>
		<form class="form-horizontal" action="adminAddAsignatura" method="POST">
			<input type="hidden" id="source" name="source"
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
					<input type="number" class="form-control" name="Anio"
						id="Anio" >
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Añadir</button>
					<button value="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
			</div>
		</form>
	</article>
	<!-- fin añadir asignatura-->
	
	<!-- editar asignatura-->
	
	<article class="module width_full2" id ="NuevoAsignatura">
		<header>
			<h3>Editar Asignatura</h3>
		</header>
		<form class="form-horizontal" action="adminEditAsignatura" method="POST">
			<input type="hidden" id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" />
 			
 			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Id</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="Id"
						id="Id" placeholder=" Id de la asignatura a modificar">
				</div>
			</div>
 			
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">Nueva asignatura</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Asignatura"
						id="Asignatura" placeholder=" ">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Nuevo curso</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="Curso" id="Curso"
						placeholder=" ">
				</div>
			</div>

			<div class="form-group">
				<label for="inputLastName" class="col-sm-2 control-label">Nuevo año</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" name="Anio"
						id="Anio" placeholder=" ">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Editar</button>
					<button value="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
			</div>
		</form>
	</article>
	<!--  fin editar asignatura-->
	
	<!-- listas de todas las asignaturas -->
	<article class="module width_3_quarter" id="listaAsignaturas">
		<header>
			<h3 class="tabs_involved">Lista de Asignaturas</h3>
		</header>
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="table_id" class="tablesorter" cellspacing="0">
					<thead>
						<tr>
							<th class="header"></th>
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
								<td><input type="checkbox"></td>
								<td>${asignaturas.id}</td>
								<td>${asignaturas.nombre}</td>
								<td>${asignaturas.grupo}</td>
								<td>${asignaturas.anio }</td>
								<td><a href="">
									<input type="image" src="resources/img/img_admin/icn_trash.png"
									id ="eliminar" onclick="deleteAsig('${requestScope['javax.servlet.forward.servlet_path']}','${asignaturas.id}','${asignaturas.nombre}','${asignaturas.grupo}','${asignaturas.anio }')"
									title="Trash"></a></td>
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
			<input type="hidden" id="source" name="source"
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
					<button value="reset" id="asignaturas-reset" class="btn btn-default">Reset</button>
				</div>
			</div>
		</form>
	</article>
	<!-- final añadir usuario -->



	<!-- Lista usuarios -->
	<article class="module width_3_quarter" id="listaUsuarios">
		<header>
			<h3 class="tabs_involved">Lista Usuarios</h3>
		</header>
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<table id="tableUsuarios" class="tablesorter" cellspacing="0">
					<thead>
						<tr>
							<th class="header"></th>
							<th class="header">Nombre</th>
							<th class="header">Apellidos</th>
							<th class="header">email</th>
							<th class="header">Rol</th>
							<th class="header">Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${todosUsuarios}" var="usuarios">
							<tr>
								<td><input type="checkbox"></td>
								<td>${usuarios.nombre}</td>
								<td>${usuarios.apellidos}</td>
								<td>${usuarios.email }</td>
								<td>${usuarios.rol }</td>
								<td><a >
									<input type="image" src="resources/img/img_admin/icn_trash.png"
									id ="eliminar" onclick="deleteAsig('${requestScope['javax.servlet.forward.servlet_path']}','${asignaturas.id}','${usuarios.nombre}','${usuarios.apellidos}}','${usuarios.rol } }')"
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


	<div class="clear"></div>

	<article class="module width_full">
		<header>
			<h3>New Message</h3>
		</header>
		<div class="module_content">
			<fieldset>
				<label>From</label> <input type="text">
			</fieldset>
			<fieldset>
				<label>To</label> <input type="text">
			</fieldset>
			<fieldset>
				<label>Subject</label>
				<textarea rows="12"></textarea>
			</fieldset>
		</div>
		<footer>
			<div class="submit_link">
				<input type="submit" value="Publish" class="alt_btn"> <input
					type="submit" value="Reset">
			</div>
		</footer>
	</article>
	<!-- end of post new article -->


	
	
	<script src="resources/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
		
		
<!-- <input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"> -->
	<%@ include file="../fragments/footer.jspf"%>