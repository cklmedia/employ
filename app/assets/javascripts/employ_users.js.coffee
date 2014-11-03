$(document).ready ->
  # 控制按钮是否有效
  controller_link = true
  h = $(window).height()
  w = $(window).width()
  count = $(".job_content_li").length
  $(".job_content_li").css "height", h + "px"
  $(".job_content_li").css "width", w + "px"
  i = 0
  while i < count
    $(".job_content_li").eq(i).css "left", i * w + "px"
    i++

  #滚动效果后操作
  remove_li_show = (type) ->
    $(".li_show").eq(type).removeClass "li_show"
    if type is 1 or type is "1"    
      # 当已是最左端时，隐藏左箭头
      remove_left_arow()
      # 标题步骤导航
      $(".nav_title_active").prev().addClass "nav_title_active"  if $(".nav_title_active").prev().length > 0
    else
      # 当已是最右端时，隐藏右箭头
      remove_right_arow()
      # 标题步骤导航
      $(".nav_title_active").next().addClass "nav_title_active"  if $(".nav_title_active").next().length > 0
    $(".nav_title_active").eq(type).removeClass "nav_title_active"
    # 完成滚动效果后，隐藏不应该显示的模块
    act_done_none()
    return
  
  # 当已是最左端时，隐藏左箭头
  remove_left_arow = ->
    $(".action_left").css "display", "none"  if $(".li_show").prev().length <= 0
    return
  
  # 当已是最右端时，隐藏右箭头
  remove_right_arow = ->
    $(".action_right").css "display", "none"  if $(".li_show").next().length <= 0
    return
  
  #导航条滚动完成后，事件处理
  nav_click_fuc = (obj) ->
    $(".job_content_action,.job_content_li").css "display", "block"
    $(".nav_title_active").removeClass "nav_title_active"
    obj.addClass "nav_title_active"
    $(".li_show").removeClass "li_show"
    return
  
  # 右箭头滚动
  right_arrow_act = ->
    controller_link = false
    $(".action_left,.job_content_li").css "display", "block"
    if $(".li_show").next().length > 0
      $(".li_show").next().addClass "li_show"
      $.when(animate_done(0, "li")).then ->
        remove_li_show 0
        return
  
  # 左箭头滚动
  left_arrow_act = ->
    $(".action_right,.job_content_li").css "display", "block"
    if $(".li_show").prev().length > 0
      $(".li_show").prev().addClass "li_show"
      $.when(animate_done(1, "li")).then ->
        remove_li_show 1
        return
  
  # 完成滚动效果后，隐藏不应该显示的模块
  act_done_none = ->
    controller_link = true
    $(".job_content_li:not(.li_show)").css("display","none")

  animate_done = (num, type) ->
    unless type is "nav"
      if num is "1" or num is 1
        res = w
      else
        res = -w
    else
      res = -num
    $(".job_content_li").animate(
      left: "+=" + res
    , 1000).promise()
  
  # 导航条事件响应
  $(".nav_first").click ->
    if controller_link
      controller_link = false
      nav_click_fuc $(this)  if $(".nav_title_active").prev().length > 0
      num = $("#job_content_li_img_1").css("left")
      num = num.substring(0, num.length - 2)
      $("#job_content_li_img_1").addClass "li_show"
      $.when(animate_done(num, "nav")).then(act_done_none).then remove_left_arow
    return

  $(".nav_second").click ->
    if controller_link
      controller_link = false
      nav_click_fuc $(this)
      num = $("#job_content_li_img_2").css("left")
      num = num.substring(0, num.length - 2)
      $("#job_content_li_img_2").addClass "li_show"
      $.when(animate_done(num, "nav")).then act_done_none
    return

  $(".nav_third").click ->
    if controller_link
      controller_link = false
      nav_click_fuc $(this)
      num = $("#job_content_li_img_3").css("left")
      num = num.substring(0, num.length - 2)
      $("#job_content_li_img_3").addClass "li_show"
      $.when(animate_done(num, "nav")).then act_done_none
    return

  $(".nav_fourth").click ->
    if controller_link
      controller_link = false
      nav_click_fuc $(this)  if $(".li_show").next().length > 0
      num = $("#job_content_li_img_4").css("left")
      num = num.substring(0, num.length - 2)
      $("#job_content_li_img_4").addClass "li_show"
      $.when(animate_done(num, "nav")).then(act_done_none).then remove_right_arow
    return

  
  # 左按钮响应事件
  $(".action_left").click ->
    if controller_link
      controller_link = false
      left_arrow_act()

  # 右按钮响应事件
  $(".action_right").click ->
    if controller_link
      controller_link = false
      right_arrow_act()