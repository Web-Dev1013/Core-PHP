<?php
session_start();

include("../../common/env.php");
$db_host = getenv("DB_HOST");
$db_username = getenv("DB_USERNAME");
$db_password = getenv("DB_PASSWORD");
$db_name = getenv("DB_NAME");

$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// ***************************************************** Init Define ******************************************************
// Init table
if ($_POST["type"] == "init_surveyLogin_table") {
    $user_email = $_POST["user_email"];
    $table_data = array();
    $i = 0;
    try {
        $sl_table_data = $conn->prepare("SELECT a.*, b.email AS user_email, c.name AS `period` FROM surveylogin AS a
        LEFT JOIN `user` AS b ON b.id = a.user_id
        LEFT JOIN `period` AS c ON c.id = a.period_id
        WHERE b.email = '$user_email'");
        $sl_table_data->execute();
        if ($sl_table_data->rowCount() > 0) {
            $result = $sl_table_data->fetchAll();
            foreach ($result as $temp) {
                $table_data[$i]["id"] = $temp["id"];
                $table_data[$i]["user_email"] = $temp["user_email"];
                $table_data[$i]["surveyed_co_id"] = $temp["surveyed_co_id"];
                $table_data[$i]["purchased_co_id"] = $temp["purchased_co_id"];
                $table_data[$i]["financial"] = $temp["financial_year"];
                $table_data[$i]["period"] = $temp["period"];
                $table_data[$i]["area"] = $temp["area"];
                $table_data[$i]["payment_success"] = $temp["payment_success"];
                $table_data[$i]["level_id"] = $temp["level_id"];
                $table_data[$i]["username_hash"] = $temp["username_hash"];
                $table_data[$i]["password_hash"] = $temp["password_hash"];
                $i++;
            }
            $_SESSION["sl_search_data"] = json_encode($table_data);
            echo json_encode($table_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Init Survey Login Detail Data
if ($_POST["type"] == "init_survey_login_detail") {
    $data = array();
    $company_id = $_POST["company_id"];
    try {
        $stmt = $conn->prepare("SELECT a.id, b.id as `user_id`, a.fiscal_eoy_month_end, b.works_for_co_id FROM company AS a
        LEFT JOIN `user` AS b ON a.id = b.works_for_co_id
        WHERE a.id = '$company_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $data["id"] = $temp["id"];
                $data["fiscal_eoy_month_end"] = $temp["fiscal_eoy_month_end"];
                $data["works_for_co_id"] = $temp["works_for_co_id"];
                $data["user_id"] = $temp["user_id"];
            }
            echo json_encode($data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// init_company_title
if($_POST["type"] == "init_company_title"){
    $user_email = $_POST["user_email"];
    $data = array();
    try{
        $stmt = $conn->prepare("SELECT a.*, c.name, b.email, d.name AS `period` FROM surveylogin AS a
        LEFT JOIN `user` AS b ON a.user_id = b.id
        LEFT JOIN company AS c ON c.id = b.works_for_co_id
        LEFT JOIN `period` AS d ON d.id = a.period_id
        WHERE b.email = '$user_email'");
        $stmt->execute();
        if($stmt->rowCount()>0){
            $result = $stmt->fetchAll();
            foreach($result as $temp){
                $data["area"] = $temp["area"];
                $data["financial_year"] = $temp["financial_year"];
                $data["month_start"] = $temp["month_start"];
                $data["month_end"] = $temp["month_end"];
                $data["period"] = $temp["period"];
                $data["email"] = $temp["email"];
                $data["level_id"] = $temp["level_id"];
                $data["company_name"] = $temp["name"];
            }
            echo json_encode($data);
        }
    }catch(PDOException $e){
        echo "failed".$e->getMessage();
    }
}

//  Init_user_dropdown
if ($_POST["type"] == "Init_user_dropdown") {
    $data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, email FROM `user`");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $data[$i]["id"] = $temp["id"];
                $data[$i]["email"] = $temp["email"];
                $i++;
            }
            echo json_encode($data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// init_surveyed_co_id
if ($_POST["type"] == "init_surveyed_co_id") {
    $data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, `name` FROM company");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $data[$i]["id"] = $temp["id"];
                $data[$i]["name"] = $temp["name"];
                $i++;
            }
            echo json_encode($data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Init period
if ($_POST["type"] == "init_period") {
    $period_data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, `name` from `period`");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $period_data[$i]["id"] = $temp["id"];
                $period_data[$i]["name"] = $temp["name"];
                $i++;
            }
            echo json_encode($period_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Init Display Survey Login Data
if ($_POST["type"] == "display_sl_search") {
    if (empty($_SESSION["sl_search_data"])) {
        echo "failed";
    } else {
        $sl_search_data = $_SESSION["sl_search_data"];
        echo $sl_search_data;
    }
}

//  ****************************************************** User define ***********************************************
//  Add new survey Login
if ($_POST["type"] == "add_new_survey_login") {
    $date = date_create();
    $created_at = date_timestamp_get($date);
    $sl_user_email = $_POST["sl_user_email"];
    $surveyed_co_id = $_POST["surveyed_co_id"];
    $purchased_co_id = $_POST["purchased_co_id"];
    $sl_area = $_POST["sl_area"];
    $sl_fiscal_eoy = $_POST["sl_fiscal_eoy"];
    $sl_period = $_POST["sl_period"];
    $sl_level = $_POST["sl_level"];
    $sl_financial_year = $_POST["sl_financial_year"];
    $sl_month_start = $_POST["sl_month_start"];
    $sl_month_end = $_POST["sl_month_end"];
    $sl_payment_success = $_POST["sl_payment_success"];
    $sl_username_string = $_POST["sl_username_string"];
    $sl_password_string = $_POST["sl_password_string"];
    $user_email;
    $user_password;
    try {
        $user_data = $conn->prepare("SELECT email, `password` from user where id='$sl_user_email'");
        $user_data->execute();
        if ($user_data->rowCount() > 0) {
            $result = $user_data->fetchAll();
            foreach ($result as $temp) {
                $user_email = $temp["email"];
                $user_password = $temp["password"];
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
    $sl_username_hash = md5($sl_username_string . $user_email);
    $sl_password_hash = md5($sl_password_string . $user_password);
    try {
        $stmt = $conn->prepare("INSERT INTO surveylogin set `user_id`='$sl_user_email', surveyed_co_id='$surveyed_co_id', purchased_co_id='$purchased_co_id', area='$sl_area', financial_year='$sl_financial_year', month_start='$sl_month_start', month_end='$sl_month_end', period_id='$sl_period', level_id='$sl_level', username_string='$sl_username_string', username_hash='$sl_username_hash', password_string='$sl_password_string', password_hash='$sl_password_hash', created_at = '$created_at'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $table_data = array();
            $i = 0;
            try {
                $sl_table_data = $conn->prepare("SELECT a.*, b.email AS user_email, c.name AS `period`, d.name AS surveyed_co, e.name AS purchased_co  FROM surveylogin AS a
                                            LEFT JOIN `user` AS b ON b.id = a.user_id
                                            LEFT JOIN `period` AS c ON c.id = a.period_id
                                            LEFT JOIN company AS d ON d.id = a.surveyed_co_id 
                                            LEFT JOIN company AS e ON e.id = a.purchased_co_id
                                            WHERE a.user_id = '$sl_user_email'");
                $sl_table_data->execute();
                if ($sl_table_data->rowCount() > 0) {
                    $result = $sl_table_data->fetchAll();
                    foreach ($result as $temp) {
                        $table_data[$i]["id"] = $temp["id"];
                        $table_data[$i]["user_email"] = $temp["user_email"];
                        $table_data[$i]["surveyed_co_id"] = $temp["surveyed_co"];
                        $table_data[$i]["purchased_co_id"] = $temp["purchased_co"];
                        $table_data[$i]["financial"] = $temp["financial_year"];
                        $table_data[$i]["period"] = $temp["period"];
                        $table_data[$i]["area"] = $temp["area"];
                        $table_data[$i]["payment_success"] = $temp["payment_success"];
                        $table_data[$i]["level_id"] = $temp["level_id"];
                        $table_data[$i]["username_hash"] = $temp["username_hash"];
                        $table_data[$i]["password_hash"] = $temp["password_hash"];
                        $i++;
                    }
                    echo json_encode($table_data);
                }
            } catch (PDOException $e) {
                echo "failed" . $e->getMessage();
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

//  Generate SurveyLogin Key
if ($_POST["type"] == "generate_key") {
    $user_id = $_POST["user_id"];
    $generate_key = array();
    try {
        $stmt = $conn->prepare("SELECT username_hash, password_hash from surveylogin where `user_id`='$user_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $generate_key["username_hash"] = $temp["username_hash"];
                $generate_key["password_hash"] = $temp["password_hash"];
            }
            echo json_encode($generate_key);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

//  When click tr, display table data
if ($_POST["type"] == "display_selected_row_data") {
    $tr_id = $_POST["tr_id"];
    $surveyLogin_data = array();
    try {
        $stmt = $conn->prepare("SELECT a.* FROM surveylogin AS a
        WHERE a.id='$tr_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $surveyLogin_data["id"] = $temp["id"];
                $surveyLogin_data["email"] = $temp["user_id"];
                $surveyLogin_data["surveyed_co_id"] = $temp["surveyed_co_id"];
                $surveyLogin_data["purchased_co_id"] = $temp["purchased_co_id"];
                $surveyLogin_data["area"] = $temp["area"];
                $surveyLogin_data["financial_year"] = $temp["financial_year"];
                $surveyLogin_data["fiscal_year_ends"] = $temp["fiscal_year_ends"];
                $surveyLogin_data["period_id"] = $temp["period_id"];
                $surveyLogin_data["level_id"] = $temp["level_id"];
                $surveyLogin_data["month_start"] = $temp["month_start"];
                $surveyLogin_data["month_end"] = $temp["month_end"];
                $surveyLogin_data["payment_success"] = $temp["payment_success"];
                $surveyLogin_data["username_hash"] = $temp["username_hash"];
                $surveyLogin_data["password_hash"] = $temp["password_hash"];
            }
            echo json_encode($surveyLogin_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Update SurveyLogin
if($_POST["type"] == "update_survey_login"){
    $sl_id = $_POST["sl_id"];
    $sl_user_email = $_POST["sl_user_email"];
    $surveyed_co_id = $_POST["surveyed_co_id"];
    $purchased_co_id = $_POST["purchased_co_id"];
    $sl_area = $_POST["sl_area"];
    $sl_fiscal_eoy = $_POST["sl_fiscal_eoy"];
    $sl_period = $_POST["sl_period"];
    $sl_level = $_POST["sl_level"];
    $sl_financial_year = $_POST["sl_financial_year"];
    $sl_month_start = $_POST["sl_month_start"];
    $sl_month_end = $_POST["sl_month_end"];
    $sl_payment_success = $_POST["sl_payment_success"];
    $sl_username_string = $_POST["sl_username_string"];
    $sl_password_string = $_POST["sl_password_string"];
    try {
        $user_data = $conn->prepare("SELECT email, `password` from user where id='$sl_user_email'");
        $user_data->execute();
        if ($user_data->rowCount() > 0) {
            $result = $user_data->fetchAll();
            foreach ($result as $temp) {
                $user_email = $temp["email"];
                $user_password = $temp["password"];
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
    $sl_username_hash = md5($sl_username_string . $user_email);
    $sl_password_hash = md5($sl_password_string . $user_password);
    try {
        $stmt = $conn->prepare("UPDATE surveylogin set `user_id`='$sl_user_email', surveyed_co_id='$surveyed_co_id', purchased_co_id='$purchased_co_id', area='$sl_area', financial_year='$sl_financial_year', month_start='$sl_month_start', month_end='$sl_month_end', period_id='$sl_period', level_id='$sl_level', username_string='$sl_username_string', username_hash='$sl_username_hash', password_string='$sl_password_string', password_hash='$sl_password_hash' where id='$sl_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $table_data = array();
            $i = 0;
            try {
                $sl_table_data = $conn->prepare("SELECT a.*, b.email AS user_email, c.name AS `period`, d.name AS surveyed_co, e.name AS purchased_co  FROM surveylogin AS a
                LEFT JOIN `user` AS b ON b.id = a.user_id
                LEFT JOIN `period` AS c ON c.id = a.period_id
                LEFT JOIN company AS d ON d.id = a.surveyed_co_id 
                LEFT JOIN company AS e ON e.id = a.purchased_co_id
                WHERE a.user_id = '$sl_user_email'");
                $sl_table_data->execute();
                if ($sl_table_data->rowCount() > 0) {
                    $result = $sl_table_data->fetchAll();
                    foreach ($result as $temp) {
                        $table_data[$i]["id"] = $temp["id"];
                        $table_data[$i]["user_email"] = $temp["user_email"];
                        $table_data[$i]["surveyed_co_id"] = $temp["surveyed_co"];
                        $table_data[$i]["purchased_co_id"] = $temp["purchased_co"];
                        $table_data[$i]["financial"] = $temp["financial_year"];
                        $table_data[$i]["period"] = $temp["period"];
                        $table_data[$i]["area"] = $temp["area"];
                        $table_data[$i]["payment_success"] = $temp["payment_success"];
                        $table_data[$i]["level_id"] = $temp["level_id"];
                        $table_data[$i]["username_hash"] = $temp["username_hash"];
                        $table_data[$i]["password_hash"] = $temp["password_hash"];
                        $i++;
                    }
                    echo json_encode($table_data);
                }
            } catch (PDOException $e) {
                echo "failed" . $e->getMessage();
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}