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
    $.ajax({
      url: "/places/" + $(this).attr("place_id") + "/" + $(this).attr("kind"),
      type: "POST",
      data: {},
      success: function(response) {
        
      }
    })
  })
})