<%@ Page Language="C#" AutoEventWireup="true" Inherits="SC.YPLogin" Codebehind="YPLogin.aspx.cs" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
  <meta name="WebsiteSpark" content="FZ3jGa1azn" />
  <title>中華電信人才招募網</title>
  <style type="text/css">
    body
    {
      margin-top: 0px;
      margin-left: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
      font-size: 12px;
      color: #1e1e1e;
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif; 
      line-height:24px;
      letter-spacing:0.1em;
      text-align:left;
    }
    .chinese
    {
      font-family: Arial, Verdana, Helvetica, sans-serif, 細明體; 
      line-height:12px;
    }
    .english
    {
      font-family: Arial, Verdana, Helvetica, sans-serif, 細明體; 
      /* color:Green; */
      line-height:12px;
    }
    a
    {
      font: normal 12px Arial;
      color: #1e1e1e;
      text-decoration: none;
    }
    a:hover
    {
      color: #596099; /* color: #FFFFFF; */
      text-decoration: underline;
    }
    td.Vtitle
    {
      color: #675C53;
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 160px;
      text-align: center;
    }
    td.Vitem
    {
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 160px;
      text-align: center;
    }
    td.VitemLeft
    {
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 160px;
      text-align: left;
      line-height: 20px;
      letter-spacing: 0em;
    }
    td.VitemSelected
    {
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 160px;
      text-align: center;
      font-weight: bold;
    }
    td.VitemMouseOver
    {
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 160px;
      text-align: center;
      font-weight: normal;
      cursor: pointer;
    }
    
    td.Hgap
    {
      height: 22px;
      width: 20px;
      text-align: left;
      font-weight: normal;
    }
    td.Htitle
    {
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      padding: 5px 5px;
      text-align: center;
      font-weight: normal;
    }
    td.Hitem
    {
      border: 1px solid #F0EFEC;
      height: 22px; 
      padding: 5px 5px;
      text-align: center;
      font-weight: normal;
    }
    td.HitemSelected
    {
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 100px;
      text-align: center;
      font-weight: bold;
    }
    td.HitemMouseOver
    {
      background-color: #F0EFEC;
      border: 1px solid #F0EFEC;
      height: 22px;
      width: 100px;
      text-align: center;
      font-weight: normal;
      cursor: pointer;
    }
    td.Hnavigation
    {
      height: 22px;
      width: 170px;
      padding: 5px 0px;
      text-align: left;
      font-weight: normal;
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
    }
    /* 訊息用的 */
    .message, .msg
    {
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
      color: Red;
      font-weight: bold;
      font-size: 12px;
      line-height: 20px;
      vertical-align: middle;
    }
    table.LoginEntry
    {
      border-collapse: collapse;
      text-align: center;
      margin-left: auto;
      margin-right: auto;
    }

    table.Login
    {
      border-collapse: collapse;
      text-align: center;
      margin-left:0px;
      width:550px;
      /* 
      margin-left: auto;
      margin-right: auto;
      */
    }
    table.Login td
    {
      /* border: 1px solid #808080; */ /* line-height: 14px; */
      vertical-align: middle;
      text-align: center;
      font-family: 細明體, Arial, Verdana, Helvetica, sans-serif;
    }
    table.Login td.title
    {
      padding: 4px 12px 4px 12px;
      background-color: #E1E1E1;
      border: 1px solid #808080;
      text-align: center;
    }
    table.Login td.left
    {
      padding: 4px 12px 4px 12px;
      text-align: left;
      border: 1px solid #808080;
      background-color: #D2E1F0;
    }
    table.Login td.right
    {
      padding: 4px 12px 4px 12px;
      text-align: right;
      border: 1px solid #808080;
      background-color: #B1CBE4;
    }
    /* table.Login td input[type="Text"], table.Login td input[type="Password"] */
    input[type="Text"], input[type="Password"]
    {
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
      font-size: 12px;
      border: 1px solid #999999;
    }
    table.Login td select
    {
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
      font-size: 12px;
    }
    .pageTitle
    {
      font-size: 16px;
      font-weight: bolder;
      color: #007B7B;
    }
    div.divbody
    {
      top: 0px;
      left: 0px;
      padding: 20px;
      background-color: #EEEEEE;
    }
    input.command
    {
      padding:4px 6px;
      font-family: Arial, 細明體, Verdana, Helvetica, sans-serif;
      font-size: 12px;
      font-weight: normal;
      color: Blue;
      border: 1px solid #999999;
    }
    /*
    input[type="checkbox"]
    {
      border-bottom-style:none;
    } -->
    */
  </style>
  <script src="YPJS/js/SC_ckMain.js" type="text/javascript"></script>
  <script src="ypJS/js/robJsLib.js" type="text/javascript"></script>
</head>
<body>
<div style="position:relative; margin:0 auto; width:980px; " >
  <form id="form1" runat="server">
  <!-- top -->
  <div style="z-index: 1; left: 0px; top: 0px; position: absolute; width: 980px;">
    <table width="980px" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
      <tr>
        <td valign="middle" align="left" style="width:16px;">&nbsp;</td>
        <td style="text-align:center;">
          <img id="imgYPBanner" runat="server" alt="Banner" src="" enableviewstate="false" />
        </td>
      </tr>
    </table>
    <table id="Hmenu" border="0" cellpadding="0" cellspacing="2" runat="server" visible="false" style="border-collapse: collapse;">
      <tr>
        <td class="Hnavigation">
          <asp:LinkButton ID="lcmdHome" runat="server" onclick="lcmdHome_Click">首頁</asp:LinkButton> >> 登入/註冊</td>
      </tr>
     </table>
  </div>

  <!-- left menu -->
  <div id="divLeftMenu" runat="server" enableviewstate="false"
    style="z-index: 1; left: 10px; top:100px; position:absolute; 
    width:180px;">
    <table id="Vmenu" cellspacing="6" runat="server">
      <tr><td>
        <table cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
          <tr><td class="Vtitle" style="cursor:pointer; line-height:14px; text-decoration: underline;" onclick="JavaScript: location='YPDefault.aspx';" >首頁&nbsp;/&nbsp;職位查詢
        </td></tr>
        </table>
      </td></tr>
      <tr><td>
        <table cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
          <tr>
          <td id="td1" runat="server" class="Vtitle"  style="cursor:pointer; line-height:14px; text-decoration: underline;" onclick="JavaScript: window.open('privacy.html','_blank','');" >個人資料保護法宣告
          </td>
          </tr>
        </table>
      </td></tr>
      <tr><td style="height:300px;"></td></tr>
      <tr>
        <td class="Vtitle" style="line-height:14px;">
          Copyright &copy; 2012
          <br />eRecruit of
          <br />SKFH
          <br />版權所有
        </td>
      </tr>
      <tr id="trService" runat="server" enableviewstate="false">
        <td id="tdService" runat="server" enableviewstate="false"
          class="Vtitle" style="line-height:14px;"></td>
      </tr>
    </table>
  </div>

  <!-- content -->
  <div id="divContent" runat="server"
    style="z-index: 1; left: 200px; top:100px; position:absolute; 
    width: 780px;">
      <div style="margin-top:7px; background-color: #F0EFEC; padding:5px;">
      <span style="font-size:24px; font-weight:bold; font-family:標楷體,Arial,細明體,;">
      中華電信人才招募網線上履歷系統&nbsp;<span style="font-family:Arial;"> Recruiting system</span></span>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
      <asp:View ID="viewLogin" runat="server">
        <div>
          <table class="Login" width="650px" >
            <tr><td class="pageTitle">我要登入</td></tr>
            <tr>
              <td align="center">
                <div class="chinese">
                  如果您還沒有註冊，請點選「我要註冊」，加入履歷系統；
                  <br />若您已註冊過本系統，請直接輸入身分證字號與密碼登入。
                </div>
              </td>
            </tr>
          
            <tr>
              <td>

                <table class="LoginEntry">
                  <tr>
                    <td class="right">
                      <div class="chinese">身份證號：</div>
                    </td>
                    <td class="left" >
                      <asp:TextBox ID="txtYPIDNO" runat="server" Width="100" MaxLength="20"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">登入密碼：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtYPPW" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">驗證碼：</div>
                    </td>
                    <td class="left" style="height:30px; width:130px;" >
                      <asp:TextBox ID="txtYPVerifyCode" runat="server" MaxLength="4"
                        Width="48px" style="vertical-align: middle;" ></asp:TextBox>
                      <img id="imgYPLoginPic" runat="server" alt="" src="YPLoginPic.aspx" style="vertical-align: middle;" />
                    </td>
                  </tr>
                  <tr>
                    <td class="left" style="text-align:center;" colspan="2">
                      <div class="chinese">
                        <asp:CheckBox ID="ckYPLoginPrivacy" runat="server" />
                        <span id="spanYPLoginPrivacyTC" runat="server" class="chinese">我接授並同意公司的個資法宣告</span>
                      </div>
                    </td>
                  </tr>
                </table>
                
              </td>
            </tr>
            <tr>
              <td align="center" style="padding-top:5px;">
                <asp:Button ID="cmdLogin" runat="server" Text="登入履歷系統" CssClass="command" 
                  onclick="cmdLogin_Click" />
                  <asp:Button ID="cmdGoRegiter" runat="server" Text="我要註冊" CssClass="command" OnClick="cmdGoRegiter_Click" />
                &nbsp;<asp:Button ID="cmdForget" runat="server" CssClass="command" 
                  OnClick="cmdForget_Click" Text="忘記密碼" />
              </td>
            </tr>
          </table>
        </div>
      </asp:View>
      <asp:View ID="viewRegiter" runat="server">
        <div style="text-align:left;">
          <table class="Login" width="650px" style="margin-left:0px;">
            <tr>
              <td class="pageTitle">我要註冊</td>
            </tr>
            <tr>
              <td>註冊時，請確實填寫以下資料：</td>
            </tr>
            <tr>
              <td>
              *以下資料都將轉入到履歷表中，並做為您的基本資料，請務必填寫真實資料*
              </td>
            </tr>
            <tr>
              <td align="center">
                <table class="LoginEntry">
                  <tr>
                    <td class="right" >
                      <div class="chinese">姓名：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtRegCname" runat="server" Width="100" MaxLength="10"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">身份證號：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtRegIDNO" runat="server" Width="100" MaxLength="10"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">登入密碼：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtRegPW" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">再次確認密碼：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtRegPW2" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">E-mail：</td>
                    <td class="left">
                      <asp:TextBox ID="txtRegMail" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">驗證碼：</div>
                    </td>
                    <td class="left" style="height:30px; width:130px;" >
                      <asp:TextBox ID="txtRegVerifyCode" runat="server" MaxLength="4"
                        Width="40px" style="vertical-align: middle;" ></asp:TextBox>
                      <img id="imgRegLoginPic" runat="server" alt="" src="YPLoginPic.aspx" style="vertical-align: middle;" />
                    </td>
                  </tr>
                  <tr>
                    <td class="left" style="text-align:center;" colspan="2">
                      <div class="chinese">
                        <asp:CheckBox ID="ckRegPrivacy" runat="server" />
                        <span id="spanRegPrivacyTC" runat="server" class="chinese">我接授並同意公司的個資法宣告</span>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td align="center">
                <br />
                <asp:Button ID="cmdRegister" runat="server" Text="註冊後登入線上履歷系統" 
                  CssClass="command" onclick="cmdRegister_Click" />
              </td>
            </tr>
            <tr>
              <td align="center" style="padding-top:5px;">
                如果您已註冊過，請直接登入：
                <asp:Button ID="cmdGoLogin" runat="server" Text="我要登入" 
                  CssClass="command" OnClick="cmdGoLogin_Click" />
              </td>
            </tr>
          </table>
        </div>
      </asp:View>
      
      <asp:View ID="viewForget" runat="server">
        <div style="text-align:left;">
          <table class="Login" width="650px" style="margin-left:0px;">
            <tr>
              <td class="pageTitle">忘記密碼</td>
            </tr>
            <tr>
              <td align="center">
                <div class="chinese">請輸入註冊時填寫的E-mail，即可重設密碼：</div>
              </td>
            </tr>
          
            <tr>
              <td>

                <table class="LoginEntry">
                  <tr>
                    <td class="right">
                      <div class="chinese">身份證號：</div>
                    </td>
                    <td class="left" >
                      <asp:TextBox ID="txtFGidno" runat="server" Width="100" MaxLength="20"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">E-mail：</td>
                    <td class="left">
                      <asp:TextBox ID="txtFGmail" runat="server" Width="200px" MaxLength="50" ></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">驗證碼：</div>
                    </td>
                    <td class="left" style="height:30px; width:130px;" >
                      <asp:TextBox ID="txtFGVerifyCode" runat="server" MaxLength="4"
                        Width="40px" style="vertical-align: middle;" ></asp:TextBox>
                      <img id="imgFGLoginPic" runat="server" alt="" src="YPLoginPic.aspx" style="vertical-align: middle;" />
                    </td>
                  </tr>
                  <tr>
                    <td class="left" style="text-align:center;" colspan="2">
                      <div class="chinese">
                        <asp:CheckBox ID="ckFGPrivacy" runat="server" />
                        <span id="spanFGPrivacyTC" runat="server" class="chinese">我接授並同意公司的個資法宣告</span>
                      </div>
                    </td>
                  </tr>
                </table>
                
              </td>
            </tr>
            <tr>
              <td align="center" style="padding-top:5px;">
                <asp:Button ID="cmdCheckMail" runat="server" Text="檢核帳號" CssClass="command" 
                  onclick="cmdCheckMail_Click" />
                &nbsp;<asp:Button ID="cmdCheckCancel" runat="server" CssClass="command" 
                  onclick="cmdCheckCancel_Click" Text="返回登入頁面" />
                &nbsp;</td>
            </tr>
          </table>
        </div>
      </asp:View>
      
      <asp:View ID="viewReset" runat="server">
        <div style="text-align:left;">
          <table class="Login" width="650px" style="margin-left:0px;">
            <tr>
              <td class="pageTitle">重設密碼</td>
            </tr>
            <tr>
              <td>重設密碼後，請重新登入：</td>
            </tr>
            <tr>
              <td align="center">
                <table class="LoginEntry">
                  <tr>
                    <td class="right" >
                      <div class="chinese">姓名：</div>
                    </td>
                    <td class="left">
                      <asp:Label ID="lblSETCname" runat="server" Text=""></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td class="right" >
                      <div class="chinese">性別：</div>
                    </td>
                    <td class="left">
                      <asp:Label ID="lblSETsex" runat="server" Text=""></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">身份證號：</div>
                    </td>
                    <td class="left">
                      <asp:Label ID="lblSETidno" runat="server" Text=""></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">重設密碼：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtSETpw" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">再次確認密碼：</div>
                    </td>
                    <td class="left">
                      <asp:TextBox ID="txtSETpw2" runat="server" Width="100" MaxLength="20" TextMode="Password" autocomplete="off"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">E-mail：</td>
                    <td class="left">
                      <asp:Label ID="lblSETmail" runat="server" Text=""></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td class="right">
                      <div class="chinese">驗證碼：</div>
                    </td>
                    <td class="left" style="height:30px; width:130px;" >
                      <asp:TextBox ID="txtSETVerifyCode" runat="server" MaxLength="4"
                        Width="40px" style="vertical-align: middle;" ></asp:TextBox>
                      <img id="imgSETLoginPic" runat="server" alt="" src="YPLoginPic.aspx" style="vertical-align: middle;" />
                    </td>
                  </tr>
                  <tr>
                    <td class="left" style="text-align:center;" colspan="2">
                      <div class="chinese">
                        <asp:CheckBox ID="ckSETPrivacy" runat="server" />
                        <span id="spanSETPrivacyTC" runat="server" class="chinese">I Accept privacyxx</span>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td align="center" style="padding-top:5px;">
                <asp:Button ID="cmdReset" runat="server" Text="重設密碼" 
                  CssClass="command" onclick="cmdReset_Click" />
                &nbsp;<asp:Button ID="cmdResetCancel" runat="server" CssClass="command" 
                  onclick="cmdResetCancel_Click" Text="返回登入頁面" />
              </td>
            </tr>
          </table>
        </div>
      </asp:View>
      
    </asp:MultiView>
    <div style="text-align:center; width:550px; margin-left:0px;">
      <asp:Label ID="lblMsg" runat="server" Text="" CssClass="message"></asp:Label>
    </div>
    <asp:HiddenField ID="hidYPD00" runat="server" Visible="false" />
    <asp:HiddenField ID="hidYPDateUpdate" runat="server" Visible="false" />
  </div>

  
  </form>
</div>
</body>
</html>
