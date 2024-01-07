<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume4" ValidateRequest="false" Codebehind="YPresume4.aspx.cs" %>
<%@ MasterType VirtualPath="YPresume.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="divbody" id="divbody" runat="server">
    *請填寫專長及證照
    <table class="item" cellpadding="5" cellspacing="0">
      <tr>
        <td>專長、作品(詳述)</td>
        <td>
          <asp:TextBox ID="txtYPZCZP" runat="server" MaxLength="500" Width="400px" />
        </td>
      </tr>
      <tr>
        <td>專業證照</td>
        <td>
          <asp:TextBox ID="txtYPZYZZ" runat="server" MaxLength="500" Width="400px" />
        </td>
      </tr>
      <tr>
        <td>語文證照</td>
        <td>
          <asp:TextBox ID="txtYPYWZZ" runat="server" MaxLength="500" Width="400px" />
        </td>
      </tr>
      <tr>
        <td>研究論文題目</td>
        <td>
          <asp:TextBox ID="txtYPLWTM" runat="server" MaxLength="500" Width="400px" />
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
  </div>

<div id="divJS" runat="server" enableviewstate="false"></div>

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
</script> 
</asp:Content>

