<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume1" ValidateRequest="false" Codebehind="YPresume1.aspx.cs" %>
<%@ MasterType VirtualPath="YPresume.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/robCalendarV200.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/robCalendYMV200.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/robYPSH.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="divbody" id="divbody" runat="server">
    *請逐項填寫個人基本資料
    <table class="item" cellpadding="5" cellspacing="0">
      <tr>
        <td>姓名</td>
        <td>
          <asp:TextBox ID="txtYPName" runat="server" MaxLength="20" Width="120px" CssClass="readOnly" ReadOnly="True" />
        </td>
        <td>出生日期</td>
        <td>
          <asp:TextBox ID="txtYPBirDate" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
          &#12288;<asp:Label ID="lblAge" runat="server"></asp:Label>
        </td>
      </tr>
      <tr>
        <td>身份證號</td>
        <td>
          <asp:TextBox ID="txtYPIDNO" runat="server" MaxLength="10" Width="150px" 
            CssClass="readonly" ReadOnly="True" />
        </td>
        <td>婚姻狀況</td>
        <td>
          <asp:DropDownList ID="dropYPMarry" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem>已婚</asp:ListItem>
            <asp:ListItem>未婚</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>性別</td>
        <td>
          <asp:DropDownList ID="dropYPSex" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>身心障礙人士</td>
        <td>
          <asp:DropDownList ID="dropYPHelth" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem Value="N">否</asp:ListItem>
            <asp:ListItem Value="Y">是</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>原住民</td>
        <td>
          <asp:DropDownList ID="dropYPYzm" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem Value="N">否</asp:ListItem>
            <asp:ListItem Value="Y">是</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>本公司因公撫恤員工之遺眷</td>
        <td>
          <asp:DropDownList ID="dropYPGsyj" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem Value="N">否</asp:ListItem>
            <asp:ListItem Value="Y">是</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>兵役狀況</td>
        <td>
          <asp:DropDownList ID="dropYPArmy" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem Value="1">役畢</asp:ListItem>
            <asp:ListItem Value="2">未役</asp:ListItem>
            <asp:ListItem Value="3">免役</asp:ListItem>
            <asp:ListItem Value="4">補役</asp:ListItem>
            <asp:ListItem Value="5">國民役</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>本公司在職員工</td>
        <td>
          <asp:DropDownList ID="dropYPZzyg" runat="server" >
            <asp:ListItem Value="-1">-請選擇-</asp:ListItem>
            <asp:ListItem Value="N">否</asp:ListItem>
            <asp:ListItem Value="Y">是</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>役期</td>
        <td colspan="3">
          <asp:TextBox ID="txtYPArmyYMF" runat="server" MaxLength="7" Width="50px" Text="" 
          /> 至 <asp:TextBox ID="txtYPArmyYME" runat="server" MaxLength="7" Width="50px" Text="" />
        </td>
      </tr>
      <tr>
        <td>戶籍地址</td>
        <td colspan="3">
          <asp:TextBox ID="txtYPHAddr" runat="server" MaxLength="100" Width="360px" ></asp:TextBox>
          <br />請依身份證上住址欄填寫(縣市/村里鄰/路街巷弄號樓)
        </td>
      </tr>
      <tr>
        <td>現居地址</td>
        <td colspan="3">
          <asp:TextBox ID="txtYPAddr" runat="server" MaxLength="100" Width="360px" ></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>E-mail</td>
        <td colspan="3">
          <asp:TextBox ID="txtYPMail" runat="server" MaxLength="100" Width="200px" /></td>
      </tr>
      <tr>
        <td>連絡電話</td>
        <td colspan="3">
          手機<asp:TextBox ID="txtYPCel" runat="server" MaxLength="50" Width="120px" />
          &#12288;住宅電話<asp:TextBox ID="txtYPTel" runat="server" MaxLength="50" Width="120px" />
          &#12288;辦公室電話<asp:TextBox ID="txtYPOTel" runat="server" MaxLength="50" Width="120px" />
        </td>
      </tr>
    </table>
   
    <table class="item" cellpadding="5" cellspacing="0">
      <tr>
        <td class="statusbar" align="center">
          <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>
          <span id="span1"></span>
        </td>
      </tr>
      <tr>
        <td class="statusbar" align="center">
          <asp:Button ID="cmdSave" runat="server" Text=" 存檔 Save " CssClass="cmd" OnClick="cmdSave_Click" />
        </td>
      </tr>
    </table>
    <asp:HiddenField ID="hidYPD00" runat="server" />
    <asp:HiddenField ID="hidYPDateUpdate" runat="server" />
    <asp:HiddenField ID="hidYPZip" runat="server" />
    <asp:HiddenField ID="hidYPCity" runat="server" />
    <asp:HiddenField ID="hidYPArea" runat="server" />
    <asp:HiddenField ID="hidYPHZip" runat="server" />
    <asp:HiddenField ID="hidYPHCity" runat="server" />
    <asp:HiddenField ID="hidYPHArea" runat="server" />
    <asp:HiddenField ID="hidYPHELTH1" runat="server" />
    <asp:HiddenField ID="hidYPHELTH2" runat="server" />
    <asp:HiddenField ID="hidYPHELTH3" runat="server" />
    <asp:HiddenField ID="hidYPARMY" runat="server" />
    <asp:HiddenField ID="hidYPARMY1" runat="server" />
  </div>

<div id="divJS" runat="server" enableviewstate="false"></div>

<div id="divSchool" 
    style="border:1px solid #339966; width:200px; padding:6px;
    position:absolute; line-height:20px; visibility:hidden;
    background-color:#CCFFCC;" 
    onmouseover="swShDivOut=false;" 
    onmouseout="swShDivOut=true;" ></div>
<div id="divYPSHjs" runat="server" enableviewstate="false"></div>

<script type="text/javascript">
  function setTxtField(sw1, obj1) {
    if (obj1 == null) { return; }
    if (sw1) {
      obj1.className = "";
      obj1.removeAttribute("disabled");
    } else {
      obj1.value = "";
      obj1.className = "readOnly";
      obj1.setAttribute("disabled", "disabled");
    }
  }
  function strAge(obj1) {
    var str1 = obj1.value;
    var i = Date.parse(str1); // 如果轉出不是正確的值，強制清除
    if (isNaN(i)) { obj1.value = ""; str1 = ""; }
    var objAge = $rob(sLed + "lblAge");
    if (!objAge) {  return; }
    var dateNow = new Date();
    if (str1.length > 0) {
      var i1 = dateNow.getFullYear() * 12 + dateNow.getMonth();
      var arr1 = str1.split('/');
      if (arr1.length < 2) { objAge.value = ""; return; }
      var iy = parseInt(arr1[0]);
      var im = parseInt(arr1[1]);
      var i2 = iy * 12 + im - 1;
      i1 = (i1 - i2) / 12;
      objAge.innerHTML = Math.floor(i1).toString() + "歲";
    } else {
      objAge.innerHTML = "&nbsp;"; //若只給"", 有時會清不掉
    }
  }
  if (sysYPEdit) {
    $rob(sLed + "txtYPBirDate").onblur = function() { strAge(this); }
    $rob(sLed + "txtYPBirDate").onclick = function() { robCalendar_setDate(this); }
    $rob(sLed + "txtYPArmyYMF").onclick = function() { robCalendYM_setDate(this); }
    $rob(sLed + "txtYPArmyYMF").onblur = function() { var i = Date.parse(this.value + '/01'); if (isNaN(i)) { this.value = ''; } }
    $rob(sLed + "txtYPArmyYME").onclick = function() { robCalendYM_setDate(this); }
    $rob(sLed + "txtYPArmyYME").onblur = function () { var i = Date.parse(this.value + '/01'); if (isNaN(i)) { this.value = ''; } }

  }
</script> 
<!-- #include file="YPJS/css/robCalendarV200.htm" -->
<!-- #include file="YPJS/css/robCalendYMV200.htm" -->
<script type="text/javascript">
  // $rob("robCalendarCmdSet").onblur = function() { strAge($rob(sLed + "txtYPBirDate")); }
  strAge($rob(sLed + "txtYPBirDate"));
</script>
</asp:Content>

