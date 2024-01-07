<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true"  ValidateRequest="false" 
Inherits="SC.admSetupYPpic" Codebehind="admSetupYPpic.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="viewData" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="100%">
        <tr><th class="headC" colspan="3">發佈 首頁圖片</th></tr>
        <tr>
          <td class="dark" colspan="3" style="line-height: 24px; text-align: left;">
            連結網址設定：空白-留在本頁, http...-開新視窗, (非http)...以本頁開啟
          </td>
        </tr>
        <tr>
          <td align="center" class="light" colspan="3">
            <%-- ***** 列出資料 ***** --%>
            <table class="item" id="Table2" cellpadding="0" cellspacing="0" 
              style="margin-left:auto; margin-right:auto; width:820px;">
              <tr>
                <td class="dark" >首頁 Banner：在前台首頁的上端顯示的大Banner。
                  <br />(最大)寬980 x (鎖定)高100 會自動置中。
                  <br />下欄中顯示時受限於寬度，會縮減最大寬度為700，高度做比例縮減。點擊後開視窗顯示原圖大小。</td>
              </tr>
              <tr>
                <td>
                  <img id="imgYPBanner" runat="server" alt="Banner" src="" visible="false" />
                </td>
              </tr>
              <tr>
                <td class="lightL">
                  上傳原圖：<asp:TextBox ID="txtBanner" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  &nbsp;&nbsp;
                  顯示圖檔：<asp:TextBox ID="txtBannerA" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  <asp:TextBox ID="txtBannerB" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="1px" Visible="false" ></asp:TextBox>
                  &nbsp;&nbsp;
                  連結設定：<asp:TextBox ID="txtBannerLink" runat="server" Width="300px"  ></asp:TextBox>
                  <br />
                  上傳圖片：<asp:FileUpload ID="fuBanner" runat="server" CssClass="cmd" Width="300px"/>
                </td>
              </tr>
            </table>
            
            <br />
            <table class="item" id="Table1" cellpadding="0" cellspacing="0" 
              style="margin-left:auto; margin-right:auto; width:820px;">
              <tr>
                <td class="dark" >頁面中左上方 CIS-Logo：在前台履歷表中左上方的企業形象Logo。
                  <br />(最大)寬200 x (鎖定)高50 會靠左。
                  <br />下欄中顯示原圖大小。</td>
              </tr>
              <tr>
                <td>
                  <img id="imgCISLogo" runat="server" alt="CIS_Logo" src=""  visible="false"/>
                </td>
              </tr>
              <tr>
                <td class="lightL">
                  上傳原圖：<asp:TextBox ID="txtCISLogo" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  &nbsp;&nbsp;
                  顯示圖檔：<asp:TextBox ID="txtCISLogoA" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  <asp:TextBox ID="txtCISLogoB" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="1px" Visible="false" ></asp:TextBox>
                  &nbsp;&nbsp;
                  連結設定：<asp:TextBox ID="txtCISLogoLink" runat="server" Width="300px"  ></asp:TextBox>
                  <br />
                  上傳圖片：<asp:FileUpload ID="fuCISLogo" runat="server" CssClass="cmd" Width="300px"/>
                </td>
              </tr>
            </table>
            
            <br />
            <table class="item" id="Table3" cellpadding="0" cellspacing="0" 
              style="margin-left:auto; margin-right:auto; width:820px;">
              <tr>
                <td class="dark" >招聘網站中的熱門職缺圖片 FBHOT：在前台職缺列表及後台職缺管理中顯示。
                  <br />(最大)寬70 x (最大)高14 。
                  <br />下欄中顯示原圖大小。</td>
              </tr>
              <tr>
                <td>
                  <img id="imgFBHOT" runat="server" alt="熱門職缺" src="" visible="false" />
                </td>
              </tr>
              <tr>
                <td class="lightL">
                  上傳原圖：<asp:TextBox ID="txtFBHOT" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  &nbsp;&nbsp;
                  顯示圖檔：<asp:TextBox ID="txtFBHOTA" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="120px" ></asp:TextBox>
                  <asp:TextBox ID="txtFBHOTB" runat="server" ReadOnly="true" 
                    CssClass="readOnly" Width="1px" Visible="false" ></asp:TextBox>
                  &nbsp;&nbsp;
                  連結設定：<asp:TextBox ID="txtFBHOTLink" runat="server" Width="300px"  ></asp:TextBox>
                  <br />
                  上傳圖片：<asp:FileUpload ID="fuFBHOT" runat="server" CssClass="cmd" Width="300px"/>
                </td>
              </tr>
            </table>
            <br />
          </td>
        </tr>
        <tr>
          <td id="itemTablePager" runat="server" class="lightC" colspan="3">
          </td>
        </tr>
        <tr>
          <td class="darkC" colspan="3">
            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
          </td>
        </tr>
        <tr>
          <td colspan="3" class="darkC">
              <asp:Button ID="cmdSave" runat="server" CssClass="cmd"
               Text=" 上傳圖片 / 存檔 " onclick="cmdSave_Click" Visible="true"/>
            </td>
          </tr>
        <tr runat="server" visible="false">
          <td class="dark">
            &nbsp;
          </td>
          <td class="dark">
            &nbsp;
          </td>
          <td class="dark">
            &nbsp;
          </td>
        </tr>
      </table>

      <script type="text/javascript" src="js/admACT.js"></script>

    </asp:View>
    <asp:View ID="viewEdit" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="840px" >
          <tr>
            <td colspan="2" class="darkC">
              <asp:Button ID="cmdEdit" runat="server" CssClass="cmd"
               Text=" 存檔 " Visible="true"/>
               &nbsp;&nbsp;
              <asp:Button ID="cmdCancel" runat="server" CssClass="cmd"
                Text=" 回列表 " EnableViewState="False" />
            </td>
          </tr>
        </table>
    </asp:View>
  </asp:MultiView>
</asp:Content>
