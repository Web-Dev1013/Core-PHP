$(function () {
  //  ********************************************** Main table *************************************************
  var surveyPages_table = $("#surveyPages_table").DataTable({
    "columns": [{
        "title": "User",
        "data": "user"
      },
      {
        "title": "SurveyCode",
        "data": "codeHash"
      },
      {
        "title": "Survey_code_name",
        "data": "codeName"
      },
      {
        "title": "Survey_page_header",
        "data": "pageHeader"
      },
      {
        "title": "page_display_order",
        "data": "pageOrder"
      },
    ],
    "filter": false,
    "info": false,
    "paginate": true
  });
  $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
  $("#surveyPages_table_length").hide();
  $("#surveyPages_table_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

  //  ************************************************ Recommendation Table *****************************************
  var rec_table = $("#recommendation").DataTable({
    "column": [{
        "title": "Survey Page",
        "data": "survey_page"
      },
      {
        "title": "Date",
        "data": "date"
      },
      {
        "title": "Recommendation",
        "data": "recommendation"
      }
    ],
    "filter": false,
    "info": false,
    "paginate": true
  });
  $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
  $("#recommendation_length").hide();
  $("#recommendation_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");

  //  ************************************************** Feedback Table ***********************************************
  var fb_table = $("#feedback").DataTable({
    "column": [{
        "title": "Survey Page",
        "data": "survey_page"
      },
      {
        "title": "Date",
        "data": "date"
      }, {
        "title": "Feedback",
        "data": "feedback"
      }
    ],
    "filter": false,
    "info": false,
    "paginate": true
  });
  $(".dataTables_paginate.paging_simple_numbers").addClass("float-right mb-2");
  $("#feedback_length").hide();
  $("#feedback_length select").addClass("form-control mx-auto w-50 border-warning text-gold font-weight-bold");
  // *********************************************************** Init define ********************************************

  // Init SurveyPage Table
  $.fn.init_surveyPage_table = function () {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "init_surveyPage_table",
        sc_hash: window.localStorage.getItem("sc_hash")
      },
      success: function (res) {
        if (res == "") {
          $(".alert-danger .notification").html("No registered data!");
          $(".alert-danger").addClass("show");
          setTimeout(function () {
            $(".alert-danger").removeClass("show");
          }, 2000);
        } else {
          res = JSON.parse(res);
          surveyPages_table.clear();
          $.each(res, function (index, value) {
            var rowIndex = surveyPages_table.row.add(value);
            var row = $('#surveyPages_table').dataTable().fnGetNodes(rowIndex);
            $(row).attr('id', res[index]["id"]);
          });
          surveyPages_table.draw();
          var page_search = "";
          for (x in res) {
            page_search += "<option value='" + res[x]["id"] + "'>" + res[x]["codeName"] + "</option>";
          }
          $("#surveypage_search").html(page_search);
          $("#surveypage_search").select2();
        }
      }
    });
  }

  //  Base detail Data
  $.fn.sp_base_data = function (sc_hash) {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "sp_base_data",
        sc_hash: sc_hash
      },
      success: function (res) {
        res = JSON.parse(res);
        $("#sp_survey_co_id").val(res.surveyed_co_id);
        $("#sp_purchased_co_id").val(res.purchased_co_id);
        $("#sp_area").val(res.area);
        $("#sp_financial_year").val(res.financial_year);
        $("#sp_fiscal_eoy").val(res.fiscal_year_ends);
        $("#sp_month_start").val(res.month_start);
        $("#sp_month_end").val(res.month_end);
        $("#sp_period").val(res.period_id);
        $(".sp-level-btn-group button").removeClass("btn-warning");
        $(".sp-level-btn-group button").addClass("btn-outline-warning");
        $("#sp_" + res.level_id).addClass("btn-warning");
        $("#sp_" + res.level_id).removeClass("btn-outline-warning");
      }
    })
  }

  //  Init template function
  var value_arr = [];
  $.fn.display_template = function (res) {
    res = JSON.parse(res);
    var template_data = "";
    value_arr = [];
    for (x in res) {
      value_arr.push(res[x]["value"]);
      if (res[x]["flag_id"] == 1) {
        template_data += "<thead><tr id='" + res[x]["id"] + "'><td></td><td><img src='assets/image/page1/" + res[x]["icon_url"] + "' width='30px' height='30px'></td><td>" + res[x]["name"] + "<p class='sup text-gold'>" + res[x]["category_code"] + "</p></td><td><span class='sp_current'> $ </span></td><td class='value'>" + res[x]["value"] + "</td><td><span class='page_unit sup'>" + res[x]["unit"] + "</span></td><td class='all-percentage'>" + res[x]["percentage"] + "</td></tr></thead><tbody class='row_position'>";
      }
      if (res[x]["flag_id"] == 0) {
        template_data += "<tr id='" + res[x]["id"] + "'><td><span class='eye p-2'><i class='fas fa-eye fa-lg text-gold'></i></span></td><td><img src='assets/image/page1/" + res[x]["icon_url"] + "' width='30px' height='30px'></td><td>" + res[x]["name"] + "<p class='sup text-gold'>" + res[x]["category_code"] + "</p></td><td><span class='sp_current'> $ </span></td><td class='value'>" + res[x]["value"] + "</td><td><span class='page_unit sup'>" + res[x]["unit"] + "</span></td><td class='percentage'>" + res[x]["percentage"] + "</td></tr>";
      }
      if (res[x]["flag_id"] == 2) {
        template_data += "</tbody><tfoot><tr id='" + res[x]["id"] + "'><td><span id='sp_add_row' class='p-2'><i class='fas fa-plus-circle text-gold fa-2x'></i></span></td><td><i class='fas fa-question-circle fa-2x text-gold'></i></td><td>" + res[x]["name"] + "<p class='sup text-gold'>" + res[x]["category_code"] + "</p></td><td><span class='sp_current'> $ </span></td><td class='value'>" + res[x]["value"] + "</td><td><span class='page_unit sup'>" + res[x]["name"] + "</span></td><td class='sub-percentage'>" + res[x]["percentage"] + "</td></tr></tfoot>";
      }
    }
    return template_data;
  };

  $.fn.init_template = function () {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "init_template"
      },
      async: false,
      success: function (res) {
        $("#template").html($.fn.display_template(res));
      }
    });
  }

  // Base Detail data and formatting option
  $.fn.detail_and_formatting_data = function (tr_id) {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "detail_and_formatting_data",
        level_id: $(".sp-level-btn-group .btn-warning").attr("value"),
        tr_id: tr_id
      },
      success: function (res) {
        res = JSON.parse(res);
        $("#sp_name_search").val(res.survey_page_header_user);
        $("#sp_header_user").html(res.survey_page_header_user);
        $("#sp_tagline_user").html(res.survey_page_tagline_user);
        $("#sp_name_admin").val(res.survey_page_name_admin);
        $("#sp_description").val(res.survey_page_description_admin);
        $("#sp_unit").val(res.survey_page_unit);
        for (n in $(".currency_format button")) {
          if ($(".currency_format button").eq(n).html() == res.survey_page_currency) {
            $(".currency_format button").addClass("btn-outline-warning");
            $(".currency_format button").removeClass("btn-warning");
            $(".currency_format button").eq(n).addClass("btn-warning");
            $(".currency_format button").eq(n).removeClass("btn-outline-warning");
          }
        }
        $("#" + res.survey_page_separator).addClass("btn-warning");
        $("#" + res.survey_page_separator).removeClass("btn-outline-warning");
        $("#dc_" + res.survey_page_decimals).addClass("btn-warning");
        $("#dc_" + res.survey_page_decimals).removeClass("btn-outline-warning");
      }
    });
  }

  // Template table define.
  $.fn.template_table_data = function (tr_id) {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "template_table_data",
        tr_id: tr_id,
        level_id: $(".sp-level-btn-group .btn-warning").attr("value"),
      },
      success: function (res) {
        $.fn.display_template(res);
      }
    });
  }

  $("#page_item").on("click", function () {
    var sc_hash = window.localStorage.getItem("sc_hash");
    if (sc_hash == null) {
      $(".alert-danger .notification").html("No survey code selected!");
      $(".alert-danger").addClass("show");
      setTimeout(function () {
        $(".alert-danger").removeClass("show");
      }, 2000);
    } else {
      $.fn.init_surveyPage_table();
      $.fn.sp_base_data(sc_hash);
      $.fn.init_template();
      $("#sp_fiscal_eoy").select2();

      // Move row
      $(".row_position").sortable({
        delay: 150,
        stop: function () {
          var selectedData = new Array();
          $('.row_position>tr').each(function () {
            selectedData.push($(this).attr("id"));
          });
          $.fn.updateOrder(selectedData);
        }
      });
      $.fn.updateOrder = function (data) {
        $.ajax({
          url: "model/pages/surveyPages_model.php",
          type: 'POST',
          data: {
            type: "move_row",
            position: data
          },
          async: false,
          success: function (res) {
            if (res == "success") {
              $(".alert-success .notification").html("Successfully Changed!.");
              $(".alert-success").addClass("show");
              setTimeout(function () {
                $(".alert-success").removeClass("show");
              }, 2000);
            }
          }
        });
      }
    }    

    // Company title define
    var company_title = window.localStorage.getItem("init_company_title");
    res = JSON.parse(company_title);
    $("#sp_title_company_name").html(res.company_name);
    $("#sp_title_area").html(res.area);
    $("#sp_title_period").html(res.financial_year + " - " + res.period + "( " + res.month_start + " - " + res.month_end + " )");
    $("#sp_title_email").html(res.email);
    $("#sp_title_level").html(res.level_id);
  });


  //  Hide tr of expenditure table.
  $("#template").on("click", function (e) {
    if ($(e.target).parent().hasClass("fa-eye") == true || $(e.target).hasClass("fa-eye") == true) {
      $(e.target).parents("td").find(".fa-eye").toggleClass("fa-eye-slash");
      $(e.target).parents("tr").css("background", "#ff222233");
      for (x in value_arr) {
        // Stop
      }
    }
  });

  // Init period
  $.ajax({
    url: "model/pages/surveyPages_model.php",
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
      $("#sp_period").html(period_data);
    }
  })

  // Init Company
  $.ajax({
    url: "model/pages/surveyPages_model.php",
    type: "POST",
    data: {
      type: "init_company"
    },
    success: function (res) {
      var init_company_data = "";
      res = JSON.parse(res);
      for (x in res) {
        init_company_data += "<option value='" + res[x]["id"] + "'>" + res[x]["name"] + "</option>";
      }
      $("#sp_survey_co_id").html(init_company_data);
      $("#sp_purchased_co_id").html(init_company_data);
    }
  });

  // Init Base Categories Name
  $.ajax({
    url: "model/pages/surveyPages_model.php",
    type: "POST",
    data: {
      type: "init_base_categories"
    },
    success: function (res) {
      res = JSON.parse(res);
      var b_c_data = "";
      for (x in res) {
        b_c_data += "<option value='" + res[x]["template_id"] + "'>" + res[x]["name"] + "</option>";
      }
      $("#sp_level1_search").html(b_c_data);
    }
  });

  $("#level_category_load").on("click", function () {
    if ($("#sp_name_search").val() != "") {
      $.ajax({
        url: "model/pages/surveyPages_model.php",
        type: "POST",
        data: {
          type: "sp_name_load",
          keyword: $("#sp_name_search").val(),
          level_id: $(".sp-level-btn-group .btn-warning").attr("value")
        },
        success: function (res) {
          res = JSON.parse(res);
          $("#sp_name_admin").val(res.name);
          $("#sp_description").val(res.description);
          $("#sp_unit").val(res.unit);
          $("#sp_hidden_temp").val(res.id);
          $(".format button").removeClass("btn-warning");
          $(".format button").addClass("btn-outline-warning");
          for(x in $(".currency_format button")){
            if($(".currency_format button:eq("+x+")").html() == res.currency){
              $(".currency_format button").removeClass("btn-warning");
              $(".currency_format button").addClass("btn-outline-warning");
              $(".currency_format button:eq("+x+")").addClass("btn-warning");
              $(".currency_format button:eq("+x+")").removeClass("btn-outline-warning");
            }
          }
          $("#" + res.separator).addClass("btn-warning");
          $("#" + res.separator).removeClass("btn-outline-warning");
          $("#dc_" + res.decimal).addClass("btn-warning");
          $("#dc_" + res.decimal).removeClass("btn-outline-warning");
        }
      });
    } else {
      $(".alert-danger .notification").html("Please select survey page name!.");
      $(".alert-danger").addClass("show");
      setTimeout(function () {
        $(".alert-danger").removeClass("show");
      }, 2500);
    }
  });

  // Save survey page
  $("#save_page").on("click", function () {
    var sc_hash = window.localStorage.getItem("sc_hash");
    if ($("#sp_header_user").html() != "") {
      $.ajax({
        url: "model/pages/surveyPages_model.php",
        type: "POST",
        data: {
          type: "save_surveyPage",
          sp_code_name: $("#sp_name_search").val(),
          sp_level_id: $(".sp-level-btn-group .btn-warning").attr("value"),
          sp_template_id: $("#sp_level1_search").val(),
          sp_name_admin: $("#sp_name_admin").val(),
          sp_description: $("#sp_description").val(),
          sp_currency: $(".currency_format .btn-warning").html(),
          sp_separate: $(".separate_format .btn-warning").attr("id"),
          sp_decimal: $(".decimal_format .btn-warning").html(),
          sp_unit: $("#sp_unit").val(),
          sp_header_user: $("#sp_header_user").html(),
          sp_tagline_user: $("#sp_tagline_user").html(),
          sc_hash: sc_hash
        },
        async: false,
        success: function (res) {
          if (res == "success") {
            $(".alert-success .notification").html("Successfully saved!");
            $(".alert-success").addClass("show");
            setTimeout(function () {
              $(".alert-success").removeClass("show");
            }, 2000);
            $.fn.init_surveyPage_table();
          }
        }
      });
    } else {
      $(".alert-danger .notification").html("Please input survey page header name!");
      $(".alert-danger").addClass("show");
      setTimeout(function () {
        $(".alert-danger").removeClass("show");
      }, 2000);
    }
  });

  // Update
  $("#update_page").on("click", function () {
    var sc_hash = window.localStorage.getItem("sc_hash");
    var update_sp_id = window.localStorage.getItem("update_sp_id");
    if ($("#sp_header_user").html() != "") {
      $.ajax({
        url: "model/pages/surveyPages_model.php",
        type: "POST",
        data: {
          type: "update_surveyPage",
          update_sp_id: update_sp_id,
          sp_code_name: $("#sp_name_search").val(),
          sp_level_id: $(".sp-level-btn-group .btn-warning").attr("value"),
          sp_name_admin: $("#sp_name_admin").val(),
          sp_description: $("#sp_description").val(),
          sp_currency: $(".currency_format .btn-warning").html(),
          sp_separate: $(".separate_format .btn-warning").attr("id"),
          sp_decimal: $(".decimal_format .btn-warning").html(),
          sp_unit: $("#sp_unit").val(),
          sp_header_user: $("#sp_header_user").html(),
          sp_tagline_user: $("#sp_tagline_user").html(),
          sc_hash: sc_hash
        },
        async: false,
        success: function (res) {
          if (res == "success") {
            $(".alert-success .notification").html("Successfully updated!");
            $(".alert-success").addClass("show");
            setTimeout(function () {
              $(".alert-success").removeClass("show");
            }, 2000);
            $.fn.init_surveyPage_table();
          }
        }
      });
    } else {
      $(".alert-danger .notification").html("Please input survey page header name!");
      $(".alert-danger").addClass("show");
      setTimeout(function () {
        $(".alert-danger").removeClass("show");
      }, 2000);
    }
  });

  // When click preview button
  $("#preview").on("click", function () {
    if ($("sp_name_hidden").val() != "") {
      $.ajax({
        url: "model/pages/surveyPages_model.php",
        type: "POST",
        data: {
          type: "init_template",
          page_id: $("#sp_hidden_temp").val(),
          level_id: window.localStorage.getItem("level_id")
        },
        success: function (res) {
          var template_data = $.fn.display_template(res);
          var separate_format;
          var group_separate;
          if ($(".separate_format btn-warning").attr("id") == "dot") {
            separate_format = ",";
            group_separate = ".";
          } else {
            separate_format = ".";
            group_separate = ",";
          }
          for (x in value_arr) {
            $(".value:eq(" + x + ")").html(value_arr[x]);
          }
          new AutoNumeric.multiple('.value', {
            currencySymbol: "",
            caretPositionOnFocus: "start",
            modifyValueOnWheel: false,
            decimalCharacter: separate_format,
            digitGroupSeparator: group_separate,
            decimalPlaces: 2
          });
          $("#template").html(template_data);
        }
      });
    } else {
      $(".alert-danger .notification").html("Don't exist the defined data!");
      $(".alert-danger").addClass("show");
      setTimeout(function () {
        $(".alert-danger").removeClass("show");
      }, 2500);
    }
  });

  // Search Template from basecategories table
  $("#search_base_template").on("click", function () {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "search_base_template",
        keyword: $("#sp_level1_search").val()
      },
      success: function (res) {
        $("#template").html($.fn.display_template(res));
      }
    });
  });

  //   **************************************************** Auth Numeric define *******************************************
  var separate_format;
  var group_separate;
  var decimal_format = 2;
  if ($(".separate_format .btn-warning").attr("id") == "comma") {
    group_separate = ",";
    separate_format = ".";
  } else {
    group_separate = ".";
    separate_format = ",";
  }
  //  Select Currency format
  $(".currency_format button").on("click", function () {
    $(".currency_format button").removeClass("btn-warning");
    $(".currency_format button").addClass("btn-outline-warning");
    $(this).addClass("btn-warning");
    $(this).removeClass("btn-outline-warning");
    $(".sp_current").html($(this).html());
  });

  //  Select page separator
  $(".separate_format button").on("click", function () {
    $(".separate_format button").removeClass("btn-warning");
    $(".separate_format button").addClass("btn-outline-warning");
    $(this).addClass("btn-warning");
    $(this).removeClass("btn-outline-warning");
    if ($(this).attr("id") == "comma") {
      for (x in value_arr) {
        $(".value:eq(" + x + ")").html(value_arr[x]);
      }
      separate_format = ".";
      group_separate = ",";
      new AutoNumeric.multiple('.value', {
        currencySymbol: "",
        caretPositionOnFocus: "start",
        modifyValueOnWheel: false,
        decimalCharacter: separate_format,
        digitGroupSeparator: group_separate,
        decimalPlaces: decimal_format
      });
    }
    if ($(this).attr("id") == "dot") {
      for (x in value_arr) {
        $(".value:eq(" + x + ")").html(value_arr[x]);
      }
      separate_format = ",";
      group_separate = ".";
      new AutoNumeric.multiple('.value', {
        currencySymbol: "",
        caretPositionOnFocus: "start",
        modifyValueOnWheel: false,
        decimalCharacter: separate_format,
        digitGroupSeparator: group_separate,
        decimalPlaces: decimal_format
      });
    }
  });

  //  Decimal format
  $(".decimal_format button").on("click", function () {
    $(".decimal_format button").removeClass("btn-warning");
    $(".decimal_format button").addClass("btn-outline-warning");
    $(this).addClass("btn-warning");
    $(this).removeClass("btn-outline-warning");
    decimal_format = Number($(this).html());
    for (x in value_arr) {
      $(".value:eq(" + x + ")").html(value_arr[x]);
    }
    new AutoNumeric.multiple('.value', {
      currencySymbol: "",
      caretPositionOnFocus: "start",
      modifyValueOnWheel: false,
      decimalCharacter: separate_format,
      digitGroupSeparator: group_separate,
      decimalPlaces: decimal_format
    });
  })

  // Auto Numeric
  new AutoNumeric.multiple('.value', {
    currencySymbol: "",
    caretPositionOnFocus: "start",
    modifyValueOnWheel: false,
    decimalCharacter: separate_format,
    digitGroupSeparator: group_separate,
    decimalPlaces: decimal_format
  });


  // When click the row on surveyPage Table
  var l_c_data = []; // Level category Data 
  $("#surveyPages_table tbody").on("dblclick", function (e) {
    var tr_id = $(e.target).parent().attr("id");
    window.localStorage.setItem("update_sp_id", tr_id);
    $("#surveyPages_table tbody tr").removeClass("table-active");
    $("#surveyPages_table #" + tr_id).addClass("table-active");
    var level_temp = "";
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: "POST",
      data: {
        type: "display_selected_surveyPages_data",
        tr_id: tr_id
      },
      success: function (res) {
        res = JSON.parse(res);
        $("#sp_survey_co_id").val(res.surveyed_co_id);
        $("#sp_purchased_co_id").val(res.purchased_co_id);
        $("#sp_area").val(res.area);
        $("#sp_fiscal_eoy").val(res.fiscal_year_ends);
        $("#sp_period").val(res.period_id);
        $("#sp_financial_year").val(res.financial_year);
        $("#sp_month_start").val(res.month_start);
        $("#sp_month_end").val(res.month_end);
        window.localStorage.setItem("surveycode_id", res.surveycode_id);
        window.localStorage.setItem("surveylogin_id", res.surveylogin_id);
        window.localStorage.setItem("level_id", res.level_id);
        level_temp = res.level_id;
        for (x in $(".sp-level-btn-group button")) {
          if ($(".sp-level-btn-group button:eq(" + x + ")").attr("value") == res.level_id) {
            $(".sp-level-btn-group button").removeClass("btn-warning");
            $(".sp-level-btn-group button").addClass("btn-outline-warning");
            $(".sp-level-btn-group button:eq(" + x + ")").addClass("btn-warning");
            $(".sp-level-btn-group button:eq(" + x + ")").removeClass("btn-outline-warning");
          }
        }
        $.fn.detail_and_formatting_data(tr_id);
        $.fn.template_table_data(tr_id);
      }
    });
  });

  // Init Level categories
  $.ajax({
    url: "model/pages/surveyPages_model.php",
    type: "POST",
    data: {
      type: "init_level_categories",
      level_id: $(".sp-level-btn-group .btn-warning").attr("value")
    },
    success: function (res) {
      res = JSON.parse(res);
      l_c_data = res;
    }
  });

  // Level name Search
  $("#sp_name_search").on("keyup", function () {
    var l_c_name = "";
    var key = new RegExp($("#sp_name_search").val(), 'i');
    $("#level_name_list").removeClass("d-none");
    for (x in l_c_data) {
      if (l_c_data[x]["name"].search(key) > -1) {
        l_c_name += "<div class='px-3 py-1' id='" + l_c_data[x]["id"] + "'>" + l_c_data[x]["name"] + "</div>";
      }
    }
    $("#level_name_list").html(l_c_name);
  });

  $("#level_name_list").on("click", function (e) {
    if ($(e.target).parent().attr("id") == "level_name_list") {
      $("#sp_name_search").val($(e.target).html());
      $("#level_name_list").addClass("d-none");
    }
  });

  $("#level_name_list").on("mouseleave", function () {
    $(this).addClass("d-none");
  })

  // ***************************************************** User define *************************************************** 
  // Survey page table move row
  $(".sp_tbody").sortable({
    delay: 150,
    stop: function () {
      var selectedData = new Array();
      $('.sp_tbody>tr').each(function () {
        selectedData.push($(this).attr("id"));
      });
      $.fn.sp_updateOrder(selectedData);
    }
  });
  $.fn.sp_updateOrder = function (data) {
    $.ajax({
      url: "model/pages/surveyPages_model.php",
      type: 'POST',
      data: {
        type: "sp_table_row",
        level_id: $("sp-level-btn-group .btn-warning").attr("value"),
        position: data
      },
      async: false,
      success: function (res) {
        if (res == "success") {
          $(".alert-success .notification").html("Successfully Changed!.");
          $(".alert-success").addClass("show");
          setTimeout(function () {
            $(".alert-success").removeClass("show");
          }, 2000);
          $.fn.init_surveyPage_table();
        }
      }
    });
  }

  //  Add new row
  var add_id = 0;
  $("#template").on("click", function (e) {
    if ($(e.target).parent().attr("id") == "sp_add_row" || $(e.target).attr("id") == "sp_add_row" || $(e.target).parents("span").attr("id") == "sp_add_row") {
      if (add_id == 0) {
        var add_row = "<tr><td></td><td><button class='btn btn-warning btn-sm' id='icon_upload'><i class='fas fa-upload'></i></button><input type='file' id='file'></td><td class='form-inline'><input type='text' id='new_name' class='form-control w-50' placeholder='name'><input type='text' id='new_code' class='form-control w-50' placeholder='HE1000.****'></div></td><td><span class='sp_current'> $ </span></td><td colspan='3' class='d-flex'><input type='text' id='new_percentage' class='form-control w-75' placeholder='Percentage'><button class='btn btn-warning btn-sm' id='sp_add_data'>Add</button></td><td></td><td></td></tr>";
        $("#template tbody").append(add_row);
        add_id++;
      }
    }
  });

  //  Icon Upload
  var file;
  var fdata = new FormData();
  $("#template").on("click", function (e) {
    if ($(e.target).attr("id") == "sp_add_data" || $(e.target).parent().attr("id") == "sp_add_data" || $(e.target).parents("span").attr("id") == "sp_add_data") {
      if (Number($("#new_percentage").val()) > Number($(".sub-percentage").html())) {
        $(".alert-danger .notification").html("Your plan is filled fully. Please reset your plan.");
        $(".alert-danger").addClass("show");
        setTimeout(function () {
          $(".alert-danger").removeClass("show");
        }, 2000);
      } else {
        var total_temp = $("#template thead").find(".value").html();
        if ($("#comma").hasClass("btn-warning") == true) {
          total_temp = total_temp.replace(",", "");
        } else {
          total_temp = total_temp.replace(",", "");
        }
        var new_value = Number(total_temp) * Number($("#new_percentage").val());
        var sub_percentage = Number($(".sub-percentage").html()) - Number($("#new_percentage").val());
        var sub_value = Number(total_temp) * sub_percentage;
        var sub_order = Number($("#template tbody tr").length) + 2;
        var level_id = $(".sp-level-btn-group .btn-warning").attr("value");
        file = $("#file")[0].files[0];
        fdata.append("file", file);
        fdata.append("name", $("#new_name").val());
        fdata.append("percentage", $("#new_percentage").val());
        fdata.append("code", $("#new_code").val());
        fdata.append("value", new_value)
        fdata.append("order", Number($("#template tbody tr").length));
        fdata.append("sub_percentage", sub_percentage);
        fdata.append("sub_value", sub_value);
        fdata.append("sub_order", sub_order);
        fdata.append("sub_id", Number($(".sub-percentage").parent().attr("id")));
        fdata.append("level_id", level_id);
        fdata.append("surveylogin_id", window.localStorage.getItem("surveylogin_id"));
        fdata.append("surveycode_id", window.localStorage.getItem("surveycode_id"));
        $.ajax({
          url: "model/pages/upload.php",
          type: "POST",
          data: fdata,
          processData: false,

          contentType: false,
          dataType: "text",
          async: false,
          success: function (res) {
            if (res == "success") {
              $.fn.init_template();
            }
          }
        });
      }
    }
  });

  // When click New Page Button
  $("#sp_new").on("click", function(){
    $("#sp_name_search").val("");
    $("#sp_name_admin").val("");
    $("#sp_description").val("");
    $("#sp_unit").val("");
    $("#sp_header_user").html("");
    $("#sp_tagline_user").html("");
    $("#currency_format button").removeClass("btn-warning");
    $("#currency_format button").addClass("btn-outline-warning");
    $("#currency_format button:eq(0)").addClass("btn-warning");
    $("#currency_format button:eq(0)").removeClass("btn-outline-warning");
    $("#separate_format button").removeClass("btn-warning");
    $("#separate_format button").addClass("btn-outline-warning");
    $("#separate_format #comma").addClass("btn-warning");
    $("#separate_format #comma").removeClass("btn-outline-warning");
    $("#decimal_format button").removeClass("btn-warning");
    $("#decimal_format button").addClass("btn-outline-warning");
    $("#decimal_format #dc_2").addClass("btn-warning");
    $("#decimal_format #dc_2").removeClass("btn-outline-warning");
  });

});