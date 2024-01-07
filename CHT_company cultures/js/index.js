// md_section2_2
(function ($) {
  let now = 0;
  let item = $(".md2_2_item");
  let total = item.length;

 let $modal = $('.news_modal');
 let HIDE_CLASS = 'modal_hide';
  $(".md2_2_row > a").on("click", function () {
    let direction = $(this).hasClass("next") ? 1 : -1;
    now = (now + direction + total) % total;
    item
      .eq(now)
      .css({
        display: "block",
      })
      .siblings(".md2_2_item")
      .css({
        display: "none",
      });
  });

  function md2Resize() {
    $(window)
      .on("resize", function () {
        now = 0;

        if (window.innerWidth <= 1200) {
          // item.eq(now).css({
          //   display: "block"
          // });
          // item.eq(now + 1).css({
          //   display: "block"
          // });
          item
            .eq(now)
            .css({
              display: "block",
            })
            .siblings(".md2_2_item")
            .css({
              display: "none",
            });
          // if (window.innerWidth <= 1170) {
          //   item
          //     .eq(now)
          //     .css({
          //       display: "block"
          //     })
          //     .siblings(".md2_2_item")
          //     .css({
          //       display: "none"
          //     });
          // }
        } else if (window.innerWidth > 1200) {
          item.eq(0).css({
            display: "none",
          });
          item.eq(1).css({
            display: "none",
          });

          $(".md2_2_item:not(.boss)").css({
            display: "block",
          });
        }
      })
      .resize();
  }

  $(document).ready(function () {
    news(4);
    md2Resize();
    md2List();
    //readMore
    $(".changeImg").hover(
      function () {
        $(this).attr("src", "./images/index/s3_btn_hover.gif");
      },
      function () {
        $(this).attr("src", "./images/index/s3_btn.png");
      }
    );

    $(".prev, .next").hover(
      function () {
        $(this).attr("src", "../images/index/arrow_hover.png");
      },
      function () {
        $(this).attr("src", "../images/index/s1_arrow.png");
      }
    );
    // md_section1
    $(".s1_focus").on("click", function () {
      $(".s1_new").addClass("s1_no");
      $(".s1_focus").removeClass("s1_no");
      $(".s1_newArrow").css("display", "none");
      $(".s1_focusArrow").css("display", "block");
      $(".s1_item_1").css("display", "none");
      $(".s1_item_2").css("display", "block");
    });
    // md_section1
    $(".s1_new").on("click", function () {
      $(".s1_focus").addClass("s1_no");
      $(".s1_new").removeClass("s1_no");
      $(".s1_newArrow").css("display", "block");
      $(".s1_focusArrow").css("display", "none");
      $(".s1_item_1").css("display", "block");
      $(".s1_item_2").css("display", "none");
    });
  });

  function md2List() {
    let now = 0;
    let total = $(".senpai").length;


    $(".senpai").eq(now).show(0).siblings().hide(0);
    $(".s2_btnList li").eq(now).addClass("on");

    $(".s2_btnList > li").on("click", function () {
      now = $(this).index();
      $(".md2_2_item")
        .eq(now)
        .stop(false, true)
        .fadeIn()
        .siblings()
        .stop(false, true)
        .fadeOut();
      $(".s2_btnList li").eq(now).addClass("on").siblings().removeClass("on");
    });

    $(".md2_2_buttom > a").on("click", function () {
      var direction = $(this).hasClass("next");
      if (direction) {
        now = (now + 1) % total;
      } else {
        now = now <= 0 ? total - 1 : now - 1;
      }
      $(".md2_2_item")
        .eq(now)
        .stop(false, true)
        .fadeIn()
        .siblings()
        .stop(false, true)
        .fadeOut();
      $(".s2_btnList li").eq(now).addClass("on").siblings().removeClass("on");
    });
  }

  function focus(num) {
    let focus = [
      {
        number: "01",
        job: "AI應用專案管理/雲端系統/SDN網路規劃/資安/系統分析與開發"
      },
      {
        number: "02",
        job: "智慧電網產品專案規劃"
      },
      {
        number: "03",
        job: "智慧安防專案管理"
      },
      {
        number: "04",
        job: "智慧城市及智慧綠能(iEN)/公雲/IDC產品推廣"
      },
      {
        number: "05",
        job: "5G網路及應用技術研發"
      },
      {
        number: "06",
        job: "雲端/OSS/BSS/服務平台技術研發"
      },
      {
        number: "07",
        job: "物聯網技術研發"
      },
      {
        number: "08",
        job: "AI/ML/資安技術研發"
      },
      {
        number: "09",
        job: "營運規劃分析"
      },
      {
        number: "10",
        job: "客戶經營與產品銷售推廣"
      },
      {
        number: "11",
        job: "行動ICT 產品及物聯網產業應用開發與推廣"
      },
      {
        number: "12",
        job: "行銷規劃、客戶忠誠度計畫"
      },
      {
        number: "13",
        job: "客戶維繫"
      }
    ]
    $(".s1_item_2 ul").empty();
    for (let i = 0; i < num; i++) {
      if (i == 12) {
        $(".s1_item_2 ul").append(
          '<li>' +
          '<a href="./e-recruit/showPositionDesc.aspx?fb=' + 1 + '" target="_blank">' +
          '<div class="s1_date">' + focus[i].number + '</div>' +
          '<div class="s1_news">' + focus[i].job + '</div>' +
          '</a>' +
          '</li>'
        );
      } else {
        $(".s1_item_2 ul").append(
          '<li>' +
          '<a href="./e-recruit/showPositionDesc.aspx?fb=' + (i + 2) + '" target="_blank">' +
          '<div class="s1_date">' + focus[i].number + '</div>' +
          '<div class="s1_news">' + focus[i].job + '</div>' +
          '</a>' +
          '</li>'
        );
      }

    }

  }
  //重點職缺
  $(".s1_focus").on("click", function () {
    focus(5);
  })
  //重點職缺展開
  $("#focusBtn").on("click", function () {
    var focusLen = $(".s1_item_2 ul li").length;
    if (focusLen == 5) {
      $("#focusBtn img").attr("src", "./images/index/s3_btn_less.png");
      focus(13);
    } else if (focusLen == 13) {
      $("#focusBtn img").attr("src", "./images/index/s3_btn.png");
      focus(5);
    }

  })
  var newLen;
  //最新消息
  function news(num) {
    $.ajax({
      url: "robNews.aspx?a=list",
    }).done(function (res) {
      // console.log(res);
      var strStart = res.split("¶");
      // console.log(strStart);
      var newArr = [];
      var arr;
      strStart.forEach(function (item) {
        arr = item.split("¡");
        newArr.push([
          arr[0],
          arr[1],
          arr[2],
        ]

        )
      })
      newArr.shift();
      // console.log(newArr);
      newLen = newArr.length - 2;
      // newArr.length = newLen-2;
      // console.log( newLen);

      // console.log(newArr);
      // console.log(newArr[0][0]);
      $(".s1_item_1 ul").empty();
      for (let i = 0; i < num; i++) {
       
        $(".s1_item_1 ul").append(
          '<li>' +
          '<a href="javascript:;" alt="' + newArr[i][0] + '">' +
          '<div class="s1_date">' + newArr[i][1] + '</div>' +
          '<div class="s1_news">' + newArr[i][2] + '</div>' +
          '</a>' +
          '</li>'
        ); 
      }
      //最新消息內容
      $(".s1_item_1 ul li a").click(function () {
              console.log("123");
        var n = $(this).attr("alt");
        // console.log(n);

        $.ajax({
          url: "robNews.aspx?a=page&d=" + n + "",
        }).done(function (res) {
          // console.log(res);
          var strStart = res.split("¶");
          strStart.pop();
          console.log(strStart);
        
          if(!strStart[2]) {
            
            $modal.addClass(HIDE_CLASS);
          } else {
            $modal.fadeIn(500).removeClass(HIDE_CLASS);
            $(".news_content").empty();
            $(".news_content").append(
              '<h1>'+ strStart[1] +'</h1>'+
              '<h2><img src="./images/index/news_time.png" alt="">'+ strStart[0] +'</h2>'+
              '<hr>'+
              '<p>'+ strStart[2] +'</p>'+
              '<a class="modal_close"><img src="./images/index/news_close.png" alt=""></a>'
            ); 
            mobalClose();
          }
        })
      })
    })
  }
  $(".s1_new").on("click", function () {
    news(4);
  })
  //最新消息展開
  $("#newsBtn").on("click", function () {
    var newsLen = $(".s1_item_1 ul li").length;
    if (newsLen == 4) {
      $("#newsBtn img").attr("src", "./images/index/s3_btn_less.png");
      news(newLen);
    } else if (newsLen == newLen) {
      $("#newsBtn img").attr("src", "./images/index/s3_btn.png");
      news(4);
    }
  })

  //最新消息內容關閉
  function mobalClose() {
    $('.modal_close').on('click', function () {
        $modal.fadeOut(500).addClass(HIDE_CLASS);
    });
}
})($);
