<%@ Page Language="C#" AutoEventWireup="true" CodeFile="robCalendHM.aspx.cs" Inherits="admin_css_robCalendHM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <link href="robCalendHMV200.css" type="text/css" rel="Stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <input type="text" onclick="robCalendHM_setDate(this);" />
  </div>
  </form>
<%-- 2011.12.16 robCalendHM v2.0 for IE6/IE7/IE8/FireFox/Chrome **beg** 
     2011.12.06 rob 更改 位置的選項, 以及透過 this 傳入, 而不是傳入 this.id 
     2011.22.24 rob 測試時有加上 height:600px;, 這在 IE6/IE7 會顯示 時/分的外框
     <div id="robCalendHMDiv" style="border:solid 1px #ccccFF;position: absolute; z-index: 990; top: 0px; left: 0px; width: 100%;  visibility:hidden; overflow:hidden; height:600px; " >
     上線時要去掉 height:600px;, 這在 IE6/IE7 會顯示 時/分的外框
     <div id="robCalendHMDiv" style="border:solid 1px #ccccFF;position: absolute; z-index: 990; top: 0px; left: 0px; width: 100%;  visibility:hidden; overflow:hidden; " >
     --%>  
  <iframe id="robCalendHMIFrame" style="position: absolute; z-index: 980; top: 0px; left: 0px; width: 100%; height:600px;  visibility:hidden; overflow:hidden; filter:alpha(opacity=50);-moz-opacity:.5;opacity: 0.5;"></iframe>
   <div id="robCalendHMDiv" style="border:solid 1px #ccccFF;position: absolute; z-index: 990; top: 0px; left: 0px; width: 100%;  visibility:hidden; overflow:hidden; height:600px; " >
    <div id="robCalendHMInBox" style="position: absolute; top: 0px; left: 0px; background-color: #EEEEEE;
      border: 1px solid #0000FF; font-family: Arial, Helvetica, sans-serif; font-size: 12px;
      letter-spacing: 1px; padding: 5px; width: 400px; margin-left: auto; margin-right: auto;
      z-index:999; ">
      <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: auto; margin-right: auto;">
        <tr>
          <td id="robCalendHMGap1" style="width: 6px;"></td>
          <td id="robCalendHMTdHour" style="vertical-align: top;">
            <table id="robCalendHMHourTable" cellpadding="0" cellspacing="0" class="robCalendHMStyle_table">
              <tr><td colspan="2" class="robCalendHMStyle_HourTableTdTitle">時</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTdSelected" onclick="robCalendHM_selHour(0);">0</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(12);">12</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(1);">1</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(13);">13</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(2);">2</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(14);">14</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(3);">3</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(15);">15</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(4);">4</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(16);">16</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(5);">5</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(17);">17</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(6);">6</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(18);">18</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(7);">7</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(19);">19</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(8);">8</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(20);">20</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(9);">9</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(21);">21</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(10);">10</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(22);">22</td></tr>
              <tr><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(11);">11</td><td class="robCalendHMStyle_HourTableTd" onclick="robCalendHM_selHour(23);">23</td></tr>
            </table>
          </td>
          <td id="robCalendHMGap2" style="width: 6px;"></td>
          <td id="robCalendHMTdMinute" style="vertical-align: top;">
            <table id="robCalendHMMinuteTable" cellpadding="0" cellspacing="0" class="robCalendHMStyle_table">
              <tr><td colspan="2" class="robCalendHMStyle_MinuteTableTdTitle">分</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,0);">0</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,0);">0</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,1);">1</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,1);">1</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,2);">2</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,2);">2</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,3);">3</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,3);">3</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,4);">4</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,4);">4</td></tr>
              <tr><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(1,5);">5</td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,5);">5</td></tr>
              <tr><td></td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,6);">6</td></tr>
              <tr><td></td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,7);">7</td></tr>
              <tr><td></td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,8);">8</td></tr>
              <tr><td></td><td class="robCalendHMStyle_MinuteTableTd" onclick="robCalendHM_selMinute(2,9);">9</td></tr>
            </table>
          </td>
          <td id="robCalendHMGap3" style="width: 6px;"></td>
          <td id="robCalendHMTdDate" style="vertical-align: top;">
            <table id="robCalendHMDateTable" cellpadding="0" cellspacing="0" class="robCalendHMStyle_table">
              <tr><td style="height:120px; width:140px;">&nbsp;</td></tr>
              <tr>
                <td style="text-align: center;">
                <input type="button" value="轉至  今日時分" id="robCalendHMCmdToday" onclick="robCalendHM_Today();" 
                  style="font-family: Arial, 細明體, Helvetica, sans-serif; font-size: 12px; color: #006699; border: 1px solid #006699; background-color: #D2E1F0; padding-top: auto; padding-bottom: auto; height:28px; width: 140px; cursor:pointer;" />
                  <br /><br /><br />
                  <input type="button" value="" id="robCalendHMCmdSet" onclick="robCalendHM_returnDate();"
                  style="font-family: Arial, 細明體, Helvetica, sans-serif; font-size: 12px; color: #006699; border: 1px solid #006699; background-color: #D2E1F0; padding-top: auto; padding-bottom: auto; height:28px; width: 140px; cursor:pointer;" />
                </td>
              </tr>
            </table>
          </td>
          <td id="robCalendHMGap4" style="width: 6px;"></td>
        </tr>
      </table>
    </div>
  </div>
  <script type="text/javascript">
    /**************** 
    * 傳入 page HTML tag id, 並以期目前的內容來設定日曆的顯示日期
    *****************/
    function robCalendHM_setDate(id1) {
      // 由程式呼叫： onclick="robCalendHM_setDate(this.id);"
      // 如果找不到該 object id , 則離開
      //var obj1 = document.getElementById(id1);
      var obj1 = id1;
      if (obj1 == undefined || obj1 == null || obj1 == "") { return false; }

      // 重設 div 高度, 將遮蔽高度設為整個內容高
      // document.getElementById("robCalendHMDiv").style.height = (document.body.scrollHeight + 20) + "px";
      //var setStyleHeight = (document.body.clientHeight < 500 ? 500 : document.body.clientHeight);
      //document.getElementById("robCalendHMIFrame").style.height = setStyleHeight + "px";
      //document.getElementById("robCalendHMDiv").style.height = setStyleHeight + "px";
      
      // var i1 = (document.body.scrollWidth - document.getElementById("robCalendHMInBox").width) / 2;

      // 設定 Calendar 的顯示位置, 水平置中, 高度中央與物件齊平
      // document.getElementById("robCalendHMInBox").style.left = (document.body.scrollWidth - document.getElementById("robCalendHMInBox").scrollWidth) / 2 + "px";
      var ix = (document.body.scrollWidth - document.getElementById("robCalendHMInBox").scrollWidth) / 2;
      if (ix > 20) { ix = ix - 20; }
      var iy = obj1.offsetTop - (document.getElementById("robCalendHMInBox").scrollHeight / 2);
      if (iy < 20) { iy = 20; }
      //document.getElementById("robCalendHMInBox").style.top = iy + "px";
      document.getElementById("robCalendHMInBox").style.top = "20px";
      document.getElementById("robCalendHMInBox").style.left = "20px";

      // 重設 div 高度, 設為 InBox 的 -20
      var setStylei = document.getElementById("robCalendHMInBox").offsetHeight + 40;
      document.getElementById("robCalendHMIFrame").style.height = setStylei + "px";
      document.getElementById("robCalendHMDiv").style.height = setStylei + "px";
      setStylei = document.getElementById("robCalendHMInBox").offsetWidth + 40;
      document.getElementById("robCalendHMIFrame").style.width = setStylei + "px";
      document.getElementById("robCalendHMDiv").style.width = setStylei + "px";

      // 2011.12.6 robin 修正
      // 取得目前 object 的位置, 往回找到 position=absolute 為止
      var sID, sTag;
      ix = obj1.offsetLeft;
      iy = obj1.offsetTop;
      var obj0 = obj1;
      while (obj0 = obj0.offsetParent) {
        if ((obj0.style.position == "absolute" || obj0.style.position == "relative")
             && obj0.tagName == "DIV") {
          if ((iy + document.getElementById("robCalendHMDiv").offsetHeight) > obj0.offsetHeight) {
            iy = (obj0.offsetHeight ? obj0.offsetHeight : 0)
               - (document.getElementById("robCalendHMDiv").offsetHeight ? document.getElementById("robCalendHMDiv").offsetHeight : 0)
               - 20;
            iy = (iy < 0 ? 0 : iy);
          }
          if ((ix + document.getElementById("robCalendHMDiv").offsetWidth) > obj0.offsetWidth) {
            ix = (obj0.offsetWidth ? obj0.offsetWidth : 0)
               - (document.getElementById("robCalendHMDiv").offsetWidth ? document.getElementById("robCalendHMDiv").offsetWidth : 0)
               - 20;
            ix = (ix < 0 ? 0 : ix);
          }
          break;
        }
        sID += "id=" + obj0.id + " tagName=" + obj0.tagName
            + " Top=" + obj0.offsetTop + " Left=" + obj0.offsetLeft + "\n"
            + " ix=" + ix + " iy=" + iy + "\n"
            ;
        iy += obj0.offsetTop;
        ix += obj0.offsetLeft;
      }
      //alert(sID);
      //setStylei = document.getElementById("robCalendHMInBox").offsetTop - 20;
      document.getElementById("robCalendHMIFrame").style.top = iy + "px";
      document.getElementById("robCalendHMDiv").style.top = iy + "px";
      //setStylei = document.getElementById("robCalendHMInBox").offsetLeft - 20;
      document.getElementById("robCalendHMIFrame").style.left = ix + "px";
      document.getElementById("robCalendHMDiv").style.left = ix + "px";
      

      // 試著取出 value 或 innerHTML 的值
      var strDate = "";
      if (obj1.value != undefined) { strDate = obj1.value; }
      else if (obj1.innerHTML != undefined) { strDate = obj1.innerHTML; }

      // 取得傳入的資料
      robCalendHM_arrDate[6] = id1;

      // 轉換時間格式
      var arHM = strDate.split(":");
      var iH = 0;
      var iM = 0;
      if (arHM.length >= 2) {
        iH = parseInt(arHM[0]);
        iM = parseInt(arHM[1]);
      }
      iH = Math.min(iH, 23);
      iM = Math.min(iM, 59);

      var date1 = new Date();
      date1.setHours(iH, iM, 0, 0);
      // debug 用: 看一下轉出的值
      // document.getElementById("robCalendHMCmdToday").setAttribute("value", i);
      // 如果轉出不是正確的值，預設為今天的日期 => 時間不預設為目前的時間
      if (iH<=0 && iM<=0 && false) { robCalendHM_Today(); }
      else {
        // Calendar 顯示取入的日期
        var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate()
                   + " " + date1.getHours() + ":" + date1.getMinutes() + ":00";
        robCalendHM_Date(str1);
      }
      // 顯示 Calendar 於網頁上
      document.getElementById("robCalendHMIFrame").style.overflow = "";
      document.getElementById("robCalendHMIFrame").style.visibility = "visible";
      
      document.getElementById("robCalendHMDiv").style.overflow = "";
      document.getElementById("robCalendHMDiv").style.visibility = "visible";
      document.body.onscroll = "retrun false;";
      // visibility: visible
      //span1.style.visibility = "visible";
      //span1.style.visibility = "hidden";
    }

    /**************** 
    * 傳回日曆中所選定的日期
    * [設定日期] button 呼叫此函數
    *****************/
    function robCalendHM_returnDate() {
      // 取回要傳回的 id
      var id1 = robCalendHM_arrDate[6];
      if (id1) {
        var obj1 = id1;
        var date1 = new Date(Date.parse(robCalendHM_arrDate[5]));
        var iH = date1.getHours();
        var iM = date1.getMinutes();
        var str1 = (iH < 10 ? "0" : "") + iH + ":" + (iM < 10 ? "0" : "") + iM;
        if (obj1.value != undefined) { obj1.value = str1; }
        else if (obj1.innerHTML != undefined) { obj1.innerHTML = str1; }
      }
      document.getElementById("robCalendHMIFrame").style.visibility = "hidden";
      document.getElementById("robCalendHMDiv").style.visibility = "hidden";
      document.body.onscroll = "";
    }

    /**************** 
    * 設定日曆為今天日期
    * [今日] button 呼叫此函數
    *****************/
    function robCalendHM_Today() {
      // 設定今日的日期變數
      var date1 = new Date();
      var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate()
                 + " " + date1.getHours() + ":" + date1.getMinutes() + ":00";
      //var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/1";
      robCalendHM_Date(str1);
    }

    /**************** 
    * 顯示日曆內容
    *  傳入參數：日期字串
    *  內部處理用
    *****************/
    function robCalendHM_Date(strDate) {
      // 設定顯示日期
      var dateNow = new Date();
      var date1 = new Date(Date.parse(strDate));
      // alert(date1.toTimeString()+"\n"+strDate);
      var obj1 = "";
      var str1 = "";
      // 設定 時
      obj1 = document.getElementById("robCalendHMHourTable");
      var iH = date1.getHours();
      for (var i = 1; i <= 12; i++) {
        robCalendHMSetStyle_HourTd(obj1.rows[i].cells[0], (iH==(i-1)?"select":"unselect"));
        robCalendHMSetStyle_HourTd(obj1.rows[i].cells[1], (iH==(i-1+12)?"select":"unselect"));
      }
      
      // 設定 分
      obj1 = document.getElementById("robCalendHMMinuteTable");
      var iM = date1.getMinutes();
      var iM1 = Math.floor(iM/10);
      var iM2 = iM%10;
      for (var i = 1; i <= 10; i++) {
        if (i <= 6) {
          robCalendHMSetStyle_MinuteTd(obj1.rows[i].cells[0], (iM1+1 == i ? "select" : "unselect"));
        }
        robCalendHMSetStyle_MinuteTd(obj1.rows[i].cells[1], (iM2+1 == i ? "select" : "unselect"));
      }
      
      // 今天日期
      var iyear = date1.getFullYear();
      var imonth = date1.getMonth()+1;
      var idate = date1.getDate();

      str1 = iyear + "/" + imonth + "/" + idate 
           + " " + (iH < 10 ? "0" : "") + iH + ":" + (iM < 10 ? "0" : "") + iM;
      str2 = (iH < 10 ? "0" : "") + iH + ":" + (iM < 10 ? "0" : "") + iM;
      document.getElementById("robCalendHMCmdSet").setAttribute("value", "傳回 時間:" + str2);
      robCalendHM_arrDate[0] = iH;
      robCalendHM_arrDate[1] = iM;
      robCalendHM_arrDate[2] = 0;
      robCalendHM_arrDate[3] = 0;
      robCalendHM_arrDate[4] = idate;
      robCalendHM_arrDate[5] = str1;
    }


    /**************** 
    * 點選日曆中的 月數 的 td 
    *  傳入參數：日期中月的數值
    *  內部處理用
    *****************/
    function robCalendHM_selHour(iH) {
      var date1 = new Date(robCalendHM_arrDate[5]);
      var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate()
                 + " " + iH.toString() + ":" + date1.getMinutes() + ":00";
      robCalendHM_Date(str1);
    }
    /**************** 
    * 點選日曆中的 分數 的 td 
    *  傳入參數：年的類別數值(1,2表示第幾位數), 日期中分的數值
    *  內部處理用
    *****************/
    function robCalendHM_selMinute(i1,i2) {
      var date1 = new Date(robCalendHM_arrDate[5]);
      var iM = date1.getMinutes();
      var iM1 = Math.floor(iM / 10);
      var iM2 = iM % 10;
      if (i1 == 1) { iM1 = i2; }
      else { iM2 = i2; }
      var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate()
                 + " " + date1.getHours() + ":" + iM1.toString() + iM2.toString() + ":00";
      robCalendHM_Date(str1);
    }
    /**************** 
    * 初始設定並建立日曆的 HTML div table tag 到 page 中 
    *  內部處理用
    *****************/
    function robCalendHM_init() {
      // 設定 CalendarDiv
      robCalendHM = document.getElementById("robCalendHMDiv");
      //robCalendHM.style.visibility = "hidden";
      //robCalendHM.style.visibility = "visible";
      //robCalendHM.style.visibility = "hidden";
      // 顯示日期
      date1 = new Date();
      var iH = date1.getHours();
      var iM = date1.getMinutes();
      str2 = (iH < 10 ? "0" : "") + iH + ":" + (iM < 10 ? "0" : "") + iM;
      document.getElementById("robCalendHMCmdSet").value = "傳回 時分:" + str1;
    }
    /**************** 
    * 設定 年/月/日 三個 table 的屬性函數
    * 傳入參數: table object
    *  內部處理用
    *****************/
    function robCalendHMSetStyle_table(obj1) {
      // obj1.setAttribute("style", robCalendHMStyle_table);
      obj1.className = "robCalendHMStyle_table";
    }
    /**************** 
    * 設定 年 table 中 td 的屬性函數
    * 傳入參數: td object, string(unselect,select,title)
    *  內部處理用
    *****************/
    function robCalendHMSetStyle_MinuteTd(obj1, par1) {
      // 設定年度的顯示項目：傳入 object td, par1:title unselect select ''
      if (par1 == "unselect") {
        //obj1.setAttribute("style", robCalendHMStyle_MinuteTableTd);
        obj1.className = "robCalendHMStyle_MinuteTableTd";
      }
      else if (par1 == "select") {
        //obj1.setAttribute("style", robCalendHMStyle_MinuteTableTdSelected);
        obj1.className = "robCalendHMStyle_MinuteTableTdSelected";
      }
      else if (par1 == "title") {
        //obj1.setAttribute("style", robCalendHMStyle_MinuteTableTdTitle);
        obj1.className = "robCalendHMStyle_MinuteTableTdTitle";
      }
      else {
        //obj1.setAttribute("style", "");
        obj1.className = "";
      }
    }
    /**************** 
    * 設定 月 table 中 td 的屬性函數
    * 傳入參數: td object, string(unselect,select,title)
    *  內部處理用
    *****************/
    function robCalendHMSetStyle_HourTd(obj1, par1) {
      // 設定年度的顯示項目：傳入 object td, par1:title unselect select ''
      if (par1 == "unselect") {
        //obj1.setAttribute("style", robCalendHMStyle_HourTableTd);
        obj1.className = "robCalendHMStyle_HourTableTd";
      }
      else if (par1 == "select") {
        //obj1.setAttribute("style", robCalendHMStyle_HourTableTdSelected);
        obj1.className = "robCalendHMStyle_HourTableTdSelected";
      }
      else if (par1 == "title") {
        //obj1.setAttribute("style", robCalendHMStyle_HourTableTdTitle);
        obj1.className = "robCalendHMStyle_HourTableTdTitle";
      }
      else {
        //obj1.setAttribute("style", "");
        obj1.className = "";
      }
    }
    // iH,iM, 0, 0, 0, 日期object, 傳入的物件id
    var robCalendHM_arrDate = [0, 0, 0, 0, 0, new Date(), ""];
    // 初始設定
    // document.getElementById("robCalendHMDiv").style.visibility = "hidden";
    //robCalendHM_init();
    //robCalendHM_Today();

    // 2011.8.12
    // IE7,IE6 光是用 visibility:hidden 還不夠, 要再加上 overflow:hidden
    // 但是在顯示時，要將 overflow 清除
    //var robNavVer = navigator.userAgent;
    //if (robNavVer.indexOf("MSIE 7") > 0 || robNavVer.indexOf("MSIE 6") > 0) {
      // alert('find');
      //robCalendHM_init();
      //robCalendHM_Today();
      //setTimeout("robCalendHM_returnDate()", 1);
    //} else {
    //  document.getElementById("robCalendHMDiv").style.visibility = "hidden";
    //}
    
  </script>
<%-- 2011.12.26 robCalendHM v2.0 for IE6/IE7/IE8/FireFox/Chrome **end** --%> 
</body>
</html>
