// ==UserScript==
// @name         Jim's Link Conversion for Carsolize!
// @namespace    https://papertrailapp.com/groups/*
// @version      1.5
// @description  Convert Carsolize SegmentIDs converted in Papertrail to log URLs.
// @author       Jim Mulhern
// @match        https://papertrailapp.com/groups/*
// @grant        none
// @require      https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
// ==/UserScript==

(function() {
    'use strict';
  jQuery(document).ready(function(){
		  // build regular expression to track carsolize IDs.
        var orig = jQuery("li span.message"), re = new RegExp(/\d{3}\/\d{3,5}\/[\d\D]{15,18}\/[\d\D]{30,32}/, "gi"), arr=[],
			str = orig.text().match(re);
	  console.info("Carsolize Plugin initialized!");

  // function to acquire carsolize ID and morph it to URI in console log.
    function getCarsolizeIDs() {
	    jQuery.each(str, function(replacement){
  // get distinct items for the array.
	     str = jQuery.unique(str);
          for(var i=0; i < str.length; i++) {
		    var URI = encodeURIComponent(str[i]);
            replacement = str[i].replace(/\d{3}\/\d{3,5}\/[\d\D]{15,18}\/[\d\D]{30,32}/, 'http://cszinternal.cloudapp.net:8081/Redirects/ToSession?env=rocket&session=/'+ URI);
			  arr.push(replacement);
			  arr = jQuery.unique(arr);
			  if (jQuery.inArray(replacement, arr) ){
                 // console.clear();
				 // DO NOTHING
			  } else {
				  var result = JSON.stringify(arr.sort(), null, 4);
                 // console.log("Carsolize Results("+ arr.length +"): " + result);
                console.table( result );
			   }
          }
		// Exit FOR loop

	    });
	// Exit FOREACH loop -- log all unique instances of URI captured.

	}
	  var last_known_scroll_position = 0;
      var ticking = false;
// evaluate window scrolling and re-run function if unique match is found.
    function doSomething(scroll_pos) {

     //  scroll position triggers event firing
	   if( typeof str !== 'undefined' && str){
        console.group("Carsolize IDs");
		   getCarsolizeIDs();
	   } else{
           console.error("Could not match str: "+ str);
         }
	    console.groupEnd();
    }

window.addEventListener('scroll', function(e) {
  last_known_scroll_position = window.scrollY;
  if (!ticking) {
    window.requestAnimationFrame(function() {
      doSomething(last_known_scroll_position);
      ticking = false;
    });
  }
  ticking = true;
});

  });
})();