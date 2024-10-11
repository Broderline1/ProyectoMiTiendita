-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Ins_Cli
	-- Add the parameters for the stored procedure here
	@Cli_Id int, @Cli_Nombre nvarchar(100), @Cli_Apellidos nvarchar(100), @Cli_Telefono nvarchar(15), @Cli_Email nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Clientes values (@Cli_Id, @Cli_Nombre, @Cli_Apellidos, @Cli_Telefono, @Cli_Email);
END
GO
