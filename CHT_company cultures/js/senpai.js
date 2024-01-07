$(function () {
    //readMore hover
    $(".changeImg").hover(
        function () {
            $(this).attr("src", "./images/index/s3_btn_hover.gif");
        },
        function () {
            $(this).attr("src", "./images/index/s3_btn.png");
        }
    );

    var $modal = $('.sp_modal');
    var HIDE_CLASS = 'modal_hide';
    var sp_data = {
        spTxt: [{
                id: "sp_1",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 鴻",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "為什麼中華電信是你的最佳選擇？",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。"
                ]
            },
            {
                id: "sp_2",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test2",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。2"
                ]
            },
            {
                id: "sp_3",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test3",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。3"
                ]
            },
            {
                id: "sp_4",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test4",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。4"
                ]
            },
            {
                id: "sp_5",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test5",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。"
                ]
            },
            {
                id: "sp_6",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test6",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。"
                ]
            },
            {
                id: "sp_7",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test7",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。"
                ]
            },
            {
                id: "sp_8",
                spImg: "./images/focus/senpai/senpai_box_01.jpg",
                spName: "嘉 2",
                spSchool: "清大 | 資訊工程",
                spWork: "數據通信分公司網際網路處",
                spQA1: [
                    "test8",
                    "中華電信為台灣市佔率最高之電信產業，擁有廣大的客戶群以及充足的內部資源。",
                ],
                spQA2: [
                    "至今讓你最難忘的事是？",
                    "我們的客戶是遊戲業者，遭受到一些國際上的流量攻擊，把他的網路塞爆，導致他下面的用戶沒辦法正常連線；這時候我們會進去做封包的查看，找出他的攻擊手法和做一些攔阻；在這過程中我覺得是非常有趣而且有ㄧ種互相成長的感覺。",
                ],
                spQA3: [
                    "中華電信是如何幫助你成長的？",
                    "最主要的成長是透過實際案件的執行，在各種實務情境下學習與客戶應對的方式、分析、解決問題的能力。"
                ]
            },
        ]

    }


    $('.sp_readMore_1').on('click', function () {
        // var i =$(this).parents(".md_section1").find(".sp_readMore_1").index(this);
        let i = $(this)["context"].id;
        $modal.fadeIn(500).removeClass(HIDE_CLASS);
        $modal.empty();
        $modal.append(spTxt(i));
        mobalClose();

    });

    function mobalClose() {
        $('.modal_close').on('click', function () {
            $modal.fadeOut(500).addClass(HIDE_CLASS);
        });
    }

    function spTxt(i) {

        let data = sp_data.spTxt;
        let found = data.find(function (el) {
            return el.id == i;
        });
        console.log(found);
        var domstr = ''
        domstr += '<div class="sp_content">'
        domstr += '<div class="sp_img">'
        domstr += '<img src="' + found.spImg + '" >'
        domstr += '</div>'
        domstr += '<div class="sp_txt">'
        domstr += '<div class="sp_title">'
        domstr += '<h2>' + found.spName + '</h2>'
        domstr += '<h5>' + found.spSchool + '</h5>'
        domstr += '<h3>' + found.spWork + '</h3>'
        domstr += '<hr>'
        domstr += '</div>'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA1[0] + '</h4>'
        domstr += '<p>' + found.spQA1[1] + '</p>'
        domstr += '</div>'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA2[0] + '</h4>'
        domstr += '<p>' + found.spQA2[1] + '</p>'
        domstr += '</div>'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA3[0] + '</h4>'
        domstr += '<p>' + found.spQA3[1] + '</p>'
        domstr += '</div>'
        domstr += ' <a class="modal_close">X</a>'
        domstr += '</div>'
        domstr += '</div>'

        return domstr


    }

    //spRWD
    let now = 0;
    let item = $(".md1_item");

    function md1Resize() {
        $(window)
            .on("resize", function () {
                now = 0;
                if (window.innerWidth < 1200) {
                    item
                        .css({
                            display: "none"
                        })
                        .eq(now)
                        .css({
                            display: "block"
                        });
                } else {
                    item
                        .css({
                            display: "block"
                        })
                }
                $(".sp_model_rwd").empty();
                $(".sp_model_rwd").append(spTxt_RWD(0));
            })
            .resize();
    }

    function md1List() {
         
        let total = $(".senpai").length;
         $(".md1_buttom > a").on("click", function () {
             var direction = $(this).hasClass("next");
             if (direction) {
                 now = (now + 1) % total;
             } else {
                 now = now <= 0 ? total - 1 : now - 1;
             }
             $(".md1_flex")
                 .find(".md1_item")
                 .siblings()
                 .stop(false, true)
                 .fadeOut()
                 .eq(now)
                 .stop(false, true)
                 .fadeIn();
                 console.log(now);
                 $(".sp_model_rwd").empty();
                 $(".sp_model_rwd").append(spTxt_RWD(now));
         });
      
    }
   
    function spTxt_RWD(now) {
            
        let data = sp_data.spTxt[now];
        let found = data;
    
        var domstr = ''
        domstr += '<div class="sp_content">'  
        domstr += '<div class="sp_txt">'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA1[0] + '</h4>'
        domstr += '<p>' + found.spQA1[1] + '</p>'
        domstr += '</div>'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA2[0] + '</h4>'
        domstr += '<p>' + found.spQA2[1] + '</p>'
        domstr += '</div>'
        domstr += '<div class="sp_part">'
        domstr += '<h4>' + found.spQA3[0] + '</h4>'
        domstr += '<p>' + found.spQA3[1] + '</p>'
        domstr += '</div>'
        domstr += '</div>'
        domstr += '</div>'

        return domstr
    }

    $(document).ready(function () {
        md1Resize();
        md1List();
    })
});