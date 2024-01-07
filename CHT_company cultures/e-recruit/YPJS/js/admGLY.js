function ckUSERPW() {
  var led = "ctl00_ContentPlaceHolder1_";
  var id1 = led + "ckUSERPW";
  var id2 = led + "txtUSERPW";
  var id3 = led + "txtUSERPW1";
  var obj1 = document.getElementById(id1);
  var obj2 = document.getElementById(id2);
  var obj3 = document.getElementById(id3);
  // 新增時沒有這項
  if (obj1 != null) {
    if (obj1.checked == true) {
      obj2.className = "";
      obj3.className = "";
      obj2.disabled = "";
      obj3.disabled = "";
    }
    else {
      obj2.className = "readOnly";
      obj3.className = "readOnly";
      obj2.disabled = "disabled";
      obj3.disabled = "disabled";
      obj2.value = "";
      obj3.value = "";
    }
  } else {
    obj2.className = "";
    obj3.className = "";
    obj2.disabled = "";
    obj3.disabled = "";
  }
}
ckUSERPW();

function check_before_save() {

  var strReg = /^[0-9a-zA-Z][0-9a-zA-Z._\-@,;]{4,19}$/;
  var led = "ctl00_ContentPlaceHolder1_";
  var id1 = led + "txtUSERID";
  var id2 = led + "lblEditMsg";
  var objMsg = document.getElementById(id2);

  var dat1 = document.getElementById(id1).value;
  //alert('dat1='+(dat1==""?"空白":"非空白") );
  //return false;
  if (dat1 == "") {
    objMsg.innerHTML = "【帳號ID】不可是空白!!";
    return false;
  }
  if (!dat1.match(strReg)) {
    objMsg.innerHTML = "【帳號ID】應設為5~20個字元!!";
    return false;
  }

  var ck1 = document.getElementById(led + "ckUSERPW").checked;
  if (ck1) {
    if (document.getElementById(led + "txtUSERPW").value != document.getElementById(led + "txtUSERPW1").value) {
      objMsg.innerHTML = "輸入的兩個帳號密碼不相符!! 請重新輸入!!";
      return false;
    }
    if (!document.getElementById(led + "txtUSERPW").value.match(strReg)) {
      objMsg.innerHTML = "【帳號密碼】應設為5~20個字元!!";
      return false;
    }
  }
  if (document.getElementById(led + "txtUSERNAME").value == "") {
    objMsg.innerHTML = "【姓名】不可以是空白!!";
    return false;
  }

  return true;
}

function checkUSERID(mode, strID) {
  var strReg = /^[0-9a-zA-Z][0-9a-zA-Z._\-@,;]{4,19}$/;
  var led = "ctl00_ContentPlaceHolder1_";
  var objMsg = document.getElementById(led + "lblEditMsg");
  if (strID.length == 0) {
    objMsg.innerHTML = "【帳號ID】不可是空白!!";
    return true;
  }
  if (!strID.match(strReg)) {
    objMsg.innerHTML = "【帳號ID】應設為5~20個字元!!";
    return true;
  }
  // 執行 AJAX
  var xmlHttp = null;
  /*
  if ("AB".indexOf(strID) < 0) {
  objMsg.innerHTML = "設定模式錯誤!!";
  return true;
  }
  if (strID.length == 0) {
  objMsg.innerHTML = "";
  return true;
  }
  */
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
  var url = "checkUSERID.aspx?mode=" + mode + "&id=" + strID;
  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  var returnCode = xmlHttp.responseText;
  // returnCode = returnCode.substr(0, 3);
  // alert("returnCode=" + returnCode);
  if (returnCode == "OK!") {
    // objMsg.innerHTML = "這是可選用的【帳號ID】!!";
    objMsg.innerHTML = "";
    return true;
  } else if (returnCode == "DUP") {
    objMsg.innerHTML = "【帳號ID】不可重覆!! 請重新輸入!!";
    return false;
  } else {
    // objMsg.innerHTML = "不清楚的狀況!!";
    objMsg.innerHTML = "";
    return true;
  }
}