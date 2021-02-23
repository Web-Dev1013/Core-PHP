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
// Init templates
if ($_POST["type"] == "init_template") {
  $template_id = 1;
  $level_id = 1;
  if (!empty($_POST["page_id"])) {
    $template_id = $_POST["page_id"];
  }
  if (!empty($_POST["level_id"])) {
    $level_id = $_POST["level_id"];
  }
  $customcategories = "level" . $level_id . "customcategories";
  $surveypages = "level" . $level_id . "surveypages";
  $templates_data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT a.survey_page_unit AS unit, b.* FROM $surveypages AS a
        LEFT JOIN $customcategories AS b ON b.base_template_id= a.id
        WHERE a.id='$template_id'
        ORDER BY b.order");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $templates_data[$i]["id"] = $temp["id"];
        $templates_data[$i]["icon_url"] = $temp["icon_url"];
        $templates_data[$i]["category_code"] = $temp["category_code"];
        $templates_data[$i]["name"] = $temp["name"];
        $templates_data[$i]["value"] = $temp["value_load"];
        $templates_data[$i]["percentage"] = $temp["percentage"];
        $templates_data[$i]["flag_id"] = $temp["flag_id"];
        $templates_data[$i]["unit"] = $temp["unit"];
        $i++;
      }
      echo json_encode($templates_data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

//  When move the row in survey table
if ($_POST["type"] == "sp_table_row") {
  $position = $_POST["position"];
  try {
    foreach ($position as $k => $v) {
      $stmt = $conn->prepare("UPDATE surveypageorder SET `order`='$k' WHERE id='$v'");
      $stmt->execute();
    }
    echo "success";
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

//  When move the row in template table
if ($_POST["type"] == "move_row") {
  $position = $_POST["position"];
  try {
    foreach ($position as $k => $v) {
      $stmt = $conn->prepare("UPDATE basecategories SET `order`='$k' WHERE id='$v'");
      $stmt->execute();
    }
    echo "success";
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Init surveyPage Table
if ($_POST["type"] == "init_surveyPage_table") {
  $sc_hash = $_POST["sc_hash"];
  $table_data = array();
  $i = 0;
  try {
    $level = $conn->prepare("SELECT b.level_id FROM surveycode AS a
        LEFT JOIN surveylogin AS b ON a.survey_login_id = b.id
        WHERE a.survey_code_hash = '$sc_hash'");
    $level->execute();
    if ($level->rowCount() > 0) {
      $level_result = $level->fetchAll();
      foreach ($level_result as $temp) {
        $level_result = $temp["level_id"];
      }
      $surveypage_table_name = "level" . $level_result . "surveypages";
      $stmt = $conn->prepare("SELECT a.id, e.email AS `user`, b.survey_code_name AS codeName, b.survey_code_hash AS codeHash, c.survey_page_header_user AS pageHeader, c.page_display_order_user AS pageOrder FROM surveypageorder AS a
            LEFT JOIN surveycode AS b ON a.surveycode_id=b.id
            LEFT JOIN $surveypage_table_name AS c ON c.id=a.surveypage_id
            LEFT JOIN surveylogin AS d ON b.survey_login_id=d.id
            LEFT JOIN `user` AS e ON d.user_id=e.id
            WHERE b.survey_code_hash = '$sc_hash'");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $result = $stmt->fetchAll();
        foreach ($result as $key => $temp) {
          $table_data[$i]["id"] = $temp["id"];
          $table_data[$i]["user"] = $temp["user"];
          $table_data[$i]["codeHash"] = $temp["codeHash"];
          $table_data[$i]["codeName"] = $temp["codeName"];
          $table_data[$i]["pageHeader"] = $temp["pageHeader"];
          $table_data[$i]["pageOrder"] = $key+1;
          $i++;
        }
        echo json_encode($table_data);
      }
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// SurveyPages base data
if ($_POST["type"] == "sp_base_data") {
  $sc_hash = $_POST["sc_hash"];
  $data = array();
  try {
    $stmt = $conn->prepare("SELECT b.* FROM surveycode AS a 
        LEFT JOIN surveylogin AS b ON a.survey_login_id = b.id
        WHERE a.survey_code_hash = '$sc_hash'");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $data["surveyed_co_id"] = $temp["surveyed_co_id"];
        $data["purchased_co_id"] = $temp["purchased_co_id"];
        $data["area"] = $temp["area"];
        $data["financial_year"] = $temp["financial_year"];
        $data["fiscal_year_ends"] = $temp["fiscal_year_ends"];
        $data["month_start"] = $temp["month_start"];
        $data["month_end"] = $temp["month_end"];
        $data["period_id"] = $temp["period_id"];
        $data["level_id"] = $temp["level_id"];
      }
      echo json_encode($data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Init Period dropdown
if ($_POST["type"] == "init_period") {
  echo $_SESSION["period"];
}

// Init company dropdown
if ($_POST["type"] == "init_company") {
  $company_data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT id, `name` from company");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $company_data[$i]["id"] = $temp["id"];
        $company_data[$i]["name"] = $temp["name"];
        $i++;
      }
      echo json_encode($company_data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Add new survey page
if ($_POST["type"] == "save_surveyPage") {
  $sc_hash = $_POST["sc_hash"];
  $sp_code_name = $_POST["sp_code_name"];
  $sp_level_id = $_POST["sp_level_id"];
  $sp_template_id = $_POST["sp_template_id"];
  $sp_name_admin = $_POST["sp_name_admin"];
  $sp_description = $_POST["sp_description"];
  $sp_currency = $_POST["sp_currency"];
  $sp_separate = $_POST["sp_separate"];
  $sp_decimal = $_POST["sp_decimal"];
  $sp_unit = $_POST["sp_unit"];
  $sp_header_user = $_POST["sp_header_user"];
  $sp_tagline_user = $_POST["sp_tagline_user"];
  $date = date_create();
  $time = date_timestamp_get($date);
  $tablename = "level" . $sp_level_id . "surveypages";
  $category_template_id = "level" . $sp_level_id . "customcategories_template_id";
  try {
    $sc_id = $conn->prepare("SELECT id FROM surveycode WHERE survey_code_hash = '$sc_hash'");
    $sc_id->execute();
    if ($sc_id->rowCount() > 0) {
      $sc_id_temp = $sc_id->fetchAll();
      foreach ($sc_id_temp as $temp) {
        $sc_id_temp = $temp["id"];
      }
    }
    $sc_survey_page_num = $conn->prepare("SELECT count(id) FROM $tablename WHERE survey_code_id = '$sc_id'");
    $sc_survey_page_num->execute();
    if($sc_survey_page_num->rowCount()>0){
      $sc_survey_page_num = $sc_survey_page_num->fetchAll();
      $sc_survey_page_num = $sc_survey_page_num + 1;
    }
    $stmt = $conn->prepare("INSERT INTO $tablename SET created_at='$time', survey_code_id='$sc_id_temp', survey_page_header_user='$sp_header_user',survey_page_tagline_user = '$sp_tagline_user', $category_template_id = '$sp_template_id',survey_page_name_admin='$sp_name_admin', survey_page_description_admin='$sp_description', survey_page_currency='$sp_currency', survey_page_separator='$sp_separate', survey_page_decimals='$sp_decimal', survey_page_unit='$sp_unit', page_display_order_user = $sc_survey_page_num");
    $stmt->execute();
    $sp_id = $conn->prepare("SELECT id from $tablename where created_at = '$time'");
    $sp_id->execute();
    if ($sp_id->rowCount() > 0) {
      $sp_id_temp = $sp_id->fetchAll();
      foreach ($sp_id_temp as $order_temp) {
        $sp_id_temp = $order_temp["id"];
      }
    }
    $page_order = $conn->prepare("INSERT INTO surveypageorder SET created_at='$time', surveycode_id='$sc_id_temp', surveypage_id='$sp_id_temp', `order`='$sc_survey_page_num'");
    $page_order->execute();
    echo "success";
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Update survey page
if ($_POST["type"] == "update_surveyPage") {
  $sc_hash = $_POST["sc_hash"];
  $update_sp_id = $_POST["update_sp_id"];
  $sp_code_name = $_POST["sp_code_name"];
  $sp_level_id = $_POST["sp_level_id"];
  $sp_name_admin = $_POST["sp_name_admin"];
  $sp_description = $_POST["sp_description"];
  $sp_currency = $_POST["sp_currency"];
  $sp_separate = $_POST["sp_separate"];
  $sp_decimal = $_POST["sp_decimal"];
  $sp_unit = $_POST["sp_unit"];
  $sp_header_user = $_POST["sp_header_user"];
  $sp_tagline_user = $_POST["sp_tagline_user"];
  $date = date_create();
  $time = date_timestamp_get($date);
  $tablename = "level" . $sp_level_id . "surveypages";
  try {
    $sc_id = $conn->prepare("SELECT id FROM surveycode WHERE survey_code_hash = '$sc_hash'");
    $sc_id->execute();
    $sc_id_temp;
    if ($sc_id->rowCount() > 0) {
      $sc_id_temp = $sc_id->fetchAll();
      foreach ($sc_id_temp as $temp) {
        $sc_id_temp = $temp["id"];
      }
    }
    $sp_id = $conn->prepare("SELECT surveypage_id FROM surveypageorder WHERE id='$update_sp_id'");
    $sp_id->execute();
    $sp_id_temp;
    if($sp_id->rowCount()>0){
      $sp_id_temp = $sp_id->fetchAll();
      foreach($sp_id_temp as $sp_temp){
        $sp_id_temp = $sp_temp["surveypage_id"];
      }
    }
    $stmt = $conn->prepare("UPDATE $tablename SET created_at='$time', survey_code_id='$sc_id_temp', survey_page_header_user='$sp_header_user',survey_page_tagline_user = '$sp_tagline_user', survey_page_name_admin='$sp_name_admin', survey_page_description_admin='$sp_description', survey_page_currency='$sp_currency', survey_page_separator='$sp_separate', survey_page_decimals='$sp_decimal', survey_page_unit='$sp_unit' WHERE id='$sp_id_temp'");
    $stmt->execute();
    $page_order = $conn->prepare("UPDATE surveypageorder SET created_at='$time', surveycode_id='$sc_id_temp' WHERE surveypage_id='$update_sp_id'");
    $page_order->execute();
    echo "success";
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Display selected surveyPages table data
if ($_POST["type"] == "display_selected_surveyPages_data") {
  $tr_id = $_POST["tr_id"];
  $tr_data = array();
  try {
    $stmt = $conn->prepare("SELECT a.*, c.surveycode_id, b.survey_login_id FROM surveylogin AS a
        LEFT JOIN surveycode AS b ON b.survey_login_id = a.id
        LEFT JOIN surveypageorder AS c ON c.surveycode_id = b.id
        WHERE c.id = '$tr_id'");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $tr_data["surveyed_co_id"] = $temp["surveyed_co_id"];
        $tr_data["purchased_co_id"] = $temp["purchased_co_id"];
        $tr_data["area"] = $temp["area"];
        $tr_data["financial_year"] = $temp["financial_year"];
        $tr_data["fiscal_year_ends"] = $temp["fiscal_year_ends"];
        $tr_data["month_start"] = $temp["month_start"];
        $tr_data["month_end"] = $temp["month_end"];
        $tr_data["period_id"] = $temp["period_id"];
        $tr_data["level_id"] = $temp["level_id"];
        $tr_data["surveycode_id"] = $temp["surveycode_id"];
        $tr_data["surveylogin_id"] = $temp["survey_login_id"];
      }
      echo json_encode($tr_data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Init base categories name
if ($_POST["type"] == "init_base_categories") {
  $b_c_data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT template_id, `name`, help, category_code from basecategories where flag_id=1");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $b_c_data[$i]["template_id"] = $temp["template_id"];
        $b_c_data[$i]["name"]  = $temp["name"];
        $b_c_data[$i]["help"] = $temp["help"];
        $b_c_data[$i]["category_code"] = $temp["category_code"];
        $i++;
      }
      echo json_encode($b_c_data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Init level categories name
if ($_POST["type"] == "init_level_categories") {
  $level_id = $_POST["level_id"];
  $tablename = "level" . $level_id . "customcategories";
  $l_c_data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT id, `name`, help, category_code from level1customcategories where flag_id=1");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $l_c_data[$i]["id"] = $temp["id"];
        $l_c_data[$i]["name"] = $temp["name"];
        $l_c_data[$i]["help"] = $temp["help"];
        $l_c_data[$i]["category_code"] = $temp["category_code"];
        $i++;
      }
      $_SESSION["level_category"] = json_encode($l_c_data);
      echo $_SESSION["level_category"];
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Search level name
if ($_POST["type"] == "search_level_name") {
  echo $_SESSION["level_category"];
}

// Search Level category Name
if ($_POST["type"] == "sp_name_load") {
  $keyword = $_POST["keyword"];
  $level_id = $_POST["level_id"];
  $surveypage_table_name = "level" . $level_id . "surveypages";
  $data = array();
  try {
    $stmt = $conn->prepare("SELECT id, survey_page_name_admin AS `name`, survey_page_description_admin AS `description`, survey_page_currency AS currency, survey_page_separator AS `separator`, survey_page_decimals AS `decimal`, survey_page_unit AS unit FROM $surveypage_table_name WHERE survey_page_header_user='$keyword'");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $data["id"] = $temp["id"];
        $data["name"] = $temp["name"];
        $data["description"] = $temp["description"];
        $data["currency"] = $temp["currency"];
        $data["separator"] = $temp["separator"];
        $data["decimal"] = $temp["decimal"];
        $data["unit"] = $temp["unit"];
      }
      echo json_encode($data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Search base template data
if ($_POST["type"] == "search_base_template") {
  $keyword = $_POST["keyword"];
  $data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT a.survey_page_unit AS unit, b.* FROM level1surveypages AS a
        LEFT JOIN basecategories AS b ON b.template_id= a.id
        WHERE b.template_id = '$keyword'
        ORDER BY b.order");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $data[$i]["id"] = $temp["id"];
        $data[$i]["icon_url"] = $temp["icon_url"];
        $data[$i]["category_code"] = $temp["category_code"];
        $data[$i]["name"] = $temp["name"];
        $data[$i]["value"] = $temp["value_load"];
        $data[$i]["percentage"] = $temp["percentage"];
        $data[$i]["flag_id"] = $temp["flag_id"];
        $data[$i]["unit"] = $temp["unit"];
        $i++;
      }
      echo json_encode($data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// detail_and_formatting_data
if ($_POST["type"] == "detail_and_formatting_data") {
  $tr_id = $_POST["tr_id"];
  $level_id = $_POST["level_id"];
  $tablename = "level" . $level_id . "surveypages";
  $data = array();
  try {
    $stmt = $conn->prepare("SELECT a.* FROM $tablename AS a 
        LEFT JOIN surveypageorder AS b ON b.surveypage_id = a.id
        WHERE b.id = '$tr_id'");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $data["survey_page_header_user"] = $temp["survey_page_header_user"];
        $data["survey_page_tagline_user"] = $temp["survey_page_tagline_user"];
        $data["survey_page_name_admin"] = $temp["survey_page_name_admin"];
        $data["survey_page_description_admin"] = $temp["survey_page_description_admin"];
        $data["survey_page_currency"] = $temp["survey_page_currency"];
        $data["survey_page_separator"] = $temp["survey_page_separator"];
        $data["survey_page_unit"] = $temp["survey_page_unit"];
        $data["survey_page_decimals"] = $temp["survey_page_decimals"];
      }
      echo json_encode($data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}

// Template table define
if ($_POST["type"] == "template_table_data") {
  $tr_id = $_POST["tr_id"];
  $level_id = $_POST["level_id"];
  $category_table = "level" . $level_id . "customcategories";
  $surveypage_table = "level" . $level_id . "surveypages";
  $template_id = "level" . $level_id . "customcategories_template_id";
  $data = array();
  $i = 0;
  try {
    $stmt = $conn->prepare("SELECT a.* FROM $category_table AS a
        LEFT JOIN $surveypage_table AS b ON b.$template_id = a.base_template_id
	      LEFT JOIN surveypageorder AS c ON c.surveypage_id = b.id
        WHERE c.id='$tr_id'");
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      $result = $stmt->fetchAll();
      foreach ($result as $temp) {
        $data[$i]["id"] = $temp["id"];
        $data[$i]["icon_url"] = $temp["icon_url"];
        $data[$i]["category_code"] = $temp["category_code"];
        $data[$i]["name"] = $temp["name"];
        $data[$i]["value"] = $temp["value_load"];
        $data[$i]["percentage"] = $temp["percentage"];
        $data[$i]["flag_id"] = $temp["flag_id"];
        // $data[$i]["unit"] = $temp["unit"];
        $i++;
      }
      echo json_encode($data);
    }
  } catch (PDOException $e) {
    echo "failed" . $e->getMessage();
  }
}
