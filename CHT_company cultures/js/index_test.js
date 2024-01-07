// md_section2_2
(function ($) {
  let now = 0;
  let item = $(".md2_2_item");
  let total = item.length;

  $(".md2_2_row > a").on("click", function () {
    let direction = $(this).hasClass("next") ? 1 : -1;
    now = (now + direction + total) % total;
    item
      .eq(now)
      .css({
        display: "block"
      })
      .siblings(".md2_2_item")
      .css({
        display: "none"
      });
  });

  function md2Resize() {
    $(window)
      .on("resize", function () {
        now = 0;

        if (window.innerWidth <= 1200) {
          item.eq(now).css({
            display: "block"
          });
          item.eq(now + 1).css({
            display: "block"
          });
          if (window.innerWidth <= 1170) {
            item
              .eq(now)
              .css({
                display: "block"
              })
              .siblings(".md2_2_item")
              .css({
                display: "none"
              });
          }
        } else if (window.innerWidth > 1200) {
          item.eq(0).css({
            display: "none"
          });
          item.eq(1).css({
            display: "none"
          });

          $(".md2_2_item:not(.boss)").css({
            display: "block"
          });
        }
      })
      .resize();
  }

  $(document).ready(function () {
    s1_news();
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
    console.log(total);

    $(".senpai")
      .eq(now)
      .show(0)
      .siblings()
      .hide(0);
    $(".s2_btnList li")
      .eq(now)
      .addClass("on");

    $(".s2_btnList > li").on("click", function () {
      now = $(this).index();
      $(".md2_2_item")
        .eq(now)
        .stop(false, true)
        .fadeIn()
        .siblings()
        .stop(false, true)
        .fadeOut();
      $(".s2_btnList li")
        .eq(now)
        .addClass("on")
        .siblings()
        .removeClass("on");
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
      $(".s2_btnList li")
        .eq(now)
        .addClass("on")
        .siblings()
        .removeClass("on");
    });
  }
})($);

function s1_news() {
  $.ajax({
    url: "./upload/system/dbIndex.txt",
  }).done(function (res) {

    var strStart = res.split("¶");
    // console.log(strStart);
    var newArr = [];
    var arr;
    strStart.forEach(function(item) {
      arr = item.split("¡"); 
      newArr.push([
        arr[0],
        arr[1],
        arr[2],
        arr[3],
        arr[4],
        arr[5],
        arr[6],
        arr[7],
      ]

      )
    })
    console.log(newArr);
    console.log(newArr[1][1]);
    // let j = res.focus;

    // let arr1 = Object.keys(i);
    // let len1 = arr1.length
    // console.log(len1);
    // console.log(arr1);

    // let arr2 = Object.keys(j);
    // let len2 = arr2.length
    // console.log(len2);
   
      $(".s1_item_1 ul").empty();
      // $(".s1_item_2 ul").empty();
      for (let i = 0; i < 4; i++) {
        if(newArr[i][1] == "N") {
          continue;
        } else {
          $(".s1_item_1 ul").append(
            '<li>' +
            '<div class="s1_date">' + newArr[i][2] + '</div>' +
            '<div class="s1_news">' + newArr[i][3] + '</div>' +
            '</li>'
          );
        }
    }
   


    // for (let i = 4; i < 8; i++) {
    //   if(newArr[i][1] == "N") {
    //     continue;
    //   } else {
    //   $(".s1_item_2 ul").append(
    //     '<li>' +
    //     '<div class="s1_date">' + newArr[i][2] + '</div>' +
    //     '<div class="s1_news">' + newArr[i][3] + '</div>' +
    //     '</li>'
    //   );
    //   }
    // }

  })

}


