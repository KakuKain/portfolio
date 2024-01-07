function __robPostBack(robArg1, robArg2) {
  var theForm = document.forms['aspnetForm'];
  if (!theForm) {
    theForm = document.aspnetForm;
  }
  if (!theForm) {
    theForm = document.forms[0];
  }
  if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
    theForm.__robArg1.value = robArg1;
    theForm.__robArg2.value = robArg2;
    theForm.submit();
  }
}
var sLed = "ctl00_ContentPlaceHolder1_";
//var sLed = "ContentPlaceHolder1_";  // 正式上線用的是沒有 ct100_ 的版本
function $rob(_sid) {
  if (document.getElementById(_sid))
  { return document.getElementById(_sid); }
  if (_sid.indexOf("ctl00_") == 0)
  { _sid = _sid.replace("ctl00_", ""); }
  if (document.getElementById(_sid))
  { return document.getElementById(_sid); }
  if (_sid.indexOf("ContentPlaceHolder1_") == 0)
  { _sid = _sid.replace("ContentPlaceHolder1_", ""); }
  return document.getElementById(_sid);
}

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
function getRadio(_name) {
  var obj1 = document.getElementsByName(_name);
  if (obj1) {
    for (var i = 0; i < obj1.length; i++) {
      if (obj1[i].checked) { return i; }
    }
    return -1;
  } else {
    return -1;
  }
}
function setRadio(_name, _i) {
  var obj1 = document.getElementsByName(_name);
  if (obj1) {
    for (var i = 0; i < obj1.length; i++) {
      obj1[i].checked = (i == _i ? "checked" : "");
    }
  }
}
// var oldBorderColor = null;
function validInt(obj1, sMsg, nMin, nMax, bBlank) {
  // backgroundColor borderColor
  // if (oldBorderColor == null) { oldBorderColor = obj1.style.borderColor; }
  // alert("id="+obj1.id + " borderColor=" + obj1.style.borderColor);
  var sErr = "";
  obj1.value = obj1.value.trim();
  if (obj1.value.length > 0) {
    var i = parseInt(obj1.value);
    if (isNaN(i)) {
      // obj1.className = "redBorder";
      sErr = "【" + sMsg + "】格式錯誤，只能是數字!!";
    } else { obj1.value = i.toString(); }
    if (i < nMin || i > nMax) {
      //obj1.className = "redBorder";
      sErr = "【" + sMsg + "】格式錯誤，只能是數字 " + nMin + "~" + nMax + " !!";
    }
  } else if (!bBlank) {
    //obj1.className = "redBorder";
    sErr = "【" + sMsg + "】不可是空白，只能是數字 " + nMin + "~" + nMax + " !!";
  }
  if (sErr.length > 0) {
    obj1.style.borderColor = "#FF0000";
    alert(sErr);
    obj1.focus();
    return false;
  } else {
    //obj1.className = "";
    //obj1.style.borderColor = oldBorderColor;
    obj1.style.borderColor = "#999999";  // "#B1B4D1";
    // oldBorderColor = null;
    return true;
  }
}

var robAjaxData = "";
function robAjaxDataAppend(name, value) {
  //robAjaxData += (robAjaxData.length > 0 ? "&" : "") + name + "=" + escape(value);
  // encodeURIComponent
  robAjaxData += (robAjaxData.length > 0 ? "&" : "") + name + "=" + encodeURIComponent(value);
}
var robAjaxAction = "";

function robAjax(inData, method, url, robAjaxCallback) {
  if (inData == null) { return; }
  if (inData.length <= 0) { return; }
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
  var olblMsg = null;
  if ($rob("lblMsg")) { olblMsg = $rob("lblMsg"); }
  else if ($rob(sLed+"lblMsg")) { olblMsg = $rob(sLed+"lblMsg"); }
  xmlHttp.onreadystatechange = function() {
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
      var returnCode = xmlHttp.responseText;
      // if (olblMsg) { olblMsg.innerHTML += returnCode; } //return;
      //alert(returnCode); //return;
      var arR = returnCode.split((returnCode.indexOf("ÿ") >= 0 ? "ÿ" : "¶")); // ¶ 改為 ÿ
      //var arR = returnCode.split("ÿ"); // ¶ 改為 ÿ
      if (arR[0] == "RESEND") { //alert('RESEND');
        //alert(inData + "\n" + method + "\n" + url + "\n");
        robAjax(inData, method, url, robAjaxCallback); return;
      /* } else if (arR[0] == "UNLOGIN" && false) {
        //location.href = "../loginerror.aspx";
        alert('你的操作已逾時, 請重新登入!!');
        //window.open('../', '_top');
      } else if (arR[0] == "ERR") {
        if (arR.length > 1) {
          if (olblMsg) { olblMsg.innerHTML = arR[1]; } // +logAjax;
        } else {
          if (olblMsg) { olblMsg.innerHTML = returnCode; }
        } */
      } else {
        //(robAjaxCallback && typeof (robAjaxCallback) === "function") && robAjaxCallback(returnCode);
        if (robAjaxCallback && typeof (robAjaxCallback) === "function") {
          robAjaxCallback(returnCode);
        }
        //alert(returnCode);
      }
      
      //else { if (olblMsg) { olblMsg.innerHTML = returnCode; } }
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
