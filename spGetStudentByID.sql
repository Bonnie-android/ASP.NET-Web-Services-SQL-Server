/**  create a test table and fill it with students
create table dbo.tblStudents
(
  StudentID int primary key identity,
  StudentName varchar(20),
  StudentGrade varchar(20),
  StudentTotalMarks int
)
*****/

/*** create a stored procedure called spGetStudentList which returns a the list of students via ADO to a webservice ***/
create procedure spGetStudentByID
@ID int
AS
BEGIN
   SELECT * FROM dbo.tblStudents
   WHERE StudentID = @ID
END



spGetStudentByID 10