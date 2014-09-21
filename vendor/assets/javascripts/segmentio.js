// custom tracking events for segment, upgrade actions
jQuery(function() {
  $('#upgrade-account').on('click', function(){
  	analytics.track('upgrade-account', {
  	    description: 'The user from any page click upgrade from the navbar.'
  	});
  });
  
  $('#upgrade-in-p').on('click', function(){
	analytics.track('upgrade-feature-account-link', {
	    description: 'The user clicked upgrade INLINE paragraph after trying to ' +
					 'generate a link to track profile views.'
	});
  });
  
  $('#flash-listing-upgrade').on('click', function(){
	analytics.track('upgrade-limit-flash-link', {
	    description: 'The user clicked upgrade in ' +
					'flash message after trying to add 3+ videos'	
	});
  });
  
  $('#to-checkout').on('click', function(){
	analytics.track('HOT-CHECKOUT-PAGE', {
	    description: 'The user is on the checkout page to enter in pmt information'
	});
  });
  
  $('#upgrade-below-p').on('click', function(){
	analytics.track('upgrade-feature-account-link', {
	    description: 'The user clicked upgrade BELOW paragraph after trying to ' +
					 'generate a link to track profile views. '
	});
  });
});