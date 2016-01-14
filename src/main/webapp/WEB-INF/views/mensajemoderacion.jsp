<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header"><h1>Mensaje de moderacion</h1></div>
                <form name="enviarMensajeModeracion" id="formularioMensajeModeracion" action="${prefix}mensajeModeracion${idvotacion}" method="POST">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Motivo:</label>
                            <input type="text" class="form-control" id="motivo" name="motivo">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Mensaje:</label>
                            <textarea rows="10" cols="100" class="form-control" id="mensaje" name="mensaje" maxlength="999" style="resize:none"></textarea>
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-primary">Enviar Mensaje</button>
                </form>
</div>


<%@ include file="../fragments/footer.jspf" %>