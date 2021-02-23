$(function () {
    $('[data-toggle="tooltip"]').tooltip();

    // ******************************************* Init Define ****************************************************
    var user_table = $('#user_table').DataTable({
        "filter": false,
        "info": false,
        "data": [],
        "columns": [{
                "title": "Email",
                "data": 'email'
            },
            {
                "title": "Works_for_co_id",
                "data": 'company'
            },
            {
                "title": "FirstName",
                "data": 'first_name'
            },
            {
                "title": "LastName",
                "data": 'last_name'
            }
        ]
    });
    $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
    $("#user_table_length").hide();
    // $("#user_table_length").addClass("font-weight-bold text-center float-right px-4 text-gold");
    $("#user_table_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

    // Init User_table function
    $.fn.init_user_table = function () {
        $.ajax({
            url: "model/pages/user_model.php",
            type: "POST",
            data: {
                type: "init_user_table",
            },
            success: function (res) {
                res = JSON.parse(res);
                user_table.clear();
                $.each(res, function (index, value) {
                    var row_data = user_table.row.add(value);
                    var row = $("#user_table").dataTable().fnGetNodes(row_data);
                    $(row).attr("id", res[index].id);
                });
                user_table.draw();
            }
        });
    }

    // Display user data on user table
    $.fn.display_user_data = function (user_id) {
        $("#user_table tbody tr").removeClass("table-active");
        $("#user_table #" + user_id).addClass("table-active");
        $.ajax({
            url: "model/pages/user_model.php",
            type: "POST",
            data: {
                type: "display_selected_user_data",
                user_id: user_id
            },
            success: function (res) {
                res = JSON.parse(res);
                $("#user_email").val(res.email);
                $("#user_password").val(res.password);
                $("#first_name").val(res.first_name);
                $("#last_name").val(res.last_name);
                $("#works_for_id").val(res.works_for_co_id);
                $("#job_title").val(res.title);
                $("#phone_number").val(res.phone_num);
                $("#phone_country_id").val(res.phone_country_id);
                window.localStorage.setItem("user_full_name", res.first_name + " " + res.last_name);
                $("#works_for_id").trigger("change");
                $("#phone_country_id").trigger("change");
            }
        });
    }

    // Init Search User
    $.fn.search_user = function () {
        $.ajax({
            url: "model/pages/user_model.php",
            type: "POST",
            data: {
                type: "search_user"
            },
            success: function (res) {
                var user_data = "";
                res = JSON.parse(res);
                for (x in res) {
                    user_data += "<option value='" + res[x]["id"] + "'>" + res[x]["email"] + "</option>";
                }
                $("#user_search").html(user_data);
            }
        });
    }

    //  Define Init user table
    $.fn.init_user_table();

    // Select box define
    // $("#user_item").on("click", function () {
        // Country Id
        $("#phone_country_id").select2({
            placeholder: "Select a country..."
        });

        // Works for company id
        $("#works_for_id").select2({
            placeholder: "Select works for company..."
        });

        // User search
        $("#user_search").select2({
            placeholder: "Select User..."
        })
    // });

    // Country Id
    $.ajax({
        url: "model/pages/user_model.php",
        type: "POST",
        data: {
            type: "country_id"
        },
        success: function (res) {
            res = JSON.parse(res);
            country = "";
            for (x in res) {
                country += "<option value= " + res[x]["id"] + ">" + res[x]["text"] + "</option>";
            }
            $("#phone_country_id").html(country);
        }
    });

    // Search User
    $.fn.search_user();

    //  Work for Number 
    $.ajax({
        url: "model/pages/user_model.php",
        type: "POST",
        data: {
            type: "init_works_co_id"
        },
        success: function (res) {
            res = JSON.parse(res);
            var works_id = "";
            for (x in res) {
                works_id += "<option value=" + res[x]["id"] + "> " + res[x]["company_name"] + "</option>";
            }
            $("#works_for_id").html(works_id);
        }
    });

    // ************************************************** User define **************************************************
    // Add User
    $("#user_add").on("click", function () {
        if ($("#user_email").val() != "" && $("#user_password").val() != "") {
            $.ajax({
                url: "model/pages/user_model.php",
                type: "POST",
                data: {
                    type: "user_add",
                    user_email: $("#user_email").val(),
                    user_password: $("#user_password").val(),
                    first_name: $("#first_name").val(),
                    last_name: $("#last_name").val(),
                    works_for_co_id: $("#works_for_id").val(),
                    job_title: $("#job_title").val(),
                    phone_number: $("#phone_number").val(),
                    phone_country_id: $("#phone_country_id").val()
                },
                success: function (res) {
                    res = JSON.parse(res);
                    user_table.clear();
                    $.each(res, function (index, value) {
                        var row_data = user_table.row.add(value);
                        var row = $("#user_table").dataTable().fnGetNodes(row_data);
                        $(row).attr("id", res[index].id);
                    });
                    user_table.draw();
                    $(".alert-success .notification").html("Successfully Added!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                    $.fn.search_user();
                }
            });
        }
    });

    //  When click on table, display table Data
    $("#user_table tbody").on("dblclick", function (e) {
        var user_id = $(e.target).parent("tr").attr("id");
        $.fn.display_user_data(user_id);
    });

    // Select User
    $("#select_user").on("click", function () {
        window.localStorage.setItem("user_email", $("#user_email").val());
        $(".alert-success .notification").html("Successfully Selected!.");
        $(".alert-success").addClass("show");
        setTimeout(function () {
            $(".alert-success").removeClass("show");
            $("#company_item").click();
        }, 1500);
    });

    // When select user on user search dropdown
    $("#user_search").on("change", function () {
        var user_id = $("#user_search").val();
        $.fn.display_user_data(user_id);
    });

    // When click reset on user page
    $("#user_reset").on("click", function () {
        $("#user_email").val("");
        $("#user_password").val("");
        $("#first_name").val("");
        $("#last_name").val("");
        $("#works_for_id").val("");
        $("#job_title").val("");
        $("#phone_number").val("");
        $("#phone_country_id").val("");
        $("#user_hidden_temp").val("")
    });

    //  User Update
    $("#user_update").on("click", function () {
        if ($("#user_email").val() != "" && $("#user_password").val() != "") {
            $.ajax({
                url: "model/pages/user_model.php",
                type: "POST",
                data: {
                    type: "user_update",
                    user_id: $("#user_hidden_temp").val(),
                    user_email: $("#user_email").val(),
                    user_password: $("#user_password").val(),
                    first_name: $("#first_name").val(),
                    last_name: $("#last_name").val(),
                    works_for_co_id: $("#works_for_id").val(),
                    job_title: $("#job_title").val(),
                    phone_number: $("#phone_number").val(),
                    phone_country_id: $("#phone_country_id").val()
                },
                success: function (res) {
                    res = JSON.parse(res);
                    user_table.clear();
                    $.each(res, function (index, value) {
                        var row_data = user_table.row.add(value);
                        var row = $("#user_table").dataTable().fnGetNodes(row_data);
                        $(row).attr("id", res[index].id);
                    });
                    user_table.draw();
                    $(".alert-success .notification").html("Successfully Updated!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                    $.fn.search_user();
                }
            });
        }
    });
});