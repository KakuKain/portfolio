using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Globalization;

namespace SC
{
  public partial class YPresume9 : System.Web.UI.Page
  {
    CultureInfo cultureInfo = new CultureInfo("zh-TW");
    SqlConnection conn1 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString.ToString());
    SqlConnection conn2 = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString.ToString());
    SqlDataReader rd1;
    SqlCommand cmd1;
    string strSqlCmd;
    int result;
    HtmlTableRow row;
    HtmlTableCell cell;
    string YPmode;           // 履歷表的模式 READ已存檔/EDIT編輯中/CHECK審核中,由 master page 中處理 session["YPMODE"], page 中讀入
    string YPname;
    int YPD00;

    protected void Page_Load(object sender, EventArgs e)
    {
      Response.Cache.SetNoStore();
      Response.CacheControl = "no-cache";

      // 檢查目前的 Session 狀態;
      Master.checkSession();

      // 取得目前的值
      YPD00 = (int)Session["YPD00"];
      YPname = Session["YPNAME"].ToString();
      // 取得目前的 YPMODE : EDIT / READ / (x)CHECK
      YPmode = Session["YPMODE"].ToString();

      // 設定目前的 menu 選單 h, v
      Master.SetMenuSelected(2, 9);

      lblMsg.Text = "";

      readTxt_ZYSX(); // 注意事項
      ShowData();

      if (IsPostBack)
      {
        // 在 PostBack 時，查看是否有傳入參數，若是要處理的參數，則去處理
        string robArg1 = "", robArg2 = "";
        if (Request.Form["__robArg1"] != null)
        { robArg1 = Request.Form["__robArg1"].ToString(); }
        if (Request.Form["__robArg2"] != null)
        { robArg2 = Request.Form["__robArg2"].ToString(); }
        //lblMsg.Text = "robArg1 = " + robArg1 + "<br>robArg2 = " + robArg2;
        //return;

        switch (robArg1)
        {
          case "prgProc": // 主資料 處理
                          //load_prgProc(robArg2);
            break;
          case "prgPager": // pager 處理
                           //load_prgPager(robArg2);
            break;
          case "prgLogPage": // pager 處理
                             //load_prgPager(robArg2);
            Response.Redirect("YPresume" + robArg2 + ".aspx");
            break;
          default:
            break;
        }


      }
    }

    protected void ShowData()
    { // 顯示目前的資料
      cmdSave.Enabled = false;
      cmdSave.Visible = true;
      cmdRead.Visible = false;

      // 讀取 應徵者主檔 YPF1
      // 驗證輸入履歷表資料
      // 每一頁的存檔都有很嚴謹的驗證規則
      //V1. 履歷表-基本資料 : YPBIRDATE出生日期, YPMAIL MAIL,YPHADDR戶籍地址,YPADDR現居地址,YPCEL手機
      //V2. 履歷表-學歷     : YPXL 至少要有一個
      // 3. 履歷表-工作經歷 : 可以沒有工作經歷
      // 4. 履歷表-專長及證照: 可以沒有
      //v5. 履歷表-在校成績 : YPZXCJ 至少要有一個
      // 6. 履歷表-家庭狀況 : 無此項
      //V7. 履歷表-自傳 : YPZZ  一定要有
      //V8. 履歷表-上傳照片 : YPPICFILE 一定要有

      string strErr = "";
      string str1 = "";
      bool swPass = true;
      // 讀取 應徵者主檔 YPF1
      try
      {
        tbLog.Controls.Clear();

        strSqlCmd = @"
SELECT 
replace(isnull(convert(nvarchar(10),[YPF1].[YPBIRDATE],120),''),'-','/') AS [YPBIRDATE],
isnull([YPF1].[YPHADDR],'') AS [YPHADDR], 
isnull([YPF1].[YPADDR],'') AS [YPADDR], 
isnull([YPF1].[YPCEL],'') AS [YPCEL], 
isnull([YPF1].[YPMAIL],'') AS [YPMAIL], 

isnull([YPF1].[YPXL],'') AS [YPXL],
isnull([YPF1].[YPZXCJ],'') AS [YPZXCJ],
isnull([YPF1].[YPZZ],'') AS [YPZZ],
isnull([YPF1].[YPPICFILE],'') AS [YPPICFILE],

[YPD00] 
FROM [YPF1] 
WHERE [YPD00] = @YPD00
;";
        // 2011.12.22 bug !!
        cmd1 = new SqlCommand(strSqlCmd, conn1);
        cmd1.CommandType = CommandType.Text;
        cmd1.Parameters.AddWithValue("@YPD00", YPD00);

        conn1.Open();
        rd1 = cmd1.ExecuteReader();
        if (rd1.Read())
        { // 檢查履歷中的各頁代表性欄位
          // 1. 履歷表-基本資料:YPBIRDATE出生日期, YPMAIL MAIL,YPHADDR戶籍地址,YPADDR現居地址,YPCEL手機
          strErr = "";
          if (rd1["YPBIRDATE"].ToString().Length <= 0)
          { strErr += " 出生日期"; }
          if (rd1["YPHADDR"].ToString().Length <= 0)
          { strErr += " 戶籍地址"; }
          if (rd1["YPADDR"].ToString().Length <= 0)
          { strErr += " 現居地址"; }
          if (rd1["YPMAIL"].ToString().Length <= 0)
          { strErr += " E-mail"; }
          if (rd1["YPCEL"].ToString().Length <= 0)
          { strErr += " 手機"; }

          if (strErr.Length > 0 && YPmode == "EDIT")
          {
            strErr = "【<label class=\"opCmd\" onmousemove=\"this.className='opCmdMsOver'\" onmouseout=\"this.className='opCmd';\" onclick=\"__robPostBack('prgLogPage','1')\">基本資料</label>】"
              + " 中未填寫的欄位：<br />"
              + strErr;
            //cell.InnerHtml += "<a class=\"tableOpCommand\" href=\"javascript:__robPostBack('prgPager','1')\">|&lt;</a>";

            // 設定一個 row
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "left");
            cell.InnerHtml = strErr;
            row.Cells.Add(cell);
            // 加上一個 row
            tbLog.Rows.Add(row);
            swPass = false;
          }

          // 2. 履歷表-學歷 : 至少要有一個
          strErr = "";
          if (rd1["YPXL"].ToString().Length <= 0)
          { strErr += " 至少要填寫一項"; }
          if (strErr.Length > 0 && YPmode == "EDIT")
          {
            strErr = "【<label class=\"opCmd\" onmousemove=\"this.className='opCmdMsOver'\" onmouseout=\"this.className='opCmd';\" onclick=\"__robPostBack('prgLogPage','2')\">學歷</label>】"
              + " 中的資料不完整：<br />"
              + strErr;
            //cell.InnerHtml += "<a class=\"tableOpCommand\" href=\"javascript:__robPostBack('prgPager','1')\">|&lt;</a>";

            // 設定一個 row
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "left");
            cell.InnerHtml = strErr;
            row.Cells.Add(cell);
            // 加上一個 row
            tbLog.Rows.Add(row);
            swPass = false;
          }

          // 6. 在校成績 : YPZXCJ 至少要有一個
          strErr = "";
          if (rd1["YPZXCJ"].ToString().Length <= 0)
          { strErr += " 至少要填寫一項"; }
          if (strErr.Length > 0 && YPmode == "EDIT")
          {
            strErr = "【<label class=\"opCmd\" onmousemove=\"this.className='opCmdMsOver'\" onmouseout=\"this.className='opCmd';\" onclick=\"__robPostBack('prgLogPage','5')\">在校成績</label>】"
              + " 中的資料不完整：<br />"
              + strErr;
            //cell.InnerHtml += "<a class=\"tableOpCommand\" href=\"javascript:__robPostBack('prgPager','1')\">|&lt;</a>";

            // 設定一個 row
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "left");
            cell.InnerHtml = strErr;
            row.Cells.Add(cell);
            // 加上一個 row
            tbLog.Rows.Add(row);
            swPass = false;
          }

          // 7. 自傳 : YPZZ
          strErr = "";
          if (rd1["YPZZ"].ToString().Length <= 0)
          { strErr += " 不可為空白"; }
          if (strErr.Length > 0 && YPmode == "EDIT")
          {
            strErr = "【<label class=\"opCmd\" onmousemove=\"this.className='opCmdMsOver'\" onmouseout=\"this.className='opCmd';\" onclick=\"__robPostBack('prgLogPage','7')\">自傳</label>】"
              + " 中的資料未填寫：<br />"
              //+ strErr
              ;
            //cell.InnerHtml += "<a class=\"tableOpCommand\" href=\"javascript:__robPostBack('prgPager','1')\">|&lt;</a>";

            // 設定一個 row
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "left");
            cell.InnerHtml = strErr;
            row.Cells.Add(cell);
            // 加上一個 row
            tbLog.Rows.Add(row);
            swPass = false;
          }

          // 8. 履歷表-上傳照片 : YPPICFILE 一定要有
          strErr = "";
          if (rd1["YPPICFILE"].ToString().Length <= 0)
          { strErr += " 上傳照片 "; }
          if (strErr.Length > 0 && YPmode == "EDIT")
          {
            strErr = "【<label class=\"opCmd\" onmousemove=\"this.className='opCmdMsOver'\" onmouseout=\"this.className='opCmd';\" onclick=\"__robPostBack('prgLogPage','8')\">上傳照片</label>】"
              + " 未上傳照片<br />";
            //+ strErr;
            //cell.InnerHtml += "<a class=\"tableOpCommand\" href=\"javascript:__robPostBack('prgPager','1')\">|&lt;</a>";

            // 設定一個 row
            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.Attributes.Add("class", "left");
            cell.InnerHtml = strErr;
            row.Cells.Add(cell);
            // 加上一個 row
            tbLog.Rows.Add(row);
            swPass = false;
          }

          // 確認所有資料才算成功完成
          // if (strErr == "") { swPass = true; }
        }
        else
        {
          lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
            + "讀取資料時發生錯誤!!";
        }
        rd1.Close();
      }
      catch (Exception err)
      {
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
          + "※讀取處理資料時，發生錯誤：" + Server.HtmlEncode(err.Message);
      }
      finally
      {
        conn1.Close();
      }
      /*
      if (swPass == false)
      {
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
          + "履歷表中 " + strErr + " 資料不完整，<br />請務必填寫完整後才可提交。";
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
          + "※處理資料時，發生錯誤：" + Server.HtmlEncode(err.Message);
        return;
      }
       * */

      // 輸入欄位, 選項性欄位設定
      // checkEditField();
      // 正確讀到資料，才可操作
      if (swPass && YPmode == "EDIT") { cmdSave.Enabled = true; }
      else { cmdSave.Enabled = false; }

      // 如果是 EDIT mode 才要加上操作, 或是讀取資料錯誤
      if (YPmode != "EDIT" || !swPass)
      {
        // 將 divbody 中所有的項目都 disable
        // setControlToNonEditMode(divbody);
      }
      if (YPmode == "EDIT")
      {
        cmdSave.Visible = true;
        cmdRead.Visible = false;
      }
      if (YPmode == "READ")
      {
        lblMsg.Text += "您已將履歷表提交，若要修改，請重新點選【我要修改履歷表】。";
        cmdSave.Visible = false;
        cmdRead.Visible = true;
      }
      if (YPmode == "CHECK")
      {
        /* 2012.8.31 應徵職位後，仍要能修改履歷表
        lblMsg.Text += "您已提交的履歷表正在審查中，暫無法進行修改。";
        cmdSave.Visible = false;
        cmdRead.Visible = false; */
        lblMsg.Text += "您已將履歷表提交並在審查中，若要修改，請重新點選【我要修改履歷表】。";
        cmdSave.Visible = false;
        cmdRead.Visible = true;
      }
    }

    protected void cmdRead_Click(object sender, EventArgs e)
    {
      // 如果要重新修改履歷表, 則設定為 [編輯中], YPmode 將由 "READ" 轉為 "EDIT"
      bool swPass = false;
      try
      {
        string strSqlCmd = @"
UPDATE [YPF1] SET 
[YPACT]='Y',
[IPUPDATE]=@IP,
[UNAMEUPDATE]=@UNAME, 
[DATEUPDATE]=getdate(),
[IPLASTAPPLY]=null,
[DATELASTAPPLY]=null
WHERE [YPD00]=@YPD00 
;";
        // strSqlCmd += "WHERE [YPD00]=@YPD00 AND REPLACE(ISNULL(SUBSTRING(CONVERT(NVARCHAR(50),[DATEUPDATE],120),1,19),''),'-','/')=@DATEUPDATE ; ";
        // strSqlCmd += "SELECT @@ROWCOUNT AS [ROWS];";

        SqlCommand cmd1 = new SqlCommand(strSqlCmd, conn1);
        cmd1.CommandType = CommandType.Text;
        cmd1.Parameters.AddWithValue("@YPD00", YPD00);
        cmd1.Parameters.AddWithValue("@UNAME", YPname);
        cmd1.Parameters.AddWithValue("@IP", Request.ServerVariables["REMOTE_ADDR"].ToString());
        // cmd1.Parameters.AddWithValue("@DATEUPDATE", hidYPDateUpdate.Value);

        conn1.Open();
        int rows = cmd1.ExecuteNonQuery();
        if (rows == 1)
        { // 資料已更改
          swPass = true;
        }
        else
        {
          lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
              + "設定重新修改履歷表時發生錯誤!! (筆數=" + rows.ToString() + ")";
        }
      }
      catch (Exception err)
      {
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
          + "※設定重新修改履歷表時，發生處理錯誤：" + Server.HtmlEncode(err.Message);
      }
      finally
      {
        conn1.Close();
      }
      if (swPass == false) { return; }
      // 更新完成
      YPmode = "EDIT";

      // 設定目前的 YPMODE : EDIT / READ / (x)CHECK
      Master.SetYPmode(YPmode);

      // 重新顯示資料，才能改變 EDIT COMMAND
      lblMsg.Text = "";
      ShowData();
    }

    protected void cmdSave_Click(object sender, EventArgs e)
    {
      // 設定提交日期
      string dateApply = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
      bool swPass = false;

      try
      {
        // 資料提交處理(1)：應徵者主檔 YPF1 : 新增一筆提交日期
        swPass = false;
        conn1.Open();
        /*
        declare @firstApply datetime;
        set @firstApply=(select [DATEFIRSTAPPLY] from [YPF1] where [YPD00]=@YPD00);
        if (@firstApply is null)
        begin
          update [YPF1] set [DATEFIRSTAPPLY]=@DATEAPPLY where [YPD00]=@YPD00);
        end
        */
        // 2012.8.12 若提交時, 檢查是否有應徵職位, 來設定 2已提交 3審查中
        /*
declare @iYJ int, @sYPACT nvarchar(1);
set @iYJ = (select count(YJD00) from [YJF1] where [YPD00]=@YPD00);
if (@iYJ>0) 
  set @sYPACT='3' 
else 
  set @sYPACT='2';
         */
        strSqlCmd = @"
UPDATE [YPF1] SET
[YPACT]='T', 
[DATEFIRSTAPPLY]=(case when [DATEFIRSTAPPLY] is null then @DATEAPPLY else [DATEFIRSTAPPLY] end),
[IPFIRSTAPPLY]=(case when [IPFIRSTAPPLY] is null then @IP else [IPFIRSTAPPLY] end),
[DATELASTAPPLY]=@DATEAPPLY,
[IPLASTAPPLY]=@IP,
[IPUPDATE]=@IP,
[DATEUPDATE]=@DATEAPPLY,
[UNAMEUPDATE]=@UNAME
WHERE [YPD00]=@YPD00;
";
        cmd1 = new SqlCommand(strSqlCmd, conn1);
        cmd1.CommandText = strSqlCmd;
        cmd1.CommandType = CommandType.Text;
        cmd1.Parameters.Clear();
        cmd1.Parameters.AddWithValue("@YPD00", YPD00);
        cmd1.Parameters.AddWithValue("@UNAME", YPname);
        cmd1.Parameters.AddWithValue("@IP", Request.ServerVariables["REMOTE_ADDR"].ToString());
        cmd1.Parameters.AddWithValue("@DATEAPPLY", dateApply);
        swPass = false;
        int rows = cmd1.ExecuteNonQuery();
        if (rows == 1)
        { // 資料已更改
          swPass = true;
        }
        else
        {
          lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
              + "資料提交處理時發生錯誤!! (筆數=" + rows.ToString() + ")";
        }
      }
      catch (Exception err)
      {
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
          + "※資料提交處理時發生錯誤，發生錯誤：" + Server.HtmlEncode(err.Message);
      }
      finally
      {
        conn1.Close();
      }
      if (swPass == true)
      {
        lblMsg.Text += (lblMsg.Text.Length > 0 ? "<br />" : "")
            + "資料提交完成!!";
        YPmode = "READ";
        Session["YPMODE"] = YPmode;
        Response.Redirect("YPmemb1.aspx");
      }
      return;

    }

    protected void readTxt_ZYSX()
    { // 用 SteramReader來讀取資料, 要排除掉找不到檔案的問題
      // string fname = Server.MapPath("~/admin/robReditorV100.inc");
      string fname = Server.MapPath("upload/system/履歷表提交注意事項.txt");
      string srData = "";
      try
      {
        using (StreamReader sr = new StreamReader(fname))
        {
          srData = sr.ReadToEnd();
        }
      }
      catch (Exception err)
      {
        lblMsg.Text = "錯誤!" + Server.HtmlEncode(err.Message);
      }
      finally { }
      divZYSX.InnerHtml = robClass1.txtHTML(srData);

      // 2012.5.21 加上操作步驟
      fname = Server.MapPath("upload/system/履歷表提交注意事項1.txt");
      srData = "";
      try
      {
        using (StreamReader sr = new StreamReader(fname))
        {
          srData = sr.ReadToEnd();
        }
      }
      catch (Exception err)
      {
        lblMsg.Text = "錯誤!" + Server.HtmlEncode(err.Message);
      }
      finally { }
      tdNotice.InnerHtml = robClass1.txtHTML(srData);

    }


  }
}