<%@ include file="../fragments/header.jspf" %>
<c:choose>
<c:when test="${not empty votaciones}">
<c:forEach items="${votaciones}" var="votaciones">
<label>ID: </label><p>${votaciones.id}</p>
<br/>
<c:forEach items="${votaciones.valoraciones}" var="valoraciones">
<table class="table">
<tr>
<td>${valoraciones.categoria}</td>
<td>${valoraciones.puntuacion}</td>
</tr>
</table>
</c:forEach>
</c:forEach>
<br>
</c:when>
</c:choose>
<%@ include file="../fragments/footer.jspf" %>