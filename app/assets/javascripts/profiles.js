// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  $("#profile_information_form").bind("ajax:success", function(evt, data, status, xhr){
    //alert(xhr.responseText)
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
})