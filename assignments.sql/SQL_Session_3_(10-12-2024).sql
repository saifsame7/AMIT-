-- - SELECT with ORDER BY
-- Question: Retrieve the ID, first name, and last name of
--		students, sorted alphabetically by their first names.
SELECT StudentID, FirstName, LastName
FROM Students
ORDER BY FirstName ASC;


-- Question: Retrieve the ID, name, and credits of subjects, 
--  sorted by credits in descending order.
SELECT SubjectID, SubjectName, Credits
FROM Subjects
ORDER BY Credits DESC;


-- Question: Retrieve the ID, first name, last name, and 
-- department of professors, sorted by department (ascending)
---  and last name (descending).
SELECT ProfessorID, FirstName, LastName, Department
FROM Professors
ORDER BY Department ASC, LastName DESC, FirstName ASC;


-- Question: Retrieve the ID, name, and adjusted credits 
--  (credits + 2) of subjects, sorted by adjusted credits 
--   in descending order.
SELECT SubjectID, SubjectName, Credits + 2 AS Adjested_Credits
FROM Subjects
ORDER BY Adjested_Credits DESC;


-- Question: Retrieve the ID, first name, last name, and 
--   birthdate of students, sorted by birthdate 
--    in ascending order.
SELECT StudentID, FirstName, LastName, BirthDate
FROM Students
ORDER BY BirthDate ASC;


-- Question: Retrieve the ID, student ID, subject ID, 
--   and grade from grades, sorted by grade (ascending) 
--     and subject ID (descending).
SELECT *
FROM Grades
ORDER BY Grade ASC, SubjectID DESC;


-- Question: Retrieve the ID, name, and remaining capacity 
--    (capacity - 10) of sections, sorted by remaining 
--      capacity in descending order.
SELECT SectionID, SectionName, Capacity - 10 AS Rem_Cap
FROM Sections
ORDER BY Rem_Cap DESC;




-- Question: Retrieve the ID, first name, last name, 
--   and email of professors, sorted by the first character
--     of their email in ascending order.
SELECT ProfessorID, FirstName, LastName, Email
FROM Professors
ORDER BY LEFT(Email, 1) ASC;



-- - EQUI and NON-EQUI JOINS


-- Question: Which students are enrolled in which subjects, 
--   along with their grades?
SELECT Students.StudentID,
		Students.FirstName,
		Students.LastName,
		Subjects.SubjectName,
		Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
INNER JOIN Subjects ON Grades.SubjectID = Subjects.SubjectID


-- Question: Which professors teach which subjects?
SELECT Professors.FirstName,
		Professors.LastName,
		Subjects.SubjectName
FROM Professors
INNER JOIN Subjects ON Professors.ProfessorID = Subjects.ProfessorID


-- Question: List all students and their grades where the grade
--    is not 'A'.
SELECT Students.StudentID,
		Students.FirstName,
		Students.LastName,
		Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
WHERE Grades.Grade <> 'A'
ORDER BY Students.FirstName ASC;


-- Question: List all sections where the capacity is greater 
--   than 30.
SELECT SectionID, SectionName, Capacity
FROM Sections
Where Capacity > 30;



-- - EQUI JOIN Types


-- Question: Which students are enrolled in which subjects, 
--    along with their grades?  
SELECT Students.StudentID, 
       Students.FirstName, 
       Students.LastName, 
       Subjects.SubjectName, 
       Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
INNER JOIN Subjects ON Grades.SubjectID = Subjects.SubjectID;


-- Question: Which professors teach which subjects?  
SELECT Professors.ProfessorID, 
       Professors.FirstName, 
       Professors.LastName, 
       Subjects.SubjectName
FROM Professors
INNER JOIN Subjects ON Professors.ProfessorID = Subjects.ProfessorID;



-- Question: List all professors and the subjects they teach,
--   including professors not teaching any subject.  
SELECT p.ProfessorID, 
		p.FirstName, 
		p.LastName,
		s.SubjectName
FROM Professors p 
LEFT JOIN Subjects s ON p.ProfessorID = S.ProfessorID;


-- Question: List all subjects and the professors teaching them,
--    including subjects with no assigned professor.  
--INSERT INTO Subjects (SubjectName, SectionID, Credits)
--VALUES ('Machine Learning', 3, 6);

SELECT  s.SubjectName,
		p.FirstName
FROM Professors p
RIGHT JOIN Subjects s ON p.ProfessorID = s.ProfessorID;

-- Question: Which students share the same birth date?  
SELECT A.StudentID AS Student1_ID,
		A.FirstName AS Student1_Name,
		B.StudentID AS Student2_ID,
		B.FirstName AS Student2_Name
FROM Students A
INNER JOIN Students B
ON A.BirthDate = B.BirthDate AND A.StudentID <> B.StudentID;


-- Question: Which sections have the same capacity?  
SELECT A.SectionName AS Section1_name,
		A.Capacity AS Section1_Capacity,
		B.SectionName AS Section2_name,
		B.Capacity AS Section2_Capacity
FROM Sections A
INNER JOIN Sections B
ON A.Capacity = B.Capacity AND A.SectionID <> B.SectionID;


-- Question: Pair all professors with all sections regardless
--    of assignment.  
SELECT Professors.ProfessorID,
		Professors.FirstName,
		Professors.LastName,
		Sections.SectionID,
		Sections.SectionName
FROM Professors, Sections;



-- Question: Pair all students with all subjects regardless of
--   enrollment.  
SELECT Students.StudentID,
		Students.FirstName AS StudentName,
		Subjects.SubjectID,
		Subjects.SubjectName
FROM Students, Subjects;


-- Table Alias
-- Question 1: What are the names of students and the sections they are in, using aliases for both tables?









-- Question 2: What are the details of subjects taught by professors, using aliases for better readability?









-- Question 3: What are the grades of students in specific subjects, with aliases used to clarify tables?








-- LEFT JOIN, RIGHT JOIN, and FULL JOIN 

-- Question 1: Which students have a section assigned, and which don't?









-- Question 2: What are the grades of all students, including those who don't have grades assigned?










-- Question 3: What subjects are assigned to a professor, including subjects that aren't assigned to anyone?










-- Question 1: Which professors have sections assigned, and which sections do not have a professor?









-- Question 2: What grades are assigned for each subject, including subjects without grades?









-- Question 3: Which sections have students assigned, and which sections do not have students?











-- Question 1: Which students and professors are associated with sections, and which are not?











-- Question 2: What are the grades and subjects, including subjects or grades that are unmatched?









-- Question 3: Which students and sections are related, and which are not, in the overall assignment of sections?








-- Sub-Query (Nested Query) with WHERE, HAVING and FROM (Inline View) clauses 

-- Question: Which students are in sections with a capacity greater than 30?











-- Question: Which subjects have an average grade of 'A' across all students?














-- Question: What is the average grade count for each section?










-- UNION and UNION ALL

-- Question: Retrieve a list of all unique student names and professor names in the faculty.











-- Question: Retrieve a list of all student names and professor names, including duplicates.












-- Aggregate Functions (COUNT , SUM , MAX, MIN and AVG)

-- Question: How many students are there in the Students table?



-- Question: How many sections exist in the Sections table?



-- Question: How many grades are recorded in the Grades table?




-- Question: What is the total capacity of all sections combined?



-- Question: What is the total number of credits for all subjects?



-- Question: What is the total number of seats occupied (calculated as Grades recorded)?




-- Question: What is the highest capacity of any section?



-- Question: What is the maximum number of credits offered by any subject?



-- Question: What is the most recent birth year among students?




-- Question: What is the smallest section capacity?



-- Question: What is the earliest birth year among students?



-- Question: What is the smallest number of credits assigned to any subject?




-- Question: What is the average capacity of all sections?



-- Question: What is the average number of credits across all subjects?



-- Question: What is the average age of students (assuming 'BirthDate' can be used for calculations)?




-- Question: What is the average length of first names of professors?




-- Question: What is the rounded average capacity of all sections to the nearest whole number?




-- Question: What is the ceiling value of the average number of credits across all subjects?



-- GROUP BY with and without HAVING clause

-- Question: What is the total capacity for each section?




-- Question: What is the average number of credits for each department offering subjects?





-- Question: What is the total capacity for sections where the total capacity exceeds 50?





-- Question: Which departments have an average number of credits greater than 3 for their subjects?







-- Question: Which departments have more than 3 subjects?






-- Question: What is the maximum capacity of sections grouped by section name where the maximum capacity is greater than 50?







-- Question: Which subjects have a minimum grade below 'B' in their grades?






-- Question: What is the total credits for each department where the total credits exceed 10?






-- Question: Which sections have an average capacity above 40?






-- Question: Count distinct grades per subject where the count is greater than 2.










