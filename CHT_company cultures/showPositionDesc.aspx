<%@ Page Language="C#" AutoEventWireup="true"
  Inherits="SC.showPositionDesc" Codebehind="showPositionDesc.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>中華電信:職位說明</title>
  <style type="text/css">
    td
    {
      padding-left: 20px;
    }
    .cart_odd
    {
      background: #F0EFEC;
      height: 40px;
      font-size: 13px;
    }
    .cart_oii
    {
      background: #FFF;
      height: 40px;
    }
    .cart_bb
    {
      padding: 10px 70px 10px 60px;
      width: 300px;
      line-height: 20px;
      text-align: justify;
      text-justify: inter-ideograph;
    }
    .cart_list_tabel
    {
      border: 1px solid #675C53;
      font-family: Verdana, Arial, Helvetica, sans-serif;
      font-size: 12px;
      text-align: left;
    }
    .jobs
    {
      text-align: center;
      width: 700px;
      margin: 0 auto;
    }
    .btnpadding
    {
      margin: 10px 5px;
    }
    .message
    {
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
      font-size: 12px;
      font-weight: bold;
      color: Red;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <div id="itemDiv" runat="server" class="jobs">
    <table runat="server" cellpadding="0" cellspacing="0" align="left" width="700" class="cart_list_tabel">
      <tr class="cart_odd">
        <td>
          職位名稱
        </td>
      </tr>
      <tr class="cart_oii">
        <td class="cart_bb">
          專員
        </td>
      </tr>
    </table>
  </div>
  <div style="text-align:center;">
  <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>
  </div>
  </form>
</body>
</html>
