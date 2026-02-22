create database hospitalDB;
use hospitalDB;

-- Table
-- patients
create table if not exists patients(
patientID int auto_increment primary key,
FirstName varchar(100) not null,
LastName varchar(100) not null,
DateOfBirth date,
Gender varchar(20),
ContactNumber varchar(10),
Address text
);


-- Doctors
create table if not exists Doctors(
doctorID int auto_increment primary key,
firstname varchar(100),
Lastname varchar(100),
Specialization varchar(100),
ContactNumber varchar(10),
Email varchar(100));

-- appointments

create table if not exists appointments(
appointmentID int auto_increment primary key,
patientID int,
doctorID int,
appoitmentDate datetime,
daignosis text,
foreign key (patientID) references patients(patientID)
on delete cascade on update cascade,
foreign key (doctorID) references doctors(doctorID)
on delete cascade on update cascade);


-- Task 2: Modifying the Tables with DDL Commands
-- Step 1: Add a Column
-- Add a column named Email to the Patients table.
alter table patients add column Email varchar(100);

-- Step 2: Modify the Data Type of a Column
-- Change the datatype of the ContactNumber column in the Doctors table.
alter table Doctors modify column ContactNumber char(10);
describe Doctors;

-- Step 3: Drop a Column
-- Remove the Address column from the Patients table.
alter table patients drop column Address;

-- Step 4: Add a Constraint
-- Add a unique constraint to the Email column in the Doctors table.
alter table Doctors modify column Email varchar(100) unique;

-- Step 5: Drop a Constraint
-- Remove the unique constraint from the Email column in the Doctors table.
alter table Doctors drop index Email;

-- Step 6: Change the Column Name
-- Rename the Diagnosis column to MedicalDiagnosis in the Appointments table.
alter table Appointments change column daignosis MedicalDiagnosis text;


-- Task 3: Data Manipulation with DML Commands
-- Step 1: Insert Data
-- Insert sample data into the Patients, Doctors, and Appointments tables. (Random)
-- Patients
INSERT INTO patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber)
VALUES
('Amit', 'Sharma', '1985-03-12', 'Male', '9876543210'),
('Sneha', 'Patil', '1990-07-25', 'Female', '9865321470'),
('Rahul', 'Deshmukh', '1978-11-03', 'Male', '9123456780'),
('Priya', 'Kulkarni', '2000-02-15', 'Female', '9988776655'),
('Vikram', 'Joshi', '1969-09-09', 'Male', '9090909090');

-- Doctors
INSERT INTO doctors (FirstName, LastName, Specialization, ContactNumber, Email)
VALUES
('Rajesh', 'Gupta', 'Cardiologist', '9811112233', 'rajesh.gupta@hospital.com'),
('Anita', 'Mehta', 'Dermatologist', '9822223344', 'anita.mehta@hospital.com'),
('Suresh', 'Rao', 'Orthopedic', '9833334455', 'suresh.rao@hospital.com'),
('Kavita', 'Nair', 'Pediatrician', '9844445566', 'kavita.nair@hospital.com'),
('Manoj', 'Singh', 'Neurologist', '9855556677', 'manoj.singh@hospital.com');

-- Appointment
INSERT INTO appointments (patientID, doctorID, appoitmentDate, MedicalDiagnosis)
VALUES
(1, 1, '2025-09-05 10:30:00', 'Routine heart check-up, BP slightly high'),
(2, 2, '2025-09-06 14:00:00', 'Skin allergy treatment'),
(3, 3, '2025-09-07 09:15:00', 'Back pain, possible disc issue'),
(4, 4, '2025-09-08 11:00:00', 'Fever and cold, pediatric care'),
(5, 5, '2025-09-09 16:45:00', 'Frequent headaches, neurological checkup');

select * from patients;
select * from Doctors;
select * from appointments;

-- Step 2: Update Data
-- Update the specialization of a doctor in the Doctors table. (up to you)
set sql_safe_updates = 0;
update Doctors set Specialization = 'Gynecologist'
where firstname = 'Anita';

update Doctors set doctorID = 7
where firstname = 'Anita';