function bidHandler(message){
	json = ColdFusion.JSON.encode(message.data);
	var response=jQuery.parseJSON(json);
	if (typeof response == 'object' && message.type == 'data') {
		$('.price').text(response['amount']);
	}
}