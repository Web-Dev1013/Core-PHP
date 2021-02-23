$(function () {
    var surveyLogin_table = $('#surveyLogin_table').DataTable({
        "filter": false,
        "info": false,
        "data": [],
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
        ]
    });
    $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
    $("#surveyLogin_table_length").hide();
    $("#surveyLogin_table_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

    $(".sl-level-btn-group button").on("click", function () {
        $(".sl-level-btn-group button").removeClass("btn-warning");
        $(".sl-level-btn-group button").addClass("btn-outline-warning");
        $(this).removeClass("btn-outline-warning");
        $(this).addClass("btn-warning");
    });

    //  *************************************************** Init *******************************************************
    //Init SurveyLogin Table
    $.fn.surveyLogin_table = function () {
        var user_email = window.localStorage.getItem("user_email");
        $.ajax({
            url: "model/pages/surveyLogin_model.php",
            type: "POST",
            data: {
                type: "init_surveyLogin_table",
                user_email: user_email
            },
            success: function (res) {
                if (res == "") {
                    $(".alert-danger .notification").html("No company selected!");
                    $(".alert-danger").addClass("show");
                    setTimeout(function () {
                        $(".alert-danger").removeClass("show");
                    }, 2000);
                    surveyLogin_table.clear();
                    surveyLogin_table.draw();
                } else {
                    res = JSON.parse(res);
                    surveyLogin_table.clear();
                    $.each(res, function (index, value) {
                        var row_data = surveyLogin_table.row.add(value);
                        var row = $("#surveyLogin_table").dataTable().fnGetNodes(row_data);
                        $(row).attr("id", res[index]["id"]);
                    });
                    surveyLogin_table.draw();
                }
            }
        });
    }

    $.fn.init_company_title = function(user_email){
        $.ajax({
            url: "model/pages/surveyLogin_model.php",
            type: "POST",
            data: {
                type: "init_company_title",
                user_email : user_email
            },
            success: function(res){
                window.localStorage.setItem("init_company_title", res);
                res = JSON.parse(res);
                $("#sl_title_company_name").html(res.company_name);
                $("#sl_title_area").html(res.area);
                $("#sl_title_period").html(res.financial_year + " - " + res.period + "( " + res.month_start + " - " + res.month_end + " )");
                $("#sl_title_email").html(res.email);
                $("#sl_title_level").html(res.level_id);
            }
        });
    }

    // When dblclick on table
    $.fn.display_selected_sl_data = function (tr_id) {
        $("#surveyLogin_table tbody tr").removeClass("table-active");
        $("#surveyLogin_table #" + tr_id).addClass("table-active");
        $.ajax({
            url: "model/pages/surveyLogin_model.php",
            type: "POST",
            data: {
                type: "display_selected_row_data",
                tr_id: tr_id
            },
            success: function (res) {
                res = JSON.parse(res);
                $("#sl_user_email").val(res.email);
                $("#surveyed_co_id").val(res.surveyed_co_id);
                $("#purchased_co_id").val(res.purchased_co_id);
                $("#sl_area").val(res.area);
                $("#sl_fiscal_eoy").val(res.fiscal_year_ends);
                $("#sl_period").val(res.period_id);
                $("#sl_financial_year").val(res.financial_year);
                $("#sl_month_start").val(res.month_start);
                $("#sl_month_end").val(res.month_end);
                $("#sl_payment_success").val(res.payment_success);
                $("#sl_username_hash").val(res.username_hash);
                $("#sl_password_hash").val(res.password_hash);
                $("#sl_hidden_temp").val(res.id);
                $("#selected_sl_hidden").val(res.email);
                $("#sl_user_email").trigger("change");
                $("#surveyed_co_id").trigger("change");
                $("#purchased_co_id").trigger("change");
                $("#sl_fiscal_eoy").trigger("change");
                $("#sl_period").trigger("change");

                $(".sl-level-btn-group button").removeClass("btn-warning");
                $(".sl-level-btn-group button").addClass("btn-outline-warning");
                $(".sl-level-btn-group button").attr("disabled", false);
                for (x in $(".sl-level-btn-group button")) {
                    if ($(".sl-level-btn-group button:eq(" + x + ")").attr("id") == res.level_id) {
                        $(".sl-level-btn-group button:eq(" + x + ")").removeClass("btn-outline-warning");
                        $(".sl-level-btn-group button:eq(" + x + ")").addClass("btn-warning");
                    }
                }
                for(var i = Number(res.level_id)+1; i <= $(".sl-level-btn-group button").length; i++){
                    $(".sl-level-btn-group button:eq("+i+")").attr("disabled", true);
                }
            }
        });
    }

    // Init User dropdown
    $.ajax({
        url: "model/pages/surveyLogin_model.php",
        type: "POST",
        data: {
            type: "Init_user_dropdown"
        },
        success: function (res) {
            var data = "";
            res = JSON.parse(res);
            for (x in res) {
                data += "<option value='" + res[x]["id"] + "'>" + res[x]["email"] + "</option>";
            }
            $("#sl_user_email").html(data);
        }
    })

    // Init Surveyed_co_id
    $.ajax({
        url: "model/pages/surveyLogin_model.php",
        type: "POST",
        data: {
            type: "init_surveyed_co_id"
        },
        success: function (res) {
            var data = "";
            res = JSON.parse(res);
            for (x in res) {
                data += "<option value='" + res[x]["id"] + "'>" + res[x]["name"] + "</option>";
            }
            $("#surveyed_co_id").html(data);
            $("#purchased_co_id").html(data);
        }
    });

    // Init Period
    $.ajax({
        url: "model/pages/surveyLogin_model.php",
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
            $("#sl_period").html(period_data);
        }
    });

    //  Init Survey Login search dropdown
    $.fn.display_search_survey_login = function () {
        $.ajax({
            url: "model/pages/surveyLogin_model.php",
            type: "POST",
            data: {
                type: "display_sl_search"
            },
            success: function (res) {
                if (res == "failed"){
                    $(".alert-danger .notification").html("No company selected!");
                    $(".alert-danger").addClass("show");
                    setTimeout(function () {
                        $(".alert-danger").removeClass("show");
                    }, 2000);
                }else {
                    res = JSON.parse(res);
                    var data = "";
                    for (x in res) {
                        data += "<option value='" + res[x]["id"] + "'>" + res[x]["user_email"] + "</option>";
                    }
                    $("#surveylogin_search").html(data);
                }
            }
        });
    }

    //  *************************************************** User Define ******************************************
    $("#login_item").on("click", function () {
        var user_email = window.localStorage.getItem("user_email");
        console.log(user_email)
        $.fn.surveyLogin_table();
        $.fn.display_search_survey_login();
        $.fn.init_company_title(user_email);
        $("#surveylogin_search").select2({
            placeholder: "Select User..."
        })
        $("#sl_period").select2({
            placeholder: "Select period..."
        });
        $("#sl_fiscal_eoy").select2({
            placeholder: "Select fiscal_eoy"
        });
        $("#sl_payment_success").select2({
            minimumResultsForSearch: Infinity
        });
        $("#sl_user_email").select2();
        $("#surveyed_co_id").select2();
        $("#purchased_co_id").select2();
        // Init Survey Login Detail
        // if (window.localStorage.getItem("company_id") == null) {
        //     $(".alert-danger .notification").html("No User Selected. Please select user.");
        //     $(".alert-danger").addClass("show");
        //     setTimeout(function () {
        //         $(".alert-danger").removeClass("show");
        //     }, 2000);
        // } else {
            $.ajax({
                url: "model/pages/surveyLogin_model.php",
                type: "POST",
                data: {
                    type: "init_survey_login_detail",
                    company_id: window.localStorage.getItem("company_id")
                },
                success: function (res) {
                    res = JSON.parse(res);
                    $("#sl_user_email").val(res["user_id"]);
                    $("#surveyed_co_id").val(res["works_for_co_id"]);
                    $("#sl_fiscal_eoy").val(res["fiscal_eoy_month_end"]);
                    $("#sl_fiscal_eoy").trigger("change");
                    $("#surveyed_co_id").trigger("change");
                    $("#sl_user_email").trigger("change");
                }
            });
        // }
    
    });

    // Define Month start and Month end base on Period
    var year = new Date;
    var feb = year % 4 == 0 ? "Feb 29" : "Feb 28";
    var eoy_start_arr = ["Jan 1", "Feb 1", "Mar 1", "Apr 1", "May 31", "Jun 1", "Jul 1", "Aug 1", "Sep 1", "Oct 1", "Nov 1", "Dec 1"];
    var eoy_end_arr = ["Jan 31", feb, "Mar 31", "Apr 30", "May 31", "Jun 30", "Jul 31", "Aug 31", "Sep 30", "Oct 31", "Nov 30", "Dec 31"];
    $("#sl_period").on("change", function () {
        var key = $(this).val();
        var eoy = Number($("#sl_fiscal_eoy").val());
        switch (key) {
            case "1":
                $("#sl_month_start").val(eoy_start_arr[eoy + 1]);
                $("#sl_month_end").val(eoy_end_arr[eoy - 1]);
                break;
            case "2":
            case "3":
                $("#sl_month_start").val(eoy_start_arr[(eoy + Number(key - 1)) > 12 ? (eoy + Number(key) - 13) : (eoy + Number(key) - 1)]);
                $("#sl_month_end").val(eoy_end_arr[(eoy + Number(key) + 4) > 12 ? (eoy + Number(key) - 8) : (eoy + Number(key) + 4)]);
                break;
            case "4":
            case "5":
            case "6":
            case "7":
                $("#sl_month_start").val(eoy_start_arr[(eoy + Number(key) - 3) > 12 ? (eoy + Number(key) - 15) : (eoy + Number(key) - 3)]);
                $("#sl_month_end").val(eoy_end_arr[(eoy + Number(key)) > 12 ? (eoy + Number(key) - 12) : (eoy + Number(key))]);
                break;
            case "8":
            case "9":
            case "10":
            case "11":
            case "12":
            case "13":
            case "14":
            case "15":
            case "16":
            case "17":
            case "18":
            case "19":
                $("#sl_month_start").val(eoy_start_arr[(eoy + Number(key) - 8) > 12 ? (eoy + Number(key) - 20) : (eoy + Number(key) - 8)]);
                $("#sl_month_end").val(eoy_end_arr[(eoy + Number(key) - 8) > 12 ? (eoy + Number(key) - 20) : (eoy + Number(key) - 8)]);
                break;
        }
    });

    // New Survey Login Add
    $("#sl_add").on("click", function () {
        if ($("#sl_user_email").val() != 0) {
            $.ajax({
                url: "model/pages/surveyLogin_model.php",
                type: "POST",
                data: {
                    type: "add_new_survey_login",
                    sl_user_email: $("#sl_user_email").val(),
                    surveyed_co_id: $("#surveyed_co_id").val(),
                    purchased_co_id: $("#purchased_co_id").val(),
                    sl_area: $("#sl_area").val(),
                    sl_fiscal_eoy: $("#sl_fiscal_eoy").val(),
                    sl_period: $("#sl_period").val(),
                    sl_level: $(".sl-level-btn-group .btn-warning").attr("id"),
                    sl_financial_year: $("#sl_financial_year").val(),
                    sl_month_start: $("#sl_month_start").val(),
                    sl_month_end: $("#sl_month_end").val(),
                    sl_payment_success: $("#sl_payment_success").val(),
                    sl_username_string: $("#sl_username_string").val(),
                    sl_password_string: $("#sl_password_string").val()
                },
                success: function (res) {
                    res = JSON.parse(res);
                    surveyLogin_table.clear();
                    $.each(res, function (index, value) {
                        var row_data = surveyLogin_table.row.add(value);
                        var row = $("#surveyLogin_table").dataTable().fnGetNodes(row_data);
                        $(row).attr("id", res[index]["id"]);
                    });
                    surveyLogin_table.draw();
                    $(".alert-success .notification").html("Successfully Added!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                }
            });
        } else {
            $(".alert-danger .notification").html("Please select user!.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }
    });

    // Generate Key
    $("#sl_generate").on("click", function () {
        if ($("#sl_username_hash").val() == "" && $("#sl_password_hash").val()) {
            $.ajax({
                url: "model/pages/surveyLogin_model.php",
                type: "POST",
                data: {
                    type: "generate_key",
                    user_id: $("#sl_user_email").val()
                },
                success: function (res) {
                    res = JSON.parse(res);
                    $("#sl_username_hash").val(res.username_hash);
                    $("#sl_password_hash").val(res.password_hash);
                }
            });
        } else {
            $(".alert-danger .notification").html("This hash code is already exist.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }
    });

    //  When dblclick row , display table data
    $("#surveyLogin_table tbody").on("dblclick", function (e) {
        var tr_id = $(e.target).parent("tr").attr("id");
        $.fn.display_selected_sl_data(tr_id);
        $("#sl_hidden_temp").val(tr_id);
    });

    // Select Survey login
    $("#sl_select").on("click", function(){
        window.localStorage.setItem("selected_sl", $("#selected_sl_hidden").val());
        $(".alert-success .notification").html("Successfully Selected!.");
        $(".alert-success").addClass("show");
        setTimeout(function () {
            $(".alert-success").removeClass("show");
            $("#code_item").click();
        }, 1500);
    });


    // Select user on survey login select box
    $("#surveylogin_search").on("change", function () {
        var tr_id = $(this).val();
        $.fn.display_selected_sl_data(tr_id);
    });

    // update surveyLogin
    $("#sl_update").on("click", function () {
        if ($("#sl_user_email").val() != 0) {
            $.ajax({
                url: "model/pages/surveyLogin_model.php",
                type: "POST",
                data: {
                    type: "update_survey_login",
                    sl_id: $("#sl_hidden_temp").val(),
                    sl_user_email: $("#sl_user_email").val(),
                    surveyed_co_id: $("#surveyed_co_id").val(),
                    purchased_co_id: $("#purchased_co_id").val(),
                    sl_area: $("#sl_area").val(),
                    sl_fiscal_eoy: $("#sl_fiscal_eoy").val(),
                    sl_period: $("#sl_period").val(),
                    sl_level: $(".sl-level-btn-group .btn-warning").attr("id"),
                    sl_financial_year: $("#sl_financial_year").val(),
                    sl_month_start: $("#sl_month_start").val(),
                    sl_month_end: $("#sl_month_end").val(),
                    sl_payment_success: $("#sl_payment_success").val(),
                    sl_username_string: $("#sl_username_string").val(),
                    sl_password_string: $("#sl_password_string").val()
                },
                success: function (res) {
                    res = JSON.parse(res);
                    surveyLogin_table.clear();
                    $.each(res, function (index, value) {
                        var row_data = surveyLogin_table.row.add(value);
                        var row = $("#surveyLogin_table").dataTable().fnGetNodes(row_data);
                        $(row).attr("id", res[index]["id"]);
                    });
                    surveyLogin_table.draw();
                    $(".alert-success .notification").html("Successfully Updated!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                }
            });
        } else {
            $(".alert-danger .notification").html("Please fill all field!.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }
    });
});