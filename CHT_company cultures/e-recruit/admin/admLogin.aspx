<%@ Page Language="C#" MasterPageFile="admLoginM.master"
  AutoEventWireup="true" Inherits="SC.admLogin" Codebehind="admLogin.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <table cellpadding="5" cellspacing="1" class="tbMain">
    <tr>
      <th class="headC" colspan="2">
        管理員登入
      </th>
    </tr>
    <tr>
      <td class="darkC" width="100px">
        帳&nbsp;&nbsp;號：
      </td>
      <td class="lightL" >
        <asp:TextBox ID="txtAdminID" runat="server" CssClass="txtBox" MaxLength="20"
          Width="150px"></asp:TextBox>
        5~20碼
      </td>
    </tr>
    <tr>
      <td class="darkC">
        密&nbsp;&nbsp;碼：
      </td>
      <td class="lightL">
        <asp:TextBox ID="txtAdminPW" runat="server" CssClass="txtBox" MaxLength="20"
          TextMode="Password" Width="150px" autocomplete="on"></asp:TextBox>
        8~20碼
      </td>
    </tr>
    <tr>
      <td class="darkC">
        驗證碼：
      </td>
      <td class="lightL" >
        <asp:TextBox ID="txtVerifyCode" runat="server" CssClass="txtBox" MaxLength="4"
          Width="100px" style="vertical-align: middle;" ></asp:TextBox>
        <img id="imgLoginPic" runat="server" alt="" src="admLoginPic.aspx" style="vertical-align: middle;" />
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="darkC">
        <asp:Button ID="cmdLogin" runat="server" Text="登入" CssClass="cmd" OnClick="cmdLogin_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="cmdReset" runat="server" Text="重設" CssClass="cmd" OnClick="cmdReset_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="cmdHome" runat="server" Text="回首頁" CssClass="cmd" OnClick="cmdHome_Click" />
        <br />
        <b><asp:Label ID="lblMsg" runat="server"  CssClass="msg"></asp:Label></b>
      </td>
    </tr>
  </table>
</asp:Content>
