<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admSetupYPService" ValidateRequest="false" Codebehind="admSetupYPService.aspx.cs" %>
<%@ MasterType VirtualPath="admPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <style type="text/css">
    .style3
    {
      font-size: medium;
      font-weight: bold;
    }
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
        系統設置 : 設定 前台服務訊息</th>
    </tr>
    <tr>
      <td colspan="3" class="dark">
        <div style="text-align:left; line-height:20px;">
          <br />
          設定前台中的【服務訊息方塊】中的內文，換行請按&lt;Enter&gt;鍵：<br />
          <asp:TextBox ID="txtZYSX" runat="server" CssClass="txtBox"
            Width="600px" TextMode="MultiLine" Rows="20" ></asp:TextBox>
        </div>
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
    <tr>
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
