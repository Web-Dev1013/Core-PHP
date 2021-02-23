<?php
session_start();

include("../../common/env.php");
$db_host = getenv("DB_HOST");
$db_username = getenv("DB_USERNAME");
$db_password = getenv("DB_PASSWORD");
$db_name = getenv("DB_NAME");

$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//  Add new expenditure data
if (isset($_FILES["file"]["name"])) {
    $icon_name = basename($_FILES["file"]["name"]);
    $location = "../../assets/image/page1/" . $icon_name;
    move_uploaded_file($_FILES['file']['tmp_name'], $location);
    $new_name = $_POST["name"];
    $new_value = $_POST["value"];
    $new_percentage = $_POST["percentage"];
    $icon_url = $_FILES["file"]["name"];
    $new_code = $_POST["code"];
    $order = $_POST["order"];
    $sub_percentage = $_POST["sub_percentage"];
    $sub_value = $_POST["sub_value"];
    $sub_order = $_POST["sub_order"];
    $sub_id = $_POST["sub_id"];
    $level_id = $_POST["level_id"];
    $table_name = "level".$level_id."customcategories";
    $surveylogin_id = $_POST["surveylogin_id"];
    $surveycode_id = $_POST["surveycode_id"];
    $date = date_create();
    $date_time = date_timestamp_get($date);
    try {
        $stmt = $conn->prepare("INSERT into $table_name set created_at='$date_time',survey_login_id='$surveylogin_id', survey_code_id='$surveycode_id', category_code='$new_code', base_template_id='$level_id', parent_id=1, `order`='$order', flag_id=0, `percentage`='$new_percentage', icon_url='$icon_url', `name`='$new_name', `sign`=1, value_load='$new_value'");
        $stmt->execute();
        // if ($stmt->rowCount() > 0) {
            $update = $conn->prepare("UPDATE $table_name set created_at = '$date_time', `order`='$sub_order', `percentage`='$sub_percentage', value_load='$sub_value' where id='$sub_id'");
            $update->execute();
            // if ($update->rowCount() > 0) {
                echo "success";
            // }
        // }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
