<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admMain" Codebehind="admMain.aspx.cs" %>
<%@ MasterType VirtualPath="admPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
<!-- ��e 840 -->  
<table align="center" cellspacing="1" class="tbMain" width="800px" id="tbMain" runat="server">
  <tr>
    <th class="headC" >�t�Ϊ��A���i</th>
  </tr>
    
  <tr>
    <td align="center" class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">
    
    <tr>
      <td class="darkC" colspan="3">¾��</td>
      <td class="darkC" colspan="3">¾��</td>
      <td class="darkC" colspan="3">�o��</td>
      <td class="darkC" colspan="3">�Ҹ�</td>
      
    </tr>
    <tr>
      <td class="darkC">�`��</td>
      <td class="darkC">�ҥ�</td>
      <td class="darkC">�T��</td>

      <td class="darkC">�`��</td>
      <td class="darkC">�ҥ�</td>
      <td class="darkC">�T��</td>

      <td class="darkC">�o���L��</td>
      <td class="darkC">�o����</td>
      <td class="darkC">�|���o��</td>

      <td class="darkC">�w�Ҹ�</td>
      <td class="darkC">����Ҹ�</td>
      <td class="darkC">�|���Ҹ�</td>

    </tr>
    <tr>
      <td class="light"><asp:Label ID="L1_1" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_2" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_3" runat="server" Text="&nbsp;"></asp:Label></td>

      <td class="light"><asp:Label ID="L1_4" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_5" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_6" runat="server" Text="&nbsp;"></asp:Label></td>

      <td class="light"><asp:Label ID="L1_7" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_8" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_9" runat="server" Text="&nbsp;"></asp:Label></td>

      <td class="light"><asp:Label ID="L1_10" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_11" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L1_12" runat="server" Text="&nbsp;"></asp:Label></td>
    </tr>
    
    </table>
    </td>
  </tr>
  
  <tr>
    <%-- �|���έp --%>
    <td class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">

    <tr>
      <td class="darkC" colspan="2">������W��</td>
      <td class="darkC" colspan="6">���x�̲έp</td>
      <td class="darkC" colspan="3">�W�Ǥ�����O</td>
    </tr>
    <tr>
      <td class="darkC">������U</td>
      <td class="darkC">���봣��</td>
      
      <td class="darkC">�`��</td>
      <td class="darkC">�s�g��</td>
      <td class="darkC">�w����</td>
      <td class="darkC">�¦W��</td>
      <td class="darkC">�w����</td>
      <td class="darkC">�W�Ǥ��</td>

      <td class="darkC">�`��</td>
      <td class="darkC">�ҥ�</td>
      <td class="darkC">�T��</td>
    </tr>
    <tr>
      <td class="light"><asp:Label ID="L2_1" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_2" runat="server" Text="&nbsp;"></asp:Label></td>

      <td class="light"><asp:Label ID="L2_3" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_4" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_5" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_6" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_7" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_8" runat="server" Text="&nbsp;"></asp:Label></td>

      <td class="light"><asp:Label ID="L2_9" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_10" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="L2_11" runat="server" Text="&nbsp;"></asp:Label></td>
    </tr>

    </table>
    </td>
  </tr>
  
  <tr>
    <%-- �޲z�� LA --%>
    <td class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">
    <tr>
      <td class="darkC" colspan="3">�t�κ޲z�̲έp</td>
      <td class="darkC" colspan="3">�@��޲z���έp</td>
    </tr>
    <tr>
      <td class="darkC">�`��</td>
      <td class="darkC">�ҥ�</td>
      <td class="darkC">�T��</td>
      <td class="darkC">�`��</td>
      <td class="darkC">�ҥ�</td>
      <td class="darkC">�T��</td>
    </tr>
    <tr>
      <td class="light"><asp:Label ID="LA_1" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="LA_2" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="LA_3" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="LA_4" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="LA_5" runat="server" Text="&nbsp;"></asp:Label></td>
      <td class="light"><asp:Label ID="LA_6" runat="server" Text="&nbsp;"></asp:Label></td>
    </tr>
    </table>
    </td>
  </tr>
  
  <tr>
    <td class="darkC">
      <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
    </td>
  </tr>
</table>
</asp:Content>
