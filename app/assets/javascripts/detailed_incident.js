$(document).ready(function(){
	$('#datetimepicker1').datetimepicker({
		maxDate: moment(),
		useCurrent: false
	});

	anonymousReportingSettings();
	detailOfIncidentLocation();

	if($("input[name = 'incident[is_anonymous]']").is(":checked") == true){
		$("#personal-info").hide();
	}
	
});

function anonymousReportingSettings(){
	$("input[name = 'incident[is_anonymous]']").on('change', function(){
		if($(this).is(":checked") == true){
      $("#personal-info").hide();
    }
    else{
    	$("#personal-info").show();	
    }
	});
}

function detailOfIncidentLocation(){
	$("select[name = 'incident[location]']").on('change', function(){		
		if($(this).val() == "More details"){
      $('#incident_location').replaceWith("<textarea placeholder='Details of location' class='form-control' name='incident[location]' id='incident_location'></textarea>");
    }
	});
}