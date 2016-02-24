<%@ include file="../fragments/header.jspf"%>
<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Preguntas frecuentes <small>OmnisCracia</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Preguntas frecuentes</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->

	<!-- Content Row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne">¿Que ofrecemos?</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">Ofrecemos un portal web para
							realizar votaciones cruzadas entre profesores y alumnos de tu
							universidad sobre cuestiones académicas o de docencia con el fin
							de mejorar la enseñanza.</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo">¿Cual es
								nuestra motivación?</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">Mejorar la comunicación entre
							alumnos y profesores, dar a conocer los aspectos que se podrían
							mejorar a cada participante(Alumno/Profesor). Mejorar la
							enseñanza trabajando juntos,consiguiendo mejores alumnos y
							mejores docentes.</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree">¿Cuales son
								nuestras normas?</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						<div class="panel-body">
							Se deberá ser honesto, objetivo ,amable, respetuoso y justo .<br />
							Se usará un lenguaje correcto,respetuoso y no estará permitido
							ofender o ridiculizar.<br /> Se da por hecho,que todos los
							participantes tienen el mismo fin, mejorar individualmente para
							facilitar un mejor aprendizaje.<br />Las opiniones serán libres
							y respetuosas.<br />Se considerara injusto que se puedan
							traducir en discordia por cada una de las partes o que las
							opiniones se reflejen en la calificación académica de los
							alumnos.<br /> Todo usuario que se use este servicio deberá
							aceptar estas normas.<br />En caso de que no cumplan, se
							sancionará mediante la expulsión pudiéndose dar en caso de
							gravedad,un informe a instituciones u organismos académicos
							reguladores.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour">¿Quienes
								votan?</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse">
						<div class="panel-body">
							Los alumnos votan aspectos que caracterizan a sus profesores.<br />Los
							profesores votan aspectos que caracterizan a sus alumnos.<br />Alumnos
							y profesores deberán estar relacionados,serán los alumnos a los
							que imparte clase un profesor concreto.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFive">¿Que se vota?</a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse">
						<div class="panel-body">
							Se votan los aspectos más característicos del contrario,a los que
							llamaremos categorías.<br /> (Ej profesor que sabe mucho pero no
							explica bien y además no resuelve ejercicios).<br />Categorías {
							conocimientos, explicación , resolución de ejercicios } Estas
							categorías se deberian preservar durante un curso, se realizarán
							votaciones sobre ellas iterativamente cada X tiempo,con el fin de
							medir la progresión de cada individuo.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSix">¿Quien decide
								estas categorias?</a>
						</h4>
					</div>
					<div id="collapseSix" class="panel-collapse collapse">
						<div class="panel-body">
							Las categorías las decide el administrador,los usuarios podrán
							sugerir otras.<br /> Los Usuarios individualmente deciden las
							categorías a votar ,el votante y el votado deben estar en la
							misma clase.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSeven">¿Como se
								votan las categorías?</a>
						</h4>
					</div>
					<div id="collapseSeven" class="panel-collapse collapse">
						<div class="panel-body">
							Los participantes elegirán una Puntuación de 0 a 5 para cada una
							de las categorías a votar.<br /> Después de todas las categorías
							habrá un campo para dejar un Comentario(esto nos obliga a
							implementar mecanismos de moderación).
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseEight">¿Quien se
								encarga de la moderacion?</a>
						</h4>
					</div>
					<div id="collapseEight" class="panel-collapse collapse">
						<div class="panel-body">
							Cada Usuario modera única y exclusivamente la clase a la que
							pertenece.<br />Él será el responsable de evitar el mal uso de
							OmniCracia.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseNine">¿Cual es la
								finalidad de la moderacion?</a>
						</h4>
					</div>
					<div id="collapseNine" class="panel-collapse collapse">
						<div class="panel-body">
							Se colaborará para conseguir la motivación de OmniCracia y se
							evitará el mal uso y el incumplimiento de las Normas.<br />Como
							mal uso entendemos comportamientos irracionales,lenguaje no
							apropiado y todo lo que se expuso en el apartado de Normas.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseNine">¿Que es lo que
								se modera?</a>
						</h4>
					</div>
					<div id="collapseNine" class="panel-collapse collapse">
						<div class="panel-body">
							Se moderará el campo de comentario en las votaciones,si no
							cumplen las normas.<br /> Se podrá moderar la puntuación de las
							categorías en una votación siempre y cuando se pueda comprobar
							que no corresponde a un comportamiento justo y maduro.<br /> Se
							podrá negar la participación en OmniCracia de usuarios que no
							cumplas las normas.
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseNine">¿Como se lleva
								a cabo la moderacion?</a>
						</h4>
					</div>
					<div id="collapseNine" class="panel-collapse collapse">
						<div class="panel-body">Los usuarios avisaran al
							administrador para todos estos puntos anteriores y en última
							instancia será el administrador el que proceda.</div>
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.panel-group -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<hr>

	<%@ include file="../fragments/footer.jspf"%>