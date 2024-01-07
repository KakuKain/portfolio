<%@ Page Title="管理者-系統設置" Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admSetup" ValidateRequest="false" Codebehind="admSetup.aspx.cs" %>
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
        系統設置
      </th>
    </tr>
    <tr>
      <td colspan="3" class="dark">
        <div style="text-align:left;">
          <span class="f16B">系統設置：只有系統管理員才有權限可以操作此功能</span><br />
          ※請注意：您的操作可能會引起系統的運作不正常，請小心使用!!
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="3" class="darkL">
        在系統測試完成後，正式上線前，您可能需要清除所有的測試資料：
        <br />1) <asp:LinkButton ID="lcmdCreate" runat="server" 
          OnClick="lcmdCreate_Click" 
          OnClientClick="if (!confirm('你確定要執行【清除資料】嗎？')) return false;"
          CssClass="lnkCmd">清除資料</asp:LinkButton>
        &nbsp; 這會清除指定資料的內容，請小心處理!!
        &nbsp;&nbsp;<asp:Label ID="lblCreate" runat="server" CssClass="msg"></asp:Label>
        <table  cellspacing="0" cellpadding="2" style="border-collapse:collapse; border:0 solid; margin-left:40px;">
        <tr>
          <td style="width:200px; text-align:left;">系統設置</td>
          <td style="width:400px; text-align:left;"></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate11" runat="server" Text="管理者帳號" /></td>
          <td><asp:Label ID="lblCreate11" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        
        <tr>
          <td class="style1"><br />招募系統</td>
          <td class="style1"></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate21" runat="server" Text="職類" /></td>
          <td><asp:Label ID="lblCreate21" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate22" runat="server" Text="發布職缺" /></td>
          <td><asp:Label ID="lblCreate22" runat="server" CssClass="msg" ></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate23" runat="server" Text="應徵者-履歷表" /></td>
          <td><asp:Label ID="lblCreate23" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate24" runat="server" Text="應徵者-應徵職缺" /></td>
          <td><asp:Label ID="lblCreate24" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        
        <tr>
          <td><asp:CheckBox ID="ckCreate26" runat="server" Text="上傳類別檔" /></td>
          <td><asp:Label ID="lblCreate26" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        <tr>
          <td><asp:CheckBox ID="ckCreate27" runat="server" Text="上傳文件檔" /></td>
          <td><asp:Label ID="lblCreate27" runat="server" CssClass="msg"></asp:Label></td>
        </tr>

        <tr>
          <td><asp:CheckBox ID="ckCreate28" runat="server" Text="最新消息" /></td>
          <td><asp:Label ID="lblCreate28" runat="server" CssClass="msg"></asp:Label></td>
        </tr>
        </table>
      </td>
    </tr>

    <tr>
      <td colspan="3" class="darkL">
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td><br />2) 設定 招募人才網站活動結止日期
              <asp:LinkButton ID="lcmdEndDate" runat="server" 
                OnClick="lcmdEndDate_Click" 
                CssClass="lnkCmd">(存檔)：</asp:LinkButton>&nbsp;</td>
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
