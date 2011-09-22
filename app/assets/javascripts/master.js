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
    $(".pop_dialog").fadeOut(function(){
      window.overlay.hide();
    });
  })
  
  $(".datepicker").datepicker({
    dateFormat: 'yy-mm-dd',
  minDate: new Date()
  });
  
  $(".tooltip").qtip({
    
  })
  
})