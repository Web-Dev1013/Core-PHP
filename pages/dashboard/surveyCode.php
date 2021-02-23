<div class="alert alert-success w-25 float-right fade">
    <button type="button" class="close" data-dismiss="alert"></button>
    <strong> Success! </strong> <span class="notification">Successfully Created</span>.
</div>
<div class="alert alert-danger w-25 float-right fade">
    <button type="button" class="close" data-dismiss="alert"></button>
    <strong> Failed! </strong><span class="notification"> Please fill email field</span>
</div>
<div class="surveyCode">
    <div class="main-table row">
        <div class="container-fluid">
            <div class="text-center py-3">
                <P id="sc_title_company_name" class="h2 font-weight-bold px-3 text-gold">
                    ABC Fintech (ABC)
                </P>
                <P id="sc_title_period" class="h2 font-weight-bold px-3 text-gold">
                    2018 - Annual (Jul 2017 -Jun 2018)
                </P>
                <P class="h2 font-weight-bold px-3 text-gold">
                    <span id="sc_title_area">Enterprise</span> - LEVEL
                    <span id="sc_title_level">1</span>
                </P>
                <p class="text-secondary"><small>Surveycodes deliver surveys to a specific Surveylogin so that they can be tracked by user and company ( <span id="sc_title_email"></span> )</small>
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
                        <div class="node_code node rounded-circle mx-auto bg-warning"></div>
                        <small>Survey Code</small>
                    </div>
                    <div>
                        <small>Step 4</small>
                        <div class="node_page node rounded-circle mx-auto"></div>
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
                <select id="sc_search" class="form-control w-75"></select>
                <span class="text-white font-weight-bold mx-auto">Code Search</span>
            </div>
            <table id="surveyCode_table" class="display table table-hover table-bordered" style="width:100%">
                <thead>
                    <tr class="bg-light">
                        <th style="width: 15%">Email</th>
                        <th style="width: 15%">Surveyed_co</th>
                        <th>Purchased_co</th>
                        <th style="width: 5%">Year</th>
                        <th style="width: 5%">Period</th>
                        <th style="width: 11%">Area</th>
                        <th style="width: 5%">Paid</th>
                        <th style="width: 5%">Level</th>
                        <th style="width: 13%">username_hash</th>
                        <th style="width: 13%">password_hash</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <P class="h4 pt-5 font-weight-bold px-3 text-gold">
        Details:
    </P>
    <div class="feature">
        <div class="col-lg-10 offset-lg-1 col-md-12 row">
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Name</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-globe fa-lg"></i>
                            </span>
                        </div>
                        <select id="sc_user_email" class="form-control" disabled></select>
                    </div>
                </div>
            </div>
        </div>
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
                        <select id="sc_surveyed_co_id" class="form-control" disabled></select>
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
                        <select id="sc_purchased_co_id" class="form-control" disabled></select>
                    </div>
                </div>
            </div>
        </div>
        <P class="h4 pt-5 font-weight-bold px-3 text-gold">
            Survey Period:
        </P>
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
                        <input type="text" id="sc_area" class="form-control" readonly placeholder="Enterprise">
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
                        <select class="form-control" id="sc_fiscal_eoy" disabled>
                            <?php
                            $feb = date("m") % 4 == 0 ? "Feb 29" : "Feb 28";
                            $eoy_arr = array("Jan 31", "$feb", "Mar 31", "Apr 30", "May 31", "Jun 30", "Jul 31", "Aug 31", "Sep 30", "Oct 31", "Nov 30", "Dec 31");
                            foreach ($eoy_arr as $key => $eoy) {
                                echo "<option value = '$key'>$eoy</option>";
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
                        <select id="sc_period" class="form-control" disabled></select>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Level ID</p>
                    <div class="btn-group sc-level-btn-group">
                        <button id="1" type="button" class="btn btn-warning" disabled>Level1</button>
                        <button id="2" type="button" class="btn btn-outline-warning" disabled>Level2</button>
                        <button id="3" type="button" class="btn btn-outline-warning" disabled>Level3</button>
                        <button id="4" type="button" class="btn btn-outline-warning" disabled>Level4</button>
                        <button id="5" type="button" class="btn btn-outline-warning" disabled>Level5</button>
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
                        <input type="text" id="sc_financial_year" class="form-control" readonly placeholder="2020">
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
                        <input type="text" id="sc_month_start" class="form-control" readonly placeholder="July 1 2019">
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
                        <input type="text" id="sc_month_end" class="form-control" readonly placeholder="June 30 2020">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Payment Success</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <select id="sc_payment_success" class="form-control" disabled>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <P class="h4 pt-5 font-weight-bold px-3 text-gold">
            Survey Login Details:
        </P>
        <div class="col-lg-10 offset-lg-1 col-md-12 row">
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Username Hash</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-lock fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="sc_username_hash" class="form-control" readonly>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Password Hash</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-lock fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="sc_password_hash" class="form-control" readonly>
                    </div>
                </div>
                <input type="hidden" id="sc_hidden_temp">
                <input type="hidden" id="selected_sl_hidden">
                <input type="hidden" id="sc_hash_hidden">
            </div>
        </div>
        <P class="h4 pt-5 font-weight-bold px-3 text-gold">
            The code to a specific survey for the details above
        </P>
        <div class="col-lg-10 offset-lg-1 col-md-12 row">
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Survey code name</p>
                    <div class="input-group">
                        <input type="text" id="sc_code_name" class="form-control" placeholder="Trip Analysis">
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Survey code description</p>
                    <div class="input-group">
                        <input type="text" id="sc_code_description" class="form-control" placeholder="This is a survey to determine how much trips cost.">
                    </div>
                </div>
            </div>
        </div>
        <P class="h4 pt-5 font-weight-bold px-3 text-gold">
            Limitations
            <span class="text-danger px-3">When (<i class="fas fa-times-circle text-danger"></i>) is clicked LIMITATION becomes NULL</span>
        </P>
        <div class="col-lg-10 offset-lg-1 col-md-12 row">
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">max_responses</p>
                    <div class="input-group" style="width: 90%">
                        <input type="text" id="sc_max_responses" class="form-control">
                        <div class="cross-mark">
                            <i class="fas fa-times-circle fa-lg text-danger"></i>
                        </div>
                    </div>
                    <p class="sup float-right mr-5">UNLIMITED used of UNLIMITED</p>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Expires Date</p>
                    <div class="input-group" style="width: 90%">
                        <input type="text" id="sc_expires_date" class="form-control" autocomplete="off">
                        <div class="cross-mark">
                            <i class="fas fa-times-circle fa-lg text-danger"></i>
                        </div>
                    </div>
                    <p class="sup float-right mr-5">Expires in 14 days</p>
                </div>
            </div>
        </div>
        <P class="h4 pt-5 font-weight-bold px-3 text-gold">
            Survey respondents to use this code to access this survey
        </P>
        <div class="col-lg-10 offset-lg-1 col-md-12 row">
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Survey code string</p>
                    <div class="input-group">
                        <input type="text" id="sc_code_string" class="form-control" value="346DGFGFfe!@" placeholder="">
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="pt-2">
                    <p class="sup">Survey code hash</p>
                    <div class="input-group">
                        <input type="text" id="sc_code_hash" class="form-control" placeholder="" readonly>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-10 offset-lg-1 col-md-12 p-4">
            <div class="float-right">
                <button id="sc_add" class="btn btn-warning py-2 px-5 mt-2">
                    <i class="fas fa-plus-circle align-middle fa-lg text-white"></i>
                    <span class=" align-middle pl-2 text-white font-weight-bold">Add</span>
                </button>
                <button id="sc_select" class="btn btn-warning py-2 px-3 mt-2">
                    <span class=" align-middle pl-2 text-white font-weight-bold">Select SurveyCode</span>
                </button>
                <!-- <button id="sc_generate" class="btn btn-warning py-2 px-5 mt-2">
                    <i class="fas fa-key align-middle fa-2x text-white"></i>
                    <span class=" align-middle pl-2 text-white font-weight-bold">Generate</span>
                </button> -->
            </div>
        </div>
    </div>
</div>