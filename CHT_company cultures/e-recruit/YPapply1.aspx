<%@ Page Language="C#" MasterPageFile="YPapply.master" AutoEventWireup="true" 
Inherits="SC.YPapply1" ValidateRequest="false" Codebehind="YPapply1.aspx.cs" %>
<%@ MasterType VirtualPath="YPapply.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="divbody" runat="server" class="divbody">
  請選擇職類：<asp:DropDownList ID="dropSelZLD00" Width="150" runat="server" AutoPostBack="true"></asp:DropDownList>
  <table id="itemTable" class="item" cellpadding="5" cellspacing="0" runat="server" style="border-collapse: collapse;">
    <tr>
      <td class="title" width="100">職缺編號</td>
      <td class="title" width="350">職缺項目</td>
      <td class="title" width="210">機構</td>
      <td class="title" width="60">職務內容</td>
      <td class="title" width="60">操作</td>
    </tr>
  </table>
  <asp:Label ID="lblMsg" CssClass="msg" runat="server" />
  <asp:HiddenField ID="hidYPD00" runat="server" />
  <asp:HiddenField ID="hidYPDateUpdate" runat="server" />
</div>
<div id="divJS" runat="server" enableviewstate="false"></div>
</asp:Content>

