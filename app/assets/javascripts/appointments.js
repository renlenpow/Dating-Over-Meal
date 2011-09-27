// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  $("#report_abuse").click(function(){
    window.overlay.fadeIn(function(){
      $("#report_abuse_note").val("")
      $("#appointment_report_abuse").show()
    })
  })
  
  $("#send_abuse_report").click(function(){
    if ($("#report_abuse_note").val() == "") {
      window.flash_error("Please enter a reason")
    } else {
      $.ajax({
        url: "/appointments/" + $("#appointment_id").val() + "/report_abuse",
        type: "post",
        data: {note: $("#report_abuse_note").val()},
        success: function(response) {
          if (response.success == 1) {
            window.flash_alert(response.message)
          }
        }
      })
    }
  })
})
