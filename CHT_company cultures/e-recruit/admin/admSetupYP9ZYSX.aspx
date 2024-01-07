<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" 
Inherits="SC.admSetupYP9ZYSX" ValidateRequest="false" Codebehind="admSetupYP9ZYSX.aspx.cs" %>
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
        系統設置 : 設定 履歷表提交注意事項</th>
    </tr>
    <tr>
      <td colspan="3" class="dark">
        <div style="text-align:left; line-height:20px;">
          <br />
          設定前台【填寫個人履歷表】→【提交履歷表】中的【*提交履歷表的注意事項】內文：<br />
          <asp:TextBox ID="txtZYSX" runat="server" CssClass="txtBox"
            Width="750px" TextMode="MultiLine" Rows="15" ></asp:TextBox>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="3" class="dark">
        <div style="text-align:left; line-height:20px;">
          <br />
          【*提交履歷表的注意事項】隨後的提示文字：<br />
          <asp:TextBox ID="txtZYSX1" runat="server" CssClass="txtBox"
            Width="750px" TextMode="MultiLine" Rows="5" ></asp:TextBox>
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
