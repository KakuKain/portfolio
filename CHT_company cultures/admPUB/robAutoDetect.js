// robAutoCss v1.0 by Robin 2014/10/6
function $rob(_sid) { return document.getElementById(_sid); }

var strPC = "PC"; // PC or M
var strLanguage = "";
var strLang = "c"; // c or e or j or s
try {
  if (navigator.userAgent.toLowerCase().indexOf("windows nt") >= 0) {
    strPC = "PC";
  } else {
    strPC = "M";
  }
  if (navigator.language) {
    strLanguage = navigator.language;
  } else if (navigator.systemLanguage) {
    strLanguage = navigator.systemLanguage;
  } else if (navigator.userLanguage) {
    strLanguage = navigator.userLanguage;
  }
  strLanguage = strLanguage.toLowerCase();
  // zh-tw zh-cn : zh
  // en or en-xx
  // ja
  if (strLanguage.indexOf("zh") >= 0) { strLang = "c"; }
  else if (strLanguage.indexOf("ja") >= 0) { strLang = "j"; }
  else if (strLanguage.indexOf("en") >= 0) { strLang = "e"; }
  else { strLang = "e"; }
} catch (e) { // 發生錯誤，用預設值
  strPC = "PC";
  strLang = "c";
}
//location.href = "./" + strLang + strPC + "/index.html";
location.href = "./" + strLang + "/index.html";

/*
var newPageTrail = "_" + strLang + ".html";
var nowPage = location.href; //.toLowerCase();
if (nowPage.indexOf(newPageTrail) < 0) {
  var reg = /_[c|e|j].html/ig;
  var result = reg.exec(nowPage);
  if (result != null) {
    var str1 = nowPage.replace(result, newPageTrail);
    alert(result + "\n_x.html\n" + str1);
    location.href = str1;
  } else {
    reg = /.html/ig;
    var result = reg.exec(nowPage);
    if (result != null) {
      var str1 = nowPage.replace(result, newPageTrail);
      alert(result + "\n.html\n" + str1);
      location.href = str1;
    }
  }
}
if (strLang == "c") {
} else if (strLang == "e") {
} else if (strLang == "j") {
}
*/