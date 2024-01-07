using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Globalization;

public partial class SH2004_admin_JobList : System.Web.UI.Page
{
  string adminID = "admin", adminPW = "admin";
  string varAdminQX="";
  int varD00 = -1;
  string dbIndex = "", dbFile = "";
  HtmlTableRow row;
  HtmlTableCell cell;
  /* "182¶ => record split 161¡ => field split 191¿ => field begin/end mark" */


  protected void Page_Load(object sender, EventArgs e)
  {
    dbIndex = Server.MapPath("../upload/system/dbIndex.txt");
    if (!File.Exists(dbIndex)) { writeTxtFile(dbIndex, ""); }
    //dbFile = Server.MapPath("../upload/system/dbFile.txt");
    //if (!File.Exists(dbFile)) { writeTxtFile(dbFile, ""); }
    

    lblMsg.InnerHtml = "";
    imgLoginPic.Src = "admLoginPic.aspx?gt=" + DateTime.Now.ToString("mmss");

    if (Session["adminCodeP"] == null) { Session["adminCodeP"] = ""; }
    Session["adminCode"] = Session["adminCodeP"];
    // Session["adminCode"] = labelVerifyCode.Text.Trim();
    // 設定驗證碼 -> 每次換頁都要重新給一個
    System.Random rnd = new Random();
    string verifycode = "";
    string strCode = "9765432ACDEFGHJKLMPQRSTUVWXY";
    for (int i = 0; i < 6; i++)
    {
      int num = rnd.Next(strCode.Length);
      verifycode += strCode.Substring(num, 1);
    }
    // labelVerifyCode.Text = verifycode;
    Session["adminCodeP"] = verifycode;
    divLogin.Visible = false; divList.Visible = false; divEdit.Visible = false;
    
    if (!IsPostBack)
    {
      divLogin.Visible = true;
    }
    else
    {
      varD00 = (int)ViewState["varD00"];
      varAdminQX = (string)ViewState["varAdminQX"];

      if ("Y".IndexOf(varAdminQX) < 0)
      {
        divLogin.Visible = true; return;
      }
      switch (hidAction.Value)
      {
        case "cmdLogin":
          if (login()) 
          { 
            divList.Visible = true; 
            showData(); 
          }
          else { divLogin.Visible = true; }
          break;
        case "cmdListSave":
          divList.Visible = true;
          if (writeTxtFile(dbIndex, hidFB.Value))
          {
            lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
              + "存檔完成!!";
          }
          showData();
          break;
        case "cmdEdit":
          varD00 = Convert.ToInt32(hidD00.Value);
          writeTxtFile(dbIndex, hidFB.Value);
          divEdit.Visible = true;
          readRecord();
          break;
        case "cmdCancel":
          divList.Visible = true;
          showData(); 
          break;
        case "cmdSave":
          if (writeRecord())
          {
            lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
              + "存檔完成!!";
          }
          divList.Visible = true;
          showData();
          break;
        default:
          break;
          
      }
    }
  }

  protected void Page_PreRender(object sender, EventArgs e)
  { // 保存 Session
    ViewState["varD00"] = (int)varD00;
    ViewState["varAdminQX"] = (string)varAdminQX;
  }

  protected override object SaveViewState()
  {
    return base.SaveViewState();
  }


  protected bool login()
  {
    bool swPass = false;
    txtAdminID.Value = txtAdminID.Value.Trim();
    txtAdminPW.Value = txtAdminPW.Value.Trim();
    txtAdminYZM.Value = txtAdminYZM.Value.Trim().ToUpper();
    if (txtAdminID.Value == adminID && txtAdminPW.Value == adminPW && txtAdminYZM.Value == Session["adminCode"].ToString())
    { swPass = true; }
    else
    { lblMsg.InnerHtml = "請重新輸入!!"; swPass = false; }
    txtAdminYZM.Value = "";
    return swPass;
  }

  protected bool showData()
  {
    bool swPass = false;
    try
    {
      string txtData = readTxtFile(dbIndex);
      hidFB.Value = txtData;
      swPass = true;
    }
    catch(Exception err) {
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "※顯示時發生錯誤：" + Server.HtmlEncode(err.Message);
      swPass = false; 
    }
    
/*      <tr>
            <td class="Left">1001</td>
            <td class="Left">1001</td>
            <td class="Center">Y</td>
            <td class="Center">2014/11/31</td>
            <td class="Center">▲ ▼ 修改</td>
          </tr>
*/
    /* "182¶ => record split 161¡ => field split 191¿ => field begin/end mark" */
    /*
    if (txtData.Length <= 0) { showNoData(); return false; }
    string[] arR = txtData.Split('¶');
    if (arR.Length <= 0) { showNoData(); return false; }
    
    // 如果標題不只一個 row, 調整一下 new Control[n] n的值
    Control[] itemTableControlsArray = new Control[1];
    itemTableControlsArray[0] = itemTable.Controls[0];
    // 清除 itemTable 後要將標題取回
    itemTable.Controls.Clear();
    for (int i = 0; i < itemTableControlsArray.Length; i++)
    {
      itemTable.Controls.Add(itemTableControlsArray[i]);
    }
    // 顯示所有資料
    for (int i = 0; i < arR.Length; i++)
    {
      string[] arF = arR[i].Split('¡');
      if (arF.Length <= 0) { break; }

    } */

    return swPass;
  }
  protected void showNoData()
  {
    // 先將目前的 Table 標題保存起來，
    // 如果標題不只一個 row, 調整一下 new Control[n] n的值
    Control[] itemTableControlsArray = new Control[1];
    itemTableControlsArray[0] = itemTable.Controls[0];
    // 清除 itemTable 後要將標題取回
    itemTable.Controls.Clear();
    for (int i = 0; i < itemTableControlsArray.Length; i++)
    {
      itemTable.Controls.Add(itemTableControlsArray[i]);
    }

    // 設定一個 row
    row = new HtmlTableRow();
    cell = new HtmlTableCell();
    cell.InnerHtml = "查詢結果：沒有資料!!";
    cell.ColSpan = itemTable.Rows[0].Cells.Count;
    row.Cells.Add(cell);
    // 加上一個 row
    itemTable.Rows.Add(row);
    return;
  }

  protected bool readRecord()
  {
    bool swPass = false;
    dbFile = Server.MapPath(string.Format("../upload/system/{0}.txt", varD00));
    if (!File.Exists(dbFile)) { writeTxtFile(dbFile, ""); }
    try
    {// "182¶ => record split 161¡ => field split 191¿ => field begin/end mark"

      string txtData = readTxtFile(dbFile);
      string[] arR = txtData.Split('¶');
      txtJOBDESCTC.Value = (arR.Length > 0 ? arR[0] : "");
      txtJOBDESCEN.Value = (arR.Length > 1 ? arR[1] : "");
      txtJOBDESCJP.Value = (arR.Length > 2 ? arR[2] : "");

      txtData = readTxtFile(dbIndex);
      arR = txtData.Split('¶');
      for (int i = 0; i < arR.Length; i++)
      {
        string[] arF = arR[i].Split('¡');
        int D00=-1;
        Int32.TryParse(arF[0],out D00);
        if (D00 == varD00)
        {
          ckJOBACT.Checked = (arF.Length > 1 ? (arF[1] == "Y" ? true : false) : false);
          txtJOBNO.Value = (arF.Length > 2 ? arF[2] : "");
          txtJOBNTC.Value = (arF.Length > 3 ? arF[3] : "");
          txtJOBNEN.Value = (arF.Length > 4 ? arF[4] : "");
          txtJOBNJP.Value = (arF.Length > 5 ? arF[5] : "");
          txtJOBDATEFROM.Value = (arF.Length > 6 ? arF[6] : "");
          txtJOBDATEEND.Value = (arF.Length > 7 ? arF[7] : "");
          break;
        }
      }

      swPass = true;
    }
    catch (Exception err)
    {
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "※讀取時發生錯誤：" + Server.HtmlEncode(err.Message);
      swPass = false;
    }
    return swPass;
  }

  protected bool writeRecord()
  {
    bool swPass = false;
    dbFile = Server.MapPath(string.Format("../upload/system/{0}.txt", varD00));
    if (!File.Exists(dbFile)) { writeTxtFile(dbFile, ""); }
    try
    {// "182¶ => record split 161¡ => field split 191¿ => field begin/end mark"
      string txtData = txtJOBDESCTC.Value.TrimEnd()
        + "¶" + txtJOBDESCEN.Value
        + "¶" + txtJOBDESCJP.Value;
      writeTxtFile(dbFile, txtData);

      txtData = readTxtFile(dbIndex);
      string[] arR = txtData.Split('¶');
      string str1 = "";
      for (int i = 0; i < arR.Length; i++)
      {
        
        string[] arF = arR[i].Split('¡');
        int D00 = -1;
        Int32.TryParse(arF[0], out D00);
        if (D00 == varD00)
        {
          DateTime date1;
          
          string strDateFrom = (DateTime.TryParse(txtJOBDATEFROM.Value, out date1) ? date1.ToString("yyyy/MM/dd") : "");
          string strDateEnd = (DateTime.TryParse(txtJOBDATEEND.Value, out date1) ? date1.ToString("yyyy/MM/dd") : "");
          int result = string.Compare(strDateFrom, strDateEnd);
          if (result > 0)
          {
            str1 = strDateFrom;
            strDateFrom = strDateEnd;
            strDateEnd = str1;
          }
          arR[i] = varD00.ToString()
            + "¡" + (ckJOBACT.Checked ? "Y" : "N")
            + "¡" + txtJOBNO.Value
            + "¡" + txtJOBNTC.Value
            + "¡" + txtJOBNEN.Value
            + "¡" + txtJOBNJP.Value
            + "¡" + strDateFrom
            + "¡" + strDateEnd
            //+ "¡" + (DateTime.TryParse(txtJOBDATEFROM.Value, out date1) ? date1.ToString("yyyy/MM/dd") : "")
            //+ "¡" + (DateTime.TryParse(txtJOBDATEEND.Value, out date1) ? date1.ToString("yyyy/MM/dd") : "")
            ;
          break;
        }
      }
      str1 = string.Join("¶", arR);
      writeTxtFile(dbIndex, str1);

      swPass = true;
    }
    catch (Exception err)
    {
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "※存檔時發生錯誤：" + Server.HtmlEncode(err.Message);
      swPass = false;
    }
    return swPass;
  }

  protected string readTxtFile(string fname)
  { // 用 SteramReader來讀取資料, 要排除掉找不到檔案的問題
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
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "※讀取時發生錯誤：" + Server.HtmlEncode(err.Message);
    }
    finally { }
    return srData;
  }

  protected bool writeTxtFile(string fname, string srData)
  {
    bool swPass = true;
    try
    {
      using (StreamWriter sw = new StreamWriter(fname))
      {
        sw.Write(srData);
      }

      swPass = true;
    }
    catch (Exception err)
    {
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "※存檔時發生錯誤：" + Server.HtmlEncode(err.Message);
    }
    finally { }
    /*
    if (swPass == true)
    {
      lblMsg.InnerHtml += (lblMsg.InnerHtml.Length > 0 ? "<br />" : "")
        + "存檔完成!!";
    }*/
    return swPass;
  }
}
