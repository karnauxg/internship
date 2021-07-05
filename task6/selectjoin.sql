SELECT st.StudentID, st.Student, res.Task1, res.Task2, res.Task3, res.Task4
FROM Result as res JOIN Students as st ON res.StudentID=st.StudentID
WHERE st.Student LIKE "%Войтух%"