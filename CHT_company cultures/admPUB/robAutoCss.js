// robAutoCss v1.0 by Robin 2014/10/6
function $rob(_sid) { return document.getElementById(_sid); }
function robResizeScreen() {
  try {
    var iClientWidth = document.body.clientWidth;
    iClientWidth = document.documentElement.clientWidth;
    var iAvailWidth = screen.availWidth;
    //alert(iClientWidth + " - " + iAvailWidth+" - "+document.documentElement.clientWidth);
    if (robAutoCss.length > 0) {
      // 查核所有的 link
      // 排除華碩的問題 T零零(大i) screen.availWidth 永遠是 480 
      //alert(navigator.userAgent.indexOf("ASUS_T00I Build/JSS15Q") >= 0);
      for (var i = 0; i < document.getElementsByTagName("link").length; i++) {
        // link 的 id 是否有定義
        for (var i1 = 0; i1 < robAutoCss.length; i1++) {
          if (document.getElementsByTagName("link")[i].id == robAutoCss[i1][0]) {
            // 如果不是一組陣列，就不處理
            if (typeof robAutoCss[i1] == "object") {
              var ar1 = robAutoCss[i1];
              // 至少有 id 及 兩對值才要處理
              if (ar1.length >= 5) {
                for (var i2 = 1; i2 < ar1.length - 1; i2 = i2 + 2) {
                  // 排除華碩的問題 T零零(大i) screen.availWidth 永遠是 480 (w320 h533 zenfone4 800x480)
                  // 以那個為準?? 如果 iClientWidth >= iAvailWidth 取 iClientWidth
                  // 如果 iClientWidth < iAvailWidth 取 iClientWidth
                  if (iClientWidth <= ar1[i2]) {
                    document.getElementsByTagName("link")[i].href = ar1[i2 + 1];
                    break;
                  }
                  /*
                  if (navigator.userAgent.indexOf("ASUS_T00I Build/JSS15Q") >= 0) {
                    if (iClientWidth <= ar1[i2]) {
                      document.getElementsByTagName("link")[i].href = ar1[i2 + 1];
                      break;
                    }
                  } else {
                    if (iClientWidth <= ar1[i2] || iAvailWidth <= ar1[i2]) {
                      document.getElementsByTagName("link")[i].href = ar1[i2 + 1];
                      break;
                    }
                  }*/
                }
              }
            }
            break;
          }
        }
      }
    }

    if (robAutoImg.length > 0) {
      // 查核所有的 img
      for (var i = 0; i < document.images.length; i++) {
        // link 的 id 是否有定義
        for (var i1 = 0; i1 < robAutoImg.length; i1++) {
          if (document.images[i].id == robAutoImg[i1][0]) {
            // 如果不是一組陣列，就不處理
            if (typeof robAutoImg[i1] == "object") {
              var ar1 = robAutoImg[i1];
              // 至少有 id 及 兩對值才要處理
              if (ar1.length >= 5) {
                for (var i2 = 1; i2 < ar1.length - 1; i2 = i2 + 2) {
                  // 排除華碩的問題 T零零(大i) screen.availWidth 永遠是 480 (w320 h533 zenfone4 800x480)
                  /*if (navigator.userAgent.indexOf("ASUS_T00I Build/JSS15Q") >= 0) {
                    if (iClientWidth <= ar1[i2]) {
                      document.images[i].src = ar1[i2 + 1];
                      break;
                    }
                  } else {
                    if (iClientWidth <= ar1[i2] || iAvailWidth <= ar1[i2]) {
                      document.images[i].src = ar1[i2 + 1];
                      break;
                    }
                  }*/
                  // 只以 iClientWidth 為準
                  if (iClientWidth <= ar1[i2]) {
                    document.images[i].src = ar1[i2 + 1];
                    break;
                  }
                }
              }
            }
            break;
          }
        }
      }
    }
  }
  catch (e) {
    alert("Resize發生錯誤:" + e);
  }
}
window.onresize = function() {
  //alert("resize");
  /* alert("window.onresize"
  + "\ndocument.body.clientWidth=" + document.body.clientWidth
  + "\nscreen.availWidth=" + screen.availWidth
  + "\nnavigator.userAgent=" + navigator.userAgent
  ); */
  //是否是IE 6.0 (可放大，縮小時會因組件大小無法跟隨)
  if (navigator.userAgent.indexOf("MSIE") >= 0
    && navigator.userAgent.indexOf("MSIE 6.0") >= 0) {
    location.href = location.href;
  } else { robResizeScreen(); }

  /*robResizeScreen();*/
  /*alert("window.onresize"
  + "\ndocument.body.clientWidth=" + document.body.clientWidth
  + "\nscreen.availWidth=" + screen.availWidth
  );*/
}
robResizeScreen();
