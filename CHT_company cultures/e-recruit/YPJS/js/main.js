var theForm = document.forms['aspnetForm'];
if (!theForm) {
  theForm = document.aspnetForm;
}
if (!theForm) {
  theForm = document.forms[0];
}
function __robPostBack(robArg1, robArg2) {
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

