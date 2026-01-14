CREATE DATABASE `tertiary_institution_v3`;
USE `tertiary_institution_v3`;

CREATE TABLE Students (
	student_id INT PRIMARY KEY,
    name VARCHAR(100),
    major VARCHAR(100),
    year_of_study INT)
;

INSERT INTO Students (student_id, name, major, year_of_study) VALUES
(1, 'Alice Johnson', 'Computer Science', 2),
(2, 'Bob Smith', 'Mechnical Engineering', 3),
(3, 'Charlie Brown', 'Business Administration', 1);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100),
    credits INT)
;

INSERT INTO Courses (course_id, course_name, department, credits) VALUES
(101, 'Introduction to Programming', 'Computer Science', 3),
(102, 'Thermodynamics', 'Mechanical Engineering', 4),
(103, 'Marketing 101', 'Business Administration', 3);

CREATE TABLE Enrollments (
	enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-09-01'),
(2, 2, 102, '2023-09-01'),
(3, 3, 103, '2023-09-01'),
(4, 1, 103, '2023-09-02');

SELECT *
FROM Students
INNER JOIN Enrollments ON students.student_id = enrollments.student_id
INNER JOIN Courses ON enrollments.course_id = courses.course_id;

SELECT students.name AS student_name,
courses.course_name,
enrollments.enrollment_date
FROM Students
INNER JOIN Enrollments ON students.student_id = enrollments.student_id
INNER JOIN Courses ON enrollments.course_id = courses.course_id;

SELECT students.name AS student_name,
courses.course_name,
enrollments.enrollment_date
FROM Students
LEFT JOIN Enrollments ON students.student_id = enrollments.student_id
LEFT JOIN Courses ON enrollments.course_id = courses.course_id
ORDER BY enrollments.enrollment_date DESC;
