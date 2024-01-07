 // Closes the sidebar menu
    $("#menu_close").click(function(e) {
        e.preventDefault();
		$("#blackbg").removeClass("show_blackbg");
		$("#blackbg").addClass("hide_blackbg");
        $("#side_menu").toggleClass("active");
    });

	$("#blackbg").click(function(e) {
        e.preventDefault();
		$("#blackbg").removeClass("show_blackbg");
		$("#blackbg").addClass("hide_blackbg");
        $("#side_menu").toggleClass("active");
    });
	
    // Opens the sidebar menu
    $("#menu_toggle").click(function(e) {
        e.preventDefault();
		$("#blackbg").removeClass("hide_blackbg");
		$("#blackbg").addClass("show_blackbg");
        $("#side_menu").toggleClass("active");
    });
	/*
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    }); */