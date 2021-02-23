<?php
session_start();

include("../../common/env.php");
$db_host = getenv("DB_HOST");
$db_username = getenv("DB_USERNAME");
$db_password = getenv("DB_PASSWORD");
$db_name = getenv("DB_NAME");

$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

/* --------------------------------------------- Init Define -------------------------------------------------------*/
// Init table
if ($_POST["type"] == "init_table") {
    $user_email = $_POST["user_email"];
    $table_data = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT a.id AS id, a.name AS company_name, a.fiscal_eoy_month_end AS fiscal_eoy, b.name AS sector, c.name AS country, d.name AS currency FROM company AS a
        LEFT JOIN sector AS b ON b.id = a.sector_id
        LEFT JOIN country AS c ON c.id = a.address_country_id
        LEFT JOIN currency AS d ON d.id = a.reporting_currency_id
        LEFT JOIN `user` AS e ON e.works_for_co_id = a.id
        WHERE e.email = '$user_email'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $feb = date("m") % 4 == 0 ? "Feb 29" : "Feb 28";
                $eoy_arr = array("Jan 31", "$feb", "Mar 31", "Apr 30", "May 31", "Jun 30", "Jul 31", "Aug 31", "Sep 30", "Oct 31", "Nov 30", "Dec 31");
                $index = $temp["fiscal_eoy"];
                $table_data[$i]["id"] = $temp["id"];
                $table_data[$i]["name"] = $temp["company_name"];
                $table_data[$i]["sector"] = $temp["sector"];
                $table_data[$i]["country"] = $temp["country"];
                $table_data[$i]["currency"] = $temp["currency"];
                $table_data[$i]["fiscal_eoy"] = $eoy_arr[$index];
                $i++;
            }
            $_SESSION["init_company_data"] = json_encode($table_data);
            echo json_encode($table_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Company Sector ID
if ($_POST["type"] == "company_sector_id") {
    $sector = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT * from sector");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $sector[$i]["name"] = $temp["name"];
                $sector[$i]["id"] = $temp["id"];
                $i++;
            }
            echo json_encode($sector);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
//  Country Id
if ($_POST["type"] == "country_id") {
    $country = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT * from country");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $country[$i]["text"] = $temp["name"];
                $country[$i]["id"] = $temp["id"];
                $i++;
            }
            $_SESSION["country_data"] = json_encode($country);
            echo json_encode($country);
        }
    } catch (PDOException $e) {
        echo "fail" . $e->getMessage();
    }
}

// Currency ID
if ($_POST['type'] == "currency_id") {
    $currency = array();
    $i = 0;
    try {
        $stmt = $conn->prepare("SELECT * from currency");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $currency[$i]["code"] = $temp['code'];
                $currency[$i]["id"] = $temp["id"];
                $i++;
            }
            echo json_encode($currency);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

/* --------------------------------------------------- Define ---------------------------------------------------------*/
// Company Add
if ($_POST["type"] == "company_add") {
    $date = date_create();
    $created_at = date_timestamp_get($date);
    $name = $_POST["name"];
    $sector_id = $_POST["sector_id"];
    $ticker = $_POST["ticker"];
    $tax_id = $_POST["tax_id"];
    $number = $_POST["number"];
    $website = $_POST["website"];
    $currency_id = $_POST["currency_id"];
    $address_street_1 = $_POST["address_street_1"];
    $address_street_2 = $_POST["address_street_2"];
    $address_city = $_POST["address_city"];
    $address_state = $_POST["address_state"];
    $address_postalzip = $_POST["address_postalzip"];
    $address_country_id = $_POST["address_country_id"];
    $fiscal_eoy = $_POST["fiscal_eoy"];
    try {
        $stmt = $conn->prepare("INSERT into company set `name`='$name', fiscal_eoy_month_end='$fiscal_eoy', sector_id='$sector_id', ticker='$ticker', reporting_currency_id='$currency_id', tax_id='$tax_id', company_number='$number', website='$website', address_street_1='$address_street_1', address_street_2='$address_street_2', address_city='$address_city', address_postalzip='$address_postalzip', address_country_id='$address_country_id', created_at='$created_at'");
        $stmt->execute();
        echo "success";
        // if ($stmt->rowCount() > 0) {
        //     $company = $conn->prepare("SELECT a.id as id, a.name AS company_name, a.fiscal_eoy_month_end AS fiscal_eoy, b.name AS sector, c.name AS country, d.name AS currency FROM company AS a
        //                             LEFT JOIN sector AS b ON b.id = a.sector_id
        //                             LEFT JOIN country AS c ON c.id = a.address_country_id
        //                             LEFT JOIN currency AS d ON d.id = a.reporting_currency_id");
        //     $company->execute();
        //     $return = array();
        //     $i = 0;
        //     if ($company->rowCount() > 0) {
        //         $result = $company->fetchAll();
        //         foreach ($result as $temp) {
        //             $return[$i]["id"] = $temp["id"];
        //             $return[$i]["name"] = $temp["company_name"];
        //             $return[$i]["sector"] = $temp["sector"];
        //             $return[$i]["country"] = $temp["country"];
        //             $return[$i]["currency"] = $temp["currency"];
        //             $return[$i]["fiscal_eoy"] = $temp["fiscal_eoy"];
        //             $i++;
        //         }
        //         $_SESSION["company_data"] = json_encode($return);
        //         echo json_encode($return);
        //     }
        // }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

// Display Data of Selected_row
if ($_POST["type"] == "display_data_of_selected_row") {
    $company_id = $_POST["company_id"];
    $company_data = array();
    try {
        $stmt = $conn->prepare("SELECT a.* FROM company AS a WHERE a.id = '$company_id'");
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $result = $stmt->fetchAll();
            foreach ($result as $temp) {
                $company_data["id"] = $temp["id"];
                $company_data["name"] = $temp["name"];
                $company_data["sector"] = $temp["sector_id"];
                $company_data["ticker"] = $temp["ticker"];
                $company_data["tax_id"] = $temp["tax_id"];
                $company_data["company_num"] = $temp["company_number"];
                $company_data["website"] = $temp["website"];
                $company_data["currency"] = $temp["reporting_currency_id"];
                $company_data["street_1"] = $temp["address_street_1"];
                $company_data["street_2"] = $temp["address_street_2"];
                $company_data["address_city"] = $temp["address_city"];
                $company_data["address_state"] = $temp["address_state"];
                $company_data["postalzip"] = $temp["address_postalzip"];
                $company_data["country"] = $temp["address_country_id"];
                $company_data["fiscal_eoy"] = $temp["fiscal_eoy_month_end"];
            }
            echo json_encode($company_data);
        }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}

//  Update Company
if ($_POST["type"] == "company_update") {
    $id = $_POST["id"];
    $name = $_POST["name"];
    $sector_id = $_POST["sector_id"];
    $ticker = $_POST["ticker"];
    $tax_id = $_POST["tax_id"];
    $number = $_POST["number"];
    $website = $_POST["website"];
    $currency_id = $_POST["currency_id"];
    $address_street_1 = $_POST["address_street_1"];
    $address_street_2 = $_POST["address_street_2"];
    $address_city = $_POST["address_city"];
    $address_state = $_POST["address_state"];
    $address_postalzip = $_POST["address_postalzip"];
    $address_country_id = $_POST["address_country_id"];
    $fiscal_eoy = $_POST["fiscal_eoy"];
    try {
        $stmt = $conn->prepare("UPDATE company set `name`='$name', fiscal_eoy_month_end='$fiscal_eoy', sector_id='$sector_id', ticker='$ticker', reporting_currency_id='$currency_id', tax_id='$tax_id', company_number='$number', website='$website', address_street_1='$address_street_1', address_street_2='$address_street_2', address_city='$address_city', address_postalzip='$address_postalzip', address_country_id='$address_country_id' WHERE id='$id'");
        $stmt->execute();
        echo "success";
        // if ($stmt->rowCount() > 0) {
        //     $company = $conn->prepare("SELECT a.id AS id, a.name AS company_name, a.fiscal_eoy_month_end AS fiscal_eoy, b.name AS sector, c.name AS country, d.name AS currency FROM company AS a
        //                             LEFT JOIN sector AS b ON b.id = a.sector_id
        //                             LEFT JOIN country AS c ON c.id = a.address_country_id
        //                             LEFT JOIN currency AS d ON d.id = a.reporting_currency_id");
        //     $company->execute();
        //     $return = array();
        //     $i = 0;
        //     if ($company->rowCount() > 0) {
        //         $result = $company->fetchAll();
        //         foreach ($result as $temp) {
        //             $return[$i]["id"] = $temp["id"];
        //             $return[$i]["name"] = $temp["company_name"];
        //             $return[$i]["sector"] = $temp["sector"];
        //             $return[$i]["country"] = $temp["country"];
        //             $return[$i]["currency"] = $temp["currency"];
        //             $return[$i]["fiscal_eoy"] = $temp["fiscal_eoy"];
        //             $i++;
        //         }
        //         $_SESSION["company_data"] = json_encode($return);
        //         echo json_encode($return);
        //     }
        // }
    } catch (PDOException $e) {
        echo "failed" . $e->getMessage();
    }
}
