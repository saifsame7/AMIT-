--go 
--use FOE_Db
--go

-- - SELECT with ORDER BY
-- Question: Retrieve the ID, first name, and last name of
--		students, sorted alphabetically by their first names.
SELECT StudentID, FistName, LastName
FROM Students
ORDER BY FistName ASC;


-- Question: Retrieve the ID, name, and credits of subjects, 
--  sorted by credits in descending order.
SELECT SubjectID, SubjectName, Credits
FROM Subjects
ORDER BY Credits DESC;


-- Question: Retrieve the ID, first name, last name, and 
-- department of professors, sorted by department (ascending)
---  and last name (descending).
SELECT PrefessoID, FirstName, LastName, Department
FROM Professor
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
SELECT StudentID, FistName, LastName, BirthDate
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
SELECT PrefessoID, FirstName, LastName, Email
FROM Professor
ORDER BY LEFT(Email, 1) ASC;



-- - EQUI and NON-EQUI JOINS


-- Question: Which students are enrolled in which subjects, 
--   along with their grades?
SELECT Students.StudentID,
		Students.FistName,
		Students.LastName,
		Subjects.SubjectName,
		Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
INNER JOIN Subjects ON Grades.SubjectID = Subjects.SubjectID


-- Question: Which professors teach which subjects?
SELECT Professor.FirstName,
		Professor.LastName,
		Subjects.SubjectName
FROM Professor
INNER JOIN Subjects ON Professor.PrefessoID = Subjects.ProfessorID


-- Question: List all students and their grades where the grade
--    is not 'A'.
SELECT Students.StudentID,
		Students.FistName,
		Students.LastName,
		Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
WHERE Grades.Grade <> 'A'
ORDER BY Students.FistName ASC;


-- Question: List all sections where the capacity is greater 
--   than 30.
SELECT SectionID, SectionName, Capacity
FROM Sections
Where Capacity > 30;



-- - EQUI JOIN Types


-- Question: Which students are enrolled in which subjects, 
--    along with their grades?  
SELECT Students.StudentID, 
       Students.FistName, 
       Students.LastName, 
       Subjects.SubjectName, 
       Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
INNER JOIN Subjects ON Grades.SubjectID = Subjects.SubjectID;


-- Question: Which professors teach which subjects?  
SELECT Professor.PrefessoID, 
       Professor.FirstName, 
       Professor.LastName, 
       Subjects.SubjectName
FROM Professor
INNER JOIN Subjects ON Professor.PrefessoID = Subjects.ProfessorID;



-- Question: List all professors and the subjects they teach,
--   including professors not teaching any subject.  
SELECT p.PrefessoID, 
		p.FirstName, 
		p.LastName,
		s.SubjectName
FROM Professor p 
LEFT JOIN Subjects s ON p.PrefessoID = S.ProfessorID;


-- Question: List all subjects and the professors teaching them,
--    including subjects with no assigned professor.  
--INSERT INTO Subjects (SubjectName, SectionID, Credits)
--VALUES ('Machine Learning', 3, 6);

SELECT  s.SubjectName,
		p.FirstName
FROM Professor p
RIGHT JOIN Subjects s ON p.PrefessoID = s.ProfessorID;

-- Question: Which students share the same birth date?  
SELECT A.StudentID AS Student1_ID,
		A.FistName AS Student1_Name,
		B.StudentID AS Student2_ID,
		B.FistName AS Student2_Name
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
SELECT Professor.PrefessoID,
		Professor.FirstName,
		Professor.LastName,
		Sections.SectionID,
		Sections.SectionName
FROM Professor, Sections;



-- Question: Pair all students with all subjects regardless of
--   enrollment.  
SELECT Students.StudentID,
		Students.FistName AS StudentName,
		Subjects.SubjectID,
		Subjects.SubjectName
FROM Students, Subjects;


-- Table Alias
-- Question 1: What are the names of students and the sections they are in, using aliases for both tables?

select s.FistName,s.LastName,se.SectionName
from STUDENTS s
inner join Grades g on s.StudentID=g.StudentID
inner join Subjects su on g.SubjectID=su.SubjectID
inner join sections se on su.SectionID=se.SectionID;


-- Question 2: What are the details of subjects taught by professors, using aliases for better readability?
select s.SubjectID,s.SubjectName,s.Credits,p.FirstName,p.LastName
from subjects s
inner join professor p on p.PrefessoID=s.ProfessorID 

-- Question 3: What are the grades of students in specific subjects, with aliases used to clarify tables?
select g.Grade,s.FistName,s.LastName , su.SubjectName
from Grades g
inner join STUDENTS s on s.StudentID=g.StudentID
inner join Subjects su on g.SubjectID=su.SubjectID


-- LEFT JOIN, RIGHT JOIN, and FULL JOIN 

-- Question 1: Which students have a section assigned, and which don't?
select su.FistName,su.LastName ,se.SectionName
from STUDENTS su
left join grades g on g.StudentID=su.StudentID
left join Subjects s on s.SubjectID=g.SubjectID
left join sections se on s.SectionID=se.SectionID

-- Question 2: What are the grades of all students, including those who don't have grades assigned?
select g.Grade , s.FistName,s.LastName
from STUDENTS s
left join Grades g  on s.StudentID=g.StudentID


-- Question 3: What subjects are assigned to a professor, including subjects that aren't assigned to anyone?
select su.SubjectName ,p.FirstName,p.LastName
from subjects su
left join professor p on p.PrefessoID=su.ProfessorID 


-- Question 1: Which professors have sections assigned, and which sections do not have a professor?
select p.FirstName,p.LastName,se.SectionName
from professor p 
left join Subjects su on su.ProfessorID=p.PrefessoID
left join sections se on se.SectionID=su.SectionID


-- Question 2: What grades are assigned for each subject, including subjects without grades?
select su.SubjectName,g.Grade
from Subjects su 
left join grades g on g.SubjectID=su.SubjectID


-- Question 3: Which sections have students assigned, and which sections do not have students?
select se.SectionName,s.FistName,s.LastName
from sections se
left join subjects su on su.SectionID=se.SectionID
left join grades g on g.SubjectID=su.SubjectID
left join STUDENTS s on s.StudentID=g.StudentID

-- Question 1: Which students and professors are associated with sections, and which are not?
select s.FistName,s.LastName ,se.SectionName
from  students s 
left join grades g on g.StudentID=s.StudentID
left join Subjects su on su.SubjectID=g.SubjectID
left join sections se on se.SectionID=su.SectionID
union all 
select p.FirstName , p.LastName,se.sectionname
from professor p 
left join Subjects su on su.ProfessorID=p.PrefessoID
left join sections se on se.SectionID=su.SectionID



-- Question 2: What are the grades and subjects, including subjects or grades that are unmatched?

select g.Grade , su.SubjectName
from grades g
full outer join Subjects su on su.SubjectID=g.SubjectID

-- Question 3: Which students and sections are related, and which are not, in the overall assignment of sections?
select s.FistName,s.LastName,se.SectionName
from students s
full outer join grades g on g.StudentID=s.StudentID
full outer join subjects su on su.SubjectID=g.SubjectID
full outer join sections se on se.SectionID=su.SectionID

-- Sub-Query (Nested Query) with WHERE, HAVING and FROM (Inline View) clauses 

-- Question: Which students are in sections with a capacity greater than 30?
select s.FistName,s.LastName,se.SectionName
from students s
inner join grades g on g.StudentID=s.StudentID
inner join Subjects su on su.SubjectID=g.SubjectID
inner join sections se on se.SectionID=su.SectionID
where se.Capacity>30
														
-- Question: Which subjects have an average grade of 'A' across all students?
--*******


-- Question: What is the average grade count for each section?
--*****


-- UNION and UNION ALL

-- Question: Retrieve a list of all unique student names and professor names in the faculty.
select DISTINCT p.FirstName,p.LastName 
from professor p 
union 
select DISTINCT s.FistName,s.LastName
from students s 

-- Question: Retrieve a list of all student names and professor names, including duplicates.
select p.FirstName,p.LastName 
from professor p 
union all
select s.FistName,s.LastName
from students s 

-- Aggregate Functions (COUNT , SUM , MAX, MIN and AVG)

-- Question: How many students are there in the Students table?
select count(*)
from STUDENTS
-- Question: How many sections exist in the Sections table?
select count(*)
from sections
-- Question: How many grades are recorded in the Grades table?
select count(*)
from grades
-- Question: What is the total capacity of all sections combined?
select sum(Capacity)
from sections
-- Question: What is the total number of credits for all subjects?
select sum(credits)
from Subjects
-- Question: What is the total number of seats occupied (calculated as Grades recorded)?
select sum(credits)
from Subjects
-- Question: What is the highest capacity of any section?
select count(*)
from Grades
-- Question: What is the maximum number of credits offered by any subject?
select max(credits)
from Subjects
-- Question: What is the most recent birth year among students?
select max(birthdate)
from STUDENTS
-- Question: What is the smallest section capacity?
select min(capacity)
from sections
-- Question: What is the earliest birth year among students?
select min(birthdate)
from students
-- Question: What is the smallest number of credits assigned to any subject?
select min(credits)
from Subjects

-- Question: What is the average capacity of all sections?
select avg(capacity)
from sections
-- Question: What is the average number of credits across all subjects?
select avg(credits)
from Subjects
-- Question: What is the average age of students (assuming 'BirthDate' can be used for calculations)?
select AVG(DATEDIFF(year,BirthDate,'2024'))
from students 
-- Question: What is the average length of first names of professors?
select AVG(LEN(FirstName))
from professor 
-- Question: What is the rounded average capacity of all sections to the nearest whole number?
select ROUND(avg(Capacity),0)
from sections 
-- Question: What is the ceiling value of the average number of credits across all subjects?
select ceiling(avg(credits))
from Subjects
-- GROUP BY with and without HAVING clause

-- Question: What is the total capacity for each section?
insert into sections 
values
('Section A',20)
select sectionname,sum(Capacity)
from sections
group by (SectionName)

-- Question: What is the average number of credits for each department offering subjects?
SELECT d.depa_name, AVG(s.credits) AS avg_credits
FROM subjects s
JOIN departement d ON s.dno = d.depa_nom 
GROUP BY d.depa_name;

-- Question: What is the total capacity for sections where the total capacity exceeds 50?
select s.SectionName
from sections s
group by s.SectionName
having sum(s.Capacity)>50


-- Question: Which departments have an average number of credits greater than 3 for their subjects?
select d.depa_name
from departement d
inner join subjects s on s.dno=d.depa_nom
group by d.depa_name
having avg(s.Credits)>3



-- Question: Which departments have more than 3 subjects?
select depa_name
from departement d
inner join Subjects s on s.dno=d.depa_nom
group by depa_name
having count(*)>3 

-- Question: What is the maximum capacity of sections grouped by section name where the maximum capacity is greater than 50?
select max(s.capacity)
from sections s
group by s.SectionName
having max(s.Capacity)>50

-- Question: Which subjects have a minimum grade below 'B' in their grades?
select s.SubjectName
from subjects s
inner join grades g on g.SubjectID=s.SubjectID
group by s.SubjectName
having min(g.Grade)<'B'



-- Question: What is the total credits for each department where the total credits exceed 10?
select sum(s.Credits)
from subjects s
group by s.dno
having sum(Credits)>10





-- Question: Which sections have an average capacity above 40?
select s.SectionName
from sections s
group by s.SectionName
having avg(s.Capacity)>40

-- Question: Count distinct grades per subject where the count is greater than 2.
select count(DISTINCT g.Grade) 
from grades g 
inner join Subjects s on s.SubjectID=g.SubjectID
group by s.SubjectName
having count(DISTINCT g.Grade) >=2









