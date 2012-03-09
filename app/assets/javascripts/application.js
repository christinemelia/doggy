// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= require jquery-ui-timepicker-addon





$(function ()
      {
	
		 	
	$('#order_grooming_date').datepicker(
		{
		
		dateFormat: "yy-mm-dd"
		
	    }
	);
		
  
	
	
   	$('#order_grooming_time').timepicker(
	{
		ampm: true,
		hourMin: 8,
		hourMax: 16,
		timeFormat: 'h:m'
		
	}
	);
		
});
	
	


	
	

	
	
	
	
	
	