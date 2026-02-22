use classess;
CREATE TABLE student_details(
    sid INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    grad_year YEAR,
    dob DATE,
    age TINYINT CHECK (age >= 18),
    address TEXT
);

INSERT INTO student_details (first_name, last_name, grad_year, dob, age, address)
VALUES
('Aarav', 'Sharma', 2022, '2000-05-15', 24, 'Hyderabad, Telangana'),
('Anaya', 'Reddy', 2023, '1999-04-01', 25, 'Pune, Maharashtra'),
('Vihaan', 'Kumar', 2024, '2004-02-22', 20, 'Bangalore, Karnataka'),
('Diya', 'Singh', 2021, '2005-06-01', 19, 'Pune, Maharashtra'),
('Rohan', 'Joshi', 2024, '2005-03-10', 19, 'Hyderabad, Telangana');
