<div class="alert alert-success w-25 float-right fade">
  <button type="button" class="close" data-dismiss="alert"></button>
  <strong> Success! </strong> <span class="notification">Successfully Created</span>.
</div>
<div class="alert alert-danger w-25 float-right fade">
  <button type="button" class="close" data-dismiss="alert"></button>
  <strong> Failed! </strong><span class="notification"> Please fill email field</span>
</div>
<div class="surveyPages">
  <div class="main-table row">
    <div class="container-fluid">
      <div class="text-center py-3">
        <P id="sp_title_company_name" class="h2 font-weight-bold px-3 text-gold">
          ABC Fintech (ABC)
        </P>
        <P id="sp_title_period" class="h2 font-weight-bold px-3 text-gold">
          2018 - Annual (Jul 2017 -Jun 2018)
        </P>
        <P class="h2 font-weight-bold px-3 text-gold">
          <span id="sp_title_area">Enterprise</span> - LEVEL
          <span id="sp_title_level">1</span>
        </P>
        <p class="text-secondary"><small>Surveycodes deliver surveys to a specific Surveylogin so that they can be tracked by user and company ( <span id="sp_title_email"></span> )</small>
        </p>
      </div>
      <div class="mb-5 mt-4">
        <div class="progress mx-3">
        </div>
        <div class="nodes text-secondary text-center d-flex justify-content-between">
          <div>
            <small>Step 1</small>
            <div class="node_company node rounded-circle mx-auto"></div>
            <small>Company</small>
          </div>
          <div>
            <small>Step 2</small>
            <div class="node_login node rounded-circle mx-auto"></div>
            <small>Survey Login</small>
          </div>
          <div>
            <small>Step 3</small>
            <div class="node_code node rounded-circle mx-auto"></div>
            <small>Survey Code</small>
          </div>
          <div>
            <small>Step 4</small>
            <div class="node_page node rounded-circle mx-auto bg-warning"></div>
            <small>Survey Pages</small>
          </div>
          <div>
            <small>Step 5</small>
            <div class="node_url node rounded-circle mx- bg-white"></div>
            <small>Survey URL</small>
          </div>
          <div>
            <small>Step 6</small>
            <div class="node_results node rounded-circle mx-auto bg-white"></div>
            <small>Results</small>
          </div>
        </div>
      </div>
      <div class="search-title w-75 p-2 bg-purple flex-nowrap form-inline justify-content-between my-3">
        <select id="surveypage_search" class="form-control w-75"></select>
        <span class="text-white font-weight-bold mx-auto">Page Search</span>
      </div>
      <table id="surveyPages_table" class="display table table-hover table-bordered" style="width:100%">
        <thead>
          <tr class="bg-light">
            <th style="width: 20%">User</th>
            <th>SurveyCode</th>
            <th style="width: 20%">SurveyName</th>
            <th style="width: 20%">page_header</th>
            <th style="width: 10%">Page_display_order</th>
          </tr>
        </thead>
        <tbody class="sp_tbody">
        </tbody>
      </table>
    </div>
  </div>
  <div class="px-3">
    <button id="sp_new" class="btn btn-warning px-4 py-2">
      <i class="fas fa-plus-circle fa-lg"></i> New Page
    </button>
  </div>
  <P class="h4 pt-5 font-weight-bold px-3 text-gold">
    Surveyed Company:
  </P>
  <div class="feature">
    <div class="col-lg-10 offset-lg-1 col-md-12 row">
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Surveyed_co_id</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-university fa-lg"></i>
              </span>
            </div>
            <select id="sp_survey_co_id" class="form-control" disabled></select>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Purchased_co_id</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-university fa-lg"></i>
              </span>
            </div>
            <select id="sp_purchased_co_id" class="form-control" disabled></select>
          </div>
          <p class="sup text-right">If purchased_co_id is NULL, this means the user paid for it personally.</p>
        </div>
      </div>
    </div>
  </div>
  <P class="h4 pt-5 font-weight-bold px-3 text-gold">
    Survey Period:
  </P>
  <div class="feature">
    <div class="col-lg-10 offset-lg-1 col-md-12 row">
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Area</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-street-view fa-lg"></i>
              </span>
            </div>
            <input type="text" id="sp_area" class="form-control" readonly placeholder="Enterprise">
          </div>
        </div>
        <div class="pt-2">
          <p class="sup">Fiscal Year Ends</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-history fa-lg"></i>
              </span>
            </div>
            <select class="form-control" id="sp_fiscal_eoy" disabled>
              <?php
              $id = 0;
              $feb = date("m") % 4 == 0 ? "Feb 29" : "Feb 28";
              $eoy_arr = array("Jan 31", "$feb", "Mar 31", "Apr 30", "May 31", "Jun 30", "Jul 31", "Aug 31", "Sep 30", "Oct 31", "Nov 30", "Dec 31");
              foreach ($eoy_arr as $eoy) {
                if ($eoy == "Jan 31") {
                  echo "<option value = '$id' selected>$eoy</option>";
                } else {
                  echo "<option value = '$id'>$eoy</option>";
                }
                $id++;
              }
              ?>
            </select>
          </div>
        </div>
        <div class="pt-2">
          <p class="sup">Period Id</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-th fa-lg"></i>
              </span>
            </div>
            <select id="sp_period" class="form-control" disabled></select>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Financial Year</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-clock fa-lg"></i>
              </span>
            </div>
            <input type="text" id="sp_financial_year" class="form-control" readonly placeholder="2020">
          </div>
        </div>
        <div class="pt-2">
          <p class="sup">Month Start</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-th fa-lg"></i>
              </span>
            </div>
            <input type="text" id="sp_month_start" class="form-control" readonly placeholder="July 1 2019">
          </div>
        </div>
        <div class="pt-2">
          <p class="sup">Month End</p>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text px-3">
                <i class="fas fa-th fa-lg"></i>
              </span>
            </div>
            <input type="text" id="sp_month_end" class="form-control" readonly placeholder="June 30 2020">
          </div>
        </div>
      </div>
    </div>
  </div>
  <P class="h4 pt-5 font-weight-bold px-3 text-gold">
    Survey Pages:
  </P>
  <div class="feature">
    <div class="col-lg-10 offset-lg-1 col-md-12 row">
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Name</p>
          <div class="input-group">
            <input type="text" id="sp_name_search" class="form-control" placeholder="Enterprise" autocomplete="off">
            <div class="input-group-append">
              <button id="level_category_load" class="btn btn-outline-warning py-1">
                <i class="fas fa-search"> </i> Load
              </button>
            </div>
          </div>
          <div class="w-100 border d-none" id="level_name_list">
          </div>
        </div>
        <div class="input-group">
          <div class="input-group-prepend level-search">
            <button id="search_base_template" class="btn btn-warning py-1">
              SEARCH LEVEL 1 PAGES
            </button>
          </div>
          <select id="sp_level1_search" class="form-control w-50" placeholder="SEARCH BASE CATEGORIES"></select>
        </div>
        <div class="pt-2">
          <p class="sup">Level ID</p>
          <div class="btn-group sp-level-btn-group">
            <button id="sp_1" value="1" type="button" class="btn btn-warning" disabled>Level1</button>
            <button id="sp_2" value="2" type="button" class="btn btn-outline-warning" disabled>Level2</button>
            <button id="sp_3" value="3" type="button" class="btn btn-outline-warning" disabled>Level3</button>
            <button id="sp_4" value="4" type="button" class="btn btn-outline-warning" disabled>Level4</button>
            <button id="sp_5" value="5" type="button" class="btn btn-outline-warning" disabled>Level5</button>
          </div>
        </div>
        <div class="pt-2">
          <button class="btn btn-warning px-3 py-2" id="preview">Preview template</button>
          <button class="btn btn-warning px-3 py-2" id="load_surveyPage">Load as survey Page</button>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="pt-2">
          <p class="sup">Survey_page_name_admin</p>
          <input type="text" id="sp_name_admin" class="form-control" placeholder="HE1000 - Holiday Expenditure - Plain Text Description">
        </div>
        <div class="pt-5">
          <p class="sup">Survey_page_description_admin</p>
          <input type="text" id="sp_description" class="form-control" placeholder="">
        </div>
        <div class="pt-2">
          <button class="btn btn-warning px-2 py-2">Save template AS</button>
          <button class="btn btn-warning px-2 py-2">Update this template</button>
        </div>
      </div>
    </div>
  </div>
  <P class="h4 pt-5 font-weight-bold px-3 text-gold">
    Formatting Options:
  </P>
  <div class="feature format">
    <div class="col-lg-10 offset-lg-1 col-md-12 row">
      <div class="col-sm-6">
        <div class="pt-2 d-flex">
          <div class="px-2">
            <p class="sup">survey_page_currency</p>
            <div class="btn-group currency_format">
              <button id="usd" type="button" class="btn btn-warning"> $ </button>
              <button id="euro" type="button" class="btn btn-outline-warning"> € </button>
              <button id="gbp" type="button" class="btn btn-outline-warning"> £ </button>
            </div>
            <p class="sup">If none selected it is without currency</p>
          </div>
          <div class="px-2">
            <p class="sup">survey_page_separator</p>
            <div class="btn-group separate_format">
              <button id="comma" type="button" class="btn btn-warning">
                <a class="h1 line-height-none">, .</a>
              </button>
              <button id="dot" type="button" class="btn btn-outline-warning">
                <a class="h1 line-height-none">. ,</a>
              </button>
            </div>
            <p class="sup">Currency auto selects separators</p>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="pt-2 d-flex">
          <div class="px-2">
            <p class="sup">survey_page_decimal</p>
            <div class="btn-group decimal_format">
              <button id="dc_2" value="2" type="button" class="btn btn-warning"> 2 </button>
              <button id="dc_1" value="1" type="button" class="btn btn-outline-warning"> 1 </button>
              <button id="dc_0" value="0" type="button" class="btn btn-outline-warning"> 0 </button>
            </div>
            <p class="sup">Shown decimal places</p>
          </div>
          <div class="px-2">
            <p class="sup">survey_page_separator</p>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text px-3">
                  <i class="fas fa-lock fa-lg"></i>
                </span>
              </div>
              <input type="text" id="sp_unit" class="form-control" placeholder="Artedgs XYZ Wedrs Lifabes">
              <input type="hidden" id="sp_hidden_temp">
            </div>
            <p class="sup text-right">Plaintext that duplicates in the table</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="feature">
    <div class="col-lg-10 offset-lg-1 col-md-12 row">
      <div class="pt-5 w-100">
        <div class="">
          <i class="fas fa-pencil-alt text-gold fa-lg"></i>
          <span id="sp_header_user" class="px-3 border-bottom text-gold special-border" contenteditable>
          </span>
          <p class="ml-4 sup text-secondary">Survey_page_header_user</p>
        </div>
        <div class="pt-3">
          <i class="fas fa-pencil-alt text-gold fa-lg"></i>
          <span id="sp_tagline_user" class="px-3 border-bottom text-gold special-border" contenteditable>
          </span>
          <p class="ml-4 sup text-secondary">Survey_page_tagline_user</p>
        </div>
      </div>
      <div class="pt-4 expenditure">
        <table class="table table-hover" id="template">
        </table>
      </div>
    </div>
  </div>
  <div class="feature">
    <div class="col-lg-10 offset-lg-1 col-md-12 row pt-3 w-100">
      <div class="d-flex justify-content-between w-100">
        <button id="results_summary" class="btn btn-warning px-4 py-2"><i class="fas fa-alarm-clock"></i> Results Summary</button>
        <button id="standardize" class="btn btn-warning px-4 py-2"><i class="fas fa-calculator-alt"></i> Standardize %</button>
        <button id="save_page" class="btn btn-warning px-4 py-2"><i class="fas fa-download"></i> Save Page</button>
        <button id="update_page" class="btn btn-warning px-4 py-2"><i class="fas fa-cloud-upload-alt"></i> Update Page</button>
      </div>
    </div>
    <div class="col-lg-10 offset-lg-1 col-md-12 row pt-5 w-100">
      <table id="recommendation" class="display table table-hover table-bordered" style="width: 100%;">
        <thead>
          <tr class="bg-light">
            <th style="width: 20%">Survey Page</th>
            <th style="width: 20%">Date</th>
            <th style="width: 30%">Recommendation</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
    <div class="col-lg-10 offset-lg-1 col-md-12 row pt-3 w-100">
      <table id="feedback" class="display table table-hover table-bordered" style="width:100%">
        <thead>
          <tr class="bg-light">
            <th style="width: 20%">Survey Page</th>
            <th style="width: 20%">Date</th>
            <th style="width: 30%">Feedback</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
</div>
</div>