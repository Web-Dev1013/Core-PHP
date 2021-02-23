$(function () {
    $('[data-toggle="tooltip"]').tooltip();

    var company_table = $('#company_table').DataTable({
        "filter": false,
        "info": false,
        "columns": [{
                "title": "Company",
                "data": 'name'
            },
            {
                "title": "Sector",
                "data": 'sector'
            },
            {
                "title": "Country",
                "data": 'country'
            },
            {
                "title": "Currency",
                "data": 'currency'
            },
            {
                "title": "Fiscal EOY",
                "data": 'fiscal_eoy'
            }
        ]
    });
    $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
    $("#company_table_length").hide();
    // $("#company_table_length").addClass("font-weight-bold text-center float-right px-4 text-gold");
    $("#company_table_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

    /* --------------------------------------------- Init Define ------------------------------------------------*/
    // Init table
    $.fn.init_company_table = function (user_email) {
        $.ajax({
            url: "model/pages/company_model.php",
            type: "POST",
            data: {
                type: "init_table",
                user_email: user_email
            },
            success: function (res) {
                res = JSON.parse(res);
                var search_company = "";
                company_table.clear();
                $.each(res, function (index, value) {
                    var row_data = company_table.row.add(value);
                    var row = $("#company_table").dataTable().fnGetNodes(row_data)
                    $(row).attr("id", res[index].id);
                });
                company_table.draw();
                for (x in res) {
                    search_company += "<option value='" + res[x]["id"] + "'>" + res[x]["name"] + "</option>";
                }
                $("#company_search").html(search_company);
                $("#company_search").select2({
                    placeholder: {
                        id: '-1', // the value of the option
                        text: 'Search company...'
                    }
                });
            }
        });
    }

    // sector id
    $.ajax({
        url: "model/pages/company_model.php",
        type: "POST",
        data: {
            type: "company_sector_id",
        },
        async: false,
        success: function (res) {
            var sector = "";
            res = JSON.parse(res);
            for (x in res) {
                if (res[x]["name"] == "Banking/Credit") {
                    sector += "<option value= " + res[x]["id"] + " selected>" + res[x]["name"] + "</option>";
                } else {
                    sector += "<option value= " + res[x]["id"] + ">" + res[x]["name"] + "</option>";
                }
            }
            $("#company_sector_id").html(sector);
        }
    });

    // Company Item click
    $("#company_item").on("click", function () {
        var user_email = window.localStorage.getItem("user_email");
        if (user_email == null) {
            $(".alert-danger .notification").html("No user selected.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        } else {
            $.fn.init_company_table(user_email);
        }
        $("#company_sector_id").select2({
            placeholder: "Select sector id..."
        });
        $("#company_currency_id").select2({
            placeholder: "Select currency id..."
        });
        $("#fiscal_eoy").select2({
            placeholder: "Select fiscal eoy..."
        });
        $("#selected_user_email").html(window.localStorage.getItem("user_full_name"));

    });


    // Country Id    
    function company_formatCountry(country) {
        if (!country.id) {
            return country.text;
        }
        var $country = $(
            '<span class="flag-icon flag-icon-' + country.id.toLowerCase() + 'flag-icon-squared"></span>' +
            '<span class="flag-text">' + country.text + "</span>"
        );
        return $country;
    };

    $.ajax({
        url: "model/pages/company_model.php",
        type: "POST",
        data: {
            type: "country_id"
        },
        async: false,
        success: function (res) {
            res = JSON.parse(res);
            $("#address_country_id").select2({
                placeholder: "Select a country...",
                templateResult: company_formatCountry,
                data: res
            });
        }
    });
    // Currency
    $.ajax({
        url: "model/pages/company_model.php",
        type: "POST",
        data: {
            type: "currency_id"
        },
        async: false,
        success: function (res) {
            var currency = "";
            res = JSON.parse(res);
            for (x in res) {
                if (res[x]["code"] == "AUD") {
                    currency += "<option value=" + res[x]["id"] + " selected> " + res[x]["code"] + "</option>";
                } else {
                    currency += "<option value=" + res[x]["id"] + "> " + res[x]["code"] + "</option>";
                }
            }
            $("#company_currency_id").html(currency);
        }
    });

    // ----------------------------------------- User defined. -------------------------------------------------    
    // Display company detail data
    $.fn.company_detail_display = function (company_id) {
        $("#company_table tbody tr").removeClass("table-active");
        $("#company_table #" + company_id).addClass("table-active");
        $.ajax({
            url: "model/pages/company_model.php",
            type: "POST",
            data: {
                type: "display_data_of_selected_row",
                company_id: company_id
            },
            success: function (res) {
                res = JSON.parse(res);
                $("#company_name").val(res.name);
                $("#company_sector_id").val(res.sector)
                $("#company_ticker").val(res.ticker);
                $("#company_tax_id").val(res.tax_id);
                $("#company_num").val(res.company_number);
                $("#company_website").val(res.website);
                $("#address_street_1").val(res.street_1);
                $("#address_street_2").val(res.street_2);
                $("#address_city").val(res.address_city);
                $("#company_currency_id").val(res.currency);
                $("#address_state").val(res.address_state);
                $("#address_postalzip").val(res.postalzip);
                $("#address_country_id").val(res.country);
                $("#fiscal_eoy").val(res.fiscal_eoy);
                $("#company_hidden_temp").val(res.id)
                $("#company_sector_id").trigger("change");
                $("#company_currency_id").trigger("change");
                $("#address_country_id").trigger("change");
                $("#fiscal_eoy").trigger("change");
            }
        });
    }

    $("#select_company").on("click", function () {
        window.localStorage.setItem("company_id", $("#company_hidden_temp").val());
        $(".alert-success .notification").html("Successfully Selected!.");
        $(".alert-success").addClass("show");
        setTimeout(function () {
            $(".alert-success").removeClass("show");
            $("#login_item").click();
        }, 1500);
    });

    // Company Add
    $("#company_add").on("click", function () {
        if ($("#company_name") != "" && $("#address_postalzip").val() != "") {
            $.ajax({
                url: "model/pages/company_model.php",
                type: "POST",
                data: {
                    type: "company_add",
                    name: $("#company_name").val(),
                    sector_id: $("#company_sector_id").val(),
                    ticker: $("#company_ticker").val(),
                    tax_id: $("#company_tax_id").val(),
                    number: $("#company_num").val(),
                    website: $("#company_website").val(),
                    currency_id: $("#company_currency_id").val(),
                    address_street_1: $("#address_street_1").val(),
                    address_street_2: $("#address_street_2").val(),
                    address_city: $("#address_city").val(),
                    address_state: $("#address_state").val(),
                    address_postalzip: $("#address_postalzip").val(),
                    address_country_id: $("#address_country_id").val(),
                    fiscal_eoy: $("#fiscal_eoy").val()
                },
                success: function (res) {
                    if (res == "success") {
                        var user_email = window.localStorage.getItem("user_email");
                        $.fn.init_company_table(user_email);
                        // res = JSON.parse(res);
                        // company_table.clear();
                        // $.each(res, function (index, value) {
                        //     var row_data = company_table.row.add(value);
                        //     var row = $("#company_table").dataTable().fnGetNodes(row_data)
                        //     $(row).attr("id", res[index].id);
                        // });
                        // company_table.draw();
                        // $.fn.display_company_data();
                        $(".alert-success .notification").html("Successfully Added!.");
                        $(".alert-success").addClass("show");
                        setTimeout(function () {
                            $(".alert-success").removeClass("show");
                        }, 2000);
                    }
                }
            });
        } else {
            $(".alert-danger .notification").html("Please fill all field correctly.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }
    });

    // Select company
    $("#company_search").on("change", function () {
        var company_id = $(this).val();
        $.fn.company_detail_display(company_id);
    });

    // Reset event in company page
    $("#company_reset").on("click", function () {
        $("#company_name").val("");
        $("#company_sector_id").val("")
        $("#company_ticker").val("");
        $("#company_tax_id").val("");
        $("#company_num").val("");
        $("#company_website").val("");
        $("#address_street_1").val("");
        $("#address_street_2").val("");
        $("#address_city").val("");
        $("#company_currency_id").val("-1");
        $("#address_state").val("");
        $("#address_postalzip").val("");
        $("#address_country_id").val("");
        $("#fiscal_eoy").val("");
        $("#company_hidden_temp").val("");
        $("#company_sector_id").trigger("change");
        $("#company_currency_id").trigger("change");
        $("#address_country_id").trigger("change");
        $("#fiscal_eoy").trigger("change");
    });

    //  When click row of company_table, Display selected company data.
    $("#company_table tbody").on("dblclick", function (e) {
        var company_id = $(e.target).parent().attr("id");
        $.fn.company_detail_display(company_id);
    });

    //When click update button
    $("#company_update").on("click", function () {
        if ($("#company_name") != "" && $("#address_postalzip").val() != "") {
            $.ajax({
                url: "model/pages/company_model.php",
                type: "POST",
                data: {
                    type: "company_update",
                    id: $("#company_hidden_temp").val(),
                    name: $("#company_name").val(),
                    sector_id: $("#company_sector_id").val(),
                    ticker: $("#company_ticker").val(),
                    tax_id: $("#company_tax_id").val(),
                    number: $("#company_num").val(),
                    website: $("#company_website").val(),
                    currency_id: $("#company_currency_id").val(),
                    address_street_1: $("#address_street_1").val(),
                    address_street_2: $("#address_street_2").val(),
                    address_city: $("#address_city").val(),
                    address_state: $("#address_state").val(),
                    address_postalzip: $("#address_postalzip").val(),
                    address_country_id: $("#address_country_id").val(),
                    fiscal_eoy: $("#fiscal_eoy").val()
                },
                success: function (res) {
                    if (res == "success") {
                        var user_email = window.localStorage.getItem("user_email");
                        $.fn.init_company_table(user_email);
                    }
                    $(".alert-success .notification").html("Successfully Updated!.");
                    $(".alert-success").addClass("show");
                    setTimeout(function () {
                        $(".alert-success").removeClass("show");
                    }, 2000);
                }
            });
        } else {
            $(".alert-danger .notification").html("Please fill all field correctly.");
            $(".alert-danger").addClass("show");
            setTimeout(function () {
                $(".alert-danger").removeClass("show");
            }, 2000);
        }
    });
});