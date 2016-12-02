// ==UserScript==
// @name         Jim's Link Conversion for Papertrail 2
// @namespace    http://*.raygun.com
// @version      0.45
// @description  Convert SessionIDs in Raygun to URLs pointed to Papertrail.
// @author       Jim Mulhern
// @match        https://*.raygun.com/crashreporting/*
// @grant        none
// @require      https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=
// ==/UserScript==

(function() {
    'use strict';

  jQuery(document).ready(function(){

    var tab = jQuery("#occurrence-tab-Raw .tab-counter");

    jQuery(document).on("click",tab, function(){

    var target = jQuery("span.key:contains('sessionId')").next().html();
          console.log(target);
    // collect variables
    // you can change this to change which element you replace
    var reference = new RegExp("\d\D{30,32}-n1","g"),
    str = target.match(reference),
    text = str.innerText;
        console.log(text);

    var replacement = text.replace(str, "<a href='https://papertrailapp.com/groups/348823/events?q=program%3Aproduction+" + str +"'>"+ str +"</a>");

    console.log("replaced");

    return replacement;
    });
  });
})();