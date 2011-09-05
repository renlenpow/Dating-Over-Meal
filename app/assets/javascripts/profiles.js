// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  $("#profile_information_form").bind("ajax:success", function(evt, data, status, xhr){
    $("#alert_content").html("Your profile has been updated");
    $("#alert").slideDown()
    setTimeout(function(){ $("#alert").slideUp() }, 4000)
  })
  
  $("#follow_user").click(function(){
    var that = $(this)
    $.ajax({
      url: "/users/follow",
      type: "POST",
      data: {followed_id: $(this).attr("followed_id")},
      success: function(response){
        if (response.success == 1) {
          that.removeClass("white").addClass("green").text("Following")
        }
      }
    })
  })
  
  $("#direct_message").click(function(){
    $("#overlay").fadeIn(function(){
      $("#pop_dialog").fadeIn()
    })
  })
  
  $("#cancel_message").click(function(){
    $("#pop_dialog").fadeOut(function(){
      $("#overlay").fadeOut()
    })
  })
  
  $("#new_message").bind("ajax:success", function(evt, data, status, xhr){
    if (data.success == 1) {
      window.flash_alert("Your message has been sent")
      $("#message_content").val("")
      $("#cancel_message").trigger("click")
    } else {
      if (data.errors) {
        var errors = ""
        for (err in data.errors) {
          errors += err + " " + data.errors[err]
        }
        window.flash_error(errors)
      }
    }
  })
  
})