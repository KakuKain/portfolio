using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
//using System.Data;
//using System.Data.SqlClient;
// 2010.12.14 by robin
// 送出 Say Hi 次數的透明 gif 檔
public partial class admLoginPic : System.Web.UI.Page
{

  protected void Page_Load(object sender, EventArgs e)
  {
    string counter = "";
    if (Session["adminCodeP"] == null)
    {
      return;
    }
    else
    {
      counter = Session["adminCodeP"].ToString();
    }
    // counter = 128;

    // 設定繪圖
    // 定義顯示 text 內容
    string strSpace = "      ";
    string strName = counter.ToString();
    int maxBytes=6; // 顯示長度
    if (strName.Length < maxBytes)
    {
      strName = strSpace.Substring(1, (maxBytes-1) - strName.Length) + strName;
    }

    string strFontName = "Arial";// "Arial" "細明體";
    int iFontsize = 16;  // 40pt 130px
    int iWidth = 15 * strName.Length + 0;
    int iHeight = 16+4;


    // 創建一個 Bitmap 對象
    // Bitmap image = new Bitmap(300, 150);
    // Bitmap image = new Bitmap(iWidth, iHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
    Bitmap image = new Bitmap(iWidth, iHeight);
    // 生成 Graphics 對象
    Graphics g = Graphics.FromImage(image);
    // g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
    // g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighSpeed;

    Color bgColor = Color.Yellow;
    // Color bgColor = Color.FromArgb(0xFF, 0xFF, 0xFF, 0xFF);  // 0xFF, 0xFF, 0xFF, 0x99
    Color foreColor = Color.Blue;
    // Color foreColor = Color.FromArgb(0x006ebc);
    // Color foreColor = Color.FromArgb(0xFF,0x66,0x66,0x66);

    // g.FillRectangle(Brushes.LightYellow, 0, 0, 300, 150);
    // g.DrawRectangle(Pens.Red, 0, 0, 299, 149);
    Rectangle r = new Rectangle(0, 0, iWidth, iHeight);
    g.FillRectangle(new SolidBrush(bgColor), r);
    // g.FillRectangle(Brushes.LightYellow, 0, 0, iWidth, iHeight);


    // 定義字體
    // rob : FontStyle 有一個以上時, 是用 or 的方式來處理!!
    // Font font = new Font("細明體", 81, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Pixel);
    Font foreFont = new Font(strFontName, iFontsize, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Pixel);

    // g.DrawString(name, foreFont, Brushes.Blue, 10, 0);
    g.DrawString(strName, foreFont, new SolidBrush(foreColor), 2, 2);

    /*
    // 設定透明 -- 把指定背景的顏色設為透明色，但 MS 換讓它便成黑色
    image.MakeTransparent(bgColor);
    // 設定透明色後會變成黑色 要把黑色處理掉
    Bitmap transGif = MakeTransparentGif(image, Color.Black);

    // 輸出
    if (transGif != null)
    {
      Response.Clear();
      Response.ContentType = "image/GIF";
      transGif.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);
    }
    */

    /*
    // 創建 MemoryStream 對象
    MemoryStream mem = new MemoryStream();

    // 把圖片儲存到 MemoryStream 對象中
    // Response.ContentType = "image/png";
    // image.Save(mem, System.Drawing.Imaging.ImageFormat.Png);

    Response.ContentType = "Image/GIF";
    image.Save(mem, System.Drawing.Imaging.ImageFormat.Gif);

    // 把 MemoryStream 對象寫入輸出流中
    mem.WriteTo(Response.OutputStream);
    */

    // 輸出
    if (image != null)
    {
      Response.Clear();
      Response.ContentType = "image/GIF";
      image.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);
    }

    g.Dispose();
    image.Dispose();

  }

  public Bitmap MakeTransparentGif(Bitmap bitmap, Color color)
  { // 這是網上的 GIF 設定透明的方案
    byte R = color.R;
    byte G = color.G;
    byte B = color.B;

    MemoryStream fin = new MemoryStream();
    bitmap.Save(fin, System.Drawing.Imaging.ImageFormat.Gif);
    MemoryStream fout = new MemoryStream((int)fin.Length);

    int count = 0;
    byte[] buf = new byte[256];
    byte transparentIdx = 0;

    fin.Seek(0, SeekOrigin.Begin);

    //header
    count = fin.Read(buf, 0, 13);
    if ((buf[0] != 71) || (buf[1] != 73) || (buf[2] != 70)) return null; //GIF
    fout.Write(buf, 0, 13);

    int i = 0;
    if ((buf[10] & 0x80) > 0)
    {
      i = 1 << ((buf[10] & 7) + 1) == 256 ? 256 : 0;
    }

    for (; i != 0; i--)
    {
      fin.Read(buf, 0, 3);
      if ((buf[0] == R) && (buf[1] == G) && (buf[2] == B))
      {
        transparentIdx = (byte)(256 - i);
      }
      fout.Write(buf, 0, 3);
    }

    bool gcePresent = false;

    while (true)
    {
      fin.Read(buf, 0, 1);
      fout.Write(buf, 0, 1);
      if (buf[0] != 0x21) break;
      fin.Read(buf, 0, 1);
      fout.Write(buf, 0, 1);
      gcePresent = (buf[0] == 0xf9);

      while (true)
      {
        fin.Read(buf, 0, 1);
        fout.Write(buf, 0, 1);
        if (buf[0] == 0) break;
        count = buf[0];
        if (fin.Read(buf, 0, count) != count) return null;
        if (gcePresent)
        {
          if (count == 4)
          {
            buf[0] |= 0x01;
            buf[3] = transparentIdx;
          }
        }
        fout.Write(buf, 0, count);
      }
    }

    while (count > 0)
    {
      count = fin.Read(buf, 0, 1);
      fout.Write(buf, 0, 1);
    }

    fin.Close();
    fout.Flush();
    return new Bitmap(fout);
  }

}
