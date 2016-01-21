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
    	'Curso':Curso
    	},
	
	success: function(result) {
        location.reload();
        //$("#divSettings").html(this);
    },
	});
	
	/*por alguna razon se queda bloqueado y no sigue ejecutando */
};
function editAsig(source,Id,Asignatura,Curso,Anio){	
	/*alert(Asignatura+" "+ Curso+ " "+ Id);*/
	$("#editId").attr("value", Id);
	$("#editAsignatura").attr("value", Asignatura);
	$("#editCurso").attr("value", Curso);
	$("#editAnio").attr("value", Anio);	
	/*por alguna razon se queda bloqueado y no sigue ejecutando */
};

function deleteUsuario(source,Id){	
	/*alert(Asignatura+" "+ Curso+ " "+ Id);*/
	$.ajax({
    url: 'adminDeleteUser',
    type: 'POST',
    data: { 'source': source, 
    	'Id': Id,
    },
	
	success: function(result) {
        location.reload();
        //$("#divSettings").html(this);
    },
	});
	
	/*por alguna razon se queda bloqueado y no sigue ejecutando */
};

