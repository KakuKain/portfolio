<%@ Page Language="C#" MasterPageFile="YPmemb.master" AutoEventWireup="true" Inherits="SC.YPmemb1" Codebehind="YPmemb1.aspx.cs" %>
<%@ MasterType VirtualPath="YPmemb.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="YPJS/css/YPresume1.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="divbody">
  <table class="outer" cellpadding="0" cellspacing="0"  style="margin-left:10px;">
  <tr><td>*歡迎您加入中華電信人才招募網，您目前的應徵狀態是： </td></tr>
  <tr><td>  
    <table id="itemTable" class="item1" cellpadding="5" cellspacing="0" >
      <tr>
        <td class="title" width="150">履歷表填寫狀況</td>
        <td class="center" width="200" id="td1" runat="server"></td>
      </tr>
      <tr>
        <td class="title">目前可應徵職缺</td>
        <td class="center" id="td2" runat="server"></td>
      </tr>
      <tr>
        <td class="title">目前為止已應徵職缺</td>
        <td class="center" id="td3" runat="server"></td>
      </tr>
      <tr>
        <td class="title">應徵結果</td>
        <td class="center" id="td4" runat="server"></td>
      </tr>
  </table>
  </td></tr>
  
  <tr><td><br /></td></tr>
  <tr id="trYUListTitle" runat="server" visible="false"><td>*已上傳文件： </td></tr>
  <tr><td>
  <table id="tbYUList" class="item1" cellpadding="5" cellspacing="0" runat="server" visible="false" >
  <%--
  <tr>
    <td class="center" width="100">2011/11/5</td>
    <td style="text-align:left;" width="450">作品：基本</td>
    <td class="center" width="50">刪除</td>
  </tr>
  --%>
  </table>
  <br />
  <table class="item1" cellpadding="5" cellspacing="0">
    <tr><td colspan="2" class="title">上傳檔案<%-- ：成績單/作品/證照/其他 --%></td></tr>
    <tr>
      <td style="width:100px;">上傳類別</td>
      <td style="width:507px; text-align:left;"><asp:DropDownList ID="dropYU2NO" runat="server"></asp:DropDownList></td>
    </tr>
    <tr>
      <td>內容說明</td>
      <td style="text-align:left;"><asp:TextBox ID="txtYUBT" runat="server" 
          MaxLength="50" Width="400px"></asp:TextBox> (50字內)</td>
    </tr>
    <tr>
      <td>選取&amp;上傳檔案</td>
      <td style="text-align:left;"><asp:FileUpload 
        ID="upLoad" runat="server" 
        Width="400px" Font-Names="Arial" Font-Size="12px" CssClass="cmd" />
        <asp:Button ID="cmdUpload" runat="server" Text=" 上傳檔案 " 
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

