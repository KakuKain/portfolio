<%@ Page Language="C#" MasterPageFile="admPage.master" AutoEventWireup="true" 
Inherits="SC.admYPF1" Codebehind="admYPF1.aspx.cs" %>

<%@ MasterType VirtualPath="admPage.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
  <link href="css/robCalendarV200.css" rel="stylesheet" type="text/css" />
  <link href="css/robCalendHMV200.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div style="position:relative;">
<asp:MultiView ID="MultiView1" runat="server">
<asp:View ID="viewData" runat="server">
  <table class="tbMain" align="center" cellspacing="1" width="100%">
    <tr>
      <th colspan="3" class="headC">
        人才庫管理列表
      </th>
    </tr>
    <tr>
      <td colspan="3" class="darkL" style="line-height:24px;">
        <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
          <tr>
            <td style="text-align:right;">資料查詢選項：</td>
            <td style="text-align: left;">
              每頁顯示筆數<asp:DropDownList ID="dropmyRecsPerPage" runat="server">
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="40">40</asp:ListItem>
                <asp:ListItem Value="50">50</asp:ListItem>
              </asp:DropDownList>
              &#12288;
              <asp:Button ID="cmdFind" runat="server" CssClass="cmd" Text="查詢資料" OnClick="cmdFind_Click" />
              &#12288;<asp:Button ID="cmdRefresh" runat="server" CssClass="cmd" Text="刷新" OnClick="cmdRefresh_Click" />
              &#12288;<label id="lcmdExcel" runat="server" class="opCmd" onmouseout="this.className='opCmd'" onmouseover="this.className='opCmdMsOver'"
                onclick="window.open('admYPF1_Excel.aspx','_blank')">匯出Excel</label>
            </td>
          </tr>
          <tr>
            <td style="text-align: right;">
              篩選條件：
            </td>
            <td style="text-align: left;">
              應徵人狀態<asp:DropDownList id="dropSelYPACT" runat="server" >
                <asp:ListItem value="-1">全部</asp:ListItem>
                <asp:ListItem value="Y">填表中</asp:ListItem>
                <asp:ListItem value="T">已提交</asp:ListItem>
              </asp:DropDownList>
              &#12288;&#12288;是否黑名單<asp:DropDownList ID="dropSelYPHMD" runat="server">
                <asp:ListItem Value="-1">不限</asp:ListItem>
                <asp:ListItem Value="N">非黑名單</asp:ListItem>
                <asp:ListItem Value="Y">黑名單</asp:ListItem>
              </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td style="text-align:right;"></td>
            <td style="text-align: left;">
              性別<asp:DropDownList ID="dropSelYPSex" runat="server">
                <asp:ListItem Value="-1">不限</asp:ListItem>
                <asp:ListItem >男</asp:ListItem>
                <asp:ListItem >女</asp:ListItem>
              </asp:DropDownList>
              &#12288;&#12288;婚姻<asp:DropDownList ID="dropSelYPMarry" runat="server">
                <asp:ListItem Value="-1">不限</asp:ListItem>
                <asp:ListItem Value="1">未婚</asp:ListItem>
                <asp:ListItem Value="2">已婚/離/喪</asp:ListItem>
              </asp:DropDownList>
              &#12288;&#12288;<asp:CheckBox ID="ckSelAge" runat="server" 
              Text="年齡範圍" /><asp:TextBox ID="txtSelAgeF" runat="server" Width="30" MaxLength="2"/>
              至<asp:TextBox ID="txtSelAgeE" runat="server" Width="30" MaxLength="2" />歲
              &#12288;&#12288;<asp:CheckBox ID="ckSelXLNO" runat="server" Text="最高學歷範圍" />
              <asp:DropDownList ID="dropSelXLNOF" runat="server"></asp:DropDownList>至<asp:DropDownList 
              ID="dropSelXLNOE" runat="server"></asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td style="text-align: right;"></td>
            <td style="text-align: left;">
              <asp:CheckBox ID="ckSelDateCreate" runat="server" Text="註冊日期範圍" />
              <asp:TextBox ID="txtSelDateCreateF" runat="server" onclick="robCalendar_setDate(this);"
              MaxLength="10" Width="70px"/>至<asp:TextBox ID="txtSelDateCreateE"
              runat="server" onclick="robCalendar_setDate(this);" MaxLength="10" Width="70px"/>
              &#12288;&#12288;<asp:CheckBox ID="ckSelDateLastApply" runat="server" Text="提交日期範圍" />
              <asp:TextBox ID="txtSelDateLastApplyF" runat="server" onclick="robCalendar_setDate(this);"
              MaxLength="10" Width="70px"/>至<asp:TextBox ID="txtSelDateLastApplyE"
              runat="server" onclick="robCalendar_setDate(this);" MaxLength="10" Width="70px"/>
            </td>
          </tr>
          <tr>
            <td style="text-align:right;"></td>
            <td style="text-align: left;">
              <asp:CheckBox ID="ckSelSearch" runat="server" Text="查詢詞(姓名, 身份證號,學歷,工作經驗,專長,證照,語文,論文,自傳)" />
              <asp:TextBox ID="txtSelSearch" runat="server" Width="300px" MaxLength="50"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td style="text-align: right;">
              排序方式：
            </td>
            <td style="text-align: left;">
              <asp:DropDownList ID="dropSelOrder" runat="server">
                <asp:ListItem Value="1">註冊日期</asp:ListItem>
                <asp:ListItem Value="2">身份證號</asp:ListItem>
                <asp:ListItem Value="3">姓名</asp:ListItem>
              </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              &#12288;&#12288;<asp:CheckBox ID="ckSelListYPJOB" runat="server" Text="顯示已應徵職缺" />
              &#12288;&#12288;<label style="color: #9900FF">※以滑鼠點下【姓名】欄可打開pdf履歷表!!</label>
              <asp:Label ID="lblLine1" runat="server" ForeColor="#006600"></asp:Label>
              <br />
              &#12288;&#12288;<asp:CheckBox ID="ckSelListYUF1" runat="server" Text="顯示上傳作品" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center" class="light">
        <!-- ***** 列出資料 ***** -->
        <table id="itemTable" class="item" cellspacing="0" runat="server" 
          enableviewstate="false" style="width:100%;">
          <tr>
            <td class="title" style="width: 80px">註冊日期</td>
            <td class="title" style="width: 80px">提交日期</td>
            <td class="title" style="width: 80px">身份證號</td>
            <td class="title" style="width: 80px">姓名</td>
            <td class="title" style="width: 40px">性別</td>
            <td class="title" style="width: 80px">出生日期</td>
            <td class="title" style="width: 25px">黑</td>
            <td class="title" style="width: 35px">報名</td>
            <td class="title">狀態</td>
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
        <th colspan="2" class="headC">應聘人員資料</th>
      </tr>
      <tr>
        <td class="darkC" width="160px">註冊日期</td>
        <td class="lightL" width="540px">
          <asp:Label ID="lblYPF1DateUpdate" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="darkC">登入日期</td>
        <td class="lightL">
          <asp:Label ID="lblYPF1DateLog" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      
      <tr>
        <td class="darkC">提交日期</td>
        <td class="lightL">
          <asp:Label ID="lblYPF1DateApply" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="darkC">姓&#12288;&#12288;名</td>
        <td class="lightL">
          <asp:Label ID="lblYPF1Name" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="darkC">身份證號</td>
        <td class="lightL">
          <asp:TextBox ID="txtYPF1IDNO" runat="server" 
            MaxLength="20" Width="100px"></asp:TextBox>
          &nbsp;&nbsp;(※管理者可強制更改或設定會員的身份證號，應為10位碼 )
        </td>
      </tr>
      <tr>
        <td class="darkC">登入密碼</td>
        <td class="lightL">
          <asp:TextBox ID="txtYPF1PW" runat="server" 
            MaxLength="20" Width="100px"></asp:TextBox>
            &nbsp;&nbsp;(※管理者可強制更改或設定會員的密碼，至少為5位碼 )
        </td>
      </tr>
      <tr>
        <td class="darkC">E-mail</td>
        <td class="lightL">
          <asp:TextBox ID="txtYPF1Mail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td class="darkC">住宅電話</td>
        <td class="lightL" >
          <asp:Label ID="lblYPF1Tel" runat="server" Text="Label"></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="darkC">手機</td>
        <td class="lightL" >
          <asp:TextBox ID="txtYPF1Cel" runat="server" MaxLength="50" Width="200px"/>
        </td>
      </tr>
      <tr>
        <td class="darkC">出生日期</td>
        <td class="lightL">
          <asp:Label ID="lblYPF1BirDate" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="darkC">性別</td>
        <td class="lightL">
          <asp:Label ID="lblYPF1Sex" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      
      <tr>
      <td class="darkC">履歷填寫狀態設定</td>
      <td class="lightL">
        <asp:RadioButtonList ID="rdYPF1Act" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Value="Y">填表中</asp:ListItem>
        <asp:ListItem Value="T">已提交</asp:ListItem>
      </asp:RadioButtonList>
      </td>
    </tr>
    <tr>
      <td class="darkC">設為黑名單</td>
      <td class="lightL">
        <asp:CheckBox ID="ckYPF1HMD" runat="server" Text="黑名單，永不錄用" />
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
           Text=" 新增 " onclick="cmdEdit_Click" 
           OnClientClick=" if(!check_before_save()){ return false;}"/>
           &nbsp;&nbsp;
          <asp:Button ID="cmdCancel" runat="server" CssClass="cmd"
          Text=" 取消 " onclick="cmdCancel_Click" EnableViewState="False" />
        </td>
      </tr>
      <tr id="trProcBar" runat="server">
        <td colspan="2" class="darkL" id="tdProcBar" runat="server"></td>
      </tr>
    </table>
    <script type="text/javascript">
      function check_before_save() {
        return true;
      }
    </script>
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
          </asp:RadioButtonList>
          <asp:Label ID="lblYLQstatus" runat="server" Text=""></asp:Label>
        </td>
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
      <tr id="trProcBar3" runat="server">
        <td colspan="2" class="darkL" id="tdProcBar3" runat="server"></td>
      </tr>
    </table>
    <script type="text/javascript">
      // $(sLed + "txtMT1time").onblur = function() { if (!this.value.match(/\d\d:\d\d$/)) { this.value = ""; } }
    </script>
</asp:View>
</asp:MultiView>
<asp:HiddenField ID="hidYPNO" runat="server" />
<!-- #include file="css/robCalendarV200.htm" -->
<!-- #include file="css/robCalendHMV200.htm" -->
</div>
</asp:Content>
