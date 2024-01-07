<%@ WebHandler Language="C#" Class="List" %>

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

public class List : IHttpHandler
{
  string dbIndex = "", dbFile = "";
  int result = 0;
  string str1, returnCode;
  StringBuilder sbErr = new StringBuilder();
  int i, j, i1, i2, i3, i4;
  // 182¶ => record split 161¡ => field split 191¿ => field begin/end mark
  string strSplitR = "¶", strSplitF = "¡", strSplitM = "¿";
  string[] arIn = null;
  HttpContext myContext;
  
  public void ProcessRequest(HttpContext context)
  {
    //context.Response.ContentType = "text/plain";
    //context.Response.Write("Hello World");
    dbIndex = context.Server.MapPath("../../upload/system/dbIndex.txt");
    if (!File.Exists(dbIndex)) { writeTxtFile(dbIndex, ""); }
    myContext = context;

    string strLang = "c";
    if (context.Request["Lang"] != null)
    {
      strLang = context.Request["Lang"].ToString().ToLower();
    }

    StringBuilder sb1 = new StringBuilder();
    string dateNow = DateTime.Now.ToString("yyyy/MM/dd");
    str1 = readTxtFile(dbIndex);
    string[] arR = str1.Split(strSplitR.ToCharArray());
    for (i = 0; i < arR.Length; i++)
    {
      if (arR[i].Length > 0)
      {
        string[] arF = arR[i].Split(strSplitF.ToCharArray());
        string D00 = (arF.Length > 0 ? arF[0] : "");
        string FBACT = (arF.Length > 1 ? arF[1] : "");
        string FBNO = (arF.Length > 2 ? arF[2] : "");
        string FBNC = (arF.Length > 3 ? arF[3] : "");
        string FBNE = (arF.Length > 4 ? arF[4] : "");
        string FBNJ = (arF.Length > 5 ? arF[5] : "");
        string FBDATEFROM = (arF.Length > 6 ? arF[6] : "");
        string FBDATEEND = (arF.Length > 7 ? arF[7] : "");
        if (FBACT == "Y" && string.Compare(FBDATEFROM, dateNow) <= 0
          && string.Compare(dateNow, FBDATEEND) <= 0)
        {
          sb1.Append((sb1.Length > 0 ? strSplitF : "")
            + D00 + strSplitM
            + FBNO + strSplitM
            + (strLang == "e" ? FBNE : (strLang == "j" ? FBNJ : FBNC)) + strSplitM
            + FBDATEFROM + strSplitM
            + FBDATEEND + strSplitM
            );
        }
        else
        {
          /*
          sb1.Append(string.Format(" {0} {1} {2} {3},", i,FBACT
            , string.Compare(FBDATEFROM, dateNow), string.Compare(dateNow, FBDATEEND)));
          */
        }
      }
    }
    ReturnMsg("OK" + strSplitR + sb1.ToString(), "");

    // 防止頁面緩存
    context.Response.ClearContent();
    context.Response.Cache.SetNoStore();
    context.Response.CacheControl = "no-cache";
    context.Response.ContentType = "text/plain";
    context.Response.Write(returnCode + strSplitR
        + sbErr.ToString() + strSplitR
        );
    context.Response.Flush();
    context.Response.End();
  }

  public bool IsReusable
  {
    get
    {
      return false;
    }
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
      ReturnMsg("ERR", "※讀取時發生錯誤：" + myContext.Server.HtmlEncode(err.Message));
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
      ReturnMsg("ERR", "※存檔時發生錯誤：" + myContext.Server.HtmlEncode(err.Message));
    }
    finally { }
    return swPass;
  }

  public void ReturnMsg(string code, string msg)
  {
    returnCode = code;
    if (msg.Length > 0)
    {
      sbErr.Append((sbErr.Length > 0 ? "<br />" : "")
        + msg
        );
    }
  }

}