var date1 = new Date();
function $rob(_sid) { return document.getElementById(_sid); }
String.prototype.trim = function() {
  return (this.replace(/(^\s+)|(\s+$)/g, ""));
}
String.prototype.ltrim = function() {
  return (this.replace(/(^\s+)/g, ""));
}
String.prototype.rtrim = function() {
  return (this.replace(/(\s+$)/g, ""));
}
function robAjax(inData, method, url, robAjaxCallback) {
  if (inData == null) { return; }
  if (inData.length <= 0) { return; }
  if (method == null) { return; }
  if (method.length <= 0) { return; }
  if (".GET.POST.".indexOf(method) < 0) { return; }
  if (url == null) { return; }
  if (url.length <= 0) { return; }
  // 執行 AJAX
  var xmlHttp = null;
  try {// Firefox, Opera 8.0+, Safari, IE7
    xmlHttp = new XMLHttpRequest();
  }
  catch (e) {// Old IE
    try {
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    catch (e) {
      alert("你的流覽器不支援 AJAX 查詢功能!!");
      return true;
    }
  }
  // Create result handler
  xmlHttp.onreadystatechange = function() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
      var returnCode = xmlHttp.responseText;
      //$rob("roblblMsg").innerHTML += returnCode; //return;
      //alert(returnCode); return;
      var arR = returnCode.split("¶");
      if (arR[0] == "RESEND") {
        robAjax(inData, method, url, robAjaxCallback); return;
      } else if (arR[0] == "UNLOGIN") {
        //location.href = "../loginerror.aspx";
        alert('你的操作已逾時, 請重新登入!!');
        //window.open('../', '_top');
      } else if (arR[0] == "ERR") {
        if (arR.length > 1) {
          $rob("roblblMsg").innerHTML = arR[1]; // +logAjax;
        } else {
          $rob("roblblMsg").innerHTML = returnCode;
        }
      } else {
        //(robAjaxCallback && typeof (robAjaxCallback) === "function") && robAjaxCallback(returnCode);
        if (robAjaxCallback && typeof (robAjaxCallback) === "function") {
          if (arR.length > 1) { robAjaxCallback(arR[1]); }
          else { robAjaxCallback(returnCode); }
        }
        //alert(returnCode);
      }
      //else { $rob("roblblMsg").innerHTML = returnCode; }
    }
  }
  // 送出
  if (method == "POST") {
    xmlHttp.open("POST", url, false);
    xmlHttp.setRequestHeader("content-type", "application/x-www-form-urlencoded; charset=utf-8");
    if (inData) {
      xmlHttp.send(inData);
    } else {
      xmlHttp.send(null);
    }
  } else {
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
  }
}

function mainProc(data) {// 依畫面寬度
  $rob("robData").value = data;
  mainProc_hasData();
}

function mainProc_hasData() {
  var iClientWidth = document.documentElement.clientWidth;
  //alert("iClinetWidth=" + iClientWidth + " " + typeof (iClientWidth));
  //alert(navigator.userAgent + " " + navigator.userAgent);
  if (iClientWidth > 480) { showListTable(); } else { showListData(); }
}

function showListTable() {// table
  var data = $rob("robData").value;
  var arClass = [];
  if ($rob("robtdClass")) {
    if ($rob("robtdClass").value.length > 0) {
      arClass = $rob("robtdClass").value.split(',');
    }
  }

  var arROW = data.split('¡');
  // 清除 table
  var tb1 = $rob("itemTable");
  if (tb1) {
    // 清除 table 中所有內容
    while (tb1.rows.length > 1) {
      tb1.deleteRow(1);
    }
    // 顯示每一筆
    var i = 0, j = 0, ir = 0;
    for (i = 0; i < arROW.length; i++) {
      if (arROW[i].length <= 0) { continue; }
      tb1.insertRow(tb1.rows.length);
      ir = tb1.rows.length - 1;
      var arF = arROW[i].split('¿');

      var D00 = (arF.length > 0 ? arF[0] : "");
      var FBNO = (arF.length > 1 ? arF[1] : "");
      var FBN = (arF.length > 2 ? arF[2] : "");
      var FBDATEFROM = (arF.length > 3 ? arF[3] : "");
      var FBDATEEND = (arF.length > 4 ? arF[4] : "");
      var re = /</g;
      tb1.rows[ir].insertCell(0);
      tb1.rows[ir].cells[0].innerHTML = FBNO.replace(re, "&lt;");
      if (arClass.length > 0) { tb1.rows[ir].cells[0].className = arClass[0]; }

      tb1.rows[ir].insertCell(1);
      tb1.rows[ir].cells[1].innerHTML = "<a href='ListJOB.html?d=" + D00 + "'>"
        + FBN.replace(re, "&lt;") + "</a>"
        ;
      if (arClass.length > 1) { tb1.rows[ir].cells[1].className = arClass[1]; }

      tb1.rows[ir].insertCell(2);
      tb1.rows[ir].cells[2].innerHTML = FBDATEEND.replace(re, "&lt;");
      if (arClass.length > 2) { tb1.rows[ir].cells[2].className = arClass[2]; }

      /*for (j = 0; j < arF.length; j++) {
      tb1.rows[ir].insertCell(j);
      tb1.rows[ir].cells[j].innerHTML = arF[j];
      if (j < arClass.length) {
      tb1.rows[ir].cells[j].className = arClass[j];
      }
      }*/

    }
  }
}
function showListData() {// div
  var data = $rob("robData").value;
  var arClass = [];
  if ($rob("robtdClass")) {
    if ($rob("robdivDataClass").value.length > 0) {
      arClass = $rob("robdivDataClass").value.split(',');
    }
  }

  var arROW = data.split('¡');
  var div1 = $rob("divData");
  div1.innerHTML = "";
  // 顯示每一筆
  var i = 0, j = 0, ir = 0;
  for (i = 0; i < arROW.length; i++) {
    if (arROW[i].length <= 0) { continue; }
    var arF = arROW[i].split('¿');
    var D00 = (arF.length > 0 ? arF[0] : "");
    var FBNO = (arF.length > 1 ? arF[1] : "");
    var FBN = (arF.length > 2 ? arF[2] : "");
    var FBDATEFROM = (arF.length > 3 ? arF[3] : "");
    var FBDATEEND = (arF.length > 4 ? arF[4] : "");
    var obj1 = document.createElement("div");
    if (arClass.length > 0) {
      obj1.setAttribute("msout", arClass[0]);
      obj1.className = arClass[0];
      obj1.onmouseout = function() { this.className = this.getAttribute("msout"); }
    }
    if (arClass.length > 1) {
      obj1.setAttribute("msover", arClass[1]);
      obj1.onmouseover = function() { this.className = this.getAttribute("msover"); }
    }
    obj1.setAttribute("D00", D00);
    obj1.onclick = function() { location.href = "ListJOB.html?d=" + this.getAttribute("D00"); }
    var re = /</g;
    obj1.innerHTML = FBNO.replace(re, "&lt;")
      + "<br />" + FBN.replace(re, "&lt;")
      + "<br />" + FBDATEEND.replace(re, "&lt;")
      ;
    div1.appendChild(obj1);
  }
}

// 載入時
var url = "";
if ($rob("robJS")) {
  url = $rob("robJS").getAttribute("src").replace('.js', '.ashx');
  robAjax("Lang=" + $rob("robLang").value, "POST", url, mainProc);
}
window.onresize = function() {
  //是否是IE 6.0 (可放大，縮小時會因組件大小無法跟隨)
  if (navigator.userAgent.indexOf("MSIE") > 0
  && navigator.userAgent.indexOf("MSIE 6.0") > 0) {
    location.href = location.href;
  } else { robResizeScreen(); }
  mainProc_hasData(); 
  //alert($rob("robData").length);
  /*if ($rob("robJS")) {
  url = $rob("robJS").getAttribute("src").replace('.js', '.ashx');
  robAjax("Lang=" + $rob("robLang").value, "POST", url, mainProc);
  }*/
}
