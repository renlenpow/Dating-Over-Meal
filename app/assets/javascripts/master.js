$(document).ready(function(){
  
  window.overlay = $("#overlay")
  
  $(".back_to_top").click(function(){
    $.scrollTo(0, 500);
  })
  
  $(".tabs li").click(function(){
    $(this).addClass("current").siblings().removeClass("current")
    $(".tab_content").hide()
    $("#" + $(this).attr("tab")).show()
  })
  
  $(".interaction").click(function(){
    var that = $(this)
    $.ajax({
      url: "/places/" + $(this).attr("place_id") + "/" + $(this).attr("kind"),
      type: "POST",
      data: {},
      success: function(response) {
        $("#alert_content").html(response.message)
        $("#alert").slideDown()
        setTimeout(function(){ $("#alert").slideUp() }, 4000)
        that.removeClass("white").addClass("green")
      }
    })
  })
  
  window.flash_alert = function(alert_message) {
    $("#alert_content").html(alert_message)
    $("#alert").slideDown()
    setTimeout(function(){ $("#alert").slideUp().html("") }, 4000)
  }
  
  window.flash_error = function(error_message) {
    $("#error_content").html(error_message)
    $("#error").slideDown()
    setTimeout(function(){ $("#error").slideUp() }, 4000)
  }
  
  $(".pop_dialog .cancel_pop_dialog").click(function(){
    $(".pop_dialog").effect("explode", 500, function(){
      window.overlay.slideUp()
    });
  })
  
  $(".datepicker").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: new Date()
  });
  
  $(".tooltip").qtip({
    
  })
  
  $(".fancybox").fancybox({
		titleShow: true,
		overlayShow: true,
		overlayColor: '#000',
		overlayOpacity: 0.5,
		titlePosition: 'inside',
		cyclic: true,
		showNavArrows: true,
		onComplete: function() {
		  $("#fancybox-title").html('<div class="fancybox-title-inside"><span id="edit_image_form"><input id="image_description" placeholder="Description" class="textbox" /><br><span id="update_image_desc" class="action_button">Update</span><span class="remorse_button" id="cancel_edit_image">Cancel</span></span><span id="edit_image_btn" class="action_button">Edit</span></div>').show()
		  $("#edit_image_btn").click(function(){
		    $(this).hide();
		    $("#edit_image_form").show();
		  })
		  $("#cancel_edit_image").click(function(){
		    $(this).parent().hide();
		    $("#edit_image_btn").show()
		  })
		  $("#update_image_desc").click(function(){
		    $.ajax({
		      url: "/images/" + window.image_id,
		      type: "PUT",
		      data: {image: {description: $("#image_description").val()}},
		      success: function(response) {
		        window.flash_alert("Your image has been updated")
		        $("#edit_image_form").hide();
		        $("#edit_image_btn").show();
		      }
		    })
		  })
		}
  })
  
  window.image_id = 0
  
  $(".fancybox").bind('click', function(){
    window.image_id = $(this).attr("image_id")
  })
  
  window.overlay.click(function(){
    $(".pop_dialog").fadeOut(function(){
      window.overlay.slideUp()
    })
  })
  
  //$("select, input:checkbox, input:radio, input:file").uniform();
  
})