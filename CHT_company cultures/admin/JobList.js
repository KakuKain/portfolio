function $rob(_sid) { return document.getElementById(_sid); }
if ($rob("cmdLogin")) {
  $rob("cmdLogin").onclick = function() {
    $rob("hidAction").value = "cmdLogin";
    document.forms[0].submit();
  }
}
if ($rob("cmdSave")) {
  $rob("cmdSave").onclick = function() {
    $rob("hidAction").value = "cmdSave";
    document.forms[0].submit();
  }
}
if ($rob("cmdCancel")) {
  $rob("cmdCancel").onclick = function() {
    $rob("hidAction").value = "cmdCancel";
    document.forms[0].submit();
  }
}
var sLed = "";
var tbFB = $rob("itemTable");
if (tbFB) {
  var arFB = new Array();
  var ohidFB = $rob(sLed + "hidFB");
  /* 對於一個 table 的操作 1. insertRow(); deleteRow(); (不可使用 removeRow()) */
  function clearTable(tableID) {
    // 清除指定的 tableID 內容 - 共用/無用
    if (tableID.length <= 1) { return; }
    var otb1 = $rob(tableID);
    while (otb1.rows.length >= 2) {
      otb1.deleteRow(1);
    }
  }
  function deleteRowsTable(tableID, arr1) {
    // 清除指定的 tableID 內容, 所有選取的 row - 共用
    var otb1 = $rob(tableID);
    var sw1 = true;
    var i = 1;
    while (sw1) {
      // 只剩下標題row則結束
      if (otb1.rows.length <= 1) { break; }
      sw1 = false;
      i = 1; // 從 rows[1] 開始找起
      while (i < otb1.rows.length) {
        // 
        if (otb1.rows[i].cells[0].childNodes[0].checked) {
          otb1.deleteRow(i);
          arr1.splice(i - 1, 1);
          sw1 = true;
          break;
        }
        i++;
      }
    } // 刪除後，重新存回 (sort,display(使用直接存值不一定要save))
  }
  function selectAllRowsTable(tableID) {
    // 選取 All Rows 在指定的 tableID - 共用
    var otb1 = $rob(tableID);
    for (var i = 1; i < otb1.rows.length; i++) {
      otb1.rows[i].cells[0].childNodes[0].checked = true;
    }
  }
  function unselectAllRowsTable(tableID) {
    // 取消選取 All Rows 在指定的 tableID - 共用
    var otb1 = $rob(tableID);
    for (var i = 1; i < otb1.rows.length; i++) {
      otb1.rows[i].cells[0].childNodes[0].checked = false;
    }
  }

  function addnewRowTableFB() {
    // 新增一筆
    //if (arFB.length >= 12) { alert("最多輸入12筆資料!!"); return; }
    var iar = arFB.length;
    arFB[iar] = new oFB("N", (iar + 1).toString(), "N", "", "", "", "", "", "", "", "", "");
    //displayOneRowTableFB(iar);
    displayAllTabelFB();
  }

  function sortTableFB() {
    // saveTableFB();
    arFB.sort(sortAscFB);
    displayAllTabelFB();
    saveTableFB();
  }
  function sortDescFB(parm1, parm2) {
    if (parm1.XLNO == parm2.XLNO) {
      if (parm1.XLFYM == parm2.XLFYM) { return 0; }
      else if (parm1.XLFYM > parm2.XLFYM) { return -1 }
      else { return 1; }
      // return 0;
    } else if (parm1.XLNO > parm2.XLNO) {
      return -1;
    } if (parm1.XLNO < parm2.XLNO) {
      return 1;
    }
  }
  function sortAscFB(parm1, parm2) {
    if (parm1.XLNO == parm2.XLNO) {
      if (parm1.XLFYM == parm2.XLFYM) { return 0; }
      else if (parm1.XLFYM > parm2.XLFYM) { return -1 }
      else { return 1; }
      // return 0;
    } else if (parm1.XLNO > parm2.XLNO) {
      return 1;
    } if (parm1.XLNO < parm2.XLNO) {
      return -1;
    }
  }

  function upFB(i) {
    var obj1 = arFB[i];
    arFB[i] = arFB[i - 1];
    arFB[i - 1] = obj1;
    displayAllTabelFB();
    $rob("cmdListSave").style.visibility = "visible";
  }
  function downFB(i) {
    var obj1 = arFB[i];
    arFB[i] = arFB[i + 1];
    arFB[i + 1] = obj1;
    displayAllTabelFB();
    $rob("cmdListSave").style.visibility = "visible";
  }
  function editFB(D00) {
    saveTableFB();
    $rob("hidD00").value = D00;
    $rob("hidAction").value = "cmdEdit";
    document.forms[0].submit();
  }
  if ($rob("cmdAdd")) {
    $rob("cmdAdd").onclick = function() {
      //$rob("hidAction").value = "cmdAdd";
      //document.forms[0].submit();
      addnewRowTableFB();
      $rob("cmdListSave").style.visibility = "visible";
    }
  }
  if ($rob("cmdListSave")) {
    $rob("cmdListSave").onclick = function() {
      saveTableFB();
      $rob("hidAction").value = "cmdListSave";
      document.forms[0].submit();
    }
  }

  function saveTableFB() {
    try {
      var i = 0, iar = 0, str1 = "", str2 = "";
      for (iar = 0; iar < arFB.length; iar++) {
        str2 = arFB[iar].D00
          + "¡" + arFB[iar].FBACT
          + "¡" + arFB[iar].FBNO
          + "¡" + arFB[iar].FBNTC
          + "¡" + arFB[iar].FBNEN
          + "¡" + arFB[iar].FBNJP
          + "¡" + arFB[iar].FBDATEFROM
          + "¡" + arFB[iar].FBDATEEND
          ;
        str1 += (str1.length > 0 ? "¶" : "") + str2;
      }
      ohidFB.value = str1;
    }
    catch (err) { /* $rob(sLed + "lblMsg").innerHTML =err ; */ }
  }

  function oFB(SEL, D00, FBACT, FBNO, FBNTC, FBNEN, FBNJP, FBDATEFROM, FBDATEEND) {
    this.sel = SEL;
    this.D00 = D00;
    this.FBACT = FBACT;
    this.FBNO = FBNO;
    this.FBNTC = FBNTC;
    this.FBNEN = FBNEN;
    this.FBNJP = FBNJP;
    this.FBDATEFROM = FBDATEFROM;
    this.FBDATEEND = FBDATEEND;
  }

  function init_tableFB() {
    var arRecs = null;
    var arFlds = null;
    var str1 = null;
    var i = 0;
    arFB = new Array();
    var iar = 0;
    if (ohidFB.value.length > 0) {
      arRecs = ohidFB.value.split("¶");
      var re = /¿/g;
      for (i = 0; i < arRecs.length; i++) {
        iar = arFB.length;
        arFlds = arRecs[i].split("¡");
        arFB[iar] = new oFB("N",
            arFlds[0].replace(re, ""),
            arFlds[1].replace(re, ""),
            arFlds[2].replace(re, ""),
            arFlds[3].replace(re, ""),
            arFlds[4].replace(re, ""),
            arFlds[5].replace(re, ""),
            arFlds[6].replace(re, ""),
            arFlds[7].replace(re, "")
            );
      }
    }
    displayAllTabelFB();
  }

  function displayAllTabelFB() {
    // 清除 table 中所有內容
    while (tbFB.rows.length > 1) {
      tbFB.deleteRow(1);
    }
    // 顯示每一筆
    for (var i = 0; i < arFB.length; i++) {
      displayOneRowTableFB(i);
    }
  }

  function displayOneRowTableFB(iar) {
    var re = /</g;
    var obj1 = null;
    var i = 0;
    var ir = iar + 1;
    tbFB.insertRow(ir);

    tbFB.rows[ir].insertCell(0);
    tbFB.rows[ir].cells[0].className = "tdField1";
    tbFB.rows[ir].cells[0].innerHTML = arFB[iar].FBNO.replace(re, "&lt;")
          //+ "<br />D00=" + arFB[iar].D00
          ;

    tbFB.rows[ir].insertCell(1);
    tbFB.rows[ir].cells[1].className = "tdField2";
    tbFB.rows[ir].cells[1].innerHTML = arFB[iar].FBNTC.replace(re, "&lt;")
          + "<br />" + arFB[iar].FBNEN.replace(re, "&lt;")
          + "<br />" + arFB[iar].FBNJP.replace(re, "&lt;")
          ;

    tbFB.rows[ir].insertCell(2);
    tbFB.rows[ir].cells[2].className = "tdField3";
    tbFB.rows[ir].cells[2].innerHTML = arFB[iar].FBACT;

    tbFB.rows[ir].insertCell(3);
    tbFB.rows[ir].cells[3].className = "tdField4";
    tbFB.rows[ir].cells[3].innerHTML = arFB[iar].FBDATEFROM.replace(re, "&lt;")
          + "<br />" + arFB[iar].FBDATEEND.replace(re, "&lt;")
          ;

    tbFB.rows[ir].insertCell(4);
    tbFB.rows[ir].cells[4].className = "tdField5";
    tbFB.rows[ir].cells[4].innerHTML = (iar <= 0 ? "&#12288;" : "<span class='opCmd' onmouseout='this.className=\"opCmd\";' onmouseover='this.className=\"opCmdOver\";' onclick='upFB(" + iar + ");' >▲</span>")
          + "&nbsp;" + ((iar + 1) >= arFB.length ? "&#12288;" : "<span class='opCmd' onmouseout='this.className=\"opCmd\";' onmouseover='this.className=\"opCmdOver\";' onclick='downFB(" + iar + ");' >▼</span>")
          + "&nbsp;" + "<span class='opCmd' onmouseout='this.className=\"opCmd\";' onmouseover='this.className=\"opCmdOver\";' onclick='editFB(" + arFB[iar].D00 + ");' >修改</span>"
          ;
  }
  init_tableFB();
}