<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobList.aspx.cs" Inherits="SH2004_admin_JobList" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
  <title></title>
  <style type="text/css">
    body {padding:0px; margin:10px auto; width:1024px; font-family:Arial; font-size:100%; letter-spacing:0.1em; vertical-align:top;}
    #itemTable { border-collapse:collapse; margin:0px; padding:0px;}
    #itemTable th, #itemTable td {border:solid 1px #000000; padding:6px 12px; }
    .Center { text-align:center;}
    .Left { text-align:left;}
    .pTitle { font-size:120%; font-weight:bold; color:#778800;}
    .msg { font-size:80%; color:#FF0000;}
    .opCmd { font-size:80%; color:#006699; text-decoration:none; cursor:default;}
    .opCmdOver { font-size:80%; color:#006699; text-decoration:underline; cursor:pointer;}
    .tdField1 { text-align:left;}
    .tdField2 { text-align:left;}
    .tdField3 { text-align:center;}
    .tdField4 { text-align:center;}
    .tdField5 { text-align:left;}
    input, textarea { font-family:Arial; font-size:100%;}
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <div id="divLogin" runat="server" enableviewstate="false" >
    <span class="pTitle">管理者登入</span>
    <br />帳號：<input type="text" id="txtAdminID" runat="server" maxlength="20" style="width:180px;" />
    <br />密碼：<input type="password" id="txtAdminPW" runat="server" maxlength="20" style="width:180px;" />
    <br />驗證碼：<input type="text" id="txtAdminYZM" runat="server" maxlength="6"  style="width:80px;" />
    <img id="imgLoginPic" runat="server" alt="" src="admLoginPic.aspx" style="vertical-align: middle;" />
    <br /><input type="button" value="登入" id="cmdLogin" />
  </div>
  <div id="divList" runat="server" enableviewstate="false">
    <span class="pTitle">發佈公告 列表</span>
    <br /><input type="button" value="新增" id="cmdAdd" />&#12288;
    <input type="button" value="存檔" id="cmdListSave" style="visibility:hidden;" />
    <table id="itemTable" runat="server" enableviewstate="false" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <th class="Center" width="100">日期</th>
        <th class="Left" >公告消息</th>
        <th class="Center" width="60" >啟用</th>
        <th></th>
        <th class="Center" width="100">操作</th>
      </tr>
    </table>
  </div>
  <div id="divEdit" runat="server" enableviewstate="false">
    <span class="pTitle">發佈公告 設定</span>
    <br />日期：<input type="text" id="txtJOBNO" runat="server" maxlength="20" style="width:150px;"/>
    <br />啟用：<input type="checkbox" id="ckJOBACT" runat="server" />
    <!-- <br />發佈日期(yyyy/mm/dd)：<input type="text" id="txtJOBDATEFROM" runat="server" 
    maxlength="10" style="width:100px;" /> 至 <input type="text" id="txtJOBDATEEND" runat="server" 
    maxlength="10" style="width:100px;"/> -->
    <br />
    <br />公告消息：<input type="text" id="txtJOBNTC" runat="server" maxlength="200" style="width:660px;"/>
    <!-- <br /><span style="vertical-align:top; margin-left:66px;">內容：</span><textarea 
    id="txtJOBDESCTC" runat="server" rows="15" style="width:660px;"></textarea> -->
    <br />
    <!-- <br />職位名稱(英)：<input type="text" id="txtJOBNEN" runat="server" maxlength="200" style="width:660px;"/>
    <br /><span style="vertical-align:top; margin-left:66px;">內容：</span><textarea 
    id="txtJOBDESCEN" runat="server" rows="15" style="width:660px;"></textarea> -->
    <br />
    <!-- <br />職位名稱(日)：<input type="text" id="txtJOBNJP" runat="server" maxlength="200" style="width:660px;"/>
    <br /><span style="vertical-align:top; margin-left:66px;">內容：</span><textarea 
    id="txtJOBDESCJP" runat="server" rows="15" style="width:660px;" ></textarea> -->

    <br /><input type="button" value="存檔" id="cmdSave" />&#12288;
    <input type="button" value="取消" id="cmdCancel" />
  </div>
  <span id="lblMsg" class="msg" runat="server"></span>
  <input type="hidden" id="hidAction" value="" runat="server" enableviewstate="false" />
  <input type="hidden" id="hidFB" value="" runat="server" enableviewstate="false" />
  <input type="hidden" id="hidD00" value="" runat="server" enableviewstate="false" />
  </form>
  <script src="JobList.js" type="text/javascript"></script>
</body>
</html>
