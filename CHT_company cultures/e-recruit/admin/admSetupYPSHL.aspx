<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" 
Inherits="SC.admSetupYPSHL" ValidateRequest="false" Codebehind="admSetupYPSHL.aspx.cs" %>
<%@ MasterType VirtualPath="admPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <style type="text/css">
    .lable1
    {
      color: #CC0000;
    }
    .lable2
    {
      color: #006600;
    }
    .txtBox
    {
      letter-spacing:0.1em;
      line-height:16px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <table class="tbMain" align="center" cellspacing="1" width="100%">
    <tr>
      <th colspan="3" class="headC">
        系統設置 : 前台【填寫個人履歷表】資訊</th>
    </tr>
    <tr>
      <td colspan="3" class="light">
<table border="1" cellpadding="5" cellspacing="0" 
style="margin-left:auto; margin-right:auto; border-collapse:collapse;">
  <tr>
    <td class="darkC" style="width:300px;">
      【學歷】的【學校名稱】
    </td>
    <td class="darkC" style="width:300px;">
      【學歷】的【科系所】
    </td>
  </tr>
  <tr>
    <td class="lightC">
      <asp:TextBox ID="txtYPSHL" runat="server" CssClass="txtBox"
        Width="200px" TextMode="MultiLine" Rows="30" />
    </td>
    <td class="lightC">
      <asp:TextBox ID="txtYPXLDEPT" runat="server" CssClass="txtBox"
        Width="200px" TextMode="MultiLine" Rows="30" />
    </td>
  </tr>
</table>
      </td>
    </tr>
    <tr>
      <td class="dark" colspan="3">
        &nbsp;<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
      </td>
    </tr>
    <tr>
      <td class="dark" colspan="3">
        &nbsp;<asp:Button ID="cmdSave" runat="server" Text=" 存檔 " 
          onclick="cmdSave_Click" CssClass="cmd" />
      </td>
    </tr>
    <tr runat="server" visible="false">
      <td class="dark">
        &nbsp;
      </td>
      <td class="dark">
        &nbsp;
      </td>
      <td class="dark">
        &nbsp;
      </td>
    </tr>
  </table>
  <br />
  <br />
</asp:Content>
