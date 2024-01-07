<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" Inherits="SC.admFBF1" Codebehind="admFBF1.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
  <link href="css/robCalendarV200.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div style="position:relative;">
  <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="viewData" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="100%">
        <tr>
          <th colspan="3" class="headC">發布職缺列表</th>
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
                  啟用<asp:DropDownList ID="dropSelFBACT" runat="server">
                    <asp:ListItem Value="-1">全部</asp:ListItem>
                    <asp:ListItem Value="Y">啟用</asp:ListItem>
                    <asp:ListItem Value="N">禁止</asp:ListItem>
                  </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;"></td>
                <td style="text-align:left;">
                  <asp:CheckBox ID="ckSelFBDF" runat="server" Text="發布起始日期" />
                  <asp:TextBox ID="txtSelFBDF_F" runat="server" onclick="robCalendar_setDate(this);"
                    MaxLength="10" Width="65px"></asp:TextBox>至<asp:TextBox 
                    ID="txtSelFBDF_E" runat="server" onclick="robCalendar_setDate(this);" MaxLength="10" Width="65px"></asp:TextBox>
                  &#12288;&#12288;
                  <asp:CheckBox ID="ckSelFBDE" runat="server" Text="發布截止日期" />
                  <asp:TextBox ID="txtSelFBDE_F" runat="server" onclick="robCalendar_setDate(this);"
                    MaxLength="10" Width="65px"></asp:TextBox>至<asp:TextBox 
                    ID="txtSelFBDE_E" runat="server" onclick="robCalendar_setDate(this);" MaxLength="10" Width="65px"></asp:TextBox>
                  <br />
                  <asp:CheckBox ID="ckSelFBKSD" runat="server" Text="考試日期" />
                  <asp:TextBox ID="txtSelFBKSD_F" runat="server" onclick="robCalendar_setDate(this);"
                    MaxLength="10" Width="65px"></asp:TextBox>至<asp:TextBox 
                    ID="txtSelFBKSD_E" runat="server" onclick="robCalendar_setDate(this);" MaxLength="10" Width="65px"></asp:TextBox>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;"></td>
                <td style="text-align:left;">
                  <asp:CheckBox ID="ckSelSearch" runat="server" Text="查詢詞(職類名稱,職缺編號,職缺名稱,機構)" />
                  <asp:TextBox ID="txtSelSearch" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;">排序方式：</td>
                <td style="text-align:left;">
                  <asp:DropDownList ID="dropSelOrder" runat="server">
                    <asp:ListItem Value="1">職缺編號</asp:ListItem>
                    <asp:ListItem Value="2">職缺項目</asp:ListItem>
                    <asp:ListItem Value="3">機構</asp:ListItem>
                    <asp:ListItem Value="4">發布起始日</asp:ListItem>
                    <asp:ListItem Value="5">發布截止日</asp:ListItem>
                    <asp:ListItem Value="6">考試日期</asp:ListItem>
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
            <table id="itemTable" class="item" style="width:100%;" cellspacing="0" runat="server">
              <tr>
                <td class="title" style="width: 180px">職類</td>
                <td class="title">職缺編號<br />職缺項目</td>
                <td class="title" style="width: 100px">機構</td>
                <td class="title" style="width: 80px">發布日期</td>
                <td class="title" style="width: 80px">考試日期</td>
                <td class="title" style="width: 40px">報名<br />錄取</td>
                <td class="title" style="width: 40px">啟用</td>
                <td class="title" style="width: 100px" title="1.有應徵者時,此職缺不可刪除&#13;2.有報名者時才有管理功能">操作</td>
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
            <th colspan="2" class="headC">發布職缺</th>
          </tr>
          <tr>
            <td class="darkC" width="160px">職缺編號</td>
            <td class="lightL" width="540px">
              <asp:TextBox ID="txtFBNO" runat="server" MaxLength="20" Width="150px" ></asp:TextBox>
              &#12288;&#12288;
              <asp:CheckBox ID="ckFBHOT" runat="server" Text="熱門職缺" />
            </td>
          </tr>
          <tr>
            <td class="darkC">職缺項目</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBN" runat="server" MaxLength="50" Width="450px"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">職類</td>
            <td class="lightL">
              <asp:DropDownList ID="dropZLD00" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td class="darkC">機構</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBJG" runat="server" MaxLength="50" Width="450px"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">需求人數</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBMENS" runat="server" MaxLength="50" Width="450px"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">發佈日期</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBDF" runat="server" MaxLength="10" Width="100px"
                onclick="robCalendar_setDate(this);"></asp:TextBox>
              &nbsp;至
              <asp:TextBox ID="txtFBDE" runat="server" MaxLength="10" Width="100px"
                onclick="robCalendar_setDate(this);"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">考試日期</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBKSD" runat="server" MaxLength="10" Width="100px"
                onclick="robCalendar_setDate(this);"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">啟用</td>
            <td class="lightL">
              <asp:RadioButtonList ID="rdFBACT" runat="server" RepeatDirection="Horizontal"
                AppendDataBoundItems="True">
                <asp:ListItem Value="Y" Text="啟用"></asp:ListItem>
                <asp:ListItem Value="N" Text="禁止"></asp:ListItem>
              </asp:RadioButtonList>
            </td>
          </tr>
          
          <tr>
            <td class="darkC">學歷要求</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBXL" runat="server" MaxLength="50" Width="450px"
              Rows="10" TextMode="MultiLine"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">專長資格</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBZC" runat="server" MaxLength="50" Width="450px"
              Rows="10" TextMode="MultiLine"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">工作內容</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBDESC" runat="server" MaxLength="50" Width="450px"
              Rows="10" TextMode="MultiLine"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td class="darkC">其他</td>
            <td class="lightL">
              <asp:TextBox ID="txtFBOT" runat="server" MaxLength="50" Width="450px"
              Rows="10" TextMode="MultiLine"></asp:TextBox>
            </td>
          </tr>
          
          <tr id="trDATECREATE" runat="server">
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
               Text=" 新增 " onclick="cmdEdit_Click"/>
               &nbsp;&nbsp;
              <asp:Button ID="cmdCancel" runat="server" CssClass="cmd"
              Text=" 取消 " onclick="cmdCancel_Click" EnableViewState="False" />
            </td>
          </tr>
        </table>
    </asp:View>

    <asp:View ID="viewData3" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="100%">
        <tr>
          <th colspan="3" class="headC">管理：職缺應徵者&#12288;列表</th>
        </tr>
        <tr>
          <td colspan="3" class="lightL" style="line-height:24px;">
            <asp:Label ID="lblLine1" runat="server" Text=""></asp:Label>
            <asp:Button ID="cmdReturn3" runat="server"  CssClass="cmd"
              Text="返回職缺列表" onclick="cmdReturn3_Click"/>
          </td>
        </tr>
        <tr>
          <td colspan="3" class="darkL" style="line-height:24px;">
            <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
              <tr>
                <td style="text-align:right;">資料查詢選項：</td>
                <td style="text-align:left;">
                  每頁顯示筆數<asp:DropDownList ID="dropmyRecsPerPage3" runat="server" >
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="40">40</asp:ListItem>
                    <asp:ListItem Value="50">50</asp:ListItem>
                  </asp:DropDownList>&#12288;
                  <asp:Button ID="cmdFind3" runat="server" CssClass="cmd" 
                  Text="查詢資料" onclick="cmdFind_Click"/>
                  &#12288;<asp:Button ID="cmdRefresh3" runat="server"  CssClass="cmd"
                  Text="刷新" onclick="cmdRefresh_Click"/>
                  &#12288;<label id="lcmdYJExcel" runat="server" class="opCmd" onmouseout="this.className='opCmd'" onmouseover="this.className='opCmdMsOver'"
                    onclick="window.open('admYPF1_Excel.aspx','_blank')">匯出Excel</label>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;">篩選條件：</td>
                <td style="text-align:left;">
                  <asp:RadioButtonList ID="rdSelYJSTAT1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">全部</asp:ListItem>
                    <asp:ListItem Value="1">報名</asp:ListItem>
                    <asp:ListItem Value="3">考試</asp:ListItem>
                    <asp:ListItem Value="4">錄取</asp:ListItem>
                    <asp:ListItem Value="7">已報到</asp:ListItem>
                  </asp:RadioButtonList>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;"></td>
                <td style="text-align:left;">
                  <asp:CheckBox ID="ckSelYPHMD" runat="server" Text="包含黑名單" />
                  &#12288;&#12288;
                  <asp:CheckBox ID="ckSelSearch3" runat="server" Text="查詢詞(身份證號,姓名)" />
                  <asp:TextBox ID="txtSelSearch3" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                </td>
              </tr>
              <tr>
                <td style="text-align:right;">排序方式：</td>
                <td style="text-align:left;">
                  <asp:DropDownList ID="dropSelOrder3" runat="server">
                    <asp:ListItem Value="1">報名日期(近→遠)</asp:ListItem>
                    <asp:ListItem Value="2">報名日期(遠→近)</asp:ListItem>
                    <asp:ListItem Value="3">姓名</asp:ListItem>
                  </asp:DropDownList>
                  &#12288;&#12288;<label style="color: #9900FF">※以滑鼠點下【姓名】欄可打開或下載履歷表pdf!!</label>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="3" align="center" class="light">
            <!-- ***** 列出資料 ***** -->
            <table id="itemTable3" class="item" cellspacing="0" runat="server">
              <tr>
                <td class="title" style="width: 80px">報名日期</td>
                <td class="title" style="width: 80px">身份證號</td>
                <td class="title" style="width: 80px">姓名</td>
                <td class="title" style="width: 35px">性別</td>
                <td class="title" style="width: 120px">出生日期</td>
                <td class="title" style="width: 25px">黑</td>
                <td class="title" style="width: 60px">目前狀態</td>
                <td class="title" style="width: 40px">操作</td>
              </tr>
              <%-- <tr>
                <td>YYYY/MM/DD</td>
                <td>1234567890</td>
                <td>1234567890</td>
                <td>男</td>
                <td>YYYY/MM/DD&#12288;99歲</td>
                <td>Y</td>
                <td>網路 報章 eDM</td>
                <td>安排面試</td>
                <td>審核</td>
              </tr> --%>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="3" align="center" class="light" id="itemTablePager3" runat="server"></td>
        </tr>
        <tr>
          <td colspan="3" class="darkC">
            <asp:Label ID="lblMsg3" runat="server" CssClass="msg"></asp:Label>
          </td>
        </tr>
        <tr runat="server" visible="false">
          <td class="darkC">&nbsp;</td>
          <td class="darkC">&nbsp;</td>
          <td class="darkC">&nbsp;</td>
        </tr>
      </table>
    </asp:View>
    <asp:View ID="viewEdit3" runat="server">
      <table class="tbMain" align="center" cellspacing="1" width="700px" >
          <tr>
            <th colspan="2" class="headC">應徵者審核</th>
          </tr>
          <tr>
            <td class="darkC" width="160px">報名日期</td>
            <td class="lightL" width="540px">
              <asp:Label ID="lblYJCreateDate" runat="server" Text=""></asp:Label>
            </td>
          </tr>
          <tr>
            <td class="darkC">職缺</td>
            <td class="lightL"><asp:Label ID="lblFBINFO" runat="server" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td class="darkC">姓名</td>
            <td class="lightL"><asp:Label ID="lblYPname" runat="server" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td class="darkC">身份證號</td>
            <td class="lightL"><asp:Label ID="lblYPidno" runat="server" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td class="darkC">出生日期</td>
            <td class="lightL"><asp:Label ID="lblage" runat="server" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td class="darkC">黑名單</td>
            <td class="lightL"><asp:CheckBox ID="ckYPHMD" runat="server" Text="黑名單，永不錄用" /></td>
          </tr>
          
          <tr>
            <td class="darkC">狀態設定</td>
            <td class="lightL">
              <asp:RadioButtonList ID="rdYJstat1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">報名</asp:ListItem>
                <asp:ListItem Value="3">考試</asp:ListItem>
                <asp:ListItem Value="4">錄取</asp:ListItem>
                <asp:ListItem Value="7">報到</asp:ListItem>
            </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
            <td class="darkC">異動日期</td>
            <td class="lightL"><asp:Label ID="lblYJ_DateUpdate" runat="server" Text=""></asp:Label></td>
          </tr>
          
          <tr>
            <td colspan="2" class="lightC">
              &nbsp;<asp:Label ID="lblEditMsg3" runat="server" Text="" CssClass="msg"></asp:Label>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="2" class="darkC">
              <asp:Button ID="cmdEdit3" runat="server" CssClass="cmd"
               Text=" 新增 " onclick="cmdEdit3_Click"/>
               &nbsp;&nbsp;
              <asp:Button ID="cmdCancel3" runat="server" CssClass="cmd"
              Text=" 取消 " onclick="cmdCancel3_Click" EnableViewState="False" />
            </td>
          </tr>
        </table>
    </asp:View>
  </asp:MultiView>
  <!-- #include file="css/robCalendarV200.inc" -->
</div>
</asp:Content>
