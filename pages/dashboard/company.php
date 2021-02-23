<div class="alert alert-success w-25 float-right fade">
    <button type="button" class="close" data-dismiss="alert"></button>
    <strong> Success! </strong> <span class="notification">Successfully Created</span>.
</div>
<div class="alert alert-danger w-25 float-right fade">
    <button type="button" class="close" data-dismiss="alert"></button>
    <strong> Failed! </strong><span class="notification"> Please fill email field</span>
</div>
<div class="company">
    <div class="main-table row">
        <div class="container-fluid">
            <div class="text-center py-3">
                <P class="h2 font-weight-bold px-3 text-gold">
                    Select Company
                </P>
                <p class="text-secondary"><small>There are all the companies associated with <span id="selected_user_email"> John Smith</span></small></p>
            </div>
            <div class="mb-5 mt-4">
                <div class="progress mx-3">
                </div>
                <div class="nodes text-secondary text-center d-flex justify-content-between">
                    <div>
                        <small>Step 1</small>
                        <div class="node_company node rounded-circle mx-auto bg-warning"></div>
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
                <select id="company_search" class="form-control w-75"></select>
                <span class="text-white font-weight-bold mx-auto flex-nowrap">Company Search</span>
            </div>
            <table id="company_table" class="display table table-hover table-bordered" style="width:100%">
                <thead>
                    <tr class="bg-light">
                        <th style="width: 22%">Company</th>
                        <th style="width: 22%">Sector</th>
                        <th style="width: 22%">Country</th>
                        <th style="width: 17%">Currency</th>
                        <th style="width: 17%">Fiscal EOY</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="d-flex pt-5 justify-content-between">
        <P class="h3 font-weight-bold px-3 text-gold">
            Company Detail
        </P>
        <button id="company_reset" class="btn btn-warning mx-4 px-4 float-right">Reset</button>
    </div>
    <div class="row feature mx-4">
        <div class="col-sm-6">
            <div class="company-detail">
                <div class="pt-2">
                    <p class="sup">Name</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="company_name" class="form-control" placeholder="ABC Fintech">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Sector ID</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <select class="form-control" id="company_sector_id">
                        </select>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Ticker</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="company_ticker" class="form-control" placeholder="ABC">
                    </div>
                </div>
                <div class="pt-2">
                    <div class="company-detail">
                        <p class="sup">Tax ID</p>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text px-3">
                                    <i class="fas fa-university fa-lg"></i>
                                </span>
                            </div>
                            <input type="text" id="company_tax_id" class="form-control" placeholder="23-345-678-321">
                        </div>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Company Number</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="company_num" class="form-control" placeholder="C23-345-678-321">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Website</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-shield-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="company_website" class="form-control" placeholder="https://www.abcfin.com">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Reporting Currency ID</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-dollar-sign fa-lg"></i>
                            </span>
                        </div>
                        <select class="form-control" id="company_currency_id">

                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="company-detail">
                <div class="pt-2">
                    <p class="sup">Address Street 1</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-map-marker-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="address_street_1" class="form-control" placeholder="123 ABC Fintech Street">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Address Street 2</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-map-marker-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="address_street_2" class="form-control" placeholder="Suite 345">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Address City</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-map-marker-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="address_city">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Address State</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-map-marker-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="address_state">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Address PostalZip</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-map-marker-alt fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="address_postalzip" class="form-control" placeholder="ZIP: 3000">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Address Country Id</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-globe fa-lg"></i>
                            </span>
                        </div>
                        <select class="form-control" id="address_country_id"></select>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Fiscal EOY month end</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-history fa-lg"></i>
                            </span>
                        </div>
                        <select class="form-control" id="fiscal_eoy">
                            <?php
                            $feb = date("m") % 4 == 0 ? "Feb 29" : "Feb 28";
                            $eoy_arr = array("Jan 31", "$feb", "Mar 31", "Apr 30", "May 31", "Jun 30", "Jul 31", "Aug 31", "Sep 30", "Oct 31", "Nov 30", "Dec 31");
                            foreach ($eoy_arr as $key => $eoy) {
                                $i++;
                                echo "<option value = '$key'>$eoy</option>";
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <input type="hidden" id="company_hidden_temp">
                <input type="hidden" id="selected_company_hidden">
                <div class="py-4 float-right">
                    <button id="company_add" class="btn btn-warning py-2 px-4 mt-2">
                        <i class="fas fa-plus-circle align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Add</span>
                    </button>
                    <button id="company_update" class="btn btn-warning py-2 px-4 mt-2">
                        <i class="fas fa-cog align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Update</span>
                    </button>
                    <button id="select_company" class="btn btn-warning py-2 px-3 mt-2">
                        <i class="fas fa-university align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Select company</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>