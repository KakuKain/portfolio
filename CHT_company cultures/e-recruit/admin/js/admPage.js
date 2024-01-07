function showSubMenu(sid) {
  var objState = (document.getElementById("ctl00___robMenuState")
    ? document.getElementById("ctl00___robMenuState")
    : document.getElementById("__robMenuState"));
  var txtState = objState.value;
  var obj1 = document.getElementById("menuT" + sid);
  var obj2 = document.getElementById("menuD" + sid);
  var i = 0;
  if (isNaN(sid)) { i = parseInt(sid); }
  else { i = sid; }
  var txt1 = obj1.innerHTML;
  if (txt1.indexOf("▼") >= 0) {
    txt1 = txt1.replace("▼", "▲");
    obj1.innerHTML = txt1;
    obj2.style.display = "";
    txtState = txtState.substring(0, i) + "D" + txtState.substring(i + 1);
    objState.value = txtState;

  }
  else {
    txt1 = txt1.replace("▲", "▼");
    obj1.innerHTML = txt1;
    obj2.style.display = "none";
    txtState = txtState.substring(0, i) + "U" + txtState.substring(i + 1);
    objState.value = txtState;
  }
}
// for initial
function initSubMenuDiv() {
  var objState = (document.getElementById("ctl00___robMenuState")
    ? document.getElementById("ctl00___robMenuState")
    : document.getElementById("__robMenuState"));
  var txtState = objState.value;
  var obj1 = "", obj2 = "", txt1 = "";
  if (txtState == "") {
    // 如果沒有值，要重新去找
    for (var i = 0; i <= 20; i++) {
      obj1 = document.getElementById("menuT" + i);
      obj2 = document.getElementById("menuD" + i);
      if (obj1 == null || obj2 == null) {
        txtState += ".";
        continue;
      }
      txt1 = obj1.innerHTML;
      if (txt1.indexOf("▼") >= 0) {
        txtState += "U";
      }
      else {
        txtState += "D";
      }
    }
  }
  // 如果已有值，則依設定值來設定 menu
  for (var i = 0; i < txtState.length; i++) {
    if (txtState.charAt(i) == "U") {
      // U-up 不顯示
      obj2 = document.getElementById("menuD" + i);
      if (obj2 != null) {
        obj1 = document.getElementById("menuT" + i);
        txt1 = obj1.innerHTML;
        txt1 = txt1.replace("▲", "▼");

        obj1.innerHTML = txt1;
        obj2.style.display = "none";
      }
    }
    else if (txtState.charAt(i) == "D") {
      // D-down 顯示
      obj2 = document.getElementById("menuD" + i);
      if (obj2 != null) {
        obj1 = document.getElementById("menuT" + i);
        txt1 = obj1.innerHTML;
        txt1 = txt1.replace("▼", "▲");

        obj1.innerHTML = txt1;
        obj2.style.display = "";
      }
    }
  }
  objState.value = txtState;
}
initSubMenuDiv();

function menuSetDT() {
  var now = new Date();
  var str1 = now.getFullYear() + "/" + (now.getMonth() + 1) + "/" + now.getDate() + " "
    + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
  if (document.getElementById("ctl00_tdMenuDT")) {
    document.getElementById("ctl00_tdMenuDT").innerHTML = str1;
  } else if (document.getElementById("tdMenuDT")) {
    document.getElementById("tdMenuDT").innerHTML = str1;
  }
  myTimer = setTimeout("menuSetDT()", 1000)
}
menuSetDT();

/*
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
*/