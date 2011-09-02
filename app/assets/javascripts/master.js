$(document).ready(function(){
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
})