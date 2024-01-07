<%@ Page Language="C#" AutoEventWireup="true" Inherits="SC.YPDefault" Codebehind="YPDefault.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <title>中華電信人才招募網</title>
  <link href="YPJS/css/YPresume.css" rel="stylesheet" type="text/css" />
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <script src="YPJS/js/SC_ckMain.js" type="text/javascript"></script>
  <script src="YPJS/js/robJsLib.js" type="text/javascript"></script>
</head>
<body>
<div style="position:relative; margin:0 auto; width:980px;" >
  <form id="form1" runat="server">

  <!-- top -->
  <div style="z-index: 1; left: 0px; top: 0px; position: absolute; width: 980px; ">
    <table width="980px" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
      <tr>
        <td valign="middle" align="left" style="width:16px;">&nbsp;</td>
        <td style="text-align:center;">
          <img id="imgYPBanner" runat="server" alt="Banner" src="" enableviewstate="false" />
        </td>
      </tr>
    </table>
  </div>

  <!-- left menu -->
  <div id="divLeftMenu" runat="server" enableviewstate="false"
     style="z-index: 1; left: 10px; top: 100px; position: absolute; width: 180px">
    <table id="Vmenu" cellspacing="6" runat="server">
      <tr><td>
        <table cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
          <tr>
          <td id="tdReg" runat="server" class="Vtitle"  style="cursor:pointer; line-height:14px; text-decoration: underline;" onclick="JavaScript: location='YPLogin.aspx';" >應徵者&nbsp;&nbsp;登入/註冊
          </td>
          </tr>
        </table>
      </td></tr>
      <%-- 
      <tr><td>
        <table cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
          <tr>
          <td id="tdFG" runat="server" class="Vtitle"  style="cursor:pointer; line-height:14px; text-decoration: underline;" onclick="JavaScript: location='YPLogin.aspx?m=fg';" >忘記密碼
          </td>
          </tr>
        </table>
      </td></tr>
      --%>
      
      <tr><td>
        <table cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
          <tr>
          <td id="td1" runat="server" class="Vtitle"  style="cursor:pointer; line-height:14px; text-decoration: underline;" onclick="JavaScript: window.open('privacy.html','_blank','');" >個人資料保護法宣告
          </td>
          </tr>
        </table>
      </td></tr>
      
      <tr><td style="height:300px;"></td></tr>
      <tr>
        <td class="Vtitle" style="line-height:14px;">
          Copyright &copy; 2020
          <br />eRecruit of
          <br />CHT
          <br />版權所有
        </td>
      </tr>
      <tr id="trService" runat="server" enableviewstate="false">
        <td id="tdService" runat="server" enableviewstate="false"
          class="Vtitle" style="line-height:14px;"></td>
      </tr>
    </table>
  </div>
  <!-- content -->
  <div id="divContent" runat="server" style="z-index: 1; left: 200px; top: 100px; position: absolute; width: 780px; ">
    <div style="margin-top:7px; background-color: #F0EFEC; padding:5px;">
      <span style="font-size:24px; font-weight:bold; font-family:標楷體,Arial,細明體,; ">
      中華電信人才招募網招募訊息</span>
    </div>
    <div class="chinese" style="margin-top:10px;">歡迎您加入中華電信大家庭，請直接查閱職務內容，或登入本系統填寫履歷，謝謝。
    </div>
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
      <asp:View ID="View1" runat="server">
        請選擇職類：<asp:DropDownList ID="dropSelZLD00" Width="150" runat="server" AutoPostBack="true"></asp:DropDownList>
        <table id="itemTable" class="itemMain" cellpadding="0" cellspacing="0" runat="server" >
          <tr>
            <td class="title" width="100">職缺編號</td>
            <td class="title" width="350">職缺項目</td>
            <td class="title" width="210">機構</td>
            <td class="title" width="150">職務內容</td>
          </tr>
         </table>
      </asp:View>
      <asp:View ID="View2" runat="server">
        <div style="text-align:center;">
          <span style="font-size:18px; color:Blue; font-weight:bold;">
            謝謝您的關注，本次活動已結束!!
          </span>
        </div>
      </asp:View>
    </asp:MultiView>
    <asp:Label ID="lblMsg" CssClass="msg" runat="server" Text=""></asp:Label>
  </div>

  </form>
</div>
</body>
</html>
