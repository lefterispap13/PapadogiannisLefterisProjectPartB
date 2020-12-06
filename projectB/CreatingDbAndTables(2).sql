CREATE DATABASE PrivateSchoolStructure;
USE privateSchoolstructure;


CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(40),
first_name VARCHAR(40),
date_of_birth DATE);

CREATE TABLE trainers(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(40),
first_name VARCHAR(40),
`subject` VARCHAR(30));

CREATE TABLE assignments(
id INT PRIMARY KEY AUTO_INCREMENT,
Assignment_title VARCHAR(40),
`description` VARCHAR(40),
submission_date DATE);

CREATE TABLE stream_and_type(
id INT PRIMARY KEY AUTO_INCREMENT,
stream_title VARCHAR(30),
`type` VARCHAR(30));

CREATE TABLE courses(
id INT PRIMARY KEY AUTO_INCREMENT,
course_title VARCHAR(30),
Stream_and_typeID INT,
start_date DATE,
end_date DATE,
FOREIGN KEY (Stream_and_typeID) REFERENCES stream_and_type(id));

CREATE TABLE tuition_fees_per_student(
id INT PRIMARY KEY AUTO_INCREMENT,
studentID INT,
tuition_fees DECIMAL(8,3),
FOREIGN KEY (studentID) REFERENCES students(id));

CREATE TABLE student_grades_per_assignment(
id INT PRIMARY KEY AUTO_INCREMENT,
StudentID INT,
AssignmentID INT,
oral_mark DECIMAL(3,2),
total_mark DECIMAL(3,2),
delivery_date DATE,
FOREIGN KEY (StudentID) REFERENCES students(id),
FOREIGN KEY (AssignmentID) REFERENCES assignments(id));

CREATE TABLE students_per_course(
id INT PRIMARY KEY AUTO_INCREMENT,
StudentID INT,
CourseID INT,
FOREIGN KEY (StudentID) REFERENCES students(id),
FOREIGN KEY (courseID) REFERENCES courses(id));

CREATE TABLE trainers_per_course(
id INT PRIMARY KEY AUTO_INCREMENT,
TrainerID INT,
CourseID INT,
FOREIGN KEY (TrainerID) REFERENCES trainers(id),
FOREIGN KEY (CourseID) REFERENCES courses(id));

CREATE TABLE assignment_per_course(
id INT PRIMARY KEY AUTO_INCREMENT,
AssignmentID INT,
CourseID INT,
FOREIGN KEY (AssignmentID) REFERENCES assignments(id),
FOREIGN KEY (CourseID) REFERENCES courses(id));

CREATE TABLE assignments_per_course_per_student(
id INT PRIMARY KEY AUTO_INCREMENT,
Student_per_courseID INT,
Assignment_per_courseID INT,
FOREIGN KEY (Student_per_courseID) REFERENCES students_per_course(id),
FOREIGN KEY (Assignment_per_courseID) REFERENCES assignment_per_course(id));

