
-- >AT THE BOTTOM I HAVE ALL THE SQL QUERIES THAT OUTPUT ALL THE LISTS  <--
-- >All procedures that outputs the lists are on comments at the bottom <--
-- >You can uncomment and and call thm to see the output                <--

CREATE DATABASE PrivateSchoolStructure;
USE privateSchoolstructure;

-- BASIC TABLE 1
CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(40),
first_name VARCHAR(40),
date_of_birth DATE);

-- BASIC TABLE 2
CREATE TABLE trainers(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(40),
first_name VARCHAR(40),
`subject` VARCHAR(30));

-- BASIC TABLE 3
CREATE TABLE assignments(
id INT PRIMARY KEY AUTO_INCREMENT,
Assignment_title VARCHAR(40),
`description` VARCHAR(40),
submission_date DATE);

CREATE TABLE stream_and_type(
id INT PRIMARY KEY AUTO_INCREMENT,
stream_title VARCHAR(30),
`type` VARCHAR(30));

-- BASIC TABLE 4
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

-- inserting values for students table
INSERT INTO students VALUES(1,'papadogiannis','lefteris','1991-06-16');
INSERT INTO students VALUES(2,'karvelas','mixalis','1996-09-13');
INSERT INTO students VALUES(3,'gewrgiou','giwrgos','1997-02-10');
INSERT INTO students VALUES(4,'antwniou','antwnis','1999-04-23');
INSERT INTO students VALUES(5,'mitroglou','kwstas','1989-01-12');

-- inserting values for trainers table
INSERT INTO trainers VALUES (1,'fwtiadis','vladimiros','java');
INSERT INTO trainers VALUES (2,'pasparakis','giwrgos','java');
INSERT INTO trainers VALUES (3,'gkoumas','giannis','c#');
INSERT INTO trainers VALUES (4,'vyntra','loukas','c#');
INSERT INTO trainers VALUES (5,'mantalos','petros','python');

-- inserting values for assignments table
INSERT INTO assignments VALUES (1,'project1','private school','2020-11-17');
INSERT INTO assignments VALUES (2,'project2','library','2020-12-19');
INSERT INTO assignments VALUES (3,'project3','tic tac toe','2021-01-17');
INSERT INTO assignments VALUES (4,'project4','pc build','2021-02-15');
INSERT INTO assignments VALUES (5,'project5','programming','2021-02-25');

-- inserting values for stream_and_type table
INSERT INTO stream_and_type VALUES (1,'java','full time');
INSERT INTO stream_and_type VALUES (2,'java','part time');
INSERT INTO stream_and_type VALUES (3,'c#','full time');
INSERT INTO stream_and_type VALUES (4,'c#','part time');

-- inserting values for courses table
INSERT INTO courses VALUES (1,'CB1',1,'2020-10-17','2020-02-10');
INSERT INTO courses VALUES (2,'CB1',2,'2020-10-17','2020-05-10');
INSERT INTO courses VALUES (3,'CB1',3,'2020-10-17','2020-02-10');
INSERT INTO courses VALUES (4,'CB1',4,'2020-10-17','2020-05-10');
INSERT INTO courses VALUES (5,'CB2',1,'2020-05-12','2020-08-10');
INSERT INTO courses VALUES (6,'CB2',2,'2020-05-12','2020-11-10');
INSERT INTO courses VALUES (7,'CB2',3,'2020-05-12','2020-08-10');
INSERT INTO courses VALUES (8,'CB2',4,'2020-05-12','2020-11-10');

-- inserting values for tuition_fees_per_student table
INSERT INTO tuition_fees_per_student VALUES (1,1,1500);
INSERT INTO tuition_fees_per_student VALUES (2,2,1700);
INSERT INTO tuition_fees_per_student VALUES (3,3,1200);
INSERT INTO tuition_fees_per_student VALUES (4,4,1900);
INSERT INTO tuition_fees_per_student VALUES (5,5,800);

-- inserting values for student_grades_per_assignment table
INSERT INTO student_grades_per_assignment VALUES (1,1,1,20,60,'2020-11-17');
INSERT INTO student_grades_per_assignment VALUES (2,1,2,40,70,'2020-12-19');
INSERT INTO student_grades_per_assignment VALUES (3,1,3,50,75,'2021-01-17');
INSERT INTO student_grades_per_assignment VALUES (4,1,4,90,95,'2021-02-15');
INSERT INTO student_grades_per_assignment VALUES (5,1,5,75,70,'2021-02-25');
INSERT INTO student_grades_per_assignment VALUES (6,2,1,85,80,'2020-11-17');
INSERT INTO student_grades_per_assignment VALUES (7,2,2,90,95,'2020-12-19');
INSERT INTO student_grades_per_assignment VALUES (8,2,3,60,65,'2021-01-17');
INSERT INTO student_grades_per_assignment VALUES (9,2,4,70,75,'2021-02-15');
INSERT INTO student_grades_per_assignment VALUES (10,2,5,80,85,'2021-02-25');
INSERT INTO student_grades_per_assignment VALUES (11,3,1,90,95,'2020-11-17');
INSERT INTO student_grades_per_assignment VALUES (12,3,2,60,65,'2020-12-19');
INSERT INTO student_grades_per_assignment VALUES (13,3,3,70,75,'2021-01-17');
INSERT INTO student_grades_per_assignment VALUES (14,3,4,85,65,'2021-02-15');
INSERT INTO student_grades_per_assignment VALUES (15,3,5,70,70,'2021-02-25');
INSERT INTO student_grades_per_assignment VALUES (16,4,1,80,85,'2020-11-17');
INSERT INTO student_grades_per_assignment VALUES (17,4,2,25,60,'2020-12-19');
INSERT INTO student_grades_per_assignment VALUES (18,4,3,70,75,'2021-01-17');
INSERT INTO student_grades_per_assignment VALUES (19,4,4,50,55,'2021-02-15');
INSERT INTO student_grades_per_assignment VALUES (20,4,5,60,65,'2021-02-25');
INSERT INTO student_grades_per_assignment VALUES (21,5,1,70,65,'2020-11-17');
INSERT INTO student_grades_per_assignment VALUES (22,5,2,80,80,'2020-12-19');
INSERT INTO student_grades_per_assignment VALUES (23,5,3,90,75,'2021-01-17');
INSERT INTO student_grades_per_assignment VALUES (24,5,4,60,65,'2021-02-15');
INSERT INTO student_grades_per_assignment VALUES (25,5,5,70,75,'2021-02-25');

-- inserting values for students_per_course table
INSERT INTO students_per_course VALUES (1,1,1);
INSERT INTO students_per_course VALUES (2,2,1);
INSERT INTO students_per_course VALUES (3,3,1);
INSERT INTO students_per_course VALUES (4,4,1);
INSERT INTO students_per_course VALUES (5,5,1);
INSERT INTO students_per_course VALUES (6,1,4);

-- inserting values for trainers_per_course table
INSERT INTO trainers_per_course VALUES (1,1,1);
INSERT INTO trainers_per_course VALUES (2,2,3);
INSERT INTO trainers_per_course VALUES (3,3,2);
INSERT INTO trainers_per_course VALUES (4,4,4);
INSERT INTO trainers_per_course VALUES (5,5,5);

-- inserting values for assignment_per_course table
INSERT INTO assignment_per_course VALUES (1,1,1);
INSERT INTO assignment_per_course VALUES (2,2,1);
INSERT INTO assignment_per_course VALUES (3,3,1);
INSERT INTO assignment_per_course VALUES (4,4,1);
INSERT INTO assignment_per_course VALUES (5,5,1);
INSERT INTO assignment_per_course VALUES (6,1,3);
INSERT INTO assignment_per_course VALUES (7,2,3);
INSERT INTO assignment_per_course VALUES (8,3,3);
INSERT INTO assignment_per_course VALUES (9,4,3);
INSERT INTO assignment_per_course VALUES (10,5,3);
INSERT INTO assignment_per_course VALUES (11,1,2);
INSERT INTO assignment_per_course VALUES (12,2,2);
INSERT INTO assignment_per_course VALUES (13,3,2);
INSERT INTO assignment_per_course VALUES (14,4,2);
INSERT INTO assignment_per_course VALUES (15,5,2);

-- inserting values for assignments_per_course_per_student table
INSERT INTO assignments_per_course_per_student VALUES (1,1,1);
INSERT INTO assignments_per_course_per_student VALUES (2,1,2);
INSERT INTO assignments_per_course_per_student VALUES (3,1,3);
INSERT INTO assignments_per_course_per_student VALUES (4,1,4);
INSERT INTO assignments_per_course_per_student VALUES (5,1,5);
INSERT INTO assignments_per_course_per_student VALUES (6,2,1);
INSERT INTO assignments_per_course_per_student VALUES (7,2,2);
INSERT INTO assignments_per_course_per_student VALUES (8,2,3);
INSERT INTO assignments_per_course_per_student VALUES (9,2,4);
INSERT INTO assignments_per_course_per_student VALUES (10,2,5);
INSERT INTO assignments_per_course_per_student VALUES (11,3,1);
INSERT INTO assignments_per_course_per_student VALUES (12,3,2);
INSERT INTO assignments_per_course_per_student VALUES (13,3,3);
INSERT INTO assignments_per_course_per_student VALUES (14,3,4);
INSERT INTO assignments_per_course_per_student VALUES (15,3,5);



-- list 1, of all students

CREATE PROCEDURE showAllStudents()
SELECT 
privateschoolstructure.students.id,
privateschoolstructure.students.last_name,
privateschoolstructure.students.first_name,
privateschoolstructure.students.date_of_birth,
privateschoolstructure.tuition_fees_per_student.tuition_fees
FROM privateschoolstructure.tuition_fees_per_student
INNER JOIN privateschoolstructure.students
ON privateschoolstructure.students.id=
privateschoolstructure.tuition_fees_per_student.studentID;




-- list 2, of all trainers

CREATE PROCEDURE showAllTrainers()
SELECT * FROM trainers;


-- list 3 ,of all assignments

CREATE PROCEDURE showAllAssignments()
SELECT * FROM assignments;



-- list 4 ,of all courses

CREATE PROCEDURE showAllCourses()
SELECT 
courses.id,
courses.course_title,
stream_and_type.stream_title,
stream_and_type.`type`,
courses.start_date,
courses.end_date
FROM courses
INNER JOIN stream_and_type ON courses.Stream_and_typeID=stream_and_type.id
ORDER BY course_title;



-- xxx list 5 of all students per course

CREATE PROCEDURE showAllStudentsPerCourse()
SELECT
privateschoolstructure.students_per_course.id,
privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`,
privateschoolstructure.students.last_name,
privateschoolstructure.students.first_name
FROM privateschoolstructure.students_per_course
INNER JOIN 
privateschoolstructure.courses ON
privateschoolstructure.students_per_course.CourseID=privateschoolstructure.courses.id
INNER JOIN
privateschoolstructure.stream_and_type ON
privateschoolstructure.courses.Stream_and_typeID=privateschoolstructure.stream_and_type.id
INNER JOIN
privateschoolstructure.students ON
privateschoolstructure.students_per_course.StudentID=privateschoolstructure.students.id
ORDER BY privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`;


-- xxx list 6 ,of all trainers per course

CREATE PROCEDURE showAllTrainersPerCourse()
SELECT 
privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`,
privateschoolstructure.trainers.last_name,
privateschoolstructure.trainers.first_name
FROM privateschoolstructure.trainers_per_course
INNER JOIN privateschoolstructure.trainers ON 
privateschoolstructure.trainers_per_course.TrainerID=privateschoolstructure.trainers.id
INNER JOIN privateschoolstructure.courses ON
privateschoolstructure.trainers_per_course.CourseID=privateschoolstructure.courses.id
INNER JOIN privateschoolstructure.stream_and_type ON
privateschoolstructure.courses.Stream_and_typeID=privateschoolstructure.stream_and_type.id
ORDER by privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`;


-- xxx list 7 ,of all the assignments per course

CREATE PROCEDURE showAllAssignmentsPerCourse()
SELECT
privateschoolstructure.assignment_per_course.id,
privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`,
privateschoolstructure.assignments.assignment_title,
privateschoolstructure.assignments.`description`,
privateschoolstructure.assignments.submission_date
FROM privateschoolstructure.assignment_per_course
INNER JOIN privateschoolstructure.assignments ON
privateschoolstructure.assignment_per_course.AssignmentID=privateschoolstructure.assignments.id
INNER JOIN privateschoolstructure.courses ON
privateschoolstructure.assignment_per_course.CourseID=privateschoolstructure.courses.id
INNER JOIN privateschoolstructure.stream_and_type ON
privateschoolstructure.courses.Stream_and_typeID=privateschoolstructure.stream_and_type.id
ORDER BY id;


-- xxx list 8 ,of all the assignments per course per student

CREATE PROCEDURE showAllAssignmentsPerCoursePerStudent()
SELECT 
privateschoolstructure.courses.course_title,
privateschoolstructure.stream_and_type.stream_title,
privateschoolstructure.stream_and_type.`type`,
privateschoolstructure.students.last_name,
privateschoolstructure.students.first_name,
privateschoolstructure.assignments.assignment_title,
privateschoolstructure.assignments.`description`
FROM privateschoolstructure.assignments_per_course_per_student
INNER JOIN privateschoolstructure.students_per_course ON
privateschoolstructure.assignments_per_course_per_student.Student_per_courseID=
privateschoolstructure.students_per_course.id
INNER JOIN privateschoolstructure.students ON
privateschoolstructure.students_per_course.StudentID=
privateschoolstructure.students.id
INNER JOIN privateschoolstructure.assignment_per_course ON
privateschoolstructure.assignments_per_course_per_student.Assignment_per_courseID=
privateschoolstructure.assignment_per_course.id
INNER JOIN privateschoolstructure.assignments ON
privateschoolstructure.assignment_per_course.AssignmentID=
privateschoolstructure.assignments.id
INNER JOIN privateschoolstructure.courses ON
privateschoolstructure.assignment_per_course.CourseID=
privateschoolstructure.courses.id
INNER JOIN privateschoolstructure.stream_and_type ON
privateschoolstructure.courses.Stream_and_typeID=
privateschoolstructure.stream_and_type.id
ORDER BY course_title,stream_title,`type`,
last_name,first_name,assignment_title;



--  ???? list 9 of students that belong to more than one courses

CREATE PROCEDURE showAllStudentsMoreThanOneCourses()
SELECT 
privateschoolstructure.students.last_name,
privateschoolstructure.students.first_name,
privateschoolstructure.courses.id AS courseID
FROM privateschoolstructure.students_per_course
INNER JOIN
privateschoolstructure.courses ON
privateschoolstructure.students_per_course.CourseID=privateschoolstructure.courses.id
INNER JOIN
privateschoolstructure.stream_and_type ON
privateschoolstructure.courses.Stream_and_typeID=privateschoolstructure.stream_and_type.id
INNER JOIN
privateschoolstructure.students ON
privateschoolstructure.students_per_course.StudentID=privateschoolstructure.students.id
HAVING count(CourseID)>1;


-- ???? List of student's grades
CREATE PROCEDURE studentGrades()
select
privateschoolstructure.students.last_name,
privateschoolstructure.students.first_name,
privateschoolstructure.assignments.assignment_title,
privateschoolstructure.assignments.`description`,
privateschoolstructure.assignments.submission_date,
privateschoolstructure.student_grades_per_assignment.oral_mark,
privateschoolstructure.student_grades_per_assignment.total_mark,
privateschoolstructure.student_grades_per_assignment.delivery_date
from student_grades_per_assignment
inner join privateschoolstructure.students on
privateschoolstructure.students.id=
privateschoolstructure.student_grades_per_assignment.StudentID
inner join privateschoolstructure.assignments on
privateschoolstructure.assignments.id=
privateschoolstructure.student_grades_per_assignment.AssignmentID
ORDER BY last_name,first_name,assignment_title;

/*
-- HERE ARE ALL THE COMMANDS THAT YOU NEED TO SEE ALL THE LISTS <--

-- list 1, of all students:
CALL showAllStudents();
-- list 2, of all trainers:
CALL showAllTrainers();
-- list 3 ,of all assignments:
CALL showAllAssignments();
-- list 4 ,of all courses:
CALL showAllCourses();
-- list 5 of all students per course:
CALL showAllStudentsPerCourse();
-- list 6 ,of all trainers per course:
CALL showAllTrainersPerCourse();
-- list 7 ,of all the assignments per course:
CALL showAllAssignmentsPerCourse();
-- list 8 ,of all the assignments per course per student:
CALL showAllAssignmentsPerCoursePerStudent();
-- list 9 of students that belong to more than one courses:
CALL showAllStudentsMoreThanOneCourses();
-- list 10 of student's grades
call studentGrades();                       */