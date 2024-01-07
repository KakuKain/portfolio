<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume2" ValidateRequest="false" Codebehind="YPresume2.aspx.cs" %>
<%@ MasterType VirtualPath="YPresume.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/robCalendYMV200.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/robYPSH.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="divbody" runat="server" class="divbody">

<table class="outer" cellpadding="0" cellspacing="0" >
<tr>
  <td>*請填寫您的學歷<span class="english"></span></td>
</tr>
<tr>
  <td>
    &nbsp;&nbsp;<label id="lblCmd1" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="addnewRowTableYPXL()" >新增</label>
    &nbsp;&nbsp;<label id="lblCmd2" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="selectAllRowsTable('tableYPXL')" >全選</label>
    &nbsp;&nbsp;<label id="lblCmd3" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="unselectAllRowsTable('tableYPXL')" >取消選取</label>
    &nbsp;&nbsp;<label id="lblCmd4" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="deleteRowsTable('tableYPXL',arYPXL);sortTableYPXL();" >刪除已選取</label>
  </td>
</tr>
<tr><td>
  <table id="tableYPXL" class="item" cellpadding="5" cellspacing="0">
  <tr>
    <td class="title">選</td>
    <td class="title">教育程度</td>
    <td class="title">學校名稱</td>
    <td class="title">科系所</td>
    <td class="title">起迄年月</td>
  </tr>
  </table>
</td></tr>
<tr><td class="statusbar" align="center"><br /><asp:Label ID="lblMsg" runat="server" 
    CssClass="message" EnableViewState="False"></asp:Label></td></tr>
<tr><td class="statusbar" align="center">
    <asp:Button ID="cmdSave" runat="server" Text=" 存檔 Save " CssClass="cmd" 
      onclick="cmdSave_Click" 
      OnClientClick="sortTableYPXL();" />
</td></tr>
</table>
<asp:HiddenField ID="hidYPD00" runat="server" />
<asp:HiddenField ID="hidYPDateUpdate" runat="server" />
<asp:HiddenField ID="hidYPXL" runat="server" />
<asp:HiddenField ID="hidYPXLNO" runat="server" />
</div>
<div id="divJS" runat="server" enableviewstate="false"></div>
<div id="divSchool" 
    style="border:1px solid #339966; width:200px; padding:6px;
    position:absolute; line-height:20px; visibility:hidden;
    background-color:#CCFFCC;" 
    onmouseover="swShDivOut=false;" 
    onmouseout="swShDivOut=true;" ></div>

  <script type="text/javascript">
    var tbYPXL = $rob("tableYPXL");
    var arYPXL = new Array();
    var ohidYPXL = $rob(sLed + "hidYPXL");
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

    function addnewRowTableYPXL() {
      // 新增一筆
      if (arYPXL.length >= 6) { alert("最多輸入6筆資料!!"); return; }
      var iar = arYPXL.length;
      arYPXL[iar] = new oYPXL("N", "", "", "", "", "", "");
      displayOneRowTableYPXL(iar);
    }

    function sortTableYPXL() {
      // saveTableYPXL();
      arYPXL.sort(sortAscYPXL);
      displayAllTabelYPXL();
      saveTableYPXL();
    }
    function sortDescYPXL(parm1, parm2) {
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
    function sortAscYPXL(parm1, parm2) {
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

    function saveTableYPXL() {
      try {  //  XLNO ¡ XLNAME ¡ XLSCHOOL ¡ XLDEPT ¡ XLFYM ¡ XLEYM ¶¡¡¡¡¡
        var i = 0, iar = 0, str1 = "", str2 = "";
        var str3 = "¡¡¡¡¡";
        for (iar = 0; iar < arYPXL.length; iar++) {
          str2 = "" + arYPXL[iar].XLNO.trim()
          + "¡" + arYPXL[iar].XLNAME.trim()
          + "¡" + arYPXL[iar].XLSCHOOL.trim()
          + "¡" + arYPXL[iar].XLDEPT.trim()
          + "¡" + arYPXL[iar].XLFYM.trim()
          + "¡" + arYPXL[iar].XLEYM.trim();
          if (str2 != str3 && arYPXL[iar].XLSCHOOL.length > 0)
          { str1 += (str1.length > 0 ? "¶" : "") + str2; }
        }
        ohidYPXL.value = str1;
      }
      catch (err) { /* $rob(sLed + "lblMsg").innerHTML =err ; */ }
    }

    function oYPXL(SEL, XLNO, XLNAME, XLSCHOOL, XLDEPT, XLFYM, XLEYM) {
      this.sel = SEL;
      this.XLNO = XLNO;
      this.XLNAME = XLNAME;
      this.XLSCHOOL = XLSCHOOL;
      this.XLDEPT = XLDEPT;
      this.XLFYM = XLFYM;
      this.XLEYM = XLEYM;
    }
    
    function init_tableYPXL() {
      var arRecs = null;
      var arFlds = null;
      var str1 = null;
      var i = 0;
      arYPXL = new Array();
      var iar = 0;
      if (ohidYPXL.value.length > 0) {
        arRecs = ohidYPXL.value.split("¶");
        //var re = /¿/g; //arFlds[0].replace(re, ""),
        for (i = 0; i < arRecs.length; i++) {
          iar = arYPXL.length;
          arFlds = arRecs[i].split("¡");
          arYPXL[iar] = new oYPXL("N",
            arFlds[0],
            arFlds[1],
            arFlds[2],
            arFlds[3],
            arFlds[4],
            arFlds[5]
            );
        }
      }
      displayAllTabelYPXL();
    }

    function displayAllTabelYPXL() {
      // 清除 table 中所有內容
      while (tbYPXL.rows.length > 1) {
        tbYPXL.deleteRow(1);
      }
      // 顯示每一筆
      for (var i = 0; i < arYPXL.length; i++) {
        displayOneRowTableYPXL(i);
      }
    }

    function displayOneRowTableYPXL(iar) {
      var obj1 = null;
      var i = 0;
      var ir = iar + 1;
      tbYPXL.insertRow(ir);

      // 選擇 sel
      tbYPXL.rows[ir].insertCell(0);
      tbYPXL.rows[ir].cells[0].innerHTML = "<input type='checkbox' "
        + (sysYPEdit ? "" : "disabled='disabled' ")
        + "/>";
      // 設定 選擇 sel
      obj1 = tbYPXL.rows[ir].cells[0].childNodes[0];
      if (arYPXL[iar].sel == "Y") {
        obj1.setAttribute("checked", "checked");
      }

      // 學歷代碼 XLNO XLNAME
      tbYPXL.rows[ir].insertCell(1);
      tbYPXL.rows[ir].cells[1].innerHTML = $rob(sLed + "hidYPXLNO").value;
      // 設定學歷代碼 XLNO XLNAME
      obj1 = tbYPXL.rows[ir].cells[1].childNodes[0];
      obj1.value = arYPXL[iar].XLNO;
      if (obj1.value != arYPXL[iar].XLNO) { obj1.selectedIndex = 0; }
      if (!sysYPEdit) { obj1.setAttribute("disabled", "disabled"); }
      else {
        obj1.setAttribute("iar", iar);
        obj1.onchange = function() {
          var iar1 = this.getAttribute("iar");
          arYPXL[iar1].XLNO = this.value;
          if (arYPXL[iar1].XLNO.length <= 0) {
            arYPXL[iar1].XLNAME = "";
          } else {
            arYPXL[iar1].XLNAME = this.options[this.selectedIndex].text;
          }
          sortTableYPXL();
        }
      }

      // 學校名稱 XLSCHOOL 
      tbYPXL.rows[ir].insertCell(2);
      tbYPXL.rows[ir].cells[2].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:170px;\" "
        + "value=\"" + txtHTML(arYPXL[iar].XLSCHOOL) + "\" "
        + (sysYPEdit
          ? " onkeyup='swShTxtOut = false; getSCHOOL(this);' "
            + " ondblclick='getSCHOOL(this);' "
            + " onblur='swShTxtOut=true;checkShoolDivDisplay();"
              + "arYPXL[" + iar + "].XLSCHOOL=this.value;' "
          : "disabled='disabled' ")
        + " />";
      
      // 科系 XLDEPT
      tbYPXL.rows[ir].insertCell(3);
      tbYPXL.rows[ir].cells[3].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:90px;\" "
        + "value=\"" + txtHTML(arYPXL[iar].XLDEPT) + "\""
        + (sysYPEdit
          /*? "onblur='arYPXL[" + iar + "].XLDEPT=this.value;'"
          : "disabled='disabled' ")*/
          ? " onkeyup='swShTxtOut = false; getDEPT(this);' "
            + " ondblclick='getDEPT(this);' "
            + " onblur='swShTxtOut=true;checkShoolDivDisplay();"
              + "arYPXL[" + iar + "].XLDEPT=this.value;' "
          : "disabled='disabled' ")
        + " />";

      // 期間 XLFYM XLEYM & 設定
      tbYPXL.rows[ir].insertCell(4);
      tbYPXL.rows[ir].cells[4].innerHTML =
        "起<input type='text' maxlength='7' style='width:50px;' "
        + "value='" + txtHTML(arYPXL[iar].XLFYM) + "' "
        + (sysYPEdit
          ? " onclick=\"robCalendYM_setDate(this);\" "
            + " onblur=\"var i = Date.parse(this.value+'/01');if (isNaN(i)){ this.value = '';} "
            + "arYPXL[" + iar + "].XLFYM=this.value;"
            +"\" "
          : "disabled='disabled' ")
        + " />"
        + "<br />"
        + "迄<input type='text' maxlength='7' style='width:50px;' "
        + "value='" + txtHTML(arYPXL[iar].XLEYM) + "' "
        + (sysYPEdit
          ? "onclick=\"robCalendYM_setDate(this);\""
            + " onblur=\"var i = Date.parse(this.value+'/01');if (isNaN(i)){ this.value = '';} "
            + "arYPXL[" + iar + "].XLEYM=this.value;"
            + "\" "
          : "disabled='disabled' ")
        + " />";
    }
    
  </script>
<script src="YPJS/css/robYPSH.js" type="text/javascript"></script>
<div id="divYPSHjs" runat="server" enableviewstate="false"></div>
<script type="text/javascript">
  init_tableYPXL();
  if (!sysYPEdit) {
    for (var i = 1; i <= 4; i++) {
      $rob("lblCmd" + i).onclick = null;
      $rob("lblCmd" + i).onmouseover = null;
      $rob("lblCmd" + i).onmouseout = null;
      $rob("lblCmd" + i).innerHTML = "";
    }
  }
</script> 
<!-- #include file="YPJS/css/robCalendYMV200.htm" -->
</asp:Content>

