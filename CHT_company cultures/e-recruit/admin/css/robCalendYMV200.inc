<%-- 2011.8.12 robCalendYM v2.0 for IE6/IE7/IE8/FireFox/Chrome **beg** 
     2011.12.06 rob 更改 位置的選項, 以及透過 this 傳入, 而不是傳入 this.id --%>  
  <iframe id="robCalendYMIFrame" style="position: absolute; z-index: 980; top: 0px; left: 0px; width: 40px; height:40px;  visibility:hidden; overflow:hidden; filter:alpha(opacity=50);-moz-opacity:.5;opacity: 0.5;"></iframe>
   <div id="robCalendYMDiv" style="border:solid 1px #ccccFF;position: absolute; z-index: 990; top: 0px; left: 0px; width: 100%;  visibility:hidden; overflow:hidden; " >
    <div id="robCalendYMInBox" style="position: absolute; top: 0px; left: 0px; background-color: #EEEEEE;
      border: 1px solid #0000FF; font-family: Arial, Helvetica, sans-serif; font-size: 12px;
      letter-spacing: 1px; padding: 5px; width: 400px; margin-left: auto; margin-right: auto;
      z-index:999; ">
      <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: auto; margin-right: auto;">
        <tr>
          <td id="robCalendYMGap1" style="width: 6px;"></td>
          <td id="robCalendYMTdYear" style="vertical-align: top;">
            <table id="robCalendYMYearTable" cellpadding="0" cellspacing="0" class="robCalendYMStyle_table">
              <tr><td colspan="3" class="robCalendYMStyle_YearTableTdTitle">年度</td></tr>
              <tr><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(12,19);">19</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,0);">0</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,0);">0</td></tr>
              <tr><td class="robCalendYMStyle_YearTableTdSelected" onclick="robCalendYM_selYear(12,20);">20</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,1);">1</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,1);">1</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,2);">2</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,2);">2</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,3);">3</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,3);">3</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,4);">4</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,4);">4</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,5);">5</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,5);">5</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,6);">6</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,6);">6</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,7);">7</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,7);">7</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,8);">8</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,8);">8</td></tr>
              <tr><td></td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(3,9);">9</td><td class="robCalendYMStyle_YearTableTd" onclick="robCalendYM_selYear(4,9);">9</td></tr>
            </table>
          </td>
          <td id="robCalendYMGap2" style="width: 6px;"></td>
          <td id="robCalendYMTdMonth" style="vertical-align: top;">
            <table id="robCalendYMMonthTable" cellpadding="0" cellspacing="0" class="robCalendYMStyle_table">
              <tr><td colspan="2" class="robCalendYMStyle_MonthTableTdTitle">月份</td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTdSelected" onclick="robCalendYM_selMonth(1);">1</td><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(11);">11</td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(2);">2</td><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(12);">12</td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(3);">3</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(4);">4</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(5);">5</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(6);">6</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(7);">7</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(8);">8</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(9);">9</td><td></td></tr>
              <tr><td class="robCalendYMStyle_MonthTableTd" onclick="robCalendYM_selMonth(10);">10</td><td></td></tr>
            </table>
          </td>
          <td id="robCalendYMGap3" style="width: 6px;"></td>
          <td id="robCalendYMTdDate" style="vertical-align: top;">
            <table id="robCalendYMDateTable" cellpadding="0" cellspacing="0" class="robCalendYMStyle_table">
              <tr><td style="height:120px; width:140px;">&nbsp;</td></tr>
              <tr>
                <td style="text-align: center;">
                <input type="button" value="轉至  今日年月" id="robCalendYMCmdToday" onclick="robCalendYM_Today();" 
                  style="font-family: Arial, 細明體, Helvetica, sans-serif; font-size: 12px; color: #006699; border: 1px solid #006699; background-color: #D2E1F0; padding-top: auto; padding-bottom: auto; height:28px; width: 140px; cursor:pointer;" />
                  <br /><br /><br />
                  <input type="button" value="" id="robCalendYMCmdSet" onclick="robCalendYM_returnDate();"
                  style="font-family: Arial, 細明體, Helvetica, sans-serif; font-size: 12px; color: #006699; border: 1px solid #006699; background-color: #D2E1F0; padding-top: auto; padding-bottom: auto; height:28px; width: 140px; cursor:pointer;" />
                </td>
              </tr>
            </table>
          </td>
          <td id="robCalendYMGap4" style="width: 6px;"></td>
        </tr>
      </table>
    </div>
  </div>
  <script type="text/javascript">
    /**************** 
    * 傳入 page HTML tag id, 並以期目前的內容來設定日曆的顯示日期
    *****************/
    function robCalendYM_setDate(id1) {
      // 由程式呼叫： onclick="robCalendYM_setDate(this.id);"
      // 如果找不到該 object id , 則離開
      //var obj1 = document.getElementById(id1);
      var obj1 = id1;
      if (obj1 == undefined || obj1 == null || obj1 == "") { return false; }

      // 重設 div 高度, 將遮蔽高度設為整個內容高
      // document.getElementById("robCalendYMDiv").style.height = (document.body.scrollHeight + 20) + "px";
      //var setStyleHeight = (document.body.clientHeight < 500 ? 500 : document.body.clientHeight);
      //document.getElementById("robCalendYMIFrame").style.height = setStyleHeight + "px";
      //document.getElementById("robCalendYMDiv").style.height = setStyleHeight + "px";
      
      // var i1 = (document.body.scrollWidth - document.getElementById("robCalendYMInBox").width) / 2;

      // 設定 Calendar 的顯示位置, 水平置中, 高度中央與物件齊平
      // document.getElementById("robCalendYMInBox").style.left = (document.body.scrollWidth - document.getElementById("robCalendYMInBox").scrollWidth) / 2 + "px";
      var ix = (document.body.scrollWidth - document.getElementById("robCalendYMInBox").scrollWidth) / 2;
      if (ix > 20) { ix = ix - 20; }
      var iy = obj1.offsetTop - (document.getElementById("robCalendYMInBox").scrollHeight / 2);
      if (iy < 20) { iy = 20; }
      //document.getElementById("robCalendYMInBox").style.top = iy + "px";
      document.getElementById("robCalendYMInBox").style.top = "20px";
      document.getElementById("robCalendYMInBox").style.left = "20px";

      // 重設 div 高度, 設為 InBox 的 -20
      var setStylei = document.getElementById("robCalendYMInBox").offsetHeight + 40;
      document.getElementById("robCalendYMIFrame").style.height = setStylei + "px";
      document.getElementById("robCalendYMDiv").style.height = setStylei + "px";
      setStylei = document.getElementById("robCalendYMInBox").offsetWidth + 40;
      document.getElementById("robCalendYMIFrame").style.width = setStylei + "px";
      document.getElementById("robCalendYMDiv").style.width = setStylei + "px";

      // 2011.12.6 robin 修正
      // 取得目前 object 的位置, 往回找到 position=absolute 為止
      var sID, sTag;
      ix = obj1.offsetLeft;
      iy = obj1.offsetTop;
      var obj0 = obj1;
      while (obj0 = obj0.offsetParent) {
        if ((obj0.style.position == "absolute" || obj0.style.position == "relative")
             && obj0.tagName == "DIV") {
          if ((iy + document.getElementById("robCalendYMDiv").offsetHeight) > obj0.offsetHeight) {
            iy = (obj0.offsetHeight ? obj0.offsetHeight : 0)
               - (document.getElementById("robCalendYMDiv").offsetHeight ? document.getElementById("robCalendYMDiv").offsetHeight : 0)
               - 20;
            iy = (iy < 0 ? 0 : iy);
          }
          if ((ix + document.getElementById("robCalendYMDiv").offsetWidth) > obj0.offsetWidth) {
            ix = (obj0.offsetWidth ? obj0.offsetWidth : 0)
               - (document.getElementById("robCalendYMDiv").offsetWidth ? document.getElementById("robCalendYMDiv").offsetWidth : 0)
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
      //setStylei = document.getElementById("robCalendYMInBox").offsetTop - 20;
      document.getElementById("robCalendYMIFrame").style.top = iy + "px";
      document.getElementById("robCalendYMDiv").style.top = iy + "px";
      //setStylei = document.getElementById("robCalendYMInBox").offsetLeft - 20;
      document.getElementById("robCalendYMIFrame").style.left = ix + "px";
      document.getElementById("robCalendYMDiv").style.left = ix + "px";
      

      // 試著取出 value 或 innerHTML 的值
      var strDate = "";
      if (obj1.value != undefined) { strDate = obj1.value; }
      else if (obj1.innerHTML != undefined) { strDate = obj1.innerHTML; }

      // 取得傳入的資料
      robCalendYM_arrDate[6] = id1;

      // robin 產學要把日期改為 yyyy-mm-dd
      var strDateNew = "";
      for (var j = 0; j < strDate.length; j++) {
        if (strDate.substr(j, 1) == "-") {
          strDateNew += "/";
        }
        else
        { strDateNew += strDate.substr(j, 1); }
      }
      //strDate = strDateNew;
      // 傳入只有 yyyy/mm 要加上 /1
      strDate = strDateNew+"/1";

      var i = Date.parse(strDate);
      // debug 用: 看一下轉出的值
      // document.getElementById("robCalendYMCmdToday").setAttribute("value", i);
      // 如果轉出不是正確的值，預設為今天的日期
      if (isNaN(i)) { robCalendYM_Today(); }
      else {
        // Calendar 顯示取入的日期
        var date1 = new Date(Date.parse(strDate));
        var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate();
        robCalendYM_Date(str1);
      }
      // 顯示 Calendar 於網頁上
      document.getElementById("robCalendYMIFrame").style.overflow = "";
      document.getElementById("robCalendYMIFrame").style.visibility = "visible";
      
      document.getElementById("robCalendYMDiv").style.overflow = "";
      document.getElementById("robCalendYMDiv").style.visibility = "visible";
      document.body.onscroll = "retrun false;";
      // visibility: visible
      //span1.style.visibility = "visible";
      //span1.style.visibility = "hidden";
    }

    /**************** 
    * 傳回日曆中所選定的日期
    * [設定日期] button 呼叫此函數
    *****************/
    function robCalendYM_returnDate() {
      // 取回要傳回的 id
      var id1 = robCalendYM_arrDate[6];
      //if (id1.length > 0) {
      if (id1) {
        //var obj1 = document.getElementById(id1);
        var obj1 = id1;
        var date1 = new Date(Date.parse(robCalendYM_arrDate[5]));
        //var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate();
        var imonth = (date1.getMonth() + 1);
        var str1 = date1.getFullYear() + "/" + (imonth < 10 ? "0" + imonth : imonth);
        if (obj1.value != undefined) { obj1.value = str1; }
        else if (obj1.innerHTML != undefined) { obj1.innerHTML = str1; }
      }
      document.getElementById("robCalendYMIFrame").style.visibility = "hidden";
      document.getElementById("robCalendYMDiv").style.visibility = "hidden";
      document.body.onscroll = "";
    }

    /**************** 
    * 設定日曆為今天日期
    * [今日] button 呼叫此函數
    *****************/
    function robCalendYM_Today() {
      // 設定今日的日期變數
      var date1 = new Date();
      // var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate();
      var str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/1";
      robCalendYM_Date(str1);
    }

    /**************** 
    * 顯示日曆內容
    *  傳入參數：日期字串
    *  內部處理用
    *****************/
    function robCalendYM_Date(strDate) {
      // 設定顯示日期
      var dateNow = new Date();
      var date1 = new Date(Date.parse(strDate));
      var obj1 = "";
      var str1 = "";
      // 設定年 - 頭兩位
      obj1 = document.getElementById("robCalendYMYearTable");
      var iyear = date1.getFullYear();
      var iy12 = Math.floor(iyear / 100);
      str1 = (iy12 == 19) ? "select" : "unselect";
      robCalendYMSetStyle_YearTd(obj1.rows[1].cells[0], str1);

      //obj1.rows[1].cells[0].setAttribute("onclick", (iy12 == 19) ? "" : "robCalendYM_selYear(12,19);");

      str1 = (iy12 == 20) ? "select" : "unselect";
      robCalendYMSetStyle_YearTd(obj1.rows[2].cells[0], str1);
      // obj1.rows[2].cells[0].setAttribute("onclick", (iy12 == 20) ? "" : "robCalendYM_selYear(12,20);");
      // 設定年 - 第3/4位
      var iy3 = Math.floor((iyear - iy12 * 100) / 10);
      var iy4 = iyear - iy12 * 100 - iy3 * 10;
      for (var i = 0; i <= 9; i++) {
        str1 = (iy3 == i) ? "select" : "unselect";
        robCalendYMSetStyle_YearTd(obj1.rows[i + 1].cells[1], str1);
        //obj1.rows[i + 1].cells[1].setAttribute("onclick", (iy3 == i) ? "" : "robCalendYM_selYear(3," + i + ");");
        str1 = (iy4 == i) ? "select" : "unselect";
        robCalendYMSetStyle_YearTd(obj1.rows[i + 1].cells[2], str1);
        //obj1.rows[i + 1].cells[2].setAttribute("onclick", (iy4 == i) ? "" : "robCalendYM_selYear(4," + i + ");");
      }
      // 設定月
      obj1 = document.getElementById("robCalendYMMonthTable");
      var imonth = date1.getMonth() + 1;
      for (var i = 1; i <= 12; i++) {
        str1 = (imonth == i) ? "select" : "unselect";
        if (i <= 10) {
          robCalendYMSetStyle_MonthTd(obj1.rows[i].cells[0], str1);
          //obj1.rows[i].cells[0].setAttribute("onclick", (imonth == i) ? "" : "robCalendYM_selMonth(" + i + ");");
        }
        else {
          robCalendYMSetStyle_MonthTd(obj1.rows[i - 10].cells[1], str1);
          //obj1.rows[i - 10].cells[1].setAttribute("onclick", (imonth == i) ? "" : "robCalendYM_selMonth(" + i + ");");
        }
      }
      // 今天日期
      var idate = date1.getDate();

      str1 = iyear + "/" + imonth + "/" + idate;
      //str2 = iyear + "-" + imonth + "-" + idate;
      //str2 = iyear + "/" + imonth + "/" + idate;
      str2 = iyear + "/" + (imonth > 10 ? imonth : "0" + imonth);
      document.getElementById("robCalendYMCmdSet").setAttribute("value", "傳回 年月:" + str2);
      robCalendYM_arrDate[0] = iy12;
      robCalendYM_arrDate[1] = iy3;
      robCalendYM_arrDate[2] = iy4;
      robCalendYM_arrDate[3] = imonth;
      robCalendYM_arrDate[4] = idate;
      robCalendYM_arrDate[5] = str1;
    }


    /**************** 
    * 點選日曆中的 月數 的 td 
    *  傳入參數：日期中月的數值
    *  內部處理用
    *****************/
    function robCalendYM_selMonth(imonth) {
      imonth--;
      var date1 = new Date(robCalendYM_arrDate[5]);
      var date2 = new Date(date1.setMonth(imonth, 32));
      date2 = new Date(date2.setDate(0));
      var idate = Math.min(date2.getDate(), robCalendYM_arrDate[4]);
      date2 = new Date(date2.setDate(idate));
      var str1 = date2.getFullYear() + "/" + (date2.getMonth() + 1) + "/" + date2.getDate();
      //var obj1 = document.getElementById("robCalendYMDateTable");
      //obj1.rows[0].cells[1].innerHTML = str
      robCalendYM_Date(str1);
    }
    /**************** 
    * 點選日曆中的 年數 的 td 
    *  傳入參數：年的類別數值(12,3,4表示第幾位數), 日期中年的數值
    *  內部處理用
    *****************/
    function robCalendYM_selYear(iyno, i) {
      var iyear = 0;
      if (iyno == 12) {
        iyear = i * 100 + robCalendYM_arrDate[1] * 10 + robCalendYM_arrDate[2]
      }
      else if (iyno == 3) {
        iyear = robCalendYM_arrDate[0] * 100 + i * 10 + robCalendYM_arrDate[2]
      }
      else if (iyno == 4) {
        iyear = robCalendYM_arrDate[0] * 100 + robCalendYM_arrDate[1] * 10 + i
      }
      var date1 = new Date(robCalendYM_arrDate[5]);
      var date2 = new Date(date1.setFullYear(iyear, robCalendYM_arrDate[3] - 1, 32));
      date2 = new Date(date2.setDate(0));
      var idate = Math.min(date2.getDate(), robCalendYM_arrDate[4]);
      date2 = new Date(date2.setDate(idate));
      var str1 = date2.getFullYear() + "/" + (date2.getMonth() + 1) + "/" + date2.getDate();
      //var obj1 = document.getElementById("robCalendYMDateTable");
      //obj1.rows[0].cells[1].innerHTML = str
      robCalendYM_Date(str1);
    }
    /**************** 
    * 初始設定並建立日曆的 HTML div table tag 到 page 中 
    *  內部處理用
    *****************/
    function robCalendYM_init() {
      // 設定 CalendarDiv
      robCalendYM = document.getElementById("robCalendYMDiv");
      //robCalendYM.style.visibility = "hidden";
      //robCalendYM.style.visibility = "visible";
      //robCalendYM.style.visibility = "hidden";
      // 顯示日期
      date1 = new Date();
      // str1 = date1.getFullYear() + "/" + (date1.getMonth() + 1) + "/" + date1.getDate();
      imonth = data1.getMonth() + 1;
      str1 = date1.getFullYear() + "/" + (imonth < 10 ? "0" + imonth : imonth);
      // document.getElementById("robCalendYMCmdSet").setAttribute("value", "設定日期:" + str1);
      document.getElementById("robCalendYMCmdSet").value = "傳回 年月:" + str1;
    }
    /**************** 
    * 設定 年/月/日 三個 table 的屬性函數
    * 傳入參數: table object
    *  內部處理用
    *****************/
    function robCalendYMSetStyle_table(obj1) {
      // obj1.setAttribute("style", robCalendYMStyle_table);
      obj1.className = "robCalendYMStyle_table";
    }
    /**************** 
    * 設定 年 table 中 td 的屬性函數
    * 傳入參數: td object, string(unselect,select,title)
    *  內部處理用
    *****************/
    function robCalendYMSetStyle_YearTd(obj1, par1) {
      // 設定年度的顯示項目：傳入 object td, par1:title unselect select ''
      if (par1 == "unselect") {
        //obj1.setAttribute("style", robCalendYMStyle_YearTableTd);
        obj1.className = "robCalendYMStyle_YearTableTd";
      }
      else if (par1 == "select") {
        //obj1.setAttribute("style", robCalendYMStyle_YearTableTdSelected);
        obj1.className = "robCalendYMStyle_YearTableTdSelected";
      }
      else if (par1 == "title") {
        //obj1.setAttribute("style", robCalendYMStyle_YearTableTdTitle);
        obj1.className = "robCalendYMStyle_YearTableTdTitle";
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
    function robCalendYMSetStyle_MonthTd(obj1, par1) {
      // 設定年度的顯示項目：傳入 object td, par1:title unselect select ''
      if (par1 == "unselect") {
        //obj1.setAttribute("style", robCalendYMStyle_MonthTableTd);
        obj1.className = "robCalendYMStyle_MonthTableTd";
      }
      else if (par1 == "select") {
        //obj1.setAttribute("style", robCalendYMStyle_MonthTableTdSelected);
        obj1.className = "robCalendYMStyle_MonthTableTdSelected";
      }
      else if (par1 == "title") {
        //obj1.setAttribute("style", robCalendYMStyle_MonthTableTdTitle);
        obj1.className = "robCalendYMStyle_MonthTableTdTitle";
      }
      else {
        //obj1.setAttribute("style", "");
        obj1.className = "";
      }
    }
    // iy12,iy3, iy4, imonth, idate, 日期object, 傳入的物件id
    var robCalendYM_arrDate = [0, 0, 0, 0, 0, new Date(), ""];
    // 初始設定
    // document.getElementById("robCalendYMDiv").style.visibility = "hidden";
    //robCalendYM_init();
    //robCalendYM_Today();

    // 2011.8.12
    // IE7,IE6 光是用 visibility:hidden 還不夠, 要再加上 overflow:hidden
    // 但是在顯示時，要將 overflow 清除
    //var robNavVer = navigator.userAgent;
    //if (robNavVer.indexOf("MSIE 7") > 0 || robNavVer.indexOf("MSIE 6") > 0) {
      // alert('find');
      //robCalendYM_init();
      //robCalendYM_Today();
      //setTimeout("robCalendYM_returnDate()", 1);
    //} else {
    //  document.getElementById("robCalendYMDiv").style.visibility = "hidden";
    //}
    
  </script>
<%-- 2011.8.12 robCalendYM v2.0 for IE6/IE7/IE8/FireFox/Chrome **end** --%> 