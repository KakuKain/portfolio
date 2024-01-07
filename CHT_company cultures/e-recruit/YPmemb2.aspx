<%@ Page Language="C#" MasterPageFile="YPmemb.master" AutoEventWireup="true" Inherits="SC.YPmemb2" Codebehind="YPmemb2.aspx.cs" %>
<%@ MasterType VirtualPath="YPmemb.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="divbody" runat="server" class="divbody">
  <table class="outer" cellpadding="0" cellspacing="0"  style="margin-left:10px;">
    <tr><td>*請注意，密碼格式最少為 5 位的英數字元：</td></tr>
    <tr><td>  
      <table id="itemTable" class="item1" cellpadding="5" cellspacing="0" runat="server" >
      <tr>
        <td class="title" width="150">設定新的密碼</td>
        <td class="center" width="150">
          <asp:TextBox ID="txtSETpw" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td class="title">再次確認密碼</td>
        <td class="center">
          <asp:TextBox ID="txtSETpw2" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
        </td>
      </tr>
  </table>

</td></tr>
<tr><td class="statusbar" align="center">
  <asp:Label ID="lblMsg" runat="server" CssClass="message" EnableViewState="False"></asp:Label>
  <br /><asp:Button ID="cmdSave" runat="server" Text=" 存檔 " CssClass="cmd" onclick="cmdSave_Click" />
</td></tr>
</table>
</div>
</asp:Content>

