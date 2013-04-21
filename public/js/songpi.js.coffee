$ ->
  $("#stop").hide()

  $("#play").click ->
    $.get("/start")
    $(this).hide()
    $("#stop").show()
    return false
  $("#stop").click ->
    $.get("/stop")
    $(this).hide()
    $("#play").show()
    return false

  $(".enqueue").click ->
    $.post "/queue",
      song_id: $(this).attr("href")
    $("#play").hide()
    $("#stop").show()
    return false
