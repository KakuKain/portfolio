<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume3" ValidateRequest="false" Codebehind="YPresume3.aspx.cs" %>
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
  <td>*請填寫您的工作經歷<span class="english"></span></td>
</tr>
<tr>
  <td>
    &nbsp;&nbsp;<label id="lblCmd1" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="addnewRowTableYPWK()" >新增</label>
    &nbsp;&nbsp;<label id="lblCmd2" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="selectAllRowsTable('tableYPWK')" >全選</label>
    &nbsp;&nbsp;<label id="lblCmd3" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="unselectAllRowsTable('tableYPWK')" >取消選取</label>
    &nbsp;&nbsp;<label id="lblCmd4" class="opCmd" onmousemove="this.className='opCmdMsOver'" onmouseout="this.className='opCmd';" onclick="deleteRowsTable('tableYPWK',arYPWK);sortTableYPWK();" >刪除已選取</label>
  </td>
</tr>
<tr><td>
  <table id="tableYPWK" class="item" cellpadding="5" cellspacing="0">
  <tr>
    <td class="title">選</td>
    <td class="title">公司名稱 / 職務</td>
    <td class="title">服務期間</td>
    <td class="title">擔任工作內容</td>
    <td class="title">年資</td>
    <td class="title">年薪</td>
  </tr>
  </table>
</td></tr>
<tr><td class="statusbar" align="center"><br /><asp:Label ID="lblMsg" runat="server" 
    CssClass="message" EnableViewState="False"></asp:Label></td></tr>
<tr><td class="statusbar" align="center">
    <asp:Button ID="cmdSave" runat="server" Text=" 存檔 Save " CssClass="cmd" 
      onclick="cmdSave_Click" 
      OnClientClick="sortTableYPWK();" />
</td></tr>
</table>
<asp:HiddenField ID="hidYPD00" runat="server" />
<asp:HiddenField ID="hidYPDateUpdate" runat="server" />
<asp:HiddenField ID="hidYPWK" runat="server" />
</div>
<div id="divJS" runat="server" enableviewstate="false"></div>

  <script type="text/javascript">
    var tbYPWK = $rob("tableYPWK");
    var arYPWK = new Array();
    var ohidYPWK = $rob(sLed + "hidYPWK");
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

    function addnewRowTableYPWK() {
      // 新增一筆
      if (arYPWK.length >= 6) { alert("最多輸入6筆資料!!"); return; }
      var iar = arYPWK.length;
      arYPWK[iar] = new oYPWK("N", "", "", "", "", "", "", "");
      displayOneRowTableYPWK(iar);
    }

    function sortTableYPWK() {
      // saveTableYPWK();
      arYPWK.sort(sortDescYPWK);
      displayAllTabelYPWK();
      saveTableYPWK();
    }
    function sortDescYPWK(parm1, parm2) {
      if (parm1.WKFYM == parm2.WKFYM) { return 0; }
      else if (parm1.WKFYM > parm2.WKFYM) { return -1 }
      else { return 1; }
    }
    function sortAscYPWK(parm1, parm2) {
      if (parm1.WKFYM == parm2.WKFYM) { return 0; }
      else if (parm1.WKFYM > parm2.WKFYM) { return 1 }
      else { return -1; }
    }

    function saveTableYPWK() {
      try { // WKCOMP ¡ WKJOB ¡ WKFYM ¡ WKEYM ¡ WKDESC ¡ WKYEARS ¡ WKYPAY¶¡¡¡¡¡¡
        var i = 0, iar = 0, str1 = "", str2 = "";
        var str3 = "¡¡¡¡¡¡";
        for (iar = 0; iar < arYPWK.length; iar++) {
          str2 = "" + arYPWK[iar].WKCOMP.trim()
          + "¡" + arYPWK[iar].WKJOB.trim()
          + "¡" + arYPWK[iar].WKFYM.trim()
          + "¡" + arYPWK[iar].WKEYM.trim()
          + "¡" + arYPWK[iar].WKDESC.trim()
          + "¡" + arYPWK[iar].WKYEARS.trim()
          + "¡" + arYPWK[iar].WKYPAY.trim()
          ;
          if (str2 != str3 && arYPWK[iar].WKDESC.length > 0)
          { str1 += (str1.length > 0 ? "¶" : "") + str2; }
        }
        ohidYPWK.value = str1;
      }
      catch (err) { /* $rob(sLed + "lblMsg").innerHTML =err ; */ }
    }

    function oYPWK(SEL, WKCOMP, WKJOB, WKFYM, WKEYM, WKDESC, WKYEARS, WKYPAY ) {
      this.sel = SEL;
      this.WKCOMP = WKCOMP;
      this.WKJOB = WKJOB;
      this.WKFYM = WKFYM;
      this.WKEYM = WKEYM;
      this.WKDESC = WKDESC;
      this.WKYEARS = WKYEARS;
      this.WKYPAY = WKYPAY;
    }
    
    function init_tableYPWK() {
      var arRecs = null;
      var arFlds = null;
      var str1 = null;
      var i = 0;
      arYPWK = new Array();
      var iar = 0;
      if (ohidYPWK.value.length > 0) {
        arRecs = ohidYPWK.value.split("¶");
        //var re = /¿/g; //arFlds[0].replace(re, ""),
        for (i = 0; i < arRecs.length; i++) {
          iar = arYPWK.length;
          arFlds = arRecs[i].split("¡");
          arYPWK[iar] = new oYPWK("N",
            arFlds[0],
            arFlds[1],
            arFlds[2],
            arFlds[3],
            arFlds[4],
            arFlds[5],
            arFlds[6]
            );
        }
      }
      displayAllTabelYPWK();
    }

    function displayAllTabelYPWK() {
      // 清除 table 中所有內容
      while (tbYPWK.rows.length > 1) {
        tbYPWK.deleteRow(1);
      }
      // 顯示每一筆
      for (var i = 0; i < arYPWK.length; i++) {
        displayOneRowTableYPWK(i);
      }
    }

    function displayOneRowTableYPWK(iar) {
      var obj1 = null;
      var i = 0;
      var ir = iar + 1;
      tbYPWK.insertRow(ir);

      // 選擇 sel
      tbYPWK.rows[ir].insertCell(0);
      tbYPWK.rows[ir].cells[0].innerHTML = "<input type='checkbox' "
        + (sysYPEdit ? "" : "disabled='disabled' ")
        + "/>";
      // 設定 選擇 sel
      obj1 = tbYPWK.rows[ir].cells[0].childNodes[0];
      if (arYPWK[iar].sel == "Y") {
        obj1.setAttribute("checked", "checked");
      }

      // 公司名稱 WKCOMP 
      tbYPWK.rows[ir].insertCell(1);
      tbYPWK.rows[ir].cells[1].innerHTML =
        "公司<input type=\"text\" maxlength=\"50\" style=\"width:150px;\" "
        + "value=\"" + txtHTML(arYPWK[iar].WKCOMP) + "\" "
        + (sysYPEdit
          ? "onblur='arYPWK[" + iar + "].WKCOMP=this.value;' "
          : "disabled='disabled' ")
        + " />";

      // 職務 WKJOB 
      //tbYPWK.rows[ir].insertCell(2);
      tbYPWK.rows[ir].cells[1].innerHTML += "<br />職務"
        + "<input type=\"text\" maxlength=\"50\" style=\"width:150px;\" "
        + "value=\"" + txtHTML(arYPWK[iar].WKJOB) + "\" "
        + (sysYPEdit
          ? "onblur='arYPWK[" + iar + "].WKJOB=this.value;' "
          : "disabled='disabled' ")
        + " />";

      // 服務期間 WKFYM WKEYM & 設定
      tbYPWK.rows[ir].insertCell(2);
      tbYPWK.rows[ir].cells[2].innerHTML =
        "起<input type='text' maxlength='7' style='width:50px;' "
        + "value='" + txtHTML(arYPWK[iar].WKFYM) + "' "
        + (sysYPEdit
          ? " onclick=\"robCalendYM_setDate(this);\" "
            + " onblur=\"var i = Date.parse(this.value+'/01');if (isNaN(i)){ this.value = '';} "
            + "arYPWK[" + iar + "].WKFYM=this.value; "
            + "sortTableYPWK();"  // 服務期間 起 要排序
            + "\" "
          : "disabled='disabled' ")
        + " />"
        + "<br />"
        + "迄<input type='text' maxlength='7' style='width:50px;' "
        + "value='" + txtHTML(arYPWK[iar].WKEYM) + "' "
        + (sysYPEdit
          ? "onclick=\"robCalendYM_setDate(this);\""
            + " onblur=\"var i = Date.parse(this.value+'/01');if (isNaN(i)){ this.value = '';} "
            + "arYPWK[" + iar + "].WKEYM=this.value;"
            + "\" "
          : "disabled='disabled' ")
        + " />";

      // 擔任工作內容 WKDESC 
      tbYPWK.rows[ir].insertCell(3);
      tbYPWK.rows[ir].cells[3].innerHTML =
        "<input type=\"text\" maxlength=\"50\" style=\"width:250px;\" "
        + "value=\"" + txtHTML(arYPWK[iar].WKDESC) + "\" "
        + (sysYPEdit
          ? "onblur='arYPWK[" + iar + "].WKDESC=this.value;' "
          : "disabled='disabled' ")
        + " />";

      // 年資 WKYEARS
      tbYPWK.rows[ir].insertCell(4);
      tbYPWK.rows[ir].cells[4].innerHTML =
        "<input type=\"text\" maxlength=\"10\" style=\"width:60px;\" "
        + "value=\"" + txtHTML(arYPWK[iar].WKYEARS) + "\" "
        + (sysYPEdit
          ? "onblur='arYPWK[" + iar + "].WKYEARS=this.value;' "
          : "disabled='disabled' ")
        + " />";

      // 年薪 WKYPAY
      tbYPWK.rows[ir].insertCell(5);
      tbYPWK.rows[ir].cells[5].innerHTML =
        "<input type=\"text\" maxlength=\"10\" style=\"width:60px;\" "
        + "value=\"" + txtHTML(arYPWK[iar].WKYPAY) + "\" "
        + (sysYPEdit
          ? "onblur='arYPWK[" + iar + "].WKYPAY=this.value;' "
          : "disabled='disabled' ")
        + " />";

    }
    
  </script>

<script type="text/javascript">
  init_tableYPWK();
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

