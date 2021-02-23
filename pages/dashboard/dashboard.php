<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>

<body>
    <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3 class="text-light text-center"> <i class="fas fa-user-tie fa-lg"></i> ADMIN</h3>
                <strong><i class="fas fa-user-tie text-light fa-lg"></i> </strong>
            </div>
            <div class="dropdown-divider border-dark"></div>

            <ul class="list-unstyled components">
                <li id="user_item" class="active">
                    <a href="#users">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2" id="dashboard_users">Users</span>
                    </a>
                </li>
                <li id="company_item" class="">
                    <a href="#company">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Company</span>
                    </a>
                </li>
                <li id="transaction_item" class="">
                    <a href="#transaction">
                        <i class="fa fa-university fa-lg"></i>
                        <span class="px-2">Transaction</span>
                    </a>
                </li>
                <li id="login_item">
                    <a href="#survey_login">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Survey Login</span>
                    </a>
                </li>
                <li id="code_item">
                    <a href="#survey_codes">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Survey Codes</span>
                    </a>
                </li>
                <li id="page_item">
                    <a href="#survey_pages">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Survey Pages</span>
                    </a>
                </li>
                <li id="url_item">
                    <a href="#survey_urls">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Survey URLs</span>
                    </a>
                </li>
                <li id="result_item">
                    <a href="#survey_results">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Survey Results</span>
                    </a>
                </li>
                <li id="message_item">
                    <a href="#message">
                        <i class="fas fa-university fa-lg"></i>
                        <span class="px-2">Message</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content" >
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="row brand">
                    <button type="button" id="sidebarCollapse" class="btn btn-info mx-4">
                        <i class="fas fa-align-left"></i>
                    </button>
                    <span class="page_title text-gold">
                        <i class="fas fa-users fa-2x"></i>
                        <span class="px-2 font-weight-bold h3">Users</span>
                    </span>
                </div>
            </nav>
            <div class="pages">
                <div class="page" id="company">
                    <?php
                        include("company.php");
                    ?>
                </div>
                <div class="page" id="users">
                    <?php
                        include("user.php");
                    ?>
                </div>
                <div class="page" id="transaction">
                    <?php
                        // include("user.php");
                    ?>
                        transactions
                </div>
                <div class="page" id="survey_login">
                    <?php
                        include("surveyLogin.php");
                    ?>
                </div>
                <div class="page" id="survey_codes">
                    <?php
                        include("surveyCode.php");
                    ?>
                </div>
                <div class="page" id="survey_pages">
                    <?php
                        include("surveyPages.php");
                    ?>
                </div>
                <div class="page" id="survey_urls">
                    <?php
                        include("getUrl.php");
                    ?>
                </div>
                <div class="page" id="survey_results">
                    <?php
                        // include("user.php");
                    ?>
                    Survey_results
                </div>
                <div class="page" id="message">
                    <?php
                        include("message.php");
                    ?>
                </div>
            </div>
        </div>
    </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
</body>

</html>