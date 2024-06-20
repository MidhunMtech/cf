$(document).ready(function() {
	$('#checkEmailButton').click(function() {
		var email = $('#email').val();
		$.ajax({
			url: 'checkMail.cfm',
			type: 'POST',
			data: { email: email },
			success: function(response) {
				if (response.trim() == 'exists') {
					alert('Mail ID is already there');
					$('#submitButton').prop('disabled', true);
				} else {
					$('#submitButton').prop('disabled', false);
				}
			}
		});
	});
});
