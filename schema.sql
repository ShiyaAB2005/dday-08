CREATE DATABASE IF NOT EXISTS hygiene_management;

USE hygiene_management;

CREATE TABLE facilities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inspections (
    id INT PRIMARY KEY AUTO_INCREMENT,
    facility_id INT NOT NULL,
    cleanliness_score INT,
    odor_score INT,
    waste_level INT,
    hygiene_score DECIMAL(5,2),
    inspection_date DATE,
    FOREIGN KEY (facility_id) REFERENCES facilities(id)
);

CREATE TABLE complaints (
    id INT PRIMARY KEY AUTO_INCREMENT,
    facility_id INT NOT NULL,
    complaint_text TEXT NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (facility_id) REFERENCES facilities(id)
);