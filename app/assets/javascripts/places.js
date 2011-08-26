// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $(".delete_place_image").click(function(){
    
    var deleted = $(this).attr("image_id")
    
    if (confirm("Are you sure?")) {
      $.ajax({
        url: "/images/" + deleted,
        type: "DELETE",
        success: function(response){
          if (response.success == 1) {
            $("#place_image_" + deleted).slideDown().remove()
          } else {
            alert("An error occured. Please try again later")
          }
        }
      })
    }
  })
  
  $(".make_image_primary").click(function(){
    
    var primary = $(this).attr("image_id")
    
    $.ajax({
      url: "/images/" + primary + "/make_primary",
      type: "POST",
      success: function(response) {
        if (response.success == 1) {
          alert("Image has been updated")
        } else {
          alert("An error occured. Please try again later")
        }
      }
    })
  })
})

