 CREATE OR ALTER FUNCTION INSTR (@str VARCHAR(8000), @substr VARCHAR(255), @start INT, @occurrence INT)
  RETURNS INT
  AS
  BEGIN
	DECLARE @found INT = @occurrence,
			@pos INT = @start;
 
	WHILE 1=1 
	BEGIN
		-- Find the next occurrence
		SET @pos = CHARINDEX(@substr, @str, @pos);
 
		-- Nothing found
		IF @pos IS NULL OR @pos = 0
			RETURN @pos;
 
		-- The required occurrence found
		IF @found = 1
			BREAK;
 
		-- Prepare to find another one occurrence
		SET @found = @found - 1;
		SET @pos = @pos + 1;
	END
 
	RETURN @pos;
  END
  GO


CREATE OR alter function repetidos (@cadena varchar(100),@subcadena varchar(5))
returns int as

begin
declare @cont int
declare @repe int
set @cont=1
set @repe=0
set @cadena = REPLACE(@cadena,' ','-')
set @subcadena = REPLACE(@subcadena,' ','-')
while @cont <= len(@cadena)
begin
if substring(@cadena,@cont,len(@subcadena))=@subcadena
begin
set @repe=@repe+1
end
set @cont=@cont+1
end
return (@repe)
end

GO

