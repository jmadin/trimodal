// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

function checkUncheckAll(theElement) { 
	var theForm = theElement.form, z = 0; 
		for(z=0; z<theForm.length;z++){ 
		if(theForm[z].type == 'checkbox' && theForm[z].name != 'checkall'){ 
			theForm[z].checked = theElement.checked; 
		} 
	} 
} 

function jchange(o) {
	var fold_image = new Array();
	fold_image[0] = "/images/openarrow.gif";
	fold_image[1] = "/images/closedarrow.gif";

	if(document.getElementById(o).style.display=='none') {
		document.getElementById(o).style.display='block';
		if(document.getElementById('nfolding')) {
			document.getElementById('nfolding').src=fold_image[0];
		}
	} else {
		document.getElementById(o).style.display='none';
		if(document.getElementById('nfolding')) {
			document.getElementById('nfolding').src=fold_image[1];
		}
	}
}
