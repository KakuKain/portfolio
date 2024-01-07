<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume7" ValidateRequest="false" Codebehind="YPresume7.aspx.cs" %>
<%@ MasterType VirtualPath="YPresume.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="YPJS/js/robJsLib.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div id="divbody" runat="server" class="divbody">
    <table class="outer" cellpadding="0" cellspacing="0" >
    <tr><td>*請填寫自傳</td></tr>
    <tr>
      <td>
        <asp:TextBox ID="txtYPZZ" runat="server" Width="700px" TextMode="MultiLine" 
          Rows="25"/>
      </td>
    </tr>
    </table>
    
    <table class="item" cellpadding="5" cellspacing="0" style="margin:0px; width:750px;">
      <tr>
        <td colspan="6" class="statusbar" align="center">
          <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>
        </td>
      </tr>
      <tr>
        <td colspan="6" class="statusbar" align="center">
          <asp:Button ID="cmdSave" runat="server" 
            Text=" 存檔 Save " CssClass="cmd" 
            OnClick="cmdSave_Click" />
        </td>
      </tr>
    </table>
    <div id="divDisplay"></div>
    <asp:HiddenField ID="hidYPD00" runat="server" />
    <asp:HiddenField ID="hidYPDateUpdate" runat="server" />
</div>
  <div id="divJS" runat="server" enableviewstate="false"></div>
</asp:Content>

