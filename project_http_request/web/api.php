<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    $username = $input['username'] ?? 'unknown';
    $password = $input['password'] ?? 'unknown';

    $response = [
        'status' => 'success',
        'message' => 'Data received',
        'data' => [
            'username' => $username,
            'password' => $password
        ]
    ];

    echo json_encode($response);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method'
    ]);
}
?>
