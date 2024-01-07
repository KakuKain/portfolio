<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true"
 ValidateRequest="false" Inherits="SC.admPXF1" Codebehind="admPXF1.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
  <link href="css/robCalendarV200.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="viewData" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="100%">
        <tr>
          <th colspan="3" class="headC">
            最新消息列表
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
                  發佈<asp:DropDownList ID="dropSelPXAct" runat="server">
                    <asp:ListItem Value="-1">全部</asp:ListItem>
                    <asp:ListItem Value="Y">發佈</asp:ListItem>
                    <asp:ListItem Value="N">停用</asp:ListItem>
                  </asp:DropDownList>
                  &#12288;&#12288;
                  <asp:CheckBox ID="ckSelPXSearch" runat="server" Text="查詢詞(標題)" />
                  <asp:TextBox ID="txtSelPXSearch" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
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
            <table id="itemTable" class="item" cellspacing="0" runat="server" enableviewstate="false" width="100%">
              <tr>
                <td class="title" style="width: 80px">排序碼</td>
                <td class="title" style="width: 80px">發佈日期</td>
                <td class="title">標題</td>
                <td class="title" style="width: 40px">啟用</td>
                <td class="title" style="width: 120px">操作</td>
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
      <table class="tbMain" align="center" cellspacing="1" width="100%" >
          <tr>
            <th colspan="2" class="headC">最新消息</th>
          </tr>
          <tr>
            <td class="darkC" width="100px">排序碼</td>
            <td class="lightL" width="750px">
              <asp:TextBox ID="txtPXNO" runat="server" MaxLength="10" Width="150px" />
              <br />※排序方式：排序碼(依大到小排序) 加上 發佈日期(依大到小排序), 首頁選前4筆顯示
            </td>
          </tr>
          <tr>
            <td class="darkC">發佈日期</td>
            <td class="lightL">
              <asp:TextBox ID="txtPXDATE" runat="server" MaxLength="10" Width="70px" 
                onclick="robCalendar_setDate(this);"/>
            </td>
          </tr>
          <tr>
            <td class="darkC">標題</td>
            <td class="lightL">
              <asp:TextBox ID="txtPXBT" runat="server" MaxLength="100" Width="450px"/>
            </td>
          </tr>
          <tr>
            <td class="darkC">內文<br />
              <input type="button" class="cmd" value="預覽" style="cursor:pointer;"
                id="cmdPreview" runat="server"
                onclick="window.open('admPXF1_Preview.aspx?d=','_blank')" />
            </td>
            <td class="lightL">
              <asp:TextBox ID="txtPXTEXT" runat="server" Width="620px"
               TextMode="MultiLine" Rows="30" />
            </td>
          </tr>
          <tr>
            <td class="darkC">套版設定</td>
            <td class="lightL">
              內文中請用 <label style="color: #9900FF">#[自訂名稱]#</label> 來套用物件，說明如下：
              <br />超連結：項目的結尾，在請用 <label style="color: #9900FF">#[LEND]#</label> 來標示。例如：<label style="color: #9900FF">#[谷歌]#</label>Google地圖<label style="color: #9900FF">#[LEND]#</label>
              <br />圖片、表格：直接套用。例如：<label style="color: #9900FF">#[PIC-1]#</label>。
              &#12288;表格輸入時，每一列換行，每一欄用(,)分隔。
              <br />文字：項目的結尾，在請用 <label style="color: #9900FF">#[TEnd]#</label> 來標示。例如：<label style="color: #9900FF">#[T1]#</label>這是標題<label style="color: #9900FF">#[TEND]#</label>
              <br /><label id="lblCmd2" class="opCmd" onclick="selectAllRowsTable($('tbTAH'))">全選</label>
              &#12288;<label id="lblCmd3" class="opCmd" onclick="unselectAllRowsTable($('tbTAH'))">取消選取</label>
              &#12288;<label id="lblCmd4" class="opCmd" onclick="deleteRowsTable($('tbTAH'),arTAH)">刪除已選取</label>
              &#12288;&#12288;&#12288;&#12288;
              新增項目：<label class="opCmd" onclick="addnewRowTableTAH('tbTAH','L');">超連結</label>
              &#12288;<label class="opCmd" onclick="addnewRowTableTAH('tbTAH','P');">圖片</label>
              &#12288;<label class="opCmd" onclick="addnewRowTableTAH('tbTAH','T');">文字</label>
              &#12288;<label class="opCmd" onclick="addnewRowTableTAH('tbTAH','B');">表格</label>
              
              <table id="tbTAH" class="item" cellpadding="5" cellspacing="0" style="width:100%">
              <tr>
                <td class="title" style="width:20px;">選</td>
                <td class="title" style="width:40px;">類別</td>
                <td class="title" style="width:80px;">#[ 自訂名稱 ]#</td>
                <td class="title">套用物件定義</td>
              </tr>
            </table>
            </td>
          </tr>
          <tr>
            <td class="darkC">圖片上傳區<br />
              <asp:Button ID="cmdUpPic" runat="server" CssClass="cmd" Text="上傳圖片" OnClick="cmdUpPic_Click" />
            </td>
            <td class="lightL">
              <table class="item" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
              <tr>
                <td class="title" style="width:140px;">圖片-1</td>
                <td class="title" style="width:140px;">圖片-2</td>
                <td class="title" style="width:140px;">圖片-3</td>
                <td class="title" style="width:140px;">圖片-4</td>
                <td class="title" style="width:140px;">圖片-5</td>
              </tr>
              <tr>
                <td class='light'><asp:Image ID="imgPX1" runat="server" ImageUrl="" /></td>
                <td class="light"><asp:Image ID="imgPX2" runat="server" ImageUrl="" /></td>
                <td class="light"><asp:Image ID="imgPX3" runat="server" ImageUrl="" /></td>
                <td class="light"><asp:Image ID="imgPX4" runat="server" ImageUrl="" /></td>
                <td class="light"><asp:Image ID="imgPX5" runat="server" ImageUrl="" /></td>
              </tr>
              <tr>
                <td class="light"><asp:FileUpload ID="fuP1" runat="server" Width="120" /></td>
                <td class="light"><asp:FileUpload ID="fuP2" runat="server" Width="120" /></td>
                <td class="light"><asp:FileUpload ID="fuP3" runat="server" Width="120" /></td>
                <td class="light"><asp:FileUpload ID="fuP4" runat="server" Width="120" /></td>
                <td class="light"><asp:FileUpload ID="fuP5" runat="server" Width="120" /></td>
              </tr>
              
              </table>
            </td>
          </tr>
          <tr>
            <td class="darkC">啟用設定</td>
            <td class="lightL">
              <asp:RadioButtonList ID="rdPXACT" runat="server" RepeatDirection="Horizontal"
                AppendDataBoundItems="True">
                <asp:ListItem Value="Y" Text="啟用"></asp:ListItem>
                <asp:ListItem Value="N" Text="停用"></asp:ListItem>
              </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="darkC">建檔日期</td>
            <td class="lightL">
              <asp:Label ID="lblDateCreate" runat="server" Text=""></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="darkC">最後異動</td>
            <td class="lightL">
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
        <asp:HiddenField ID="hidrobTAH" runat="server" />
        <script src="js/robTextAreaHtml.js" type="text/javascript"></script>
    </asp:View>
  </asp:MultiView>
  <!-- #include file="css/robCalendarV200.htm" -->
</asp:Content>
