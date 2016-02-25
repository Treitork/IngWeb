<%@ include file="../fragments/header.jspf" %>
<div class="page-header"><h1>${cabecera}</h1><small></small></div>
<c:choose>
<c:when test="${not empty votaciones}">
<c:forEach items="${votaciones}" var="votaciones">
<div class="col-md-4">
<div class="panel panel-default">
<div class="panel-heading"><h4>Valoraciones</h4></div>
<table class="table">
<tr>
<th>Categoría</th>
<th>Puntuación</th>
<tr>
<c:forEach items="${votaciones.valoraciones}" var="valoraciones">
<tr>
<td>${valoraciones.categoria}</td>
<td>${valoraciones.puntuacion}</td>
</tr>
</c:forEach>
</table>
</div>
<h4>Puntuacion Media : ${votaciones.puntuacionMedia}</h4>
<div class="panel panel-default">
<div class="panel-heading"><h4>Comentario</h4></div>
<p>${votaciones.comentario}</p>
</div>
</div>
</c:forEach>
</c:when>
</c:choose>
<%@ include file="../fragments/footer.jspf" %>