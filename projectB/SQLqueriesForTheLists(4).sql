
-- >AT THE BOTTOM I HAVE ALL THE SQL QUERIES THAT OUTPUT ALL THE LISTS <--

-- list 1, of all students

CREATE PROCEDURE showAllStudents()
create procedure showAllStudents()
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


CALL showAllStudents();

-- list 2, of all trainers

CREATE PROCEDURE showAllTrainers()
SELECT * FROM trainers;

CALL showAllTrainers();

-- list 3 ,of all assignments

CREATE PROCEDURE showAllAssignments()
SELECT * FROM assignments;

CALL showAllAssignments();

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

CALL showAllCourses();

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

CALL showAllStudentsPerCourse();

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

CALL showAllTrainersPerCourse();

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

CALL showAllAssignmentsPerCourse();

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

CALL showAllAssignmentsPerCoursePerStudent();


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

CALL showAllStudentsMoreThanOneCourses();


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


