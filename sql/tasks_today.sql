CREATE DATABASE IF NOT EXISTS tasks_today_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE tasks_today_db;

CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    task_date DATE NOT NULL,
    created_at DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL
);

INSERT INTO tasks (title, status, task_date, created_at) VALUES
('Review today''s sales summary', 'pending', CURDATE(), NOW()),
('Confirm the morning inventory count', 'in_progress', CURDATE(), NOW()),
('Send the daily team update', 'completed', CURDATE(), NOW()),
('Check the delivery schedule', 'pending', DATE_SUB(CURDATE(), INTERVAL 1 DAY), NOW()),
('Organize supplier receipts', 'completed', DATE_SUB(CURDATE(), INTERVAL 1 DAY), NOW()),
('Prepare the weekly report', 'pending', DATE_SUB(CURDATE(), INTERVAL 2 DAY), NOW()),
('Update the product checklist', 'in_progress', DATE_ADD(CURDATE(), INTERVAL 1 DAY), NOW()),
('Plan the next stock review', 'pending', DATE_ADD(CURDATE(), INTERVAL 1 DAY), NOW());

INSERT INTO users (username, full_name, email, created_at) VALUES
('johneinstein', 'John Einstein Sison', 'john.einstein@example.test', NOW());
