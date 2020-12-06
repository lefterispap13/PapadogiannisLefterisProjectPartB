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
