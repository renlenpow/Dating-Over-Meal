// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("#thoughts_box").focus(function(){
      $(this).css("height", "50px")
  })
  
  $("#new_thought").bind("ajax:success", function(evt, data, status, xhr){
    if (data.success == 1) {
      alert("Your thought has been shared")
      $("#thoughts_box").val("")
    } else {
      
      if (data.errors) {
        var errors = ""
        for (err in data.errors) {
          errors += err + " " + data.errors[err]
        }
        alert(errors)
      }
    }
  })
})
