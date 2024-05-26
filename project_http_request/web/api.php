<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

// ตรวจสอบว่าคำขอเป็นแบบ POST หรือไม่
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // รับข้อมูล JSON ที่ส่งมาและแปลงเป็นอาเรย์ PHP
    $data = json_decode(file_get_contents('php://input'), true);
    
    // ตรวจสอบว่าข้อมูลที่ได้รับมี key 'name' หรือไม่
    if (isset($data['name'])) {
        $name = $data['name'];
        $response = array('message' => 'Hello, ' . $name . '!');
    } else {
        $response = array('error' => 'Name not provided');
    }

    echo json_encode($response);
} else {
    echo json_encode(array('error' => 'Invalid request method'));
}
?>
