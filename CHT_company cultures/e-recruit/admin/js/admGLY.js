function ckUSERPW() {
  var ockUSERPW = $rob(sLed + "ckUSERPW");
  var otxtUSERPW = $rob(sLed + "txtUSERPW");
  var otxtUSERPW1 = $rob(sLed + "txtUSERPW1");
  // 新增時沒有這項
  if (ockUSERPW) {
    if (ockUSERPW.checked == true) {
      otxtUSERPW.className = "";
      otxtUSERPW.disabled = "";
      otxtUSERPW1.className = "";
      otxtUSERPW1.disabled = "";
    } else {
      otxtUSERPW.className = "readOnly";
      otxtUSERPW.disabled = "disabled";
      otxtUSERPW.value = "";
      otxtUSERPW1.className = "readOnly";
      otxtUSERPW1.disabled = "disabled";
      otxtUSERPW1.value = "";
    }
  } else {
    otxtUSERPW.className = "";
    otxtUSERPW.disabled = "";
    otxtUSERPW1.className = "";
    otxtUSERPW1.disabled = "";
  }
}
ckUSERPW();

if ($rob(sLed + "cmdEdit")) {
  $rob(sLed + "cmdEdit").onclick = function () {
    var strReg = /^[0-9a-zA-Z][0-9a-zA-Z._\-@,;]{4,19}$/;
    var olblEditMsg = $rob(sLed + "lblEditMsg");
    olblEditMsg.innerHTML = "";
    this.value = this.value.trim();
    if ($rob(sLed + "txtUSERID").value.length == 0) {
      //olblEditMsg.innerHTML = "【帳號ID】不可是空白!!";
      alert("【帳號ID】不可是空白!!");
      return false;
    }
    if (!$rob(sLed + "txtUSERID").value.match(strReg)) {
      //olblEditMsg.innerHTML = "【帳號ID】應設為5~20個字元!!";
      alert("【帳號ID】應設為5~20個字元!!");
      return false;
    }

    strReg = /^[0-9a-zA-Z][0-9a-zA-Z._\-@,;]{7,19}$/;
    if ($rob(sLed + "ckUSERPW").checked) {
      if ($rob(sLed + "txtUSERPW").value != $rob(sLed + "txtUSERPW1").value) {
        //olblEditMsg.innerHTML = "輸入的兩個帳號密碼不相符!! 請重新輸入!!";
        alert("輸入的兩個帳號密碼不相符!! 請重新輸入!!");
        return false;
      } else if (!$rob(sLed + "txtUSERPW").value.match(strReg)) {
        //olblEditMsg.innerHTML = "【帳號密碼】應設為8~20個字元!!";
        alert("密碼為8-20碼，開頭為數字或大小寫字母，其餘必須是數字或大小寫字母或 ._\\-@,;");
        return false;
      }
      var strReg_A = /^[A-Z]$/; var strReg_a = /^[a-z]$/;
      var swUpper = false, swLow = false;
      for (var i = 0; i < $rob(sLed + "txtUSERPW").value.length; i++) {
        if ($rob(sLed + "txtUSERPW").value.substr(i, 1).match(strReg_A)) { swUpper = true; }
        if ($rob(sLed + "txtUSERPW").value.substr(i, 1).match(strReg_a)) { swLow = true; }
      }
      if (!swUpper || !swLow) {
        alert("密碼必須是大寫及小寫字母混合，請重新輸入!!");
      }

    }
    if ($rob(sLed+"txtUSERNAME").value.length == 0) {
      //olblEditMsg.innerHTML = "【姓名】不可以是空白!!";
      alert("【姓名】不可以是空白!!");
      return false;
    }
    return true;
  }
}

// 取消功能
if ($rob(sLed + "txtUSERID") && false) {
  $rob(sLed + "txtUSERID").onblur = function () {
    var strReg = /^[0-9a-zA-Z][0-9a-zA-Z._\-@,;]{4,19}$/;
    var olblEditMsg = $rob(sLed + "lblEditMsg");
    olblEditMsg.innerHTML = "";
    this.value = this.value.trim();
    if ($rob(sLed + "txtUSERID").value.length == 0) {
      olblEditMsg.innerHTML = "【帳號ID】不可是空白!!";
      //alert("【帳號ID】不可是空白!!");
      this.focus(); return true;
    }
    if (!this.value.match(strReg)) {
      olblEditMsg.innerHTML = "【帳號ID】應設為5~20個字元!!";
      //alert("【帳號ID】應設為5~20個字元!!");
      this.focus(); return true;
    }
    $rob(sLed + "lblEditMsg").innerHTML = "";
    robAjaxData = "";
    robAjaxDataAppend("Action", "checkUSERID");
    robAjaxDataAppend("hidUSERD00", $rob(sLed+"hidUSERD00").value);
    robAjaxDataAppend("txtUSERID", $rob(sLed + "txtUSERID").value);
    //robShowLoadingImg(1);
    robAjax(robAjaxData, "POST", "admGLY.ashx", robAjaxBackUSERID);
  }
}
function robAjaxBackUSERID(returnCode) { //alert(returnCode);
  //robShowLoadingImg(0);
  var arR = returnCode.split((returnCode.indexOf("ÿ") >= 0 ? "ÿ" : "¶")); // ¶ 改為 ÿ
  if (arR[0] == "ERR") {
    alert(arR[1]);
  } else if (arR[0] == "DUP") {
    //$rob(sLed + "lblEditMsg").innerHTML = "【帳號ID】不可重覆!! 請重新輸入!!";
    alert("【帳號ID】不可重覆!! 請重新輸入!!");
    $rob(sLed + "txtUSERID").focus();
  }
}

