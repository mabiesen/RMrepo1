// ==UserScript==
// @name         Jim's Link Conversion for Papertrail
// @namespace    http://app.raygun.com
// @version      0.1
// @description  Convert SessionIDs in Raygun to URLs pointed to Papertrail.
// @author       Jim Mulhern
// @match        http://*/*
// @grant        none
// @require      //cdnjs.cloudflare.com/ajax/libs/jquery/1.7/jquery.min.js
// ==/UserScript==

(function() {
    'use strict';

function main() {
  jQuery.noConflict(); // if window.$ has been used by other libs
 var link = jQuery('div.ei-result');

jQuery(document).ready(function() {  

  jQuery(link).each( function() {
     var hyperlink = 'https://papertrailapp.com/groups/348823/events?q=program%3Aproduction+', 
     re= new RegExp(/[\d\D]{30,32}-n1/), 
     URL= jQuery(this).text();
     var linkText = jQuery(this).html("<a href="+ hyperlink +">" + URL.replace(re , '$1' ) + " </a> ");

     return linkText;
    });
}); 
 
}

})();