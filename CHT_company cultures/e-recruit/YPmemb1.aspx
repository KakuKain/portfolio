<%@ Page Language="C#" MasterPageFile="YPmemb.master" AutoEventWireup="true" Inherits="SC.YPmemb1" Codebehind="YPmemb1.aspx.cs" %>
<%@ MasterType VirtualPath="YPmemb.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="divbody">
  <table class="outer" cellpadding="0" cellspacing="0"  style="margin-left:10px;">
  <tr><td>*�w��z�[�J���عq�H�H�~�۶Һ��A�z�ثe�����x���A�O�G </td></tr>
  <tr><td>  
    <table id="itemTable" class="item1" cellpadding="5" cellspacing="0" >
      <tr>
        <td class="title" width="150">�i�����g���p</td>
        <td class="center" width="200" id="td1" runat="server"></td>
      </tr>
      <tr>
        <td class="title">�ثe�i���x¾��</td>
        <td class="center" id="td2" runat="server"></td>
      </tr>
      <tr>
        <td class="title">�ثe����w���x¾��</td>
        <td class="center" id="td3" runat="server"></td>
      </tr>
      <tr>
        <td class="title">���x���G</td>
        <td class="center" id="td4" runat="server"></td>
      </tr>
  </table>
  </td></tr>
  
  <tr><td><br /></td></tr>
  <tr id="trYUListTitle" runat="server" visible="false"><td>*�w�W�Ǥ��G </td></tr>
  <tr><td>
  <table id="tbYUList" class="item1" cellpadding="5" cellspacing="0" runat="server" visible="false" >
  <%--
  <tr>
    <td class="center" width="100">2011/11/5</td>
    <td style="text-align:left;" width="450">�@�~�G��</td>
    <td class="center" width="50">�R��</td>
  </tr>
  --%>
  </table>
  <br />
  <table class="item1" cellpadding="5" cellspacing="0">
    <tr><td colspan="2" class="title">�W���ɮ�<%-- �G���Z��/�@�~/�ҷ�/��L --%></td></tr>
    <tr>
      <td style="width:100px;">�W�����O</td>
      <td style="width:507px; text-align:left;"><asp:DropDownList ID="dropYU2NO" runat="server"></asp:DropDownList></td>
    </tr>
    <tr>
      <td>���e����</td>
      <td style="text-align:left;"><asp:TextBox ID="txtYUBT" runat="server" 
          MaxLength="50" Width="400px"></asp:TextBox> (50�r��)</td>
    </tr>
    <tr>
      <td>���&amp;�W���ɮ�</td>
      <td style="text-align:left;"><asp:FileUpload 
        ID="upLoad" runat="server" 
        Width="400px" Font-Names="Arial" Font-Size="12px" CssClass="cmd" />
        <asp:Button ID="cmdUpload" runat="server" Text=" �W���ɮ� " 
          Font-Names="Arial" Font-Size="12px"
          CssClass="cmd" OnClick="cmdUpload_Click" /></td>
    </tr>
  </table>
  <br />
  </td></tr>

  <tr><td class="statusbar" align="center">
    <asp:Label ID="lblMsg" runat="server" CssClass="message" EnableViewState="False"></asp:Label>
  </td></tr>
  </table>
</div>
</asp:Content>

