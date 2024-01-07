var robSwContinue = 1;
var robiSendTol = 0;
var robiSendOk = 0;
var robiSendErr = 0;
var robiSendNoS = 0;
// var sLed = "ctl00_ContentPlaceHolder1_";
var robSetSeconds = $(sLed + "hidSetSec").value;
var robSetFHD00 = $(sLed + "hidFHD00").value;
var objMsg = $(sLed + "lblMsg");
var robCmdPause = $("cmdPause");
var robCmdNext = $("cmdNext");
robCmdPause.disabled = "";
robCmdNext.disabled = "disabled";
var objTimeout = null;
var objTimer = null;
var robiTimer = 0;
var robstrStatus = "&nbsp;";
// 顯示
$("spanSendTol").innerHTML = robiSendTol;
$("spanSendOk").innerHTML = robiSendOk;
$("spanSendErr").innerHTML = robiSendErr;
$("spanSendNoS").innerHTML = robiSendNoS;
$("spanStatus").innerHTML = robStatus;
function robSend() {
  // 發送
  clearTimeout(objTimeout);
  robMail();
  // 是否 : 0-停止
  if (robSwContinue < 1) {
    clearTimeout(objTimeout);
    clearTimeout(objTimer);
    robCmdPause.disabled = "disabled";
    robCmdNext.disabled = "disabled";
    $("spanStatus").innerHTML = "處理完成!!";
    return;
  }
  $("spanSendTol").innerHTML = robiSendTol;
  $("spanSendOk").innerHTML = robiSendOk;
  $("spanSendErr").innerHTML = robiSendErr;
  $("spanSendNoS").innerHTML = robiSendNoS;
  // 再次呼叫
  objTimeout = setTimeout("robSend()", robSetSeconds * 1000);
  clearTimeout(objTimer);
  robiTimer = 0;
  robstrStatus = "&nbsp;";
  $("spanStatus").innerHTML = robstrStatus;
  objTimer = setTimeout("robStatus()", 250);
}
function robPause() {
  if (objTimeout) {
    clearTimeout(objTimeout);
  }
  if (objTimer) {
    clearTimeout(objTimer);
  }
  robCmdPause.disabled = "disabled";
  robCmdNext.disabled = "";
}
function robNext() {
  robCmdPause.disabled = "";
  robCmdNext.disabled = "disabled";
  robSend();
}
function robStatus() {
  robiTimer += 0.25;
  robstrStatus += ((robiTimer % 1 > 0) ? "." : robiTimer);
  $("spanStatus").innerHTML = robstrStatus;
  clearTimeout(objTimer);
  objTimer = setTimeout("robStatus()", 250);
}
function robMail() {
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
  var url = "admEDMJSh.aspx?d00=" + robSetFHD00;
  //alert(url);
  //return;

  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  var returnCode = xmlHttp.responseText;
  var rtnCode = (returnCode.length >= 3 ? returnCode.substr(0, 3) : "");
  var rtnMsg = (returnCode.length > 3 ? returnCode.substr(3) : "");
  //robiSendTol++;
  objMsg.innerHTML = rtnMsg;
  if (rtnCode == "OK!") {
    objMsg.innerHTML = "寄送成功!!" + rtnMsg;
    robiSendTol++;
    robiSendOk++;
    return true;
  } else if (rtnCode == "NOS") {
    objMsg.innerHTML = "已註冊過或不允許寄送,拒絕寄送" + rtnMsg;
    robiSendTol++;
    robiSendNoS++;
    return true;
  } else if (rtnCode == "NO!") {
    objMsg.innerHTML = "寄送時發生錯誤!!" + rtnMsg;
    robiSendTol++;
    robiSendErr++;
    return false;
  } else if (rtnCode == "ERR") {
    objMsg.innerHTML = "發生系統錯誤!!" + rtnMsg;
    robSwContinue = 0; // 停止
    return false;
  } else if (rtnCode == "END") {
    objMsg.innerHTML = "寄送已處理完成!!" + rtnMsg;
    robSwContinue = 0; // 停止
    return false;
  } else {
    objMsg.innerHTML = "不清楚的狀況!!" + rtnMsg;
    robSwContinue = 0; // 停止
    return true;
  }
}
//setTimeout("robSend()", robSetSeconds * 500);
robSend();