<%@ Page Language="C#" MasterPageFile="YPresume.master"
  AutoEventWireup="true" Inherits="SC.YPresume8" ValidateRequest="false" Codebehind="YPresume8.aspx.cs" %>

<%@ MasterType VirtualPath="YPresume.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="YPJS/js/robJsLib.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div id="divbody" runat="server" class="divbody">
    *請上傳您最近一年的照片 (寬232 x 高298，等比例圖片)
    <table class="item" cellpadding="5" cellspacing="0" >
      <tr>
        <td style="width: 150px;">
          <div id="divPic" runat="server" style="border: none 0px #DDDDDD; background-color: #ffffff; width:116px; height:149px;">
            <asp:Image ID="imgPic" runat="server" Visible="False" />
          </div>
        </td>
        <td>
          <asp:FileUpload ID="upLoad" runat="server" Width="300px" Font-Names="Arial" Font-Size="12px" />
          <br /><br />
          <asp:Button ID="cmdUpload" runat="server" Text=" 上傳照片 " Font-Names="Arial" Font-Size="12px"
            CssClass="cmd" OnClick="cmdUpload_Click" />
          <asp:Button ID="cmdChangePic" runat="server" Text=" 更換照片 " Font-Names="Arial" Font-Size="12px"
            CssClass="cmd"  OnClick="cmdChangePic_Click" Visible="False" />
          <br />
          <asp:Label ID="lblMsgPic" runat="server" CssClass="message" EnableViewState="False"></asp:Label>
        </td>
      </tr>
    </table>
    
    <table class="item" cellpadding="5" cellspacing="0" style="margin:0px; width:750px;">
      <tr>
        <td class="statusbar" align="center">
          <br />
          <asp:Label ID="lblMsg" runat="server" CssClass="message" EnableViewState="False"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="statusbar" align="center">
          <asp:Button ID="cmdSave" runat="server" Text=" 存檔 Save " CssClass="cmd" OnClick="cmdSave_Click" Visible="false" />
        </td>
      </tr>
    </table>
    <div id="divDisplay"></div>
    <asp:HiddenField ID="hidYPD00" runat="server" />
    <asp:HiddenField ID="hidYPDateUpdate" runat="server" />
    <asp:HiddenField ID="hidYPNO" runat="server" />
    <asp:HiddenField ID="hidYPPicFile" runat="server" />
  </div>
  <div id="divJS" runat="server" enableviewstate="false"></div>
</asp:Content>
