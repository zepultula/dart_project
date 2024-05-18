<?php
// file: api.php

// อนุญาตการร้องขอจากทุกโดเมน
header('Access-Control-Allow-Origin: *');

// อนุญาตวิธีการร้องขอที่ใช้
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');

// อนุญาตส่วนหัวที่ใช้ในคำขอ
header('Access-Control-Allow-Headers: Content-Type');

// ตั้งค่า Content-Type เป็น JSON
header('Content-Type: application/json');

// ตรวจสอบว่าเป็นคำขอแบบ POST หรือไม่
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // อ่านข้อมูล JSON ที่ส่งมา
    $input = json_decode(file_get_contents('php://input'), true);
    
    // ตัวอย่างการประมวลผลข้อมูล
    $username = $input['username'] ?? 'unknown';
    $password = $input['password'] ?? 'unknown';
    
    // ตัวอย่างการสร้างผลลัพธ์
    $response = [
        'status' => 'success',
        'message' => 'Data received',
        'data' => [
            'username' => $username,
            'password' => $password
        ]
    ];

    // ส่งผลลัพธ์กลับในรูปแบบ JSON
    echo json_encode($response);
} else {
    // ส่งผลลัพธ์กลับในกรณีที่ไม่ใช่ POST
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method'
    ]);
}
