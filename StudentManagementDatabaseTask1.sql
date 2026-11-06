-- TASK 1: Student Management Database
-- 1) Create Database
create database if not exists StudentManagement;
use StudentManagement;

-- 2) Create Students Table
create table Students (
	StudentID int primary key auto_increment,
    Name varchar(50) not null,
    Gender char(1),
    Age int,
    Grade varchar(5),
    MathScore int,
    ScienceScore int,
    EnglishScore int
);

-- 3) Insert at least 10 records
insert into Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) values
('Arun Kumar', 'M', 18, 'A', 92, 85, 78),
('Priya Sharma', 'F', 17, 'A', 88, 91, 95),
('Rahul Verma', 'M', 18, 'B', 75, 68, 72),
('Sneha Patel', 'F', 17, 'A', 95, 89, 92),
('Vikram Singh', 'M', 19, 'C', 55, 62, 58),
('Ananya Reddy', 'F', 18, 'B', 78, 82, 80),
('Karthik Nair', 'M', 17, 'A', 90, 87, 85),
('Divya Iyer', 'F', 18, 'B', 70, 75, 68),
('Suresh Rajan', 'M', 19, 'C', 48, 55, 52),
('Meera Krishnan', 'F', 17, 'A', 85, 90, 88),
('Ajay Menon', 'M', 18, 'B', 65, 70, 72),
('Lakshmi Devi', 'F', 18, 'A', 93, 88, 91);

-- 4) Required Queries
-- Query 1: Show all student details
select * from Students;
-- Query 2: Average score in each subject
select
	round(avg(MathScore), 2) as Avg_Math,
    round(avg(ScienceScore), 2) as Avg_Science,
    round(avg(EnglishScore), 2) as Avg_English
from Students;
-- Query 3: Top performer (highest total score)
select
	Name,
    MathScore + ScienceScore + EnglishScore as Total_Score
from Students
order by Total_Score desc
limit 1;
-- Query 4: Count students per grade
select
	Grade,
    count(*) as Number_of_Students
from Students
group by Grade
order by Grade;
-- Query 5: Average score by gender
select
	Gender,
    round(avg(MathScore), 2) as Avg_Math,
    round(avg(ScienceScore), 2) as Avg_Science,
    round(avg(EnglishScore), 2) as Avg_English,
    round(avg(MathScore + ScienceScore + EnglishScore), 2) as Avg_Total
from Students
group by Gender;
-- Query 6: Students with Math > 80
select
	Name,
    MathScore,
    Grade
from Students
where MathScore > 80
order by MathScore desc;
-- Query 7: Update a student's grade
-- Example: Update Rahul Verma's grade from B to A
update Students
set Grade = 'A'
where StudentID = 3;
-- Verify the update
select StudentID, Name, Grade
from Students
where StudentID = 3;
