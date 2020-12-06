package utils;


import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class Connection {
    public static int newInteger(Scanner sc){
        return Integer.parseInt(sc.nextLine());
    }
    public static String reformatDate(LocalDate date){
        return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public static LocalDate newDate(String str){
        return LocalDate.parse(str, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public static void projectMenu(){
        try {

            String host = "jdbc:mysql://localhost:3306/privateschoolstructure?useLegacyDatetimeCode=false&serverTimezone=UTC";
//            String uName = "root";
//            String uPass = "";
            String uName;
            String uPass;
            Scanner sc=new Scanner(System.in);
            System.out.println("\nTo get access to the administration system of the school you have\n" +
                    "to type the username and the password of your database... \n");
            System.out.println("First type the username:");
            uName=sc.nextLine();
            System.out.println("Now type the password:");
            uPass=sc.nextLine();

            java.sql.Connection con = DriverManager.getConnection(host, uName, uPass);

            int userInput;
            int userInput1;
            System.out.println("<===============================================================================>");
            System.out.println("<===============================================================================>");
            System.out.println("<===========================  PRIVATE SCHOOL'S DATABASE  =======================>");
            System.out.println("<===============================================================================>");
            System.out.println("<===============================================================================>");
            String programCounter;



            System.out.println();
            Statement stat = con.createStatement();
            do {

                System.out.println(" ");
                System.out.println("Press: ");
                System.out.println("0 if you want to terminate the program, \n1 if you want to see the existing lists" +
                        " \n2 if you want to update the existing lists: ");
                userInput = newInteger(sc);
                if (userInput == 0) {
                    System.out.println("Goodbye ..");
                } else if (userInput == 1) {
                    String existingListsCounter;

                    do {
                        System.out.println("Press 1 for : All the Students");
                        System.out.println("Press 2 for : All the Trainers");
                        System.out.println("Press 3 for : All the Assignments");
                        System.out.println("Press 4 for : All the Courses");
                        System.out.println("Press 5 for : All the Students Per Course");
                        System.out.println("Press 6 for : All the Trainers Per Course");
                        System.out.println("Press 7 for : All the Assignments Per Course");
                        System.out.println("Press 8 for : All the Assignments Per Student per course");
                        System.out.println("Press 9 for : All the Students that are enrolled in more than one courses");
                        System.out.println("Press 10 for: All the Grades of the Students Per Assignment");
                        userInput1 = newInteger(sc);
                        if (userInput1 == 1) {
                            String sql1 = "select * from students"; //to table ths sql <--
                            ResultSet rs1 = stat.executeQuery(sql1);
                            System.out.println("The list of all Students:\n");
                            while (rs1.next()) {
                                int id_col = rs1.getInt("id");
                                String firstName = rs1.getString("first_name");
                                String lastName = rs1.getString("last_name");
                                Date dateOfBirth = rs1.getDate("date_of_birth");
                                String l1 = "ID:" + id_col + " Student: " + lastName.toUpperCase() + " " + firstName.toUpperCase() +
                                        " ,date of birth: " + dateOfBirth;
                                System.out.println(l1);
                            }
                            rs1.close();
                        } else if (userInput1 == 2) {
                            System.out.println("");
                            String sql2 = "select * from trainers"; //to table ths sql <--
                            ResultSet rs2 = stat.executeQuery(sql2);
                            System.out.println("The list of all Trainers:\n");
                            while (rs2.next()) {
                                int id_col = rs2.getInt("id");
                                String firstName = rs2.getString("first_name");
                                String lastName = rs2.getString("last_name");
                                String subject = rs2.getString("subject");
                                String l2 = "ID:" + id_col + " ,Trainer: " + lastName.toUpperCase() + " " + firstName.toUpperCase() +
                                        " ,subject: " + subject;
                                System.out.println(l2);
                            }
                            rs2.close();
                        } else if (userInput1 == 3) {

                            System.out.println("");
                            String sql3 = "select * from assignments"; //to table ths sql <--
                            ResultSet rs3 = stat.executeQuery(sql3);
                            System.out.println("The list of all Assignments:\n");
                            while (rs3.next()) {
                                int id_col = rs3.getInt("id");
                                String assignmentTitle = rs3.getString("assignment_title");
                                String description = rs3.getString("description");
                                Date subDate = rs3.getDate("submission_date");
                                String l3 = "ID:" + id_col + " assignment: " + assignmentTitle.toUpperCase() + " ,description: "
                                        + description.toUpperCase() + " ,submission date: " + subDate;
                                System.out.println(l3);
                            }
                            rs3.close();
                        } else if (userInput1 == 4) {

                            System.out.println("");
                            String sql4 = "call showAllCourses()"; //to table ths sql <--
                            ResultSet rs4 = stat.executeQuery(sql4);
                            System.out.println("The list of all Courses:\n");
                            while (rs4.next()) {
                                int id_col = rs4.getInt("id");
                                String courseTitle = rs4.getString("course_title");
                                String streamTitle = rs4.getString("stream_title");
                                String type = rs4.getString("type");
                                Date startDate = rs4.getDate("start_date");
                                Date endDate = rs4.getDate("end_date");
                                String l4 = "ID:" + id_col + " ,Course: " + courseTitle.toUpperCase() + " - " + streamTitle.toUpperCase() + " ," +
                                        type.toUpperCase() + " ,start date: " + startDate + " ,end date: " + endDate;
                                System.out.println(l4);
                            }
                            rs4.close();
                        } else if (userInput1 == 5) {

                            System.out.println("");
                            String sql5 = "call showAllStudentsPerCourse()"; //to table ths sql <--
                            ResultSet rs5 = stat.executeQuery(sql5);
                            System.out.println("The list of all Students per Course:\n");
                            while (rs5.next()) {
                                int studentPerCourseID = rs5.getInt("id");
                                String courseTitle = rs5.getString("course_title");
                                String streamTitle = rs5.getString("stream_title");
                                String type = rs5.getString("type");
                                String firstName = rs5.getString("first_name");
                                String lastName = rs5.getString("last_name");
                                String l5 = " Course: " + courseTitle.toUpperCase() + " - " +
                                        streamTitle.toUpperCase() + " ," + type.toUpperCase() +
                                        " ,last name: " + lastName.toUpperCase() + " ,first name: " + firstName.toUpperCase();
                                System.out.println(l5);
                            }
                            rs5.close();
                        } else if (userInput1 == 6) {
                            System.out.println("");
                            String sql6 = "call showAllTrainersPerCourse()"; //to table ths sql <--
                            ResultSet rs6 = stat.executeQuery(sql6);
                            System.out.println("The list of all Trainers per Course:\n");
                            while (rs6.next()) {
                                String courseTitle = rs6.getString("course_title");
                                String streamTitle = rs6.getString("stream_title");
                                String type = rs6.getString("type");
                                String firstName = rs6.getString("first_name");
                                String lastName = rs6.getString("last_name");
                                String l6 = "Course: " + courseTitle.toUpperCase() + " - " +
                                        streamTitle.toUpperCase() + " ," + type.toUpperCase() +
                                        " ,last name: " + lastName.toUpperCase() + " ,first name: " + firstName.toUpperCase();
                                System.out.println(l6);
                            }
                            rs6.close();
                        } else if (userInput1 == 7) {
                            System.out.println("");
                            String sql7 = "call showAllAssignmentsPerCourse()"; //to table ths sql <--
                            ResultSet rs7 = stat.executeQuery(sql7);
                            System.out.println("The list of all Assignments per Course :\n");
                            while (rs7.next()) {
                                int id = rs7.getInt("id");
                                String courseTitle = rs7.getString("course_title");
                                String streamTitle = rs7.getString("stream_title");
                                String type = rs7.getString("type");
                                String assignmentTitle = rs7.getString("assignment_title");
                                String description = rs7.getString("description");
                                Date submissionDate = rs7.getDate("submission_date");
                                String l7 = "ID:" + id + " Course: " + courseTitle.toUpperCase() + " - " +
                                        streamTitle.toUpperCase() + " ," + type.toUpperCase() +
                                        " ,assignment: " + assignmentTitle.toUpperCase() + " ,description: " +
                                        description.toUpperCase() + " ,submission date: " + submissionDate;
                                System.out.println(l7);
                            }
                            rs7.close();
                        } else if (userInput1 == 8) {

                            System.out.println("");
                            String sql8 = "call showAllAssignmentsPerCoursePerStudent()"; //to table ths sql <--
                            ResultSet rs8 = stat.executeQuery(sql8);
                            System.out.println("The list of all Assignments per Course Per Student:\n");
                            while (rs8.next()) {
                                String courseTitle = rs8.getString("course_title");
                                String streamTitle = rs8.getString("stream_title");
                                String type = rs8.getString("type");
                                String assignmentTitle = rs8.getString("assignment_title");
                                String description = rs8.getString("description");
                                String firstName = rs8.getString("first_name");
                                String lastName = rs8.getString("last_name");
                                String l8 = " Course: " + courseTitle.toUpperCase() + " - " +
                                        streamTitle.toUpperCase() + " ," + type.toUpperCase() +" ,last name: " + lastName.toUpperCase() +
                                        " ,first name: " + firstName.toUpperCase()+
                                        " ,assignment: " + assignmentTitle.toUpperCase() + " ,description: " +
                                        description.toUpperCase();
                                System.out.println(l8);
                            }
                            rs8.close();
                        } else if (userInput1 == 9) {

                            System.out.println("");
                            String sql9 = "call showAllStudentsMoreThanOneCourses()"; //to table ths sql <--
                            ResultSet rs9 = stat.executeQuery(sql9);
                            System.out.println("The list of all students who are enrolled in more than one courses are:\n");
                            while (rs9.next()) {
                                String firstName = rs9.getString("first_name");
                                String lastName = rs9.getString("last_name");
                                int id = rs9.getInt("courseID");

                                String l9 = "ID:" + id + " ,student: " + lastName.toUpperCase() + " " + firstName.toUpperCase();
                                System.out.println(l9);
                            }
                            rs9.close();
                        }
                        else if (userInput1 == 10) {

                            System.out.println("");
                            String sql10 = "call studentGrades()"; //to table ths sql <--
                            ResultSet rs10 = stat.executeQuery(sql10);
                            System.out.println("The list of all Students Grades Per Assignment:\n");
                            while (rs10.next()) {
                                String firstName = rs10.getString("first_name");
                                String lastName = rs10.getString("last_name");
                                String assignmentTitle = rs10.getString("assignment_title");
                                String description = rs10.getString("description");
                                Date submissionDate=rs10.getDate("submission_date");
                                double oralMark=rs10.getDouble("oral_mark");
                                double totalMark=rs10.getDouble("total_mark");
                                Date deliveryDate=rs10.getDate("delivery_date");


                                String l10 = "Student: "+lastName.toUpperCase()+" "+firstName.toUpperCase()+
                                        " ,Assignment: "+assignmentTitle.toUpperCase()+" ,description: "+description.toUpperCase()+
                                        " ,Submission date: "+submissionDate+" ,oral mark: "+oralMark+" ,total mark: "+totalMark+
                                        " ,delivery date: "+deliveryDate;
                                System.out.println(l10);
                            }
                            rs10.close();
                        }

                        System.out.println("\nIf you want to see another list press 1 or " +
                                "anything else to continue");
                        existingListsCounter = sc.nextLine();

                    } while (existingListsCounter.equals("1"));
                } else if (userInput == 2) {
                    String updateCount;
                    do {
                        System.out.println("Choose the list you want to update: \n");
                        System.out.println("Press 1 for : All the Students");
                        System.out.println("Press 2 for : All the Trainers");
                        System.out.println("Press 3 for : All the Assignments");
                        System.out.println("Press 4 for : All the Courses");
                        System.out.println("Press 5 for : All the Students Per Course");
                        System.out.println("Press 6 for : All the Trainers Per Course");
                        System.out.println("Press 7 for : All the Assignments Per Student per Course");
                        System.out.println("Or press 0 if you want to exit the program");

                        String update = sc.nextLine();
                        if (update.equals("1")) {
                            String studentCount;
                            do {
                                String sql1 = "select * from students"; //to table ths sql <--
                                ResultSet rs1 = stat.executeQuery(sql1);
                                int max = 1;
                                while (rs1.next()) {
                                    int id_col = rs1.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs1.close();
                                System.out.println("Give me the last name of the student");
                                String lastName = sc.nextLine();
                                System.out.println("Give me the first name of the student");
                                String firstName = sc.nextLine();
                                System.out.println("Give me the date of birth of the student in the form of dd/MM/yyyy");
                                LocalDate dob = newDate(sc.nextLine());
                                String sql10 = "insert into students values(?,?,?,?)"; //to table ths sql <-
                                Date date = java.sql.Date.valueOf(dob);
                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setString(2, lastName);
                                preparedStmt.setString(3, firstName);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setDate(4, date);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another student press 1 " +
                                        "or press anything else to continue:");
                                studentCount = sc.nextLine();
                            } while (studentCount.equals("1"));
                        } else if (update.equals("2")) {
                            String trainerCount;
                            do {
                                System.out.println("");
                                String sql2 = "select * from trainers"; //to table ths sql <--
                                ResultSet rs2 = stat.executeQuery(sql2);
                                int max = 1;
                                while (rs2.next()) {
                                    int id_col = rs2.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs2.close();
                                System.out.println("Give me the last name of the Trainer");
                                String lastName = sc.nextLine();
                                System.out.println("Give me the first name of the Trainer");
                                String firstName = sc.nextLine();
                                System.out.println("Give me the subject of the Trainer");
                                String subject = sc.nextLine();
                                String sql10 = "insert into trainers values(?,?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);
                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setString(2, lastName);
                                preparedStmt.setString(3, firstName);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setString(4, subject);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Trainer press 1 " +
                                        "or press anything else to continue:");
                                trainerCount = sc.nextLine();
                            } while ("1".equals(trainerCount));
                        } else if (update.equals("3")) {
                            String assignmentCounter;
                            do {
                                System.out.println("");
                                String sql3 = "select * from assignments"; //to table ths sql <--
                                ResultSet rs3 = stat.executeQuery(sql3);
                                int max = 1;
                                while (rs3.next()) {
                                    int id_col = rs3.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs3.close();
                                System.out.println("Give me the assignment title");
                                String assignmentTitle = sc.nextLine();
                                System.out.println("Give me the description of the assignment");
                                String description = sc.nextLine();
                                System.out.println("Give me the submission date of the assignment in the form of dd/MM/yyyy");
                                LocalDate dob = newDate(sc.nextLine());
                                Date date = java.sql.Date.valueOf(dob);
                                String sql10 = "insert into assignments values(?,?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);
                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setString(2, assignmentTitle);
                                preparedStmt.setString(3, description);
                                preparedStmt.setDate(4, date);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Assignment press 1 " +
                                        "or press anything else to continue:");
                                assignmentCounter = sc.nextLine();
                            } while ("1".equals(assignmentCounter));
                        } else if (update.equals("4")) {
                            String courseCounter;
                            do {
                                System.out.println("");
                                String sql4 = "call showAllCourses()"; //to table ths sql <--
                                ResultSet rs4 = stat.executeQuery(sql4);
                                int max = 1;
                                while (rs4.next()) {
                                    int id_col = rs4.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs4.close();
                                System.out.println("Give me the course title");
                                String courseTitle = sc.nextLine();

                                String sql1 = "select * from stream_and_type"; //to table ths sql <--
                                ResultSet rs1 = stat.executeQuery(sql1);
                                System.out.println("\nThe stream and types available are:\n");
                                while (rs1.next()) {
                                    int id_col = rs1.getInt("id");
                                    String streamTitle = rs1.getString("stream_title");
                                    String type = rs1.getString("type");
                                    String l1 = "ID:" + id_col + " - " + streamTitle.toUpperCase() + " ," + type.toUpperCase();
                                    System.out.println(l1);
                                }

                                System.out.println("\nGive me the stream and type ID from the above list");
                                String streamAndTypeID = sc.nextLine();
                                System.out.println("Give me the start date of the course in the form of dd/MM/yyyy:");
                                LocalDate dob = newDate(sc.nextLine());
                                Date startDate = java.sql.Date.valueOf(dob);
                                System.out.println("Give me the end date of the course in the form of dd/MM/yyyy:");
                                LocalDate dob2 = newDate(sc.nextLine());
                                Date endDate = java.sql.Date.valueOf(dob2);
                                String sql10 = "insert into courses values(?,?,?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);
                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setString(2, courseTitle);
                                preparedStmt.setString(3, streamAndTypeID);
                                preparedStmt.setDate(4, startDate);
                                preparedStmt.setDate(5, endDate);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Course press 1 " +
                                        "or press anything else to continue:");
                                courseCounter = sc.nextLine();
                            } while ("1".equals(courseCounter));
                        } else if (update.equals("5")) {
                            String studPerCourseCounter;
                            do {
                                System.out.println("");
                                String sql5 = "call showAllStudentsPerCourse()"; //to table ths sql <--
                                ResultSet rs5 = stat.executeQuery(sql5);
                                int max = 1;
                                while (rs5.next()) {
                                    int studentPerCourseID = rs5.getInt("id");
                                    if (studentPerCourseID > max) {
                                        max = studentPerCourseID;
                                    }
                                }
                                rs5.close();

                                String sql1 = "select * from students"; //to table ths sql <--
                                ResultSet rs1 = stat.executeQuery(sql1);
                                System.out.println("\nThe list of all Students:\n");
                                while (rs1.next()) {
                                    int id_col = rs1.getInt("id");
                                    String firstName = rs1.getString("first_name");
                                    String lastName = rs1.getString("last_name");
                                    Date dateOfBirth = rs1.getDate("date_of_birth");
                                    String l1 = "ID:" + id_col + " Student: " + lastName.toUpperCase() + " " + firstName.toUpperCase() +
                                            " ,date of birth: " + dateOfBirth;
                                    System.out.println(l1);
                                }

                                System.out.println("\nChoose an ID of a student from the above list");
                                int studID = newInteger(sc);

                                System.out.println("");
                                String sql4 = "call showAllCourses()"; //to table ths sql <--
                                ResultSet rs4 = stat.executeQuery(sql4);
                                System.out.println("\nThe list of all Courses:\n");
                                while (rs4.next()) {
                                    int courseID = rs4.getInt("id");
                                    String courseTitle = rs4.getString("course_title");
                                    String streamTitle = rs4.getString("stream_title");
                                    String type = rs4.getString("type");
                                    Date startDate = rs4.getDate("start_date");
                                    Date endDate = rs4.getDate("end_date");
                                    String l4 = "ID:" + courseID + " ,Course: " + courseTitle.toUpperCase() + " - " + streamTitle.toUpperCase() + " ," +
                                            type.toUpperCase() + " ,start date: " + startDate + " ,end date: " + endDate;
                                    System.out.println(l4);
                                }

                                System.out.println("\nNow you have to choose an ID of the course from the above list");
                                int courseID = newInteger(sc);
                                String sql10 = "insert into students_per_course values(?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);

                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setInt(2, studID);
                                preparedStmt.setInt(3, courseID);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Student per " +
                                        "Course press 1 or press anything else to continue:");
                                studPerCourseCounter = sc.nextLine();
                            } while ("1".equals(studPerCourseCounter));
                        } else if (update.equals("6")) {
                            String trainersPerCourseCounter;
                            do {
                                System.out.println("");
                                String sql6 = "select * from trainers_per_course"; //to table ths sql <--
                                ResultSet rs6 = stat.executeQuery(sql6);
                                int max = 1;
                                while (rs6.next()) {
                                    int id_col = rs6.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs6.close();

                                String sql1 = "select * from trainers"; //to table ths sql <--
                                ResultSet rs1 = stat.executeQuery(sql1);
                                System.out.println("\nThe list of all Trainers:\n");
                                while (rs1.next()) {
                                    int id_col = rs1.getInt("id");
                                    String firstName = rs1.getString("first_name");
                                    String lastName = rs1.getString("last_name");
                                    String subject = rs1.getString("subject");
                                    String l1 = "ID:" + id_col + " Trainer: " + lastName.toUpperCase() + " " + firstName.toUpperCase() +
                                            " ,subject: " + subject;
                                    System.out.println(l1);
                                }

                                System.out.println("\nChoose an ID of a Trainer from the above list");
                                int trainerID = newInteger(sc);

                                System.out.println("");
                                String sql4 = "call showAllCourses()"; //to table ths sql <--
                                ResultSet rs4 = stat.executeQuery(sql4);
                                System.out.println("\nThe list of all Courses:\n");
                                while (rs4.next()) {
                                    int courseID = rs4.getInt("id");
                                    String courseTitle = rs4.getString("course_title");
                                    String streamTitle = rs4.getString("stream_title");
                                    String type = rs4.getString("type");
                                    Date startDate = rs4.getDate("start_date");
                                    Date endDate = rs4.getDate("end_date");
                                    String l4 = "ID:" + courseID + " ,Course: " + courseTitle.toUpperCase() + " - " + streamTitle.toUpperCase() + " ," +
                                            type.toUpperCase() + " ,start date: " + startDate + " ,end date: " + endDate;
                                    System.out.println(l4);
                                }

                                System.out.println("\nNow you have to choose an ID of the course from the above list");
                                int courseID = newInteger(sc);
                                String sql10 = "insert into trainers_per_course values(?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);

                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setInt(2, trainerID);
                                preparedStmt.setInt(3, courseID);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Trainer per Course" +
                                        " press 1 or press anything else:");
                                trainersPerCourseCounter = sc.nextLine();
                            } while ("1".equals(trainersPerCourseCounter));
                        } else if (update.equals("7")) {
                            String assignPerStudPerCourseCounter;
                            do {
                                System.out.println("");
                                String sql6 = "select * from assignments_per_course_per_student"; //to table ths sql <--
                                ResultSet rs6 = stat.executeQuery(sql6);
                                int max = 1;
                                while (rs6.next()) {
                                    int id_col = rs6.getInt("id");
                                    if (id_col > max) {
                                        max = id_col;
                                    }
                                }
                                rs6.close();

                                System.out.println("");
                                String sql5 = "call showAllStudentsPerCourse()"; //to table ths sql <--
                                ResultSet rs5 = stat.executeQuery(sql5);
                                System.out.println("The list of all Students per Course:\n");
                                while (rs5.next()) {
                                    int id_col=rs5.getInt("id");
                                    String courseTitle = rs5.getString("course_title");
                                    String streamTitle = rs5.getString("stream_title");
                                    String type = rs5.getString("type");
                                    String firstName = rs5.getString("first_name");
                                    String lastName = rs5.getString("last_name");
                                    String l5 = "ID:"+id_col+" ,Course: " + courseTitle.toUpperCase() + " - " +
                                            streamTitle.toUpperCase() + " ," + type.toUpperCase() +
                                            " ,last name: " + lastName.toUpperCase() + " ,first name: " + firstName.toUpperCase();
                                    System.out.println(l5);
                                }

                                System.out.println("\nChoose an ID of a Student per Course from the above list");
                                int studPerCourseID = newInteger(sc);

                                System.out.println("");
                                String sql7 = "call showAllAssignmentsPerCourse()"; //to table ths sql <--
                                ResultSet rs7 = stat.executeQuery(sql7);
                                System.out.println("The list of all Assignments per Course :\n");
                                while (rs7.next()) {
                                    int id = rs7.getInt("id");
                                    String courseTitle = rs7.getString("course_title");
                                    String streamTitle = rs7.getString("stream_title");
                                    String type = rs7.getString("type");
                                    String assignmentTitle = rs7.getString("assignment_title");
                                    String description = rs7.getString("description");
                                    Date submissionDate = rs7.getDate("submission_date");
                                    String l7 = "ID:" + id + " ,Course: " + courseTitle.toUpperCase() + " - " +
                                            streamTitle.toUpperCase() + " ," + type.toUpperCase() +
                                            " ,assignment: " + assignmentTitle.toUpperCase() + " ,description: " +
                                            description.toUpperCase() + " ,submission date: " + submissionDate;
                                    System.out.println(l7);
                                }

                                System.out.println("\nNow you have to choose an ID of the course from the above list");
                                int assignmentPerCourseID = newInteger(sc);
                                String sql10 = "insert into assignments_per_course_per_student values(?,?,?)"; //to table ths sql <--
                                //ResultSet rs10 = stat.executeQuery(sql10);

                                PreparedStatement preparedStmt = con.prepareStatement(sql10);
                                preparedStmt.setInt(1, max + 1);
                                preparedStmt.setInt(2, studPerCourseID);
                                preparedStmt.setInt(3, assignmentPerCourseID);
                                preparedStmt.execute();
                                System.out.println("If you want to insert data for another Assignment Per Student per Course" +
                                        " press 1 or press anything else:");
                                assignPerStudPerCourseCounter = sc.nextLine();
                            } while ("1".equals(assignPerStudPerCourseCounter));
                        } else if (update.equals("0")) {
                            System.out.println("Goodbye ..");
                        }
                        System.out.println("Press: 1 if you want to return to menu of the lists that you want to update\nPress: 0 to continue the program");
                        updateCount = sc.nextLine();
                    } while (updateCount.equals("1"));
                } else {
                    System.out.println("Goodbye...");
                }
                System.out.println("Press 1 if you want to return to main menu or anything else to Exit the program:");
                programCounter=sc.nextLine();
            }while (programCounter.equals("1"));
            sc.close();
            System.out.println("Goodbye...");
        } catch (SQLException err) {
            System.out.println(err.getMessage());
        }

    }
}
