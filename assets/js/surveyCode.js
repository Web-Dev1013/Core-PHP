$(function () {

    $("#sc_expires_date").datepicker({
        uiLibrary: "bootstrap4"
    });

    var surveyCode_table = $("#surveyCode_table").DataTable({
        "columns": [{
                "title": "Email",
                "data": 'user_email'
            },
            {
                "title": "Surveyed_co",
                "data": 'surveyed_co_id'
            },
            {
                "title": "Purchased_co",
                "data": 'purchased_co_id'
            },
            {
                "title": "Financial",
                "data": 'financial'
            },
            {
                "title": "Period",
                "data": 'period'
            },
            {
                "title": "Area",
                "data": 'area'
            },
            {
                "title": "Paid",
                "data": 'payment_success'
            },
            {
                "title": "Level_id",
                "data": 'level_id'
            },
            {
                "title": "Username_hash",
                "data": 'username_hash'
            },
            {
                "title": "Password_hash",
                "data": 'password_hash'
            }
        ],
        "filter": false,
        "info": false,
        "paginate": true,
    });
    $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
    $("#surveyCode_table_length").hide();
    // $("#surveyCode_table_length").addClass("font-weight-bold text-center float-right px-4 text-gold");
    $("#surveyCode_table_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

    // cross mark event
    $(".cross-mark").on("click", function () {
        if ($(this).siblings().hasClass("form-control") == true) {
            if ($(this).siblings("input").attr("readonly")) {
                $(this).siblings("input").attr("readonly", false);
                $(this).html("<i class='fas fa-times-circle fa-lg text-danger'></i>");
            } else {
                $(this).siblings("input").attr("readonly", "readonly");
                $(this).html("<i class='fas fa-check-circle fa-lg text-success'></i>");
            }
        } else {
            if ($("#sc_expires_date").attr("readonly")) {
                $("#sc_expires_date").attr("readonly", false);
                $(this).html("<i class='fas fa-times-circle fa-lg text-danger'></i>");
            } else {
                $("#sc_expires_date").attr("readonly", "readonly");
                $(this).html("<i class='fas fa-check-circle fa-lg text-success'></i>");
            }
        }
    });


    // ***************************************************** Init define ************************************************
    //Init surveyCode Function
    $.fn.init_surveyCode_data = function (selected_sl) {
        $.ajax({
            url: "model/pages/surveyCode_model.php",
            type: "POST",
            data: {
                type: "init_surveyCode_table",
                selected_sl: selected_sl
            },
            success: function (res) {
                window.localStorage.setItem("init_sc_data", res);
                res = JSON.parse(res);
                surveyCode_table.clear();
                $.each(res, function (index, value) {
                    var row_data = surveyCode_table.row.add(value);
                    var row = $("#surveyCode_table").dataTable().fnGetNodes(row_data);
                    $(row).attr("id", res[index]["id"]);
                });
                surveyCode_table.draw();
                $.fn.display_sc_search();
            }
        });
    }

    // Display survey code dropdown
    $.fn.display_sc_search = function () {
        var data = "";
        var sc_data = window.localStorage.getItem("init_sc_data");
        sc_data = JSON.parse(sc_data);
        for (x in sc_data) {
            data += "<option value='" + sc_data[x]["id"] + "'>" + sc_data[x]["user_email"] + "</option>";
        }
        $("#sc_search").html(data);
    }

    // Display selected sc data
    $.fn.display_selected_sc_data = function (tr_id) {
        $("#surveyCode_table tbody tr").removeClass("table-active");
        $("#surveyCode_table #" + tr_id).addClass("table-active");
        $.ajax({
            url: "model/pages/surveyCode_model.php",
            type: "POST",
            data: {
                type: "display_selected_sc_data",
                tr_id: tr_id
            },
            success: function (res) {
                res = JSON.parse(res);
                $("#sc_user_email").val(res.user_id);
                $("#sc_surveyed_co_id").val(res.surveyed_co_id);
                $("#sc_purchased_co_id").val(res.purchased_co_id);
                $("#sc_area").val(res.area);
                $("#sc_fiscal_eoy").val(res.fiscal_year_ends);
                $("#sc_period").val(res.period_id);
                $("#sc_financial_year").val(res.financial_year);
                $("#sc_month_start").val(res.month_start);
                $("#sc_month_end").val(res.month_end);
                $("#sc_payment_success").val(res.payment_success);
                $("#sc_username_hash").val(res.username_hash);
                $("#sc_password_hash").val(res.password_hash);
                $("#sc_code_name").val(res.sc_name);
                $("#sc_code_description").val(res.sc_description);
                $("#sc_max_responses").val(res.sc_max_responses);
                $("#sc_expire_date").val(res.sc_expires_date);
                $("#sc_code_string").val(res.sc_string);
                $("#sc_code_hash").val(res.sc_hash);
                $("#sc_hidden_temp").val(res.id);
                $("#sc_hash_hidden").val(res.sc_hash);
                $("#sc_user_email").trigger("change");
                $("#sc_surveyed_co_id").trigger("change");
                $("#sc_purchased_co_id").trigger("change");
                $("#sc_fiscal_eoy").trigger("change");
                $("#sc_period").trigger("change");
                $("#sc_payment_success").trigger("change");
                $(".sc-level-btn-group button").removeClass("btn-warning");
                $(".sc-level-btn-group button").addClass("btn-outline-warning");
                for (x in $(".sc-level-btn-group button")) {
                    if ($(".sc-level-btn-group button:eq(" + x + ")").attr("id") == res.level_id) {
                        $(".sc-level-btn-group button:eq(" + x + ")").removeClass("btn-outline-warning");
                        $(".sc-level-btn-group button:eq(" + x + ")").addClass("btn-warning");
                    }
                }
            }
        });
    }

    // When select survey code 
    $("#code_item").on("click", function () {
        // Init surveyCode data
        if (window.localStorage.getItem("selected_sl") == null) {
            $(".alert-danger .notification").html("No survey login selected!.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        } else {
            var selected_sl = window.localStorage.getItem("user_email");
            $.fn.init_surveyCode_data(selected_sl);
            $("#sc_search").select2();
        }

        var company_title = window.localStorage.getItem("init_company_title");
        res = JSON.parse(company_title);
        $("#sc_title_company_name").html(res.company_name);
        $("#sc_title_area").html(res.area);
        $("#sc_title_period").html(res.financial_year + " - " + res.period + "( " + res.month_start + " - " + res.month_end + " )");
        $("#sc_title_email").html(res.email);
        $("#sc_title_level").html(res.level_id);

        //  Select 2
        $("#sc_user_email").select2();
        $("#sc_surveyed_co_id").select2();
        $("#sc_purchased_co_id").select2();
        $("#sc_fiscal_eoy").select2();
        $("#sc_period").select2();
        $("#sc_payment_success").select2();
    });

    // Init User dropdown
    var init_user_data = "";
    $.ajax({
        url: "model/pages/surveyCode_model.php",
        type: "POST",
        data: {
            type: "init_user_data"
        },
        async: false,
        success: function (res) {
            res = JSON.parse(res);
            for (x in res) {
                init_user_data += "<option value='" + res[x]["id"] + "'>" + res[x]["email"] + "</option>";
            }
            $("#sc_user_email").html(init_user_data);
        }
    });

    // Init surveyed co_id
    $.ajax({
        url: "model/pages/surveyCode_model.php",
        type: "POST",
        data: {
            type: "init_surveyed_data"
        },
        success: function (res) {
            var init_surveyed_data = "";
            res = JSON.parse(res);
            for (x in res) {
                init_surveyed_data += "<option value='" + res[x]["id"] + "'>" + res[x]["name"] + "</option>";
            }
            $("#sc_surveyed_co_id").html(init_surveyed_data);
            $("#sc_purchased_co_id").html(init_surveyed_data);
        }
    });

    // Init Period
    $.ajax({
        url: "model/pages/surveyCode_model.php",
        type: "POST",
        data: {
            type: "init_period"
        },
        success: function (res) {
            var period_data = "";
            res = JSON.parse(res);
            for (x in res) {
                period_data += "<option value='" + res[x]["id"] + "'>" + res[x]["name"] + "</option>";
            }
            $("#sc_period").html(period_data);
        }
    });

    // When click row, display selected row data

    $("#surveyCode_table tbody").on("dblclick", function (e) {
        var tr_id = $(e.target).parent("tr").attr("id");
        $.fn.display_selected_sc_data(tr_id);
    });

    // Search sc data
    $("#sc_search").on("change", function () {
        var tr_id = $(this).val();
        $.fn.display_selected_sc_data(tr_id);
    });

    // Add Survey Code
    $("#sc_add").on("click", function () {
        if ($("#sc_code_name").val() != "" && $("#sc_user_email").val() != "") {
            $.ajax({
                url: "model/pages/surveyCode_model.php",
                type: "POST",
                data: {
                    type: "surveyCode_add",
                    sl_id: $("#sc_hidden_temp").val(),
                    sc_code_name: $("#sc_code_name").val(),
                    sc_code_description: $("#sc_code_description").val(),
                    max_responses: $("#sc_max_responses").val(),
                    expires_date: $("#sc_expires_date").val(),
                    sc_code_string: $("#sc_code_string").val()
                },
                async: false,
                success: function (res) {
                    $("#sc_code_hash").val(res);
                    $(".alert-success .notification").html("Successfully Added!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                }
            });
        } else {
            $(".alert-danger .notification").html("Please select user!");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }

    });

    $("#sc_select").on("click", function () {
        if ($("#sc_code_name").val() == "") {
            $(".alert-danger .notification").html("Please fill all field!");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 1500);
        } else {
            window.localStorage.setItem("sc_hash", $("#sc_hash_hidden").val());
            $(".alert-success .notification").html("Successfully Selected!");
            $(".alert-success").addClass("show");
            setTimeout(function () {
                $(".alert-success").removeClass("show");
                $("#page_item").click();
            }, 1500);
        }
    });
});