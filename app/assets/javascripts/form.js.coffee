$(document).ready ->
  $(".group_like_logo").click ->
    $(".group_like_logo").addClass "grayed_image"
    $(this).removeClass "grayed_image"
    $(".like_group_input_for_js").val $(this).attr("alt")
    console.log $(".job_first_flow").offset().left
  # 悬浮提示信息绑定
  $('.job_flow_span').tooltip()
  $('.group_like_logo').tooltip()
