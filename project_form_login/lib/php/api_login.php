<?php
//! error_reporting(E_ALL);
//! ini_set('display_errors', 1);
//! ini_set('display_startup_errors', 1);

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

$servername = "localhost"; 
$db_username = "username";
$db_password = "password";
$dbname = "database_name";

$conn = new mysqli($servername, $db_username, $db_password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else{
    // echo "ok";
}

//? ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die(json_encode(['status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error]));
}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(204);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['username']) && isset($data['password'])) {
        $username = $data['username'];
        $password = $data['password'];

        //? ป้องกัน SQL Injection
        $username = $conn->real_escape_string($username);
        $password = $conn->real_escape_string($password);

        //? ตรวจสอบผู้ใช้ในฐานข้อมูล
        $sql = "SELECT * FROM username WHERE username='$username' AND password='$password'"; // ตรวจสอบชื่อของตารางและฟิลด์
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Login successful']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid username or password']);
        }
        $conn->close();
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Username and password required']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
