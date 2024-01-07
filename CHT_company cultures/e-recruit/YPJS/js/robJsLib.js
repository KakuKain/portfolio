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
function validTime(obj1) {
  var str1 = obj1.value;
  if (str1.length <= 0) { return; }
  var reg = /\d\d:\d\d$/;
  if (!obj1.value.match(/\d\d:\d\d$/)) {
    obj1.value = "";
    //obj1.style.borderColor = "#FF0000";
    //alert("時間格式(hh:mm)錯誤!!");
    //obj1.focus();
    return false;
  } else {
    //obj1.style.borderColor = "#999999";  // "#B1B4D1";
    return true;
  }
}
// ***** 設定 DropDown value *****
function setDropValue(obj1, _value) {
  if (obj1) { // 找到 object 才要處理
    if (obj1.tagName == "SELECT") {
      for (var i = 0; i < obj1.length; i++) {
        obj1[i].selected = (obj1[i].value == _value ? "selected" : "");
      }
      // 若找不到值, 設為第0項
      if (obj1.selectedIndex < 0) { obj1.selectedIndex = 0; }
    }
  }
}

function txtHTML(str1) {
  if (str1 == null) { return str1; }
  if (str1.length <= 0) { return str1; }
  str1 = str1.replace(/&/g, "&amp;");
  str1 = str1.replace(/</g, "&lt;");
  str1 = str1.replace(/>/g, "&gt;");
  str1 = str1.replace(/\x22/g, "&quot;"); // "
  str1 = str1.replace(/\x27/g, "&#39;"); // '
  str1 = str1.replace(/ /g, "&nbsp;");
  str1 = str1.replace(/\n/g, "");
  str1 = str1.replace(/\r/g, "<br />");
  return str1;
}