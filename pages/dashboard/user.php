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
                    Create User
                </P>
                <p class="text-secondary"><small>Users are containers for multiple companies</small></p>
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
                <select id="user_search" class="form-control w-75"></select>
                <span class="text-white font-weight-bold mx-auto">User Search</span>
            </div>
            <table id="user_table" class="display table table-hover table-bordered" style="width:100%">
                <thead>
                    <tr class="bg-light">
                        <th style="width: 22%">Company</th>
                        <th style="width: 22%">First Name</th>
                        <th style="width: 22%">Last Name</th>
                        <th style="width: 17%">Email Address</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="d-flex justify-content-between">
        <P class="h3 font-weight-bold px-3 text-gold">
            User Edit Details
        </P>
        <button id="user_reset" class="btn btn-warning px-3 mx-4">Reset</button>
    </div>
    <div class="container-fluid row feature">
        <div class="col-sm-6">
            <div class="company-detail">
                <div class="pt-2">
                    <p class="sup">Email</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-globe fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="user_email" class="form-control" placeholder="JohnSmith@abcfin.com">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Password</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-lock fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="user_password" class="form-control" placeholder="JohnSmith1234">
                    </div>
                </div>
                <div class="pt-2">
                    <div class="company-detail">
                        <p class="sup">First Name</p>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text px-3">
                                    <i class="fas fa-university fa-lg"></i>
                                </span>
                            </div>
                            <input type="text" id="first_name" class="form-control" placeholder="John">
                        </div>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Last Name</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="last_name" class="form-control" placeholder="Smith">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="company-detail">
                <div class="pt-2">
                    <p class="sup">Works for co ID</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <select id="works_for_id" class="form-control">
                        </select>
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Job title</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" id="job_title" class="form-control" placeholder="Manager">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Phone Number</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="phone_number">
                    </div>
                </div>
                <div class="pt-2">
                    <p class="sup">Phone Country ID</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text px-3">
                                <i class="fas fa-university fa-lg"></i>
                            </span>
                        </div>
                        <select class="form-control" id="phone_country_id">
                        </select>
                    </div>
                </div>
                <input type="hidden" id="user_hidden_temp">
                <div class="py-4 float-right">
                    <button id="user_add" class="btn btn-warning py-2 px-4 mt-2">
                        <i class="fas fa-plus-circle align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Add</span>
                    </button>
                    <button id="user_update" class="btn btn-warning py-2 px-3 mt-2">
                        <i class="fas fa-cog align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Update</span>
                    </button>
                    <button id="select_user" class="btn btn-warning py-2 px-2 mt-2">
                        <i class="fas fa-user align-middle fa-2x text-white"></i>
                        <span class=" align-middle pl-2 text-white font-weight-bold">Select User</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>