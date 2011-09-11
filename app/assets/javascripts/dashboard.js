// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("#thoughts_box").focus(function(){
      $(this).css("height", "50px")
  })
  
  $("#new_thought").bind("ajax:success", function(evt, data, status, xhr){
    if (data.success == 1) {
      window.flash_alert(data.message)
      $("#thoughts_box").val("")
    } else {
      window.flash_error(data.message.join("<br />"))
    }
  })
})
