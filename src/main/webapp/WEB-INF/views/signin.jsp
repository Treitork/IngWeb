<%@ include file="../fragments/header.jspf" %>

<div class="container">
	<div class="page-header">
		<h1>Registro</h1>
	</div>
<form class="form-horizontal">
<div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Nombre</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="firstName" id="inputName" placeholder="Nombre">
    </div>
  </div>
  
<div class="form-group">
    <label for="inputLastName" class="col-sm-2 control-label">Apellidos</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="lastName" id="inputLastName" placeholder="Apellidos">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">Contrase�a</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="pass" id="inputPassword" placeholder="Contrase�a">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputRepassword" class="col-sm-2 control-label">Repita contrase�a</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputRepassword" placeholder="Repita contrase�a">
    </div>
  </div>
  
 
          <div class="form-group">
    <label for="inputRepassword" class="col-sm-2 control-label">Rol</label>
         <div class="col-lg-6">
    <div class="input-group">
        <input type="radio"> Alumno
        <input type="radio"> Profesor
    </div>
  </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Registrarse</button>
    </div>
  </div>
</form>
</div>

<%@ include file="../fragments/footer.jspf" %>