// custom tracking events for woopra, upgrade actions
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
  
  $('#flash-listing-upgrade').on('click', function(){
	woopra.track('upgrade-limit-flash-link', {
	    whereFrom: 'flash-add-limit'
	});
  });
  
  $('#to-checkout').on('click', function(){
	woopra.track('HOT-checkout-page', {
	    whereFrom: 'final-checkout-page'
	});
  });
  
  $('#upgrade-below-p').on('click', function(){
	woopra.track('upgrade-feature-account-link', {
	    whereFrom: 'below-link-paragraph'
	});
  });
});


