<?php
session_start();

include("../../common/env.php");
$db_host = getenv("DB_HOST");
$db_username = getenv("DB_USERNAME");
$db_password = getenv("DB_PASSWORD");
$db_name = getenv("DB_NAME");

$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Init User table
if($_POST["type"] == "init_user_table"){
    $init_data = array();
    $i = 0;
    try{
        $stmt=$conn->prepare("SELECT a.id, a.first_name, a.last_name, a.email, b.name as company FROM `user` AS a
        LEFT JOIN company AS b ON a.works_for_co_id = b.id");
        $stmt->execute();
        if($stmt->rowCount()>0){
            $result = $stmt->fetchAll();
            foreach($result as $temp){
                $init_data[$i]["id"] = $temp["id"];
                $init_data[$i]["first_name"] = $temp["first_name"];
                $init_data[$i]["last_name"] = $temp["last_name"];
                $init_data[$i]["email"] = $temp["email"];
                $init_data[$i]["company"] = $temp["company"];
                $i++;
            }
            $_SESSION["user_table_data"] = json_encode($init_data);
            echo json_encode($init_data);
        }
    }catch(PDOException $e){
        echo "failed".$e->getMessage();
    }
}

// Country Init
if ($_POST["type"] == "country_id") {
    $country_data = $_SESSION["country_data"];
    echo $country_data;
}

// Search user
if($_POST["type"] == "search_user"){
    $user_data = $_SESSION["user_table_data"];
    echo $user_data;
}

// Work for Co ID
if ($_POST["type"] == "init_works_co_id") {
    $works_id = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT id, `name` from company");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $works_id[$i]["id"] = $temp["id"];
                $works_id[$i]["company_name"] = $temp["name"];
                $i++;
            }
            echo json_encode($works_id);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Add user
if ($_POST["type"] == "user_add") {
    $date = date_create();
    $created_at = date_timestamp_get($date);
    $user_email = $_POST["user_email"];
    $user_password = md5($_POST["user_password"]);
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $works_for_co_id = $_POST["works_for_co_id"];
    $job_title = $_POST["job_title"];
    $phone_number = $_POST["phone_number"];
    $phone_country_id = $_POST["phone_country_id"];
    try {
        $stmt = $conn->prepare("INSERT into user set email='$user_email', `password`='$user_password', first_name='$first_name', last_name='$last_name', works_for_co_id='$works_for_co_id', job_title='$job_title', phone_number='$phone_number', phone_country_id='$phone_country_id', created_at='$created_at'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $return_data=$conn->prepare("SELECT a.id, a.first_name, a.last_name, a.email, b.name as company FROM `user` AS a
            LEFT JOIN company AS b ON a.works_for_co_id = b.id");
            $return_data->execute();
            if($return_data->rowCount()>0){
                $table_data = array();
                $i = 0;
                $result = $return_data->fetchAll();
                foreach($result as $temp){
                    $table_data[$i]["id"] = $temp["id"];
                    $table_data[$i]["first_name"] = $temp["first_name"];
                    $table_data[$i]["last_name"] = $temp["last_name"];
                    $table_data[$i]["email"] = $temp["email"];
                    $table_data[$i]["company"] = $temp["company"];
                    $i++;
                }
                echo json_encode($table_data);
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Display the selected user data
if($_POST["type"] == "display_selected_user_data"){
    $user_id = $_POST["user_id"];
    $_SESSION["user_id"] = $user_id;
    $user_data = array();
    try{
        $stmt = $conn->prepare("SELECT * from user where id='$user_id'");
        $stmt->execute();
        if($stmt->rowCount()>0){
            $result = $stmt->fetchAll();
            foreach($result as $temp){
                $user_data["id"] = $temp["id"];
                $user_data["email"] = $temp["email"];
                $user_data["password"] = $temp["password"];
                $user_data["first_name"] = $temp["first_name"];
                $user_data["last_name"] = $temp["last_name"];
                $user_data["works_for_co_id"] = $temp["works_for_co_id"];
                $user_data["title"] = $temp["job_title"];
                $user_data["phone_num"] = $temp["phone_number"];
                $user_data["phone_country_id"] = $temp["phone_country_id"];
            }
            echo json_encode($user_data);
        }
    }catch(PDOException $e){
        echo "failed".$e->getMessage();
    }
}

// Update user
if($_POST["type"] == "user_update"){
    $user_id = $_POST["user_id"];
    $user_email = $_POST["user_email"];
    $user_password = md5($_POST["user_password"]);
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $works_for_co_id = $_POST["works_for_co_id"];
    $job_title = $_POST["job_title"];
    $phone_number = $_POST["phone_number"];
    $phone_country_id = $_POST["phone_country_id"];
    try {
        $stmt = $conn->prepare("UPDATE user set email='$user_email', `password`='$user_password', first_name='$first_name', last_name='$last_name', works_for_co_id='$works_for_co_id', job_title='$job_title', phone_number='$phone_number', phone_country_id='$phone_country_id' where id='$user_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $return_data=$conn->prepare("SELECT a.id, a.first_name, a.last_name, a.email, b.name as company FROM `user` AS a
            LEFT JOIN company AS b ON a.works_for_co_id = b.id");
            $return_data->execute();
            if($return_data->rowCount()>0){
                $table_data = array();
                $i = 0;
                $result = $return_data->fetchAll();
                foreach($result as $temp){
                    $table_data[$i]["id"] = $temp["id"];
                    $table_data[$i]["first_name"] = $temp["first_name"];
                    $table_data[$i]["last_name"] = $temp["last_name"];
                    $table_data[$i]["email"] = $temp["email"];
                    $table_data[$i]["company"] = $temp["company"];
                    $i++;
                }
                $_SESSION["user_table_data"] = json_encode($table_data);
                echo json_encode($table_data);
            }
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

$conn = null;
