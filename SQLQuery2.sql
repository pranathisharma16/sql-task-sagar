
INSERT INTO Student1 (Id, Name, Gender, Department)
VALUES
(1, 'Amit',  'Male',   'Computer Science'),
(2, 'Sagar', 'Male',   'Electronics'),
(3, 'Riya',  'Female', 'Computer Science'),
(4, 'Neha',  'Female', 'Civil'),
(5, 'Karan', 'Male',   'Civil'),
(6, 'Vijay', 'Male', 'Computer Science'),
(7, 'Anita', 'Female', 'Computer Science'),
(8, 'Sonal', 'Female', 'Electronis'),
(9, 'Rahul', 'Male', 'Civil'),
(10, 'Tina', 'Female', 'IT');

select * from Student1;


INSERT INTO Subject (SubjectId, SubjectName)
VALUES
(1,'Physics'),
(2,'Electronics'),
(3,'Data Structures'),
(4,'Programming'),
(5,'Maths');

select * from Subject;


INSERT INTO Semester (Sem)
VALUES
(1),
(2),
(4),
(5),
(6);

select * from Semester;


INSERT INTO Marks (Id, SubjectId, sem, Marks)
VALUES
(1, 1, 1, 74), (2, 2, 5, 68), (3, 2, 6, 82), (4, 1, 2, 90), (5, 3, 2, 76),
(1, 4, 4, 85), (2, 3, 6, 78), (3, 4, 1, 92), (4, 1, 4, 88), (5, 5, 1, 80);

CREATE PROCEDURE GetStudentDETAILS  
AS
BEGIN
    SELECT 
        s.Id,
        s.Name,
        s.Department,
        COUNT(m.Marks) AS TotalSubjects,
        SUM(m.Marks) AS TotalMarks,
        AVG(m.Marks) AS AverageMarks,
        MAX(m.Marks) AS HighestMarks,
        MIN(m.Marks) AS LowestMarks
    FROM Student1 s
    INNER JOIN Marks m 
        ON s.Id = m.Id
    GROUP BY 
        s.Id,
        s.Name,
        s.Department
    ORDER BY 
        s.Id;
END;
EXEC GetStudentDETAILS;
