jQuery.validator.addMethod("phone", function(phone_number, element,param) {
	 var filter = /^\d{10}$/;
	 if (phone_number == "" || filter.test(phone_number)) {
	        return true;
	    }
	    else {
	        return false;
	    }
	    
});