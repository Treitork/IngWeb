<%@ include file="../fragments/header.jspf" %>
<div class="container">
	<div class="page-header"><h1>Valoración</h1></div>
                <form name="realizarValoracion" id="realizarValoracion" action="${e:forHtmlContent(prefix)}realizarValoracion" method="POST">
        		<input type="hidden" id="csrf" name="csrf"
				value="${e:forHtmlAttribute(csrf_token)}" />
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Categoria:</label>
                            <input type="text" placeholder="Escribe aqui que es lo que quieres valorar" class="form-control" id="categoria" name="categoria">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                        <label>Puntuación</label>	
                            <select id="puntuacion" name="puntuacion">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            </select>
                            </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-primary">Añadir a la votacion</button>
                </form>
</div>
<%@ include file="../fragments/footer.jspf" %>