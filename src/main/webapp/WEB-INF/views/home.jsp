<%@ include file="../fragments/header.jspf" %>
	<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
    
	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url('resources/img/foto2.jpg');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resources/img/foto4.jpg');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resources/img/foto1.jpg');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
			<br/>
<div class="jumbotron">
  <h1>Bienvenido a OmnisCracia</h1>
  <p>Sistema de valoraciones entre docentes y alumnos sin precedentes.
  ¡Echa un vistazo!</p>
  <p><a class="btn btn-primary btn-lg" href="${prefix}faq" role="button">Mas información</a></p>
</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-check"></i> Buen diseño, mejor funcionamiento
						</h4>
					</div>
					<div class="panel-body">
						<p>Ese es nuestro lema en el equipo de desarrollo de Omniscracia.
						Gracias a la reutilización de software libre y gratuito es posible garantizar
						el correcto funcionamiento de la web. ¿Quieres saber que hemos utilizado? </p>
						<a href="${prefix}faq" class="btn btn-default">Leer más</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-gift"></i> Interactiva &amp; Gratuita
						</h4>
					</div>
					<div class="panel-body">
						<p>Podrás registrarte rellenando un simple formulario,
							con un correo institucional rellenando nuestro formulario
							en menos de ¡1 minuto!.¡Es totalmente gratuito!, ¿a qué 
							esperas para entrar?</p>
						<a href="${prefix}signin" class="btn btn-default">Regístrate</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-compass"></i> Fácil de usar
						</h4>
					</div>
					<div class="panel-body">
						<p>Una nueva forma de interactuar entre docentes y alumnos
						   nunca antes vista. Comparte opiniones con un solo clic de ratón
						   de forma intuitiva y simple.</p>
						<a href="${prefix}services" class="btn btn-default">Saber más</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Sistema de votaciones revolucionario</h2>
			</div>
			<div class="col-md-6">
				
				<p>Tu opinión tendrá tanta importancia como nunca antes.
				Investigando acerca de los típicos sistemas de valoraciones de
				profesores y alumnos realizados sobre un papel, nos dimos cuenta,
				que mayormente esas valoraciones nunca eran leidas, o bien terminaban
				en la papelera. Además, no son solo los alumnos los que deberían evaluar
				al profesor, si no que el profesor también debería tener la oportinudad
				de valorar a cada uno de sus alumnos, con una nota no decimal.
				Tras muchas quejas de alumnos cuyas opiniones quedaban relegadas al olvido,
				excesiva falta de comunicación entre alumno y profesor, sugerencias por
				parte del profesorado sugiriendo valoración hacia sus alumnos... y por
				muchos otros motivos surge Omniscracia. Una nueva forma de valorar criterios
				no académicos entre alumnos y profesores que no dejará a nadie indiferente.
				Tu opinion tendrá una influencia directa nunca vista anteriormente, ¿a qué esperas
				para unirte?</p>
			</div>
			<div class="col-md-6">
				<img class="img-responsive" src="resources/img/foto5.JPG" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="well">
			<div class="row">
				<div class="col-md-8">
					<p> Después de todo... ¿tienes alguna duda?,¿alguna sugerencia?,¿alguna observación?. ¡No te las guardes, contacta con nosotros!</p>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-default btn-block" href="${prefix}contact">Contactar</a>
				</div>
			</div>
		</div>
</div>
		<hr>

<%@ include file="../fragments/footer.jspf" %>
