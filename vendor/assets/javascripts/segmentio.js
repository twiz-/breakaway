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
	analytics.track('upgrade-feature-account-link-below', {
	    description: 'The user clicked upgrade BELOW paragraph after trying to ' +
					 'generate a link to track profile views. '
	});
  });
  
  $('#view-games-splash').on('click', function(){
	analytics.track('view-games-from-home', {
	    description: 'The visitor clicked view games from homepage ' 
	});
  });
  $('#sign-in-coach').on('click', function(){
	analytics.track('coach-sign-in-or-up-intent', {
	    description: 'A visitor clicked COACH from the navbar and was taken to login screen' 
	});
  });
  
  $('#sign-in-player').on('click', function(){
	analytics.track('player-sign-in-or-up-intent', {
	    description: 'A visitor clicked PLAYER from the navbar and was taken to login screen' 
	});
  });
  
  $('#sign-up-coach').on('click', function(){
	analytics.track('coach-signup-from-login', {
	    description: 'A visitor clicked START RECRUITING to signup from coach login screen' 
	});
  });
  
  $('#sign-in-player').on('click', function(){
	analytics.track('player-signup-from-login', {
	    description: 'A visitor clicked GET RECRUITED to signup from player login screen' 
	});
  });
  
  $('#create-coach-account').on('click', function(){
	analytics.track('COACH-ACCOUNT-CREATED', {
	    description: 'A visitor clicked create account from coach signup page' 
	});
  });
  
  $('#create-player-account').on('click', function(){
	analytics.track('PLAYER-ACCOUNT-CREATED', {
	    description: 'A visitor clicked create account from player signup page' 
	});
  });  
});
