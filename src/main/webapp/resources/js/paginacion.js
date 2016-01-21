$(document).ready( function () {
    $('#table_id').DataTable();
} );
$(document).ready( function () {
    $('#tableUsuarios').DataTable();
} );

function deleteAsig(source,Id,Asignatura,Curso,Anio){	
	/*alert(Asignatura+" "+ Curso+ " "+ Id);*/
	$.ajax({
    url: 'adminDeleteAsignatura',
    type: 'POST',
    data: { 'source': source, 
    	'Id': Id,
    	'Asignatura':Asignatura,
    	'Anio':Anio,
    	'Curso':Curso},
	})
	$('#table_id').DataTable();
	/*por alguna razon se queda bloqueado y no sigue ejecutando */
};
function deleteUsuario(source,Id,Asignatura,Curso,Anio){	
	/*alert(Asignatura+" "+ Curso+ " "+ Id);*/
	$.ajax({
    url: 'adminDeleteAsignatura',
    type: 'POST',
    data: { 'source': source, 
    	'Id': Id,
    	'Asignatura':Asignatura,
    	'Anio':Anio,
    	'Curso':Curso},
	})
	$('#table_id').DataTable();
	/*por alguna razon se queda bloqueado y no sigue ejecutando */
};

