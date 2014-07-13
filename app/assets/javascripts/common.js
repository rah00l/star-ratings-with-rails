$(document).ready(function() {
	$("#user_address_attributes_country_id").on("change",function(event){
		if($("#user_address_attributes_country_id").val()!="")
		{
			var countryId  = $("#user_address_attributes_country_id").val();
			$.ajax({
				type: 'GET',
				url: '/get_states',
				data: 'country_id='+countryId,
				success: function(msg) {
					$("#city_id_container").hide();
				}
			});		
		}	
		return false;
	});

	$("#state_id_container").on("change",function(event){
		if($("#user_address_attributes_state_id").val()!="")
		{
			$("#city_id_container").show();
			var stateId = $("#user_address_attributes_state_id").val();
			$.ajax({
				type: 'GET',
				url: '/get_cities',
				data: 'state_id='+stateId,
				success: function(msg) {
				}
			});
		}
		return false;
	});
});

