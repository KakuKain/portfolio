<%@ Page Title="�޲z��-�t�γ]�m" Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admSetup" ValidateRequest="false" Codebehind="admSetup.aspx.cs" %>
<%@ MasterType VirtualPath="admPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <style type="text/css">
  .style1
  {
    height: 28px;
  }
  </style>
  <link href="css/robCalendarV200.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <table class="tbMain" align="center" cellspacing="1" width="100%">
    <tr>
      <th colspan="3" class="headC">
        �t�γ]�m
      </th>
    </tr>
    <tr>
      <td colspan="3" class="dark">
        <div style="text-align:left;">
          <span class="f16B">�t�γ]�m�G�u���t�κ޲z���~���v���i�H�ާ@���\��</span><br />
          ���Ъ`�N�G�z���ާ@�i��|�ް_�t�Ϊ��B�@�����`�A�Фp�ߨϥ�!!
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="3" class="darkL">
        �b�t�δ��է�����A�����W�u�e�A�z�i��ݭn�M���Ҧ������ո�ơG
        <br />1) <asp:LinkButton ID="lcmdCreate" runat="server" 
          OnClick="lcmdCreate_Click" 
          OnClientClick="if (!confirm('�A�T�w�n����i�M����ơj�ܡH')) return false;"
          CssClass="lnkCmd">�M�����</asp:LinkButton>
        &nbsp; �o�|�M�����w��ƪ����e�A�Фp�߳B�z!!
        &nbsp;&nbsp;<asp:Label ID="lblCreate" runat="server" CssClass="msg"></asp:Label>
        <table  cellspacing="0" cellpadding="2" style="border-collapse:collapse; border:0 solid; margin-left:40px;">
        <tr>
          <td style="width:200px; text-align:left;">�t�γ]�m</td>
          <td style="width:400px; text-align:left;"></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate11" runat="server" Text="�޲z�̱b��" /></td>
          <td><asp:Label ID="lblCreate11" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        
        <tr>
          <td class="style1"><br />�۶Ҩt��</td>
          <td class="style1"></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate21" runat="server" Text="¾��" /></td>
          <td><asp:Label ID="lblCreate21" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate22" runat="server" Text="�o��¾��" /></td>
          <td><asp:Label ID="lblCreate22" runat="server" CssClass="msg" ></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate23" runat="server" Text="���x��-�i����" /></td>
          <td><asp:Label ID="lblCreate23" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate24" runat="server" Text="���x��-���x¾��" /></td>
          <td><asp:Label ID="lblCreate24" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        
        <tr>
          <td><asp:CheckBox ID="ckCreate26" runat="server" Text="�W�����O��" /></td>
          <td><asp:Label ID="lblCreate26" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate27" runat="server" Text="�W�Ǥ����" /></td>
          <td><asp:Label ID="lblCreate27" runat="server" CssClass="msg"></asp:Label></td>
        </tr>

        <tr>
          <td><asp:CheckBox ID="ckCreate28" runat="server" Text="�̷s����" /></td>
          <td><asp:Label ID="lblCreate28" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        </table>
      </td>
    </tr>

    <tr>
      <td colspan="3" class="darkL">
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td><br />2) �]�w �۶ҤH�~�������ʵ�����
              <asp:LinkButton ID="lcmdEndDate" runat="server" 
                OnClick="lcmdEndDate_Click" 
                CssClass="lnkCmd">(�s��)�G</asp:LinkButton>&nbsp;</td>
            <td>
              <asp:TextBox ID="txtEndDate" runat="server" MaxLength="10" Width="70px" 
                onclick="robCalendar_setDate(this);"></asp:TextBox>
            </td>
            <td width="350">
              <asp:Label ID="lblEndDate" runat="server" CssClass="msg"></asp:Label>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    
    <tr>
      <td class="light" colspan="3">
        &nbsp;<asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
      </td>
    </tr>
  </table>
  <!-- #include file="css/robCalendarV200.htm" -->
</asp:Content>
