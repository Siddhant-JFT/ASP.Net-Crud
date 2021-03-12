GO  
  
CREATE procedure [dbo].[spUpdateEmployee]  
(  
@id int,
@Name nvarchar(50),  
@email nvarchar(50),  
@Contact nvarchar(50),  
@Salary nvarchar(50)  
)  
as  
begin  
update dbo.EMPLOYEES set Name=@Name, email=@email,Contact=@Contact,Salary=@Salary where Id=@id;
end