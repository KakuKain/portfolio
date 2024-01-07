<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume5" ValidateRequest="false" Codebehind="YPresume5.aspx.cs" %>
<%@ MasterType VirtualPath="YPresume.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/robYPSH.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="divbody" runat="server" class="divbody">

<table class="outer" cellpadding="0" cellspacing="0" >
<tr>
  <td>*請填寫您的在校成績<span class="english"></span></td>
</tr>
<tr>
  <td>
    &nbsp;&nbsp;<label id="lblCmd1" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="addnewRowTableYPZXCJ()" >新增</label>
    &nbsp;&nbsp;<label id="lblCmd2" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="selectAllRowsTable('tableYPZXCJ')" >全選</label>
    &nbsp;&nbsp;<label id="lblCmd3" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="unselectAllRowsTable('tableYPZXCJ')" >取消選取</label>
    &nbsp;&nbsp;<label id="lblCmd4" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="deleteRowsTable('tableYPZXCJ',arYPZXCJ);sortTableYPZXCJ();" >刪除已選取</label>
  </td>
</tr>
<tr><td>
  <table id="tableYPZXCJ" class="item" cellpadding="5" cellspacing="0">
  <tr>
    <td class="title">選</td>
    <td class="title">學校名稱</td>
    <td class="title"></td>
    <td class="title">大一</td>
    <td class="title">大二</td>
    <td class="title">大三</td>
    <td class="title">大四</td>
    <td class="title">大五</td>
    <td class="title">研一</td>
    <td class="title">研二</td>
    <td class="title">研三</td>
  </tr>
  </table>
</td></tr>
<tr><td class="statusbar" align="center"><br /><asp:Label ID="lblMsg" runat="server" 
    CssClass="message" EnableViewState="False"></asp:Label></td></tr>
<tr><td class="statusbar" align="center">
    <asp:Button ID="cmdSave" runat="server" Text=" 存檔 Save " CssClass="cmd" 
      onclick="cmdSave_Click" 
      OnClientClick="sortTableYPZXCJ();" />
</td></tr>
</table>
<asp:HiddenField ID="hidYPD00" runat="server" />
<asp:HiddenField ID="hidYPDateUpdate" runat="server" />
<asp:HiddenField ID="hidYPZXCJ" runat="server" />

</div>
<div id="divJS" runat="server" enableviewstate="false"></div>
<div id="divSchool" 
    style="border:1px solid #339966; width:200px; padding:6px;
    position:absolute; line-height:20px; visibility:hidden;
    background-color:#CCFFCC;" 
    onmouseover="swShDivOut=false;" 
    onmouseout="swShDivOut=true;" ></div>

  <script type="text/javascript">
    var tbYPZXCJ = $rob("tableYPZXCJ");
    var arYPZXCJ = new Array();
    var ohidYPZXCJ = $rob(sLed + "hidYPZXCJ");
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

    function addnewRowTableYPZXCJ() {
      // 新增一筆
      if (arYPZXCJ.length >= 6) { alert("最多輸入6筆資料!!"); return; }
      var iar = arYPZXCJ.length;
      arYPZXCJ[iar] = new oYPZXCJ("N", "",
      "", "", "",  "", "", "",  "", "", "",  "", "", "",  "", "", "",
      "", "", "",  "", "", "",  "", "", "" );
      displayOneRowTableYPZXCJ(iar);
    }

    function sortTableYPZXCJ() {
      // saveTableYPZXCJ();
      //arYPZXCJ.sort(sortAscYPZXCJ);
      displayAllTabelYPZXCJ();
      saveTableYPZXCJ();
    }
    function sortDescYPZXCJ(parm1, parm2) {
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
    function sortAscYPZXCJ(parm1, parm2) {
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

    function saveTableYPZXCJ() {
      try {  //  XLNO ¡ XLNAME ¡ XLSCHOOL ¡ XLDEPT ¡ XLFYM ¡ XLEYM ¶¡¡¡¡¡
        //  CJSCHOOL ¡ CJD1A ¡ CJD1B ¡ CJD1C ¡ CJD2A ¡ CJD2B ¡ CJD2C 
        //  ¡ CJD3A ¡ CJD3B ¡ CJD3C ¡ CJD4A ¡ CJD4B ¡ CJD4C ¡ CJD5A ¡ CJD5B ¡ CJD5C 
        //  ¡ CJY1A ¡ CJY1B ¡ CJY1C ¡ CJY2A ¡ CJY2B ¡ CJY2C ¡ CJY3A ¡ CJY3B ¡ CJY3C 
        // ¶¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
        var i = 0, iar = 0, str1 = "", str2 = "";
        var str3 = "¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡";
        for (iar = 0; iar < arYPZXCJ.length; iar++) {
          str2 = "" + arYPZXCJ[iar].CJSCHOOL.trim()
          + "¡" + arYPZXCJ[iar].CJD1A.trim()
          + "¡" + arYPZXCJ[iar].CJD1B.trim()
          + "¡" + arYPZXCJ[iar].CJD1C.trim()
          + "¡" + arYPZXCJ[iar].CJD2A.trim()
          + "¡" + arYPZXCJ[iar].CJD2B.trim()
          + "¡" + arYPZXCJ[iar].CJD2C.trim()
          + "¡" + arYPZXCJ[iar].CJD3A.trim()
          + "¡" + arYPZXCJ[iar].CJD3B.trim()
          + "¡" + arYPZXCJ[iar].CJD3C.trim()
          + "¡" + arYPZXCJ[iar].CJD4A.trim()
          + "¡" + arYPZXCJ[iar].CJD4B.trim()
          + "¡" + arYPZXCJ[iar].CJD4C.trim()
          + "¡" + arYPZXCJ[iar].CJD5A.trim()
          + "¡" + arYPZXCJ[iar].CJD5B.trim()
          + "¡" + arYPZXCJ[iar].CJD5C.trim()
          + "¡" + arYPZXCJ[iar].CJY1A.trim()
          + "¡" + arYPZXCJ[iar].CJY1B.trim()
          + "¡" + arYPZXCJ[iar].CJY1C.trim()
          + "¡" + arYPZXCJ[iar].CJY2A.trim()
          + "¡" + arYPZXCJ[iar].CJY2B.trim()
          + "¡" + arYPZXCJ[iar].CJY2C.trim()
          + "¡" + arYPZXCJ[iar].CJY3A.trim()
          + "¡" + arYPZXCJ[iar].CJY3B.trim()
          + "¡" + arYPZXCJ[iar].CJY3C.trim()
          ;
          if (str2 != str3 && arYPZXCJ[iar].CJSCHOOL.length > 0)
          { str1 += (str1.length > 0 ? "¶" : "") + str2; }
        }
        ohidYPZXCJ.value = str1;
      }
      catch (err) { /* $rob(sLed + "lblMsg").innerHTML =err ; */ }
    }

    function oYPZXCJ(SEL, CJSCHOOL,
    CJD1A, CJD1B, CJD1C, CJD2A, CJD2B, CJD2C, CJD3A, CJD3B, CJD3C,
    CJD4A, CJD4B, CJD4C, CJD5A, CJD5B, CJD5C,
    CJY1A, CJY1B, CJY1C, CJY2A, CJY2B, CJY2C, CJY3A, CJY3B, CJY3C
    ) {
      this.sel = SEL;
      this.CJSCHOOL = CJSCHOOL;
      this.CJD1A = CJD1A; this.CJD1B = CJD1B; this.CJD1C = CJD1C;
      this.CJD2A = CJD2A; this.CJD2B = CJD2B; this.CJD2C = CJD2C;
      this.CJD3A = CJD3A; this.CJD3B = CJD3B; this.CJD3C = CJD3C;
      this.CJD4A = CJD4A; this.CJD4B = CJD4B; this.CJD4C = CJD4C;
      this.CJD5A = CJD5A; this.CJD5B = CJD5B; this.CJD5C = CJD5C;
      this.CJY1A = CJY1A; this.CJY1B = CJY1B; this.CJY1C = CJY1C;
      this.CJY2A = CJY2A; this.CJY2B = CJY2B; this.CJY2C = CJY2C;
      this.CJY3A = CJY3A; this.CJY3B = CJY3B; this.CJY3C = CJY3C;
    }
    
    function init_tableYPZXCJ() {
      var arRecs = null;
      var arFlds = null;
      var str1 = null;
      var i = 0;
      arYPZXCJ = new Array();
      var iar = 0;
      if (ohidYPZXCJ.value.length > 0) {
        arRecs = ohidYPZXCJ.value.split("¶");
        //var re = /¿/g; //arFlds[0].replace(re, ""),
        for (i = 0; i < arRecs.length; i++) {
          iar = arYPZXCJ.length;
          arFlds = arRecs[i].split("¡");
          arYPZXCJ[iar] = new oYPZXCJ("N",
            arFlds[0],
            arFlds[1], arFlds[2], arFlds[3],
            arFlds[4], arFlds[5], arFlds[6],
            arFlds[7], arFlds[8], arFlds[9],
            arFlds[10], arFlds[11], arFlds[12],
            arFlds[13], arFlds[14], arFlds[15],
            arFlds[16], arFlds[17], arFlds[18],
            arFlds[19], arFlds[20], arFlds[21],
            arFlds[22], arFlds[23], arFlds[24]
            );
        }
      }
      displayAllTabelYPZXCJ();
    }

    function displayAllTabelYPZXCJ() {
      // 清除 table 中所有內容
      while (tbYPZXCJ.rows.length > 1) {
        tbYPZXCJ.deleteRow(1);
      }
      // 顯示每一筆
      for (var i = 0; i < arYPZXCJ.length; i++) {
        displayOneRowTableYPZXCJ(i);
      }
    }

    function displayOneRowTableYPZXCJ(iar) {
      var obj1 = null;
      var i = 0;
      var ir = iar + 1;
      tbYPZXCJ.insertRow(ir);

      // 選擇 sel
      tbYPZXCJ.rows[ir].insertCell(0);
      tbYPZXCJ.rows[ir].cells[0].innerHTML = "<input type='checkbox' "
        + (sysYPEdit ? "" : "disabled='disabled' ")
        + "/>";
      // 設定 選擇 sel
      obj1 = tbYPZXCJ.rows[ir].cells[0].childNodes[0];
      if (arYPZXCJ[iar].sel == "Y") {
        obj1.setAttribute("checked", "checked");
      }

      // 學校名稱 CJSCHOOL 
      tbYPZXCJ.rows[ir].insertCell(1);
      tbYPZXCJ.rows[ir].cells[1].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:170px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJSCHOOL) + "\" "
        + (sysYPEdit
          ? " onkeyup='swShTxtOut = false; getSCHOOL(this);' "
            + " ondblclick='getSCHOOL(this);' "
            + " onblur='swShTxtOut=true;checkShoolDivDisplay();"
              + "arYPZXCJ[" + iar + "].CJSCHOOL=this.value;' "
          : "disabled='disabled' ")
        + " />";
      
      // 標題
      tbYPZXCJ.rows[ir].insertCell(2);
      tbYPZXCJ.rows[ir].cells[2].innerHTML = "上學期<br />下學期<br />平均分數";

      // 大一 CJD1
      tbYPZXCJ.rows[ir].insertCell(3);
      tbYPZXCJ.rows[ir].cells[3].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD1A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD1A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD1B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD1B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD1C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD1C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 大二 CJD2
      tbYPZXCJ.rows[ir].insertCell(4);
      tbYPZXCJ.rows[ir].cells[4].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD2A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD2A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD2B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD2B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD2C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD2C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 大三 CJD3
      tbYPZXCJ.rows[ir].insertCell(5);
      tbYPZXCJ.rows[ir].cells[5].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD3A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD3A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD3B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD3B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD3C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD3C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 大四 CJD4
      tbYPZXCJ.rows[ir].insertCell(6);
      tbYPZXCJ.rows[ir].cells[6].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD4A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD4A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD4B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD4B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD4C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD4C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 大五 CJD5
      tbYPZXCJ.rows[ir].insertCell(7);
      tbYPZXCJ.rows[ir].cells[7].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD5A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD5A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD5B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD5B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJD5C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJD5C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 研一 CJY1
      tbYPZXCJ.rows[ir].insertCell(8);
      tbYPZXCJ.rows[ir].cells[8].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY1A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY1A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY1B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY1B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY1C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY1C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 研二 CJY2
      tbYPZXCJ.rows[ir].insertCell(9);
      tbYPZXCJ.rows[ir].cells[9].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY2A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY2A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY2B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY2B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY2C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY2C=this.value;'"
          : "disabled='disabled' ") + " />";

      // 研三 CJY3
      tbYPZXCJ.rows[ir].insertCell(10);
      tbYPZXCJ.rows[ir].cells[10].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY3A) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY3A=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY3B) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY3B=this.value;'"
          : "disabled='disabled' ") + " />"
        + "<br /><input type=\"text\" maxlength=\"50\" style=\"width:40px;\" "
        + "value=\"" + txtHTML(arYPZXCJ[iar].CJY3C) + "\""
        + (sysYPEdit ? "onblur='arYPZXCJ[" + iar + "].CJY3C=this.value;'"
          : "disabled='disabled' ") + " />";
    }
    
  </script>
<script src="YPJS/css/robYPZXCJ_SH.js" type="text/javascript"></script>
<div id="divYPSHjs" runat="server" enableviewstate="false"></div>
<script type="text/javascript">
  init_tableYPZXCJ();
  if (!sysYPEdit) {
    for (var i = 1; i <= 4; i++) {
      $rob("lblCmd" + i).onclick = null;
      $rob("lblCmd" + i).onmouseover = null;
      $rob("lblCmd" + i).onmouseout = null;
      $rob("lblCmd" + i).innerHTML = "";
    }
  }
</script> 
</asp:Content>

