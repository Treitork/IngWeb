<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>
			Prueba
		</h1>
	</div>
	<p id =hora>La hora local es ${serverTime}. </p>
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