<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>Usuario</h1>
	</div>
<img src="../resources/img/potar.PNG" height="100" width="100" alt="" class="img-circle"> </img>

	<p id =hora></p>
	<a href="">Pincha aqui</a>
	<p id = prueba>Y ahora, una enumeración tonta</p>
	<ul>
	<c:forEach var="i" items="${elementos}">
		<li>${i}</li>
	</c:forEach>
	</ul>
	<script>
		$(document).ready(function(){
			$('#hora').hover(function(){
				$(this).slideToggle();
			});
		});
	</script>
</div>

<%@ include file="../fragments/footer.jspf" %>