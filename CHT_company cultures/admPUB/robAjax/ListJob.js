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
function getValue(varname) {
  var i = 0;
  var url = window.location.href;
  var qparts = url.split("?");
  if (qparts.length < 2) { return ""; }
  var query = qparts[1];
  var vars = query.split("&");
  var value = "";
  for (i = 0; i < vars.length; i++) {
    var parts = vars[i].split("=");
    if (parts[0] == varname) {
      value = parts[1];
      break;
    }
  }
  value = unescape(value);
  value.replace(/\+/g, " ");
  return value;
}
var varD00 = getValue("d");
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
  //if (iClientWidth > 480) { showListTable(); } else { showListData(); }
  showData();
}
function showData() {
  var data = $rob("robData").value;
  var arROW = data.split('¿');
  var FBNO = (arROW.length > 0 ? arROW[0] : "");
  var FBN = (arROW.length > 1 ? arROW[1] : "");
  var FBDATEEND = (arROW.length > 2 ? arROW[2] : "");
  var FBDESC = (arROW.length > 3 ? arROW[3] : "");
  var re = /</g;
  var reLF = /\n/g;
  var reCR = /\r/g;
  $rob("txtFBNO").innerHTML = FBNO.replace(re, "&lt;");
  $rob("txtFBN").innerHTML = FBN.replace(re, "&lt;");
  $rob("txtFBDATEEND").innerHTML = FBDATEEND.replace(re, "&lt;");
  $rob("txtFBDESC").innerHTML = FBDESC.replace(re, "&lt;").replace(reCR, "").replace(reLF, "<br />");
}

// 載入時
var url = "";
if ($rob("robJS")) {
  url = $rob("robJS").getAttribute("src").replace('.js', '.ashx');
  robAjax("Lang=" + $rob("robLang").value + "&d=" + varD00, "POST", url, mainProc);
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
