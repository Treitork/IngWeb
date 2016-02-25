<%@ include file="../fragments/header.jspf" %>
<div class="page-header"><h1>${e:forHtmlContent(cabecera)}</h1><small></small></div>
<c:choose>
<c:when test="${not empty usuario}"> 
<div class="panel panel-default">
<div class="panel-heading">ID usuario:<small> ${e:forHtmlContent(usuario.id)}</small></div>
<table class="table">
<tr>
<th>Nombre</th>
<th>Grupo</th>
<th>Año</th>
<tr>
<c:forEach items="${usuario.asignaturas}" var="asignaturas">
<tr>
<td>${e:forHtmlContent(asignaturas.nombre)}</td>
<td>${e:forHtmlContent(asignaturas.grupo)}</td>
<td>${e:forHtmlContent(asignaturas.anio)}</td>
</tr>
</c:forEach>
</table>
</div>
</c:when>
</c:choose>
<%@ include file="../fragments/footer.jspf" %>