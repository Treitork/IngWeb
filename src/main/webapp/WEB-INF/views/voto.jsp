<%@ include file="../fragments/header.jspf" %>
<div class="container">
	<div class="page-header"><h1>Valoracion</h1></div>
<table>
<thead>
<th>Categoria</th>
<th>Puntuacion</th>
</thead>
<tbody>
<c:forEach items="${valoraciones}" var="valoraciones">
<tr>
<td>${valoraciones.categoria}</td>
<td>${valoraciones.puntuacion}</td>
</tr>
</c:forEach>
</tbody>
</table>
<form action="${prefix}realizarValoracion" method="GET">
<button type="submit" class="btn btn-primary">Añadir Valoracion</button>
</form>
<br/>
<br>
<form name="realizarVotacion" id="realizarVotacion" action="${prefix}realizarVotacion${idusuario}" method="POST">
<div class="control-group form-group">
<div class="controls">
<label>Comentario</label>
<textarea rows="10" cols="100" class="form-control" id="mensaje" name="mensaje" maxlength="999" style="resize:none"></textarea>
</div>
</div>
<div id="success"></div>
<!-- For success/fail messages -->
<button type="submit" class="btn btn-primary">Enviar votacion</button>
</form>
</div>
<%@ include file="../fragments/footer.jspf" %>