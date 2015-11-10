<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>Login</h1>
	</div>
<form class="form-horizontal" id="formularioLogin" action="${prefix}login" method="POST">
<fieldset>
<input type="hidden" id="source" name="source" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" id="login" class="form-control" name="login" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Contraseña</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="pass" id="pass" placeholder="Contraseña">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input name="rememberMe" type="checkbox"> Recordarme
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" value="login" class="btn btn-default">Entrar</button> <br> <br>
       <a href ="#">¿Has olvidado la contraseña?</a>
    </div>
  </div>
  </fieldset>
</form>
</div>

<%@ include file="../fragments/footer.jspf" %>