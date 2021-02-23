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
if ($_POST["type"] == "init_surveyCode_table") {
    $selected_sl = $_POST["selected_sl"];
    $table_data = array();
    $i = 0;
    try {
        $sl_table_data = $conn->prepare("SELECT a.*, b.email AS user_email, c.name AS `period`, d.name AS surveyed_co, e.name AS purchased_co  FROM surveylogin AS a
                                LEFT JOIN `user` AS b ON b.id = a.user_id
                                LEFT JOIN `period` AS c ON c.id = a.period_id
                                LEFT JOIN company AS d ON d.id = a.surveyed_co_id 
                                LEFT JOIN company AS e ON e.id = a.purchased_co_id
                                WHERE b.email = '$selected_sl'");
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

// Init User Dropdown
if ($_POST["type"] == "init_user_data") {
    $user_data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, email from user");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $result[$i]["id"] = $temp["id"];
                $result[$i]["email"] = $temp["email"];
                $i++;
            }
            echo json_encode($result);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
//  Init Survey Data
if ($_POST["type"] == "init_surveyed_data") {
    $survey_data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, `name` from company");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $survey_data[$i]["id"] = $temp["id"];
                $survey_data[$i]["name"] = $temp["name"];
                $i++;
            }
            echo json_encode($result);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

//  Init Purchased Co_id
if ($_POST["type"] == "init_purchased_co_data") {
    $purchased_data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT b.name, a.id FROM `user` AS a LEFT JOIN company AS b ON b.id = a.works_for_co_id ");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $purchased_data[$i]["id"] = $temp["id"];
                $purchased_data[$i]["name"] = $temp["name"];
                $i++;
            }
            echo json_encode($purchased_data);
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
            $_SESSION["period"] = json_encode($period_data);
            echo json_encode($period_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

//  When click tr, display table data
if ($_POST["type"] == "display_selected_sc_data") {
    $tr_id = $_POST["tr_id"];
    $surveyCode_data = array();
    try {
        $stmt = $conn->prepare("SELECT a.*, b.survey_code_name, b.survey_code_description, b.max_responses, b.expire_date, b.survey_code_string, b.survey_code_hash FROM surveylogin AS a
        LEFT JOIN surveycode AS b ON b.survey_login_id = a.id
        WHERE a.id = '$tr_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $surveyCode_data["id"] = $temp["id"];
                $surveyCode_data["user_id"] = $temp["user_id"];
                $surveyCode_data["surveyed_co_id"] = $temp["surveyed_co_id"];
                $surveyCode_data["purchased_co_id"] = $temp["purchased_co_id"];
                $surveyCode_data["area"] = $temp["area"];
                $surveyCode_data["financial_year"] = $temp["financial_year"];
                $surveyCode_data["fiscal_year_ends"] = $temp["fiscal_year_ends"];
                $surveyCode_data["period_id"] = $temp["period_id"];
                $surveyCode_data["level_id"] = $temp["level_id"];
                $surveyCode_data["month_start"] = $temp["month_start"];
                $surveyCode_data["month_end"] = $temp["month_end"];
                $surveyCode_data["payment_success"] = $temp["payment_success"];
                $surveyCode_data["username_hash"] = $temp["username_hash"];
                $surveyCode_data["password_hash"] = $temp["password_hash"];
                $surveyCode_data["sc_name"] = $temp["survey_code_name"];
                $surveyCode_data["sc_description"] = $temp["survey_code_description"];
                $surveyCode_data["sc_max_responses"] = $temp["max_responses"];
                $surveyCode_data["sc_expires_date"] = $temp["expire_date"];
                $surveyCode_data["sc_string"] = $temp["survey_code_string"];
                $surveyCode_data["sc_hash"] = $temp["survey_code_hash"];
            }
            echo json_encode($surveyCode_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// surveyCode_add
if ($_POST["type"] == "surveyCode_add") {
    $date_temp = array();
    $i = 0;
    $date_expire = "";
    if (!empty($_POST["expires_date"])) {
        $expires_date = $_POST["expires_date"];
        foreach (explode("/", $expires_date) as $temp) {
            $date_temp[$i] = $temp;
            $i++;
        }
        $date_expire = $date_temp[2] . ":" . $date_temp[0] . ":" . $date_temp[1];
    }
    $sl_id = $_POST["sl_id"];
    $sc_code_name = $_POST["sc_code_name"];
    $sc_code_description = $_POST["sc_code_description"];
    $max_responses = $_POST["max_responses"];
    $sc_code_string = $_POST["sc_code_string"];
    $sc_code_hash = md5($sc_code_name . $sc_code_string);
    $date = date_create();
    $created_at = date_timestamp_get($date);
    $created_time = date("h:i:sa");
    $expires = $date_expire . " " . $created_time;
    try {
        $stmt = $conn->prepare("INSERT INTO surveycode set created_at = '$created_at', survey_login_id='$sl_id', survey_code_name='$sc_code_name', survey_code_description='$sc_code_description', max_responses='$max_responses', expire_date='$expires', survey_code_string='$sc_code_string', survey_code_hash='$sc_code_hash'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $surveypages = $conn->prepare("SELECT id FROM surveycode WHERE created_at = '$created_at'");
            $surveypages->execute();
            if ($surveypages->rowCount() > 0) {
                $surveypages_result = $surveypages->fetchAll();
                $sp_id_temp;
                foreach ($surveypages_result as $surveypages_temp) {
                    $sp_id_temp = $surveypages_temp["id"];
                }
                $sp_id = $conn->prepare("INSERT into level1surveypages set created_at='$created_at', survey_code_id = '$sp_id_temp', page_display_order_user='$sp_id_temp'");
                $sp_id->execute();
            }
            echo $sc_code_hash;
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
