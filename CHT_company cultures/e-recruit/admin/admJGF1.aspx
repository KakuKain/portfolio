<%@ Page Title="機構" Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admJGF1" Codebehind="admJGF1.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:MultiView ID="MultiView1" runat="server">
  <asp:View ID="viewData" runat="server">
    <table class="tbMain" align="center" cellspacing="1" width="100%">
      <tr>
        <th colspan="3" class="headC">
          機構 列表
        </th>
      </tr>
      <tr>
        <td colspan="3" class="darkL" style="line-height:24px;">
          <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
            <tr>
              <td style="text-align:right;">資料查詢選項：</td>
              <td style="text-align: left;">
                每頁顯示筆數<asp:DropDownList ID="dropmyRecsPerPage" runat="server" >
                  <asp:ListItem Value="10">10</asp:ListItem>
                  <asp:ListItem Value="20">20</asp:ListItem>
                  <asp:ListItem Value="30">30</asp:ListItem>
                  <asp:ListItem Value="40">40</asp:ListItem>
                  <asp:ListItem Value="50">50</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp;
                <asp:Button ID="cmdFind" runat="server" CssClass="cmd" 
                Text="查詢資料" onclick="cmdFind_Click"/>
                &nbsp;&nbsp;<asp:Button ID="cmdRefresh" runat="server"  CssClass="cmd"
                Text="刷新" onclick="cmdRefresh_Click"/>
              </td>
            </tr>
            <tr>
              <td style="text-align: right;">篩選條件：</td>
              <td style="text-align: left;">
                啟用<asp:DropDownList ID="dropSelJGAct" runat="server">
                  <asp:ListItem Value="-1">全部</asp:ListItem>
                  <asp:ListItem Value="Y">啟用</asp:ListItem>
                  <asp:ListItem Value="N">停用</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:CheckBox ID="ckSelSearch" runat="server" Text="查詢名稱" />
                <asp:TextBox ID="txtSelSearch" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td style="text-align: right;">
                排序方式：
              </td>
              <td style="text-align: left;">
                <asp:DropDownList ID="dropSelOrder" runat="server">
                  <asp:ListItem Value="1">機構編號</asp:ListItem>
                  <asp:ListItem Value="2">機構名稱</asp:ListItem>
                  <asp:ListItem Value="3">建檔日期</asp:ListItem>
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:LinkButton ID="lcmdAdd" runat="server" CssClass="tableOpCommand" EnableViewState="False"
                  OnClick="lcmdAdd_Click">[新增]</asp:LinkButton>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="3" align="center" class="light">
          <!-- ***** 列出資料 ***** -->
          <table id="itemTable" class="item" cellspacing="0" runat="server" style="width:840px;">
            <tr>
              <td class="title" style="width: 40px">序號</td>
              <td class="title" style="width: 80px">機構編號</td>
              <td class="title">機構名稱</td>
              <td class="title" style="width: 40px">職缺</td>
              <td class="title" style="width: 40px">啟用</td>
              <td class="title" style="width: 100px">操作</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="3" align="center" class="light" id="itemTablePager" runat="server"></td>
      </tr>
      <tr>
        <td colspan="3" class="darkC">
          <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
        </td>
      </tr>
      <tr runat="server" visible="false">
        <td class="darkC">&nbsp;</td>
        <td class="darkC">&nbsp;</td>
        <td class="darkC">&nbsp;</td>
      </tr>
    </table>
  </asp:View>
  <asp:View ID="viewEdit" runat="server">
    <table class="tbMain" align="center" cellspacing="1" width="700px" >
        <tr>
          <th colspan="2" class="headC">機構</th>
        </tr>
        <tr>
          <td class="darkC" width="200px">機構編號</td>
          <td class="lightL" width="500px">
            <asp:TextBox ID="txtJGNO" runat="server" MaxLength="10" Width="150px" ></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="darkC">機構名稱</td>
          <td class="lightL">
            <asp:TextBox ID="txtJGN" runat="server" MaxLength="50" Width="450px"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="darkC">啟用設定</td>
          <td class="lightL">
            <asp:RadioButtonList ID="rdJGACT" runat="server" RepeatDirection="Horizontal"
              AppendDataBoundItems="True">
              <asp:ListItem Value="Y" Text="啟用"></asp:ListItem>
              <asp:ListItem Value="N" Text="禁止"></asp:ListItem>
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr  id="trDATECREATE" runat="server">
          <td class="darkC">建檔日期</td>
          <td class="lightL" id="tdDATECREATE" runat="server">
            <asp:Label ID="lblDateCreate" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr id="trDATEUPDATE" runat="server">
          <td class="darkC">最後異動</td>
          <td class="lightL" id="tdDATEUPDATE" runat="server">
            <asp:Label ID="lblDateUpdate" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="lightC">
            &nbsp;<asp:Label ID="lblEditMsg" runat="server" Text="" CssClass="msg"></asp:Label>&nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="2" class="darkC">
            <asp:Button ID="cmdEdit" runat="server" CssClass="cmd"
             Text=" 新增 " onclick="cmdEdit_Click" />
             &nbsp;&nbsp;
            <asp:Button ID="cmdCancel" runat="server" CssClass="cmd"
            Text=" 取消 " onclick="cmdCancel_Click" EnableViewState="False" />
          </td>
        </tr>
      </table>
  </asp:View>
</asp:MultiView>
</asp:Content>
