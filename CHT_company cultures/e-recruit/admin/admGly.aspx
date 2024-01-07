<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admGLY" Codebehind="admGLY.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="viewData" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="100%">
        <tr>
          <th colspan="3" class="headC">
            管理員帳號列表
          </th>
        </tr>
        <tr>
          <td colspan="3" class="darkL" style="line-height:24px;">
            <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
              <tr>
                <td style="text-align:right;">資料查詢選項：</td>
                <td style="text-align:left;">
                  每頁顯示筆數<asp:DropDownList ID="dropmyRecsPerPage" runat="server" >
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="40">40</asp:ListItem>
                    <asp:ListItem Value="50">50</asp:ListItem>
                  </asp:DropDownList>&#12288;
                  <asp:Button ID="cmdFind" runat="server" CssClass="cmd" 
                  Text="查詢資料" onclick="cmdFind_Click"/>
                  &#12288;<asp:Button ID="cmdRefresh" runat="server"  CssClass="cmd"
                  Text="刷新" onclick="cmdRefresh_Click"/>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;">篩選條件：</td>
                <td style="text-align:left;">
                  帳號類別<asp:DropDownList ID="dropSelUSERType" runat="server">
                    <asp:ListItem Value="-1">全部</asp:ListItem>
                    <asp:ListItem Value="1">系統管理員</asp:ListItem>
                    <asp:ListItem Value="2">一般管理員</asp:ListItem>
                  </asp:DropDownList>
                  &#12288;&#12288;帳號啟用<asp:DropDownList ID="dropSelUSERAct" runat="server">
                    <asp:ListItem Value="-1">全部</asp:ListItem>
                    <asp:ListItem Value="Y">啟用</asp:ListItem>
                    <asp:ListItem Value="N">停用</asp:ListItem>
                  </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;"></td>
                <td style="text-align:left;">
                  <asp:CheckBox ID="ckSelSearch" runat="server" Text="查詢詞(ID,姓名)" />
                  <asp:TextBox ID="txtSelSearch" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;">排序方式：</td>
                <td style="text-align:left;">
                  <asp:DropDownList ID="dropSelOrder" runat="server">
                    <asp:ListItem Value="1">帳號</asp:ListItem>
                    <asp:ListItem Value="2">姓名</asp:ListItem>
                    <asp:ListItem Value="3">建檔日期</asp:ListItem>
                    <asp:ListItem Value="4">登入日期</asp:ListItem>
                  </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td colspan="2" style="text-align:left;">
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
            <table id="itemTable" class="item" cellspacing="0" runat="server" style="width:100%;">
              <tr>
                <%-- <td class="title" style="width: 40px">序號</td> --%>
                <td class="title" style="width: 120px">帳號ID</td>
                <td class="title" >姓名</td>
                <td class="title" style="width: 80px">類別</td>
                <td class="title" style="width: 40px">啟用</td>
                <td class="title" style="width: 80px">最後登入</td>
                <td class="title" style="width: 80px">最後異動</td>
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
      <table class="tbMain" align="center" cellspacing="1" width="800px" >
          <tr>
            <th colspan="2" class="headC">管理員帳號</th>
          </tr>
          <tr>
            <td class="darkC" width="200px">帳號ID</td>
            <td class="lightL" width="600px">
              <asp:TextBox ID="txtUSERID" runat="server" MaxLength="20" Width="150px" >1234567890</asp:TextBox>
              <asp:HiddenField ID="hidUSERD00" runat="server" />
            </td>
          </tr>
          <tr id="trSetUSERPW" runat="server">
            <td class="darkC">重設密碼</td>
            <td class="lightL">
              <asp:CheckBox ID="ckUSERPW" runat="server" />
            </td>
          </tr>
          <tr>
            <td class="darkC">帳號密碼</td>
            <td class="lightL">
              <asp:TextBox ID="txtUSERPW" runat="server" MaxLength="20" Width="150px" TextMode="Password"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">確認密碼</td>
            <td class="lightL">
              <asp:TextBox ID="txtUSERPW1" runat="server" MaxLength="20" Width="150px" TextMode="Password"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">姓名</td>
            <td class="lightL">
              <asp:TextBox ID="txtUSERNAME" runat="server" MaxLength="20" Width="150px">12345678901234567890</asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">管理員類別</td>
            <td class="lightL">
              <input type="radio" name="rdUSERTYPE" id="rdUSERTYPE1" runat="server" /><label 
              for="ContentPlaceHolder1_rdUSERTYPE1">系統管理者</label>
              &#12288;<input type="radio" name="rdUSERTYPE" id="rdUSERTYPE2" runat="server" />
              <label for="ContentPlaceHolder1_rdUSERTYPE2">一般管理員</label>
            </td>
          </tr>
          <tr>
            <td class="darkC">啟用設定</td>
            <td class="lightL">
              <asp:RadioButtonList ID="rdUSERACT" runat="server" RepeatDirection="Horizontal"
                AppendDataBoundItems="True">
                <asp:ListItem Value="Y" Text="啟用"></asp:ListItem>
                <asp:ListItem Value="N" Text="禁止"></asp:ListItem>
              </asp:RadioButtonList>
            </td>
          </tr>
          <tr  id="trDATECREATE" runat="server">
            <td class="darkC">建檔日期</td>
            <td class="lightL" id="tdDATECREATE" runat="server"></td>
          </tr>
          <tr id="trDATEUPDATE" runat="server">
            <td class="darkC">最後異動</td>
            <td class="lightL" id="tdDATEUPDATE" runat="server"></td>
          </tr>
          <tr id="trDATELASTLOG" runat="server">
            <td class="darkC">最後登入</td>
            <td class="lightL" id="tdDATELASTLOG" runat="server"></td>
          </tr>
          
          <tr>
            <td colspan="2" class="lightC">
              &nbsp;<asp:Label ID="lblEditMsg" runat="server" Text="" CssClass="msg"></asp:Label>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="2" class="darkC">
              <asp:Button ID="cmdEdit" runat="server" CssClass="cmd"
               Text=" 新增 " onclick="cmdEdit_Click" 
               OnClientClick=" if(!check_before_save()){ return false;}"/>
               &nbsp;&nbsp;
              <asp:Button ID="cmdCancel" runat="server" CssClass="cmd"
              Text=" 取消 " onclick="cmdCancel_Click" EnableViewState="False" />
            </td>
          </tr>
        </table>
        <script type="text/javascript" src="js/admGLY.js"></script>
    </asp:View>
  </asp:MultiView>
</asp:Content>
