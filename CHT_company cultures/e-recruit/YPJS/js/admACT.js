function changeACT(id,pname) {
  var led = "ctl00_ContentPlaceHolder1_";
  var objMsg = document.getElementById(led + "lblMsg");
  var obj1 = document.getElementById(id);
  var D00 = obj1.attributes("rid").value;
  var DATEUPDATE = obj1.attributes("rud").value;
  var mode=(obj1.checked?"Y":"N")
  
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
  var url = "change" + pname + ".aspx?mode=" + mode + "&id=" + D00 + "&ud=" + DATEUPDATE;
  
  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  var returnCode = xmlHttp.responseText;
  if (returnCode.substr(0, 3) == "OK!") {
    obj1.attributes("rud").value = returnCode.substr(3, 19);
    objMsg.innerHTML = "";
    return true;
  } else if (returnCode == "NO!") {
    obj1.checked = (!obj1.checked);
    objMsg.innerHTML = "資料無法更新，請刷新後重試!!";
    return false;
  } else if (returnCode == "ERR") {
    obj1.checked = (!obj1.checked);
    objMsg.innerHTML = "資料更新時發生錯誤!!";
    return false;
  } else {
    obj1.checked = (!obj1.checked);
    // objMsg.innerHTML = "不清楚的狀況!!";
    objMsg.innerHTML = "";
    return true;
  }
}