var swShTxtOut = false;
var swShDivOut = false;
var oDivSh = $rob("divSchool");
var oShTxt = null;
function checkShoolDivDisplay() {
  if (swShDivOut && swShTxtOut) {
    oDivSh.style.visibility = "hidden";
    swShTxtOut = false;
    swShDivOut = false;
  }
}
var swShFind = false;
oDivSh.style.visibility = (swShFind ? "visible" : "hidden");
var arSh = new Array();
function getSCHOOL(obj1) {
  oShTxt = obj1;
  
  swShFind = false;
  var i = 0;
  var str1 = "<span class='msOutSchool' onmouseover=\"this.className='msOverSchool';\"  onmouseout=\"this.className='msOutSchool';\" "
            + "onclick=\"oDivSh.style.visibility ='hidden'; swShDivOut=false; \">"
            + "<span style='border:solid 2px red; color:red;'>ㄨ</span>關閉" + "</span><br />";
  var sN = obj1.value.trim();

  if (sN.length > 0) {
    for (i = 0; i < arSh.length; i++) {
      if (arSh[i].indexOf(sN) >= 0) {
        str1 += "<span class='msOutSchool' onmouseover=\"this.className='msOverSchool';\"  onmouseout=\"this.className='msOutSchool';\" "
        //+ "onclick=\" $rob('" + obj1.id + "').value=this.innerHTML; "
            + "onclick=\" oShTxt.value=this.innerHTML;"
            + "if(oShTxt.onblur){oShTxt.onblur();}"
            + "oDivSh.style.visibility ='hidden'; swShDivOut=false; \">"
            + arSh[i] + "</span><br />";
        swShFind = true;
      }
    }
  }
  if (swShFind) {
    // 定位
    divShPosition(obj1);
  }
  oDivSh.style.visibility = (swShFind ? "visible" : "hidden");
  oDivSh.innerHTML = str1;
}
function divShPosition(objInput) {
  //var sID = "";
  var i = 0;
  var iy = objInput.offsetTop;
  var ix = objInput.offsetLeft;
  var obj0 = objInput;
  /*sID = "";
  sID += "id=" + obj0.id + " tagName=" + obj0.tagName
  + " Top=" + obj0.offsetTop + " Left=" + obj0.offsetLeft + "\n"
  + " ix=" + ix + " iy=" + iy + "\n"
  ;*/
  while (obj0 = obj0.offsetParent) {
    /*sID += "id=" + obj0.id + " tagName=" + obj0.tagName
    + " Top=" + obj0.offsetTop + " Left=" + obj0.offsetLeft + "\n"
    + " ix=" + ix + " iy=" + iy + "\n"
    ;*/
    if (obj0.style.position == "absolute" && obj0.tagName == "DIV") {
      // 此處不再調整位置, 為的是要能貼上輸入格
      break;
    }
    if (",TR,TBODY".indexOf(obj0.tagName) < 0) {
      iy += obj0.offsetTop;
      ix += obj0.offsetLeft;
    }
  }
  // alert(sID);
  oDivSh.style.top = (iy + 26) + "px";
  oDivSh.style.left = ix + "px";
  //oDivSh.style.display = "block";
}
