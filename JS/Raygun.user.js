// ==UserScript==
// @name         Jim's Link Conversion for Papertrail!
// @namespace    http://*.raygun.com
// @version      1.0
// @description  Convert SessionIDs in Raygun to URLs pointed to Papertrail.
// @author       Jim Mulhern
// @match        https://*.raygun.com/crashreporting/*
// @grant        none
// @require      https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
// ==/UserScript==

(function() {
    'use strict';

  jQuery(document).ready(function(){
// Listen for user to click on 'Raw Data' tab in Raygun.
    var tab = jQuery("div.tabs__tabs ul.tab-group > li#occurrence-tab-Raw .tab-counter:contains('raw data')");
    jQuery(document).on("click",tab, function(){
// Set variables to track inner text and position of element.

      var target = jQuery("span.key:contains('sessionId')").next(),
          str = target.text(),
          location = jQuery(target).offset().top;
      str = str.replace(/['"]+/g, '');

// Only call functionality if user clicked 'Raw Data' tab (which does NOT contain an Anchor Tag).
        if(str !== null || str !== undefined) {

//       console.log(str + " replaced with link!");
// Animate scrolling directly to hyperlink after clicking 'Raw Data' tab.
           jQuery('html, body').animate({
             scrollTop: location - 100
            }, 800);

// MAKE LINK BIG NOW
       return target.html("<em><a href='https://papertrailapp.com/groups/348823/events?q=program%3Aproduction+" + str +"' target='_blank'>"+ str +"</a></em>");

       } else{
           // do nothing
       }
    });

  });
})();