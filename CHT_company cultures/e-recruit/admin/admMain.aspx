<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admMain" Codebehind="admMain.aspx.cs" %>
<%@ MasterType VirtualPath="admPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
<!-- 原寬 840 -->  
<table align="center" cellspacing="1" class="tbMain" width="800px" id="tbMain" runat="server">
  <tr>
    <th class="headC" >系統狀態報告</th>
  </tr>
    
  <tr>
    <td align="center" class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">
    
    <tr>
      <td class="darkC" colspan="3">職類</td>
      <td class="darkC" colspan="3">職缺</td>
      <td class="darkC" colspan="3">發布</td>
      <td class="darkC" colspan="3">考試</td>
      
    </tr>
    <tr>
      <td class="darkC">總數</td>
      <td class="darkC">啟用</td>
      <td class="darkC">禁止</td>

      <td class="darkC">總數</td>
      <td class="darkC">啟用</td>
      <td class="darkC">禁止</td>

      <td class="darkC">發布過期</td>
      <td class="darkC">發布中</td>
      <td class="darkC">尚未發布</td>

      <td class="darkC">已考試</td>
      <td class="darkC">今日考試</td>
      <td class="darkC">尚未考試</td>

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
    <%-- 會員統計 --%>
    <td class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">

    <tr>
      <td class="darkC" colspan="2">本月報名者</td>
      <td class="darkC" colspan="6">應徵者統計</td>
      <td class="darkC" colspan="3">上傳文件類別</td>
    </tr>
    <tr>
      <td class="darkC">本月註冊</td>
      <td class="darkC">本月提交</td>
      
      <td class="darkC">總數</td>
      <td class="darkC">編寫中</td>
      <td class="darkC">已提交</td>
      <td class="darkC">黑名單</td>
      <td class="darkC">已報到</td>
      <td class="darkC">上傳文件</td>

      <td class="darkC">總數</td>
      <td class="darkC">啟用</td>
      <td class="darkC">禁止</td>
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
    <%-- 管理員 LA --%>
    <td class="darkC" style="padding:0; margin:0;">
    <table align="center" cellspacing="1" class="tbMain" width="100%">
    <tr>
      <td class="darkC" colspan="3">系統管理者統計</td>
      <td class="darkC" colspan="3">一般管理員統計</td>
    </tr>
    <tr>
      <td class="darkC">總數</td>
      <td class="darkC">啟用</td>
      <td class="darkC">禁用</td>
      <td class="darkC">總數</td>
      <td class="darkC">啟用</td>
      <td class="darkC">禁用</td>
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
