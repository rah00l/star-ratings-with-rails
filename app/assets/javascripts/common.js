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
					$("#user_address_attributes_state_id").focus();
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
					$("#user_address_attributes_city_id").focus();
				}
			});
		}
		return false;
	});


	$(".check_email").on("blur",function(event){
		if($("#user_email").val()!=""){
			var userEmail = $("#user_email").val();
			$.ajax({
				type: 'GET',
				url: '/get_user_email_status',
				data: 'user_email='+userEmail,
				datatype: 'json',
				success: function(data){
					if(data.status == "false"){
						$("#resultStatus").text(data.message).css("color","red" );
						$("#user_email").focus();
						$("#user_email").val("");
					}
					else{
						$("#resultStatus").text(data.message).css("color","green" );
					}
				}
			});
		}

	});
});

