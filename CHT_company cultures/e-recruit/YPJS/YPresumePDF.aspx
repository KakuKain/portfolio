<%@ Page Language="C#" AutoEventWireup="true" Inherits="SC.YPresumePDF" Codebehind="YPresumePDF.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <title></title>
  <style type="text/css">
    body
    {
      margin-top: 0px;
      margin-left: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
      font-size: 12px;
      color: #000000;
      font-family: 細明體, Arial, Verdana, Helvetica, sans-serif; 
      /*  
      background-image: url("../images/admin_bg.gif");
      */ 
      line-height:20px;letter-spacing:0.1em;text-align:left;background-color:#EEEEEE;
    }
    </style>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
  </div>
  </form>
</body>
</html>
<script language="javascript" type="text/javascript">
  //window.close();
</script>
