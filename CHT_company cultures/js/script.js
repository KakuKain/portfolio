$(function () {
  var $window = $(window);
  var $goTopBtn = $("#goTop");
  var $work = $("#work");

  header();
  footer();
  //http轉址
  // var url = document.location.href;
  // var len = url.length;
  // var http = url.substring(0, 5);
  // if (http != "https") {
  //   var url = "https://" + url.substring(7, len);
  //   window.location.replace(url);
  // }

  // GA 分析

  window.dataLayer = window.dataLayer || [];
  function gtag() {
    dataLayer.push(arguments);
  }
  gtag("js", new Date());

  gtag("config", "UA-83914030-21");

  // 小圖ICON
  var $head = $("head");
  var $headlinklast = $head.find("link[rel='stylesheet']:last");
  var linkElement =
    '<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">' +
    '<link rel="icon" type="image/png" sizes="32x32" href="./favicon/favicon-32x32.png">' +
    '<link rel="icon" type="image/png" sizes="16x16" href="./favicon/favicon-16x16.png">' +
    // '<link rel="manifest" href="./favicon/site.webmanifest">' +
    '<link rel="mask-icon" href="./favicon/safari-pinned-tab.svg" color="#006584">' +
    '<meta name="msapplication-TileColor" content="#da532c">' +
    '<meta name="theme-color" content="#ffffff">' +
    '<script async src="https://www.googletagmanager.com/gtag/js?id=UA-83914030-21"></script>';

  // GA code
  if ($headlinklast.length) {
    $headlinklast.after(linkElement);
  } else {
    $head.append(linkElement);
  }

  // 暫時不開啟
  $(".notYet").on("click", function () {
    alert("近期開放 敬請期待");
    return false;
  });

  // menu
  $("#nav_icon").on("click", function () {
    $("nav").toggleClass("active");
    $("body").toggleClass("active");
    return false;
  });

  // work
  var bodyClass = document.body.classList,
    lastScrollY = 0;
  window.addEventListener("scroll", function () {
    var st = this.scrollY;
    // 判斷是向上捲動，而且捲軸超過 200px
    if (st < lastScrollY) {
      // bodyClass.remove("hideUp");
      $work.addClass("on");
    } else {
      // bodyClass.add("hideUp");
      $work.removeClass("on");
    }
    lastScrollY = st;
  });

  // gotop
  $goTopBtn.on("click", function () {
    $("html, body").animate({ scrollTop: 0 });
    return false;
  });

  // Reserve talent
  var mm = window.matchMedia("(max-width: 768px)");
  mm.addListener(resizeWidth);
  $(window).load(function () {
    resizeWidth(mm);
    pageTop();
  });

  function resizeWidth(pMatchMedia) {
    if (pMatchMedia.matches) {
      //小於768時執行的js
      changePhotoMaxShirt();
      // scroll
      $window
        .on("scroll", function () {
          $("header").addClass("onFixed");
          pageTop();
          $("header h1 img").each(function () {
            var photoAlt = $(this).attr("alt");
            $(this).attr("src", "./images/" + photoAlt + "-m.png");
          });
        })
        .scroll();
    } else {
      //大於768時執行的js
      changePhotoMaxLong();
      // scroll

      $window
        .on("scroll", function () {
          if ($window.scrollTop() > 0) {
            $goTopBtn.stop().animate({ bottom: "20px" });
            $("header").addClass("onFixed");
            pageTop();
            $("header h1 img").each(function () {
              var photoAlt = $(this).attr("alt");
              $(this).attr("src", "./images/" + photoAlt + "-m.png");
            });
          } else {
            $goTopBtn.stop().animate({ bottom: "-50px" });
            $("header").removeClass("onFixed");
            pageTop();
            if ($("header").hasClass("blueLogo")) {
              $("header h1 img").each(function () {
                var photoAlt = $(this).attr("alt");
                $(this).attr("src", "./images/" + photoAlt + "-m.png");
              });
              return;
            }
            $("header h1 img").each(function () {
              var photoAlt = $(this).attr("alt");
              $(this).attr("src", "./images/" + photoAlt + ".png");
            });
          }
        })
        .scroll();
    }
  }

  // changePhotoToPhone;
  function changePhotoMaxShirt() {
    $(".header_content h1 img").each(function () {
      var photoAlt = $(this).attr("alt");
      $(this).attr("src", "./images/" + photoAlt + "-m.png");

      $("header").addClass("onFixed");
    });
  }

  // changePhotoToPC;
  function changePhotoMaxLong() {
    $(".header_content h1 img").each(function () {
      var photoAlt = $(this).attr("alt");
      $(this).attr("src", "./images/" + photoAlt + ".png");
    });
  }

  function pageTop() {
    if ($("header").hasClass("onFixed")) {
      $(".main_content").css("padding-top", "70px");
    } else {
      $(".main_content").css("padding-top", "130px");
    }
  }

  // GA
  // window.dataLayer = window.dataLayer || [];

  // function gtag() {
  //   dataLayer.push(arguments);
  // }
  // gtag("js", new Date());
  // gtag("config", "UA-113583585-1");

  function header() {
    $("#wrap header").empty();
    $("#wrap header").append(
      '<div class="header_content">' +
        "<div>" +
        "<h1>" +
        '<a href="./index.html">' +
        '<img src="./images/logo.png" alt="logo"/>' +
        "</a>" +
        "</h1>" +
        "</div>" +
        "<div>" +
        "<nav>" +
        '<div id="nav_bg"></div>' +
        '<div id="nav_title">' +
        '<a class="navTitle_fb" href="https://www.facebook.com/%E4%B8%AD%E8%8F%AF%E9%9B%BB%E4%BF%A1Career-101930081541827/">' +
        '<img src="./images/h_5.png" alt="中華電信FB">' +
        "</a>" +
        '<a class="navTitle_yt" href="https://www.youtube.com/channel/UCmwrcq1gUOfodbYVkwWAmjA">' +
        '<img src="./images/h_6.png" alt="中華電信Youtube">' +
        "</a>" +
        // '<a class="navTitle_mail" href="mailto:irisko@cht.com.tw">' +
        // '<img src="./images/h_7.png" alt="中華電信Mail">' +
        // "</a>" +
        "</div>" +
        '<div id="nav_icon">' +
        "<div></div>" +
        "<div></div>" +
        "</div>" +
        '<div id="nav_bar">' +
        '<ul id="nav_logo">' +
        '<li><img src="./images/logo.png" alt="中華電信" /></li>' +
        "</ul>" +
        '<ul id="nav_menu">' +
        "<li>" +
        "<div>01</div>" +
        "<div>" +
        "<h4>About Us</h4>" +
        '<a href="about1.html">公司簡介</a>' +
        '<a href="about2.html">企業展望</a>' +
        '<a href="about3.html">成就榮耀</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div>02</div>" +
        "<div>" +
        "<h4>Focus</h4>" +
        '<a href="focusBoss1.html">董事長的話</a>' +
        '<a href="focusBoss2.html">總經理的話</a>' +
        '<a href="focusBoss3.html">人資團隊的話</a>' +
        '<a href="focusTeam.html">技術團隊分享</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div>03</div>" +
        "<div>" +
        "<h4>Growth</h4>" +
        '<a href="growth1.html">訓練發展</a>' +
        '<a href="growth2.html">多元學習</a>' +
        '<a href="growth3.html">社團活動</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div>04</div>" +
        "<div>" +
        "<h4>Daily</h4>" +
        '<a href="daily1.html">幸福生活</a>' +
        '<a href="daily2.html">優享福利</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div>05</div>" +
        "<div>" +
        "<h4>Talent</h4>" +
        '<a href="talent1.html">重點職缺</a>' +
        '<a href="talent2.html">招募流程</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div>06</div>" +
        "<div>" +
        "<h4>Contact</h4>" +
        '<a href="contact.html">連絡我們</a>' +
        "</div>" +
        "</li>" +
        "<li>" +
        "<div></div>" +
        "<div>" +
        "<h4></h4>" +
        '<a href="https://www.facebook.com/%E4%B8%AD%E8%8F%AF%E9%9B%BB%E4%BF%A1Career-101930081541827/?view_public_for=101930081541827">' +
        '<img src="./images/h_1.png" alt="Facebook"/>' +
        "</a>" +
        '<a href="https://www.youtube.com/channel/UCmwrcq1gUOfodbYVkwWAmjA">' +
        '<img src="./images/h_3.png" alt="Youtube"/>' +
        "</a>" +
        // '<a href="mailto:irisko@cht.com.tw">' +
        // '<img src="./images/h_2.png" alt="Email"/>' +
        // "</a>" +
        "</div>" +
        "</li>" +
        "</ul>" +
        "</div>" +
        "</nav>" +
        "</div>" +
        "</div>"
    );
  }

  function footer() {
    $("footer").empty();
    $("footer").append(
      '<div class="footer_content">' +
        '<ul id="footMainMenu">' +
        '<li><a href="https://www.cht.com.tw/home/consumer"><img src="./images/f-logo.png" alt="中華電信"></a></li>' +
        "<li><a>中華電信股份有限公司版權所有 <br /> © Chunghwa Telecom Co., Ltd. All Rights Reserved.</a><a>Tel  /  02-23443670</a><a>E-mail  /  chthire@cht.com.tw</a></li>" +
        // "<li></li>" +
        // "<li></li>" +
        "</ul>" +
        '<ul id="footOtherMenu">' +
        "<li>" +
        '<a href="https://www.facebook.com/%E4%B8%AD%E8%8F%AF%E9%9B%BB%E4%BF%A1Career-101930081541827/?view_public_for=101930081541827" target="_blank">' +
        '<img src="./images/f_1.png" alt="facebook"/>' +
        "</a>" +
        "</li>" +
        "<li>" +
        '<a href="https://www.youtube.com/channel/UCmwrcq1gUOfodbYVkwWAmjA" target="_blank">' +
        '<img src="./images/f_4.png" alt="Youtube"/>' +
        "</a>" +
        "</li>" +
        "</ul>" +
        "</div>"
    );
  }
});
