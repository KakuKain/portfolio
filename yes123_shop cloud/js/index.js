$(function () {
  rwdCheck()
  mode3PH()
  storePhotoH()
  activityH()
  mode1Commodity()

  if($("body").hasClass("desktop") == true)  {
  }

  //改變尺寸
  $(window).resize(function(){
    // ? true : false
    rwdCheck()
    mode3PH()
		storePhotoH()
		activityH()
    mode1Commodity()
    if($("body").hasClass("desktop") == true) {
    }
  });
  
  // 判斷螢幕尺寸
  function rwdCheck() {
    var device = $(window).width() > 767 ? "desktop" : "mobile";
    $("body").removeClass('desktop').removeClass('mobile').addClass(device) 
  }

  
  // popup 關閉 START
  $('.popupClose').click(function (e) {
    closeWindow($(this))
  })
  $('.popupBg').click(function (e) {
    closeWindow($(this))
  })

  function closeWindow(thisObj) { 
    thisObj.parents('.K_popup').fadeOut(250)
    thisObj.parents('.K_popup').removeClass('transform-in').addClass('transform-out')
    // e.preventDefault()
  }
  // popup 關閉 END


  function mode3PH() {
    var mode3PWidth = $(".allProduct.mode3 .commodity > div:nth-of-type(1)").innerWidth()
    if($(".allProduct").hasClass("mode3") == true) {
      $(".allProduct.mode3 .commodity > div:nth-of-type(1)").height(mode3PWidth)
    }
    else {
      $(".allProduct.mode1 .commodity > div:nth-of-type(1)").height(50)
      $(".allProduct.mode2 .commodity > div:nth-of-type(1)").height("inherit")
    }
  }

  
  function storePhotoH() {
    var mode3PWidth = $(".storePhoto .mode3 .commodity > div:nth-of-type(1)").innerWidth()
    $(".storePhoto .mode3 .commodity > div:nth-of-type(1)").height(mode3PWidth)
  }

  function activityH() {
    var mode3PWidth = $(".activity.mode3 .commodity > div:nth-of-type(1)").innerWidth()
    $(".activity.mode3 .commodity > div:nth-of-type(1)").height(mode3PWidth)
  }




  
  $('input[name="modeCheck"]').click(function() {
    if($('#mode1Check').is(':checked') == true) { 
      $(".allProduct").removeClass("mode1 mode2 mode3").addClass("mode1")
      mode1Commodity()

    }
    if($('#mode2Check').is(':checked') == true) { $(".allProduct").removeClass("mode1 mode2 mode3").addClass("mode2")}
    if($('#mode3Check').is(':checked') == true) { $(".allProduct").removeClass("mode1 mode2 mode3").addClass("mode3")}
    
    mode3PH()
  });

  
  function mode1Commodity() {
    $(".merchandise .mode1 .commodity > div:nth-of-type(2)").click(function () {
      if ($(this).parents(".commodity").hasClass("mode1Close")) {
        $(this).parents(".commodity").removeClass("mode1Close");
        $(this).parents(".commodity").addClass("mode1Open");
      } else {
        $(this).parents(".commodity").removeClass("mode1Open");
        $(this).parents(".commodity").addClass("mode1Close");
      }
    });
  }
  

  // var starHour = $("#start_hour").find('option:selected').text()

  if($("select[id$=start_hour]").find(":selected").val() == "24h") {
    $(this).addClass("time24h")
    // console.log("123")
  }
})