    /* Dashboard tab menu */
    $("#content #users").show();
    $("#sidebar li").on("click", function () {
        $("#sidebar li").removeClass("active");
        $(this).addClass("active");
        var activeId = $(this).children("a").attr("href").slice(1);
        var page_title = $(this).children("a").html();
        for (var i = 0; i < $("#content .page").length; i++) {
            if ($("#content .page").eq(i).attr("id") == activeId) {
                $("#content .page").hide()
                $("#content .page").eq(i).show();
                $(".brand .page_title").html(page_title);
                $(".brand .page_title").css("font-size", "25px");
                $(".brand .page_title").css("font-weight", "bold");
            }
        }
    });
    // When resize window width
    $(window).on("resize", function () {
        var width = $(window).width();
        if (width < 900) {
            $(".search-title .text-white").html("Search");
        } else if (width < 600) {
            $(".search-title .text-white").html("<i class='fas fa-search fa-lg'></i>");
        } else {
            $(".company .search-title .text-white").html("Company Search");
            $(".user .search-title .text-white").html("User Search");
            $(".surveyCode .search-title .text-white").html("Code Search");
            $(".surveyPages .search-title .text-white").html("Page Search");
            $(".surveyLogin .search-title .text-white").html("Login Search");
        }
    });

    // Progress bar step by step
    $(".nodes").on("click", function (e) {
        if ($(e.target).hasClass("node") == true) {
            if ($(e.target).hasClass("node_company") == true) {
                $("#company_item").click();
            }
            if ($(e.target).hasClass("node_login") == true) {
                $("#login_item").click();
            }
            if ($(e.target).hasClass("node_code") == true) {
                $("#code_item").click();
            }
            if ($(e.target).hasClass("node_page") == true) {
                $("#page_item").click();
            }
            if ($(e.target).hasClass("node_url") == true) {
                $("#url_item").click();
            }
            if ($(e.target).hasClass("node_results") == true) {
                $("#result_item").click();
            }
        }
    });

    /* Create an array with the values of all the input boxes in a column */
    $.fn.dataTable.ext.order['dom-text'] = function (settings, col) {
        return this.api().column(col, {
            order: 'index'
        }).nodes().map(function (td, i) {
            return $('input', td).val();
        });
    }

    /* Create an array with the values of all the input boxes in a column, parsed as numbers */
    $.fn.dataTable.ext.order['dom-text-numeric'] = function (settings, col) {
        return this.api().column(col, {
            order: 'index'
        }).nodes().map(function (td, i) {
            return $('input', td).val() * 1;
        });
    }

    /* Create an array with the values of all the select options in a column */
    $.fn.dataTable.ext.order['dom-select'] = function (settings, col) {
        return this.api().column(col, {
            order: 'index'
        }).nodes().map(function (td, i) {
            return $('select', td).val();
        });
    }

    /* Create an array with the values of all the checkboxes in a column */
    $.fn.dataTable.ext.order['dom-checkbox'] = function (settings, col) {
        return this.api().column(col, {
            order: 'index'
        }).nodes().map(function (td, i) {
            return $('input', td).prop('checked') ? '1' : '0';
        });
    }