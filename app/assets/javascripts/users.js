// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  var appointment_invitee_id = $("#appointment_invitee_id")
  var appointment_invitee_name = $("#appointment_invitee_name")
  var date_proposal = $("#date_proposal")
  $(".make_a_date").click(function(){
    appointment_invitee_id.val($(this).attr("invitee_id"))
    appointment_invitee_name.text($(this).attr("invitee_name"))
    window.overlay.fadeIn(function(){
      date_proposal.fadeIn();
    })
  })
  
  $("#new_appointment").bind("ajax:success", function(evt, data, status, xhr){
    if (data.success == 1) {
      window.flash_alert(data.message)
    } else {
      window.flash_error(data.message.join("<br />"))
    }
  })
  
})
