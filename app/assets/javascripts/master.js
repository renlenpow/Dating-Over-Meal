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
    
  })
})