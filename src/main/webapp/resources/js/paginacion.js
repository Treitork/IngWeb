$(document).ready(function() {
	$('#table_Asignaturas').DataTable();
	$('#table_Usuarios').DataTable();
	$('#table_Votacion').DataTable();
	$('#table_Mensajes').DataTable();
});

function deleteAsig(source, Id, Asignatura, Curso, Anio, csrf) {
	/* alert(Asignatura+" "+ Curso+ " "+ Id); */
	$.ajax({
		url : 'adminDeleteAsignatura',
		type : 'POST',
		data : {
			'source' : source,
			'Id' : Id,
			'Asignatura' : Asignatura,
			'Anio' : Anio,
			'Curso' : Curso,
			'csrf' : csrf
		},

		success : function(result) {
			location.reload();
		},
	});

};
function editAsig(source, Id, Asignatura, Curso, Anio) {
	/* alert(Asignatura+" "+ Curso+ " "+ Id); */
	$("#editId").attr("value", Id);
	$("#editAsignatura").attr("value", Asignatura);
	$("#editCurso").attr("value", Curso);
	$("#editAnio").attr("value", Anio);
};

function deleteUsuario(source, Id,csrf) {
	/* alert(Asignatura+" "+ Curso+ " "+ Id); */
	$.ajax({
		url : 'adminDeleteUser',
		type : 'POST',
		data : {
			'source' : source,
			'Id' : Id,
			'csrf' : csrf
		},

		success : function(result) {
			location.reload();
		},
	});

};

function deleteVotacion(source, Id, IdReceptor, csrf) {
	/* alert("votacion" + Id); */
	$.ajax({
		url : 'adminDeleteVotacion',
		type : 'POST',
		data : {
			'source' : source,
			'Id' : Id,
			'IdReceptor' : IdReceptor,
			'csrf' : csrf
		},

		success : function(result) {
			location.reload();
		},
	});

};

function mostrarMensaje(id, mensaje) {
	/*document.getElementById(id).style.visibility = (document.getElementById(id).style.visibility == 'hidden') ? 'visible' : 'hidden';*/
	document.getElementById(id).innerHTML ="<br>"+  mensaje+ "</br>";
}
