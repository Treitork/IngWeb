<%@ include file="../fragments/header.jspf" %>

<script type="text/javascript">
$(function() {
	$(".x").click(function(){
		var id=$(this).attr("id").substring("del_".length);
		console.log("deleting", id);
		delUser(id);
	});
})

function delUser(id) {
	$.post("delUser", {id: id, csrf: "${e:forJavaScript(csrf_token)}"}, 
			function(data) {
				$("#del_"+id).parent().parent().remove();
			});
}
</script>

<div id="principal">

<h1>Sobre esta aplicaci�n</h1>
<ul>
	<li>El autor de esta aplicaci�n es Manuel Freire, y los fuentes actualizados est�n disponibles
		<a href="https://github.com/manuel-freire/iw">en Github</a>.
	<li>Esta aplicaci�n se distribuye bajo licencia BSD-Simplificada: 
		esencialmente por amor al arte, y puedes reutilizarla impunemente 
		siempre y cuando cites fuente y autor�a en tu leeme.html � equivalente.</li>
	<li>Realmente, esta segunda p�gina s�lo sirve para que veas que la sesi�n se mantiene entre
		p�ginas, y que me puedo registrar (hacer login) en cualquier p�gina si pierdo mi sesi�n --
		pero "sin cambiar" de p�gina.</li>
</ul>

<h1>Usuarios del sistema</h1>
<table class="users">
<thead>
	<tr><td>id<td>login<td>rol<td>hash+salt<td>photo</tr>
</thead>
<tbody>
	<c:forEach items="${users}" var="u">
		<!--<tr><td>${u.id}<td>${e:forHtmlContent(u.login)}<td>${u.role}-->
		<td>${u.hashedAndSalted}<td><img src="user/photo?id=${u.id}"/>
		<td><button class="x" id="del_${u.id}">x</button></tr>
	</c:forEach>
</tbody>	
</table>

</div>
<%@ include file="../fragments/footer.jspf" %>
