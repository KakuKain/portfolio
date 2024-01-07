﻿// 2012.4.20 by Robin
/* 161¡ => field split 
   191¿ => field begin/end mark 
   164(A4)¤ => table 的內項 */
var arTAH = new Array();
var arObj = new Array();
function init_tableTAH() {
  if (!$rob(sLed + "hidrobTAH")) { return; }
  if ($rob(sLed + "hidrobTAH").value.length <= 0) { return; }
  // 將物件總合拆到 arObj 中
  arObj = $rob(sLed + "hidrobTAH").value.split('¡');
  arTAH = new Array();
  var arB = null;
  // 處理 arObj 的每個物件
  for (var i = 0; i < arObj.length; i++) {
    arB = arObj[i].split('¿');
    if (arB.length <= 0) { continue; }
    if (arB[0] == "T") { // T:文字項
      arTAH[arTAH.length] = new oTEXT("N", arB[0], arB[1],
       (arB[2] ? arB[2] : 0),
       (arB[3] ? arB[3] : ""),
       (arB[4] ? arB[4] : "N"),
       (arB[5] ? arB[5] : "N"),
       (arB[6] ? arB[6] : "N"),
       (arB[7] ? arB[7] : "")
       );
    } else if (arB[0] == "L") { // L:超連結
      arTAH[arTAH.length] = new oALINK("N", arB[0], arB[1],
        (arB[2] ? arB[2] : ""));
    } else if (arB[0] == "P") { // P:圖片
      arTAH[arTAH.length] = new oIMG("N", arB[0], arB[1],
        (arB[2] ? arB[2] : 1),
        (arB[3] ? arB[3] : "")
        );
    } else if (arB[0] == "B") { // B:表格
      arTAH[arTAH.length] = new oTABLE("N", arB[0], arB[1],
        (arB[2] ? arB[2] : 0),
        (arB[3] ? arB[3] : 0),
        (arB[4] ? arB[4] : ""));
      // arObj[arObj.length - 1].initFld();
    }
  }
  // 顯示 Table 所有內容
  displayAllTabelTAH();
}
function displayAllTabelTAH() { // 顯示 Table 所有內容
  if (!$rob("tbTAH")) { return; }
  // 清除 table 中所有內容
  while ($rob("tbTAH").rows.length > 1) {
    $rob("tbTAH").deleteRow(1);
  }
  // 顯示每一筆
  for (var i = 0; i < arTAH.length; i++) {
    displayOneRowTableTAH(i);
  }
}

function displayOneRowTableTAH(iar) { // 顯示 Table 中的一個 row
  var otbTAH = $rob("tbTAH");
  var obj1 = null;
  var i = 0;
  var ir = iar + 1;
  otbTAH.insertRow(ir);

  // 選擇 sel
  otbTAH.rows[ir].insertCell(0);
  otbTAH.rows[ir].cells[0].className = "light";
  otbTAH.rows[ir].cells[0].innerHTML = "<input type='checkbox' />";
  // 設定 選擇 sel
  obj1 = otbTAH.rows[ir].cells[0].childNodes[0];
  if (arTAH[iar].sel == "Y") {
    obj1.setAttribute("checked", "checked");
  }

  // 類別
  var arLBN = new Array("文字", "超連結", "圖片", "表格");
  otbTAH.rows[ir].insertCell(1);
  otbTAH.rows[ir].cells[1].className = "light";
  otbTAH.rows[ir].cells[1].innerHTML = arTAH[iar].LBN;
  // arLBN["TLPB".indexOf(arTAH[iar].LB)];

  // 自訂名稱
  otbTAH.rows[ir].insertCell(2);
  otbTAH.rows[ir].cells[2].className = "light";
  otbTAH.rows[ir].cells[2].innerHTML = "<input type=\"text\" maxlength=\"50\" style=\"width:120px;\" value=\"" + arTAH[iar].name + "\" \
onblur=\"arTAH[" + iar + "].name=this.value; \" />";

  // 依不同類型處理定義內容  class='light'
  otbTAH.rows[ir].insertCell(3);
  otbTAH.rows[ir].cells[3].className = "light";
  otbTAH.rows[ir].cells[3].style.textAlign = "left";
  //otbTAH.rows[ir].cells[3].style.verticalAlign = "top";
  if (arTAH[iar].LB == "T") { // 文字
    displayOneRowTableTAH_TEXT(otbTAH.rows[ir].cells[3], arTAH[iar],iar);
  } else if (arTAH[iar].LB == "L") { // 超連結
    displayOneRowTableTAH_ALINK(otbTAH.rows[ir].cells[3], arTAH[iar], iar);
  } else if (arTAH[iar].LB == "P") { // 圖片
    displayOneRowTableTAH_IMG(otbTAH.rows[ir].cells[3], arTAH[iar], iar);
  } else if (arTAH[iar].LB == "B") { // 表格
    displayOneRowTableTAH_TABLE(otbTAH.rows[ir].cells[3], arTAH[iar], iar);
  }
}
function displayOneRowTableTAH_TEXT(oCell, rd1,iar) {
  oCell.innerHTML = "字體大小：<select onchange='arTAH[" + iar + "].size=this.value;'>\
<option value='-1'>&nbsp;自動&nbsp;</option>\
<option>12</option>\
<option>14</option>\
<option>16</option>\
<option>18</option>\
<option>20</option>\
<option>22</option>\
<option>24</option>\
<option>28</option>\
<option>32</option>\
<option>36</option>\
<option>40</option>\
</select>\
&#12288;顏色<select onchange='arTAH[" + iar + "].color=this.value;'>\
<option value=''>&nbsp;自動&nbsp;</option>\
<option value='black' style='background-color:black;'>黑</option>\
<option value='gray' style='background-color:gray;'>灰</option>\
<option value='silver' style='background-color:silver;'>銀</option>\
<option value='white' style='background-color:white;'>白</option>\
<option value='#A52A2A' style='background-color:#A52A2A;'>棕</option>\
<option value='maroon' style='background-color:maroon;'>褐紅</option>\
<option value='red' style='background-color:red;'>紅</option>\
<option value='orange' style='background-color:orange;'>橙</option>\
<option value='olive' style='background-color:olive;'>橄欖色</option>\
<option value='yellow' style='background-color:yellow;'>黃</option>\
<option value='green' style='background-color:green;'>綠</option>\
<option value='lime' style='background-color:lime;'>檸檬</option>\
<option value='teal' style='background-color:teal;'>藍綠</option>\
<option value='aqua' style='background-color:aqua;'>水綠</option>\
<option value='navy' style='background-color:navy;'>天藍</option>\
<option value='blue' style='background-color:blue;'>藍</option>\
<option value='purple' style='background-color:purple;'>紫</option>\
<option value='fuchsia' style='background-color:fuchsia;'>粉紅</option>\
</select>\
&#12288;<input type='checkbox' onclick=\"arTAH[" + iar + "].bold=(this.checked?'Y':'N');\" />粗體\
&#12288;<input type='checkbox' onclick=\"arTAH[" + iar + "].italic=(this.checked?'Y':'N');\" />斜體\
&#12288;<input type='checkbox' onclick=\"arTAH[" + iar + "].underline=(this.checked?'Y':'N');\" />底線&#12288;背景<select onchange='arTAH[" + iar + "].bgcolor=this.value;'>\
<option value=''>&nbsp;自動&nbsp;</option>\
<option value='black' style='background-color:black;'>黑</option>\
<option value='gray' style='background-color:gray;'>灰</option>\
<option value='silver' style='background-color:silver;'>銀</option>\
<option value='white' style='background-color:white;'>白</option>\
<option value='#A52A2A' style='background-color:#A52A2A;'>棕</option>\
<option value='maroon' style='background-color:maroon;'>褐紅</option>\
<option value='red' style='background-color:red;'>紅</option>\
<option value='orange' style='background-color:orange;'>橙</option>\
<option value='olive' style='background-color:olive;'>橄欖色</option>\
<option value='yellow' style='background-color:yellow;'>黃</option>\
<option value='green' style='background-color:green;'>綠</option>\
<option value='lime' style='background-color:lime;'>檸檬</option>\
<option value='teal' style='background-color:teal;'>藍綠</option>\
<option value='aqua' style='background-color:aqua;'>水綠</option>\
<option value='navy' style='background-color:navy;'>天藍</option>\
<option value='blue' style='background-color:blue;'>藍</option>\
<option value='purple' style='background-color:purple;'>紫</option>\
<option value='fuchsia' style='background-color:fuchsia;'>粉紅</option>\
</select>";
  for (var i = 0; i < oCell.childNodes[1].options.length; i++) {
    if (oCell.childNodes[1].options[i].value == arTAH[iar].size) {
      oCell.childNodes[1].options[i].selected = "selected"
    }
  }
  for (var i = 0; i < oCell.childNodes[3].options.length; i++) {
    if (oCell.childNodes[3].options[i].value == arTAH[iar].color) {
      oCell.childNodes[3].options[i].selected = "selected"
    }
  }
  if (arTAH[iar].bold == "Y") {
    oCell.childNodes[5].setAttribute("checked", "checked");
  }
  if (arTAH[iar].italic == "Y") {
    oCell.childNodes[7].setAttribute("checked", "checked");
  }
  if (arTAH[iar].underline == "Y") {
    oCell.childNodes[9].setAttribute("checked", "checked");
  }
  for (var i = 0; i < oCell.childNodes[11].options.length; i++) {
    if (oCell.childNodes[11].options[i].value == arTAH[iar].bgcolor) {
      oCell.childNodes[11].options[i].selected = "selected"
    }
  }

}
function displayOneRowTableTAH_ALINK(oCell, rd1, iar) {
  oCell.innerHTML = "連結網址：\
<input type='text' maxlength='500' style='width:350px;' value=\"" + rd1.url + "\" \
onblur=\"arTAH[" + iar + "].url=this.value; \" />";
}
function displayOneRowTableTAH_IMG(oCell, rd1, iar) {
  oCell.innerHTML = "選用圖片：<select onchange='arTAH[" + iar + "].imgNo=this.value;' >\
<option>1</option>\
<option>2</option>\
<option>3</option>\
<option>4</option>\
<option>5</option></select>\
&#12288;&#12288;連結網址：\
<input type='text' maxlength='500' style='width:320px;' value=\"" + rd1.url + "\" \
onblur=\"arTAH[" + iar + "].url=this.value; \" />";
  oCell.childNodes[1].options[rd1.imgNo - 1].selected = "selected";
}
function displayOneRowTableTAH_TABLE(oCell, rd1, iar) {
  oCell.innerHTML = "<textarea onblur=\"arTAH[" + iar + "].dat=this.value;\" cols='90' rows='10'>" + rd1.dat + "</textarea>";
}
function saveTableTAH() {
  var sTAH = $rob(sLed + "hidrobTAH");

  var str1 = "";
  var str2 = "";
  for (iar = 0; iar < arTAH.length; iar++) {
    // 182¶ => record split 161¡ => field split 191¿ => field begin/end mark
    var rd1 = arTAH[iar];
    if (arTAH[iar].LB == "T") {
      str2 = rd1.LB + "¿" + rd1.name + "¿" + rd1.size + "¿" + rd1.color + "¿" + rd1.bold + "¿" + rd1.italic + "¿" + rd1.underline + "¿" + rd1.bgcolor;
    } else if (arTAH[iar].LB == "P") {
      str2 = rd1.LB + "¿" + rd1.name + "¿" + rd1.imgNo + "¿" + rd1.url;
    } else if (arTAH[iar].LB == "L") {
      str2 = rd1.LB + "¿" + rd1.name + "¿" + rd1.url;
    } else if (arTAH[iar].LB == "B") {
      str2 = rd1.LB + "¿" + rd1.name + "¿" + rd1.rows + "¿" + rd1.cols + "¿" + rd1.dat;
    }
    str1 += (str1.length > 0 ? "¡" : "") + str2;
  }
  sTAH.value = str1;

}
function oTEXT(sel, LB, name, size, color, bold, italic, underline, bgcolor) {
  /* style="
  font-weight:bold; 
  font-size:12px; 
  font-style:italic; 
  text-decoration:underline; 
  color:#FFFFFF;
  " */
  this.LBN = "文字";
  this.sel = sel;
  this.LB = LB;
  this.name = name;
  this.size = size;
  this.color = color;
  this.bold = bold;
  this.italic = italic;
  this.underline = underline;
  this.bgcolor = bgcolor;
}
function oALINK(sel, LB, name, url) {
  this.LBN = "超連結";
  this.sel = sel;
  this.LB = LB;
  this.name = name;
  this.url = url;
}
function oIMG(sel, LB, name, imgNo, url) {
  this.LBN = "圖片";
  this.sel = sel;
  this.LB = LB;
  this.name = name;
  this.imgNo = imgNo;
  this.url = url;
}
function oTABLE(sel, LB, name, rows, cols, dat) {
  this.LBN = "表格";
  this.sel = sel;
  this.LB = LB;
  this.name = name;
  this.rows = rows;
  this.cols = cols;
  this.dat = dat;
  this.arDat = new Array(rows, cols);
  /* this.initFld = new function() {
    var arB = this.dat.split('¤');
    var k = 0;
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        this.arDat[i, j] = arB[k];
        k++;
      }
    }
  }
  this.saveFld = new function() {
    this.dat = "";
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        this.dat += (i <= 0 || j <= 0 ? "" : "¤")
          + this.arDat[i, j];
      }
    }
  } */
}
function deleteRowsTable(otb1, arr1) {
  // 清除指定的 tableID 內容, 所有選取的 row
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
  }
  // 刪除後，重新存回 (save,sort,display)
}
function selectAllRowsTable(otb1) {
  // 選取 All Rows 在指定的 tableID
  var i = 1;
  for (i = 1; i < otb1.rows.length; i++) {
    otb1.rows[i].cells[0].childNodes[0].checked = true;
  }
}
function unselectAllRowsTable(otb1) {
  // 取消選取 All Rows 在指定的 tableID
  var i = 1;
  for (i = 1; i < otb1.rows.length; i++) {
    otb1.rows[i].cells[0].childNodes[0].checked = false;
  }
}

function addnewRowTableTAH(tableID, LB) {
  // 新增一筆
  var otbTAH = $rob(tableID);
  var obj1 = null;
  var i = 0;
  var iar = arTAH.length;
  if (LB == "T") { arTAH[iar] = new oTEXT("N", "T", "", 12, "", "N", "N", "N",""); }
  else if (LB == "P") { arTAH[iar] = new oIMG("N", "P", "", 1, ""); }
  else if (LB == "L") { arTAH[iar] = new oALINK("N", "L", "", ""); }
  else if (LB == "B") { arTAH[iar] = new oTABLE("N", "B", "", 0, 0, ""); }
  displayOneRowTableTAH(iar);
}
$rob(sLed + "cmdEdit").onclick = function() { saveTableTAH(); };
init_tableTAH();