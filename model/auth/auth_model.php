<?php
session_start();

include("../../common/env.php");
$db_host = getenv("DB_HOST");
$db_username = getenv("DB_USERNAME");
$db_password = getenv("DB_PASSWORD");
$db_name = getenv("DB_NAME");

$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
if ($_POST['type'] == "login") {

    $username = $_POST['username'];
    $password = $_POST['password'];
    try {
        $stmt = $conn->prepare("SELECT * from `admin` where username='$username' and `password`='$password'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            $visited_time = date("Y-m-d h:i:sa");
            foreach ($result as $temp) {
                $_SESSION['username'] = $temp['username'];
                $_SESSION['userid'] = $temp['id'];
            }
            $update_query = $conn->prepare("UPDATE `admin` set visited_time='$visited_time'");
            $update_query->execute();
            if ($update_query->rowCount() > 0) {
                echo "success";
            }
        } else {
            echo "failed";
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
if ($_POST['type'] == "logout") {
    session_destroy();
    echo "success";
}

$conn = null;
