// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  $("#profile_information_form").bind("ajax:success", function(evt, data, status, xhr){
    //alert(xhr.responseText)
  })
})