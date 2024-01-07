<%@ Page Language="C#" MasterPageFile="YPresume.master" AutoEventWireup="true" 
Inherits="SC.YPresume9" ValidateRequest="false" Codebehind="YPresume9.aspx.cs" %>

<%@ MasterType VirtualPath="YPresume.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="YPJS/js/robJsLib.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div id="divbody" runat="server" class="divbody">
    *檢核履歷表資料
    <table id="tbLog" runat="server" 
      class="item" cellpadding="5" cellspacing="0">
      <tr><td class="left"></td></tr>
      <tr><td class="left"></td></tr>
    </table>
    
    <br />
    <table class="outer" cellpadding="0" cellspacing="0">
      <tr><td>*提交履歷表的注意事項</td></tr>
      <tr>
        <td>
          <table class="item" cellpadding="5" cellspacing="0" >
            <tr>
              <td class="left">
                <div class="divEnglish" id="divZYSX" runat="server" enableviewstate="false">
                  本人確認上述資料均據實填寫，並允許查核表內所填之各項資料，如因虛報情事造成公司在錄用上之判斷，日後願無條件接受免職處分。
                  <br />
                  <span class="english">I declare that the statements made above are true, and authorize
                    HTC to verify then. Where any statements are false made, I agree without protest
                    to the termination of the contract.</span>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <tr><td id="tdNotice" runat="server" style="font-size: 14px; color: #660066; font-weight: bold;">
      </td></tr>

      <tr>
        <td class="statusbar" align="center">
          <br />
          <asp:Label ID="lblMsg" runat="server" Text="" CssClass="message"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="statusbar" align="center">
          <asp:Button ID="cmdSave" runat="server" Text=" 我同意並遵守公司規定，填交個人履歷表。  I agree the rules to submit. "
            CssClass="cmd" OnClick="cmdSave_Click" />
          <asp:Button ID="cmdRead" runat="server" Text=" 我要修改個人履歷表 " 
            CssClass="cmd" OnClick="cmdRead_Click" />
        </td>
      </tr>
    </table>
    <asp:HiddenField ID="hidYPD00" runat="server" />
    <asp:HiddenField ID="hidYPDateUpdate" runat="server" />
    <asp:HiddenField ID="hidTJD00" runat="server" />
    <asp:HiddenField ID="hidTJDateUpdate" runat="server" />
  </div>
  <div id="divJS" runat="server" enableviewstate="false"></div>
</asp:Content>
