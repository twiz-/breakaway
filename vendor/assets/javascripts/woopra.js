jQuery(function() {
  $('#upgrade-account').on('click', function(){
  	woopra.track('upgrade-account', {
  	    whereFrom: 'navbar'
  	});
  });
  
  $('#upgrade-in-p').on('click', function(){
	woopra.track('upgrade-feature-account-link', {
	    whereFrom: 'in-link-paragraph'
	});
  });
  
  $('#upgrade-below-p').on('click', function(){
	woopra.track('upgrade-feature-account-link', {
	    whereFrom: 'below-link-paragraph'
	});
  });
});


