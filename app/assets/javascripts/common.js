$(document).ready(function() {
	$("#user_address_attributes_city_id").on("change",function(event){
		if($("#user_address_attributes_city_id").val()!="")
		{
			var cityId  = $("#user_address_attributes_city_id").val();
			$.ajax({
				type: 'GET',
				url: '/user/get_states',
				data: 'city_id'+cityId,
				success: function(msg) {

				}

			});		
		}	
		return false;
	});

});

