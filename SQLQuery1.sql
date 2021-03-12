CREATE procedure [dbo].[spGetEmployee] (@id int) 
as  
begin  
select * from dbo.Employees Where ID= @id 
end