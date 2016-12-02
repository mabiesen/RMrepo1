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
    // collect variables
    // you can change this to change which element you replace
	
    var reference = document.querySelector('/(\d\D+?[\-n1])/');
    var text = reference.innerText;
    var replacement = text.replace(reference, "https://papertrailapp.com/groups/348823/events?q=program%3Aproduction+" + reference);

    // create new anchor tag
    var a = document.createElement('a');
    a.href = replacement;
    a.innerText = text;

    // do the replacement
    reference.innerHTML = ''; // clear the old contents of the reference
    reference.appendChild(a); // append the new anchor tag into the element
})();



/*
$j = jQuery.noConflict(); 

$j(document).ready(function() {  

   $j('a[href*="&OrderId="]').each( function() {
      var $this = $j(this);
      var re = /\d{4,5}\./;
     
      $this.text($this.text().replace(re, ''));
    });
}); 

var linkText = $this.text();
var newText = linkText.replace(re, '');
$this.text(newText);




--
function toggle(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}
*/