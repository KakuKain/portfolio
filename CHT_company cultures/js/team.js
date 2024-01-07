$(document).ready(function () {
    let url = location.href;

    if (url.indexOf('?') != -1) {
        let ary1 = url.split('?');
        let ary2 = ary1[1].split("=");
        let ary3 = ary2[1].substring(5);

        $(".teamTitle li#" + ary2[1]).addClass("on");
        //文章切換
        $(".theme").css("display", "none");
        $(".theme" + ary3).css("display", "block");
        //Banner 切換
        $("#wrap").removeClass().addClass("allFocus FTeam FTeam" + ary3);
    } else {
        $(".teamTitle li#theme1").addClass("on");
    }
})

$(".teamTitle li").on("click", function () {
    let n = $(this).attr("id");
    let m = n.substring(5);

    if (m > 2) {
        alert("近期開放 敬請期待");
        return false;
    } else {
        $(".teamTitle li").removeClass("on");
        $(this).addClass("on");
        //文章切換
        $(".theme").css("display", "none");
        $(".theme" + m).css("display", "block");
        //Banner 切換
        $("#wrap").removeClass().addClass("allFocus FTeam FTeam" + m);
    }

})
