
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS departments1;

CREATE TABLE departments1 (
	id INT PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE courses (
	id INT PRIMARY KEY,
	name TEXT NOT NULL,
	department_id INT NOT NULL,
	credits INT NOT NULL ,
	FOREIGN KEY (department_id) REFERENCES departments1(id)
);

CREATE TABLE students (
	id INT PRIMARY KEY,
	name TEXT NOT NULL,
	age INT NOT NULL CHECK (age >= 16),
    department TEXT NOT NULL,
	department_id INT  NOT NULL,
	cgpa REAL NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments1(id)
);

INSERT INTO departments1(id, name) VALUES
	(1, 'Computer Science'),
	(2, 'Electronics'),
	(3, 'Mechanical'),
	(4, 'Civil');

INSERT INTO courses (id, name, department_id, credits) VALUES
	(101, 'Database Management Systems', 1, 4),
	(102, 'Data Structures', 1, 4),
	(201, 'Computer Science', 2, 3),
	(301, 'Artificial Intelligence and Machine Learning', 3, 4),
	(401, 'Structural Engineering', 4, 3);

INSERT INTO students (id, name, age, department, department_id, cgpa) VALUES
	(1, 'Aarav', 20,'Computer Science', 1, 9.20),
	(2, 'Diya', 21,'Artificial Intelligence and Machine Learning', 1, 8.70),
	(3, 'Kavya', 20, 'Computer Science', 1, 7.90),
	(4, 'Ananya', 22, 'Electronics', 2, 8.40),
	(5, 'Isha', 21, 'Information science', 2, 9.00),
	(6, 'Meera', 20, 'BBA', 3, 7.60),
	(7, 'Rohan', 22, 'Mechanical', 3, 8.10),
	(8, 'Sara', 21, 'Civil', 4, 8.80),
	(9, 'Vikram', 20, 'Robotics', 4, 7.50),
	(10, 'Nisha', 22, 'BCA', 1, 9.60);

SELECT * FROM students;

SELECT name, cgpa
FROM students;

SELECT *
FROM students
WHERE cgpa > 8.0;

-- 2. Aggregate Functions
SELECT COUNT(*) AS student_count FROM students;
SELECT AVG(cgpa) AS average_cgpa FROM students;
SELECT MAX(cgpa) AS highest_cgpa FROM students;
SELECT MIN(cgpa) AS lowest_cgpa FROM students;
SELECT SUM(cgpa) AS total_cgpa FROM students;

--COUNT(*): Counts and returns the total number of rows (student records) present in the table.

--AVG(cgpa): Calculates the average (arithmetic mean) of all CGPA values across the selected students.

--MAX(cgpa): Finds and returns the highest individual CGPA recorded in the dataset.

--MIN(cgpa): Finds and returns the lowest individual CGPA recorded in the dataset.

--SUM(cgpa): Adds all individual CGPA values together to give the grand total sum.

-- 3. GROUP BY Queries
SELECT department, COUNT(*)AS student_count FROM students GROUP BY department;

SELECT department,AVG(cgpa)AS average_cgpa FROM students GROUP BY department;


