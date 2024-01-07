function setYJSTAT1(_d00, _value) {
  var inData = "YJSTAT1¶" + _d00 + "¶" + _value;
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
  var url = "admZGXC_Ajax.aspx";
  xmlHttp.open("POST", url, false);
  xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  if (inData) {
    xmlHttp.send("in=" + inData);
  } else {
    xmlHttp.send(null);
  }
  var returnCode = xmlHttp.responseText;
  // alert(returnCode); return;
  // $(sLed+"lblMsg3").innerHTML = returnCode; return;
  var arR = returnCode.split("¶");
  var arInData = inData.split("¶");
  if (arInData[0] == "YJSTAT1") {
    // 是否傳回正確
    if (arR[0] == "OK") { }
    else {
      if (arR.length > 1) {
        $(sLed+"lblMsg3").innerHTML = arR[1];
      }
    }
  }
}