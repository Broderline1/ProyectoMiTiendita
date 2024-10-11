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
CREATE PROCEDURE Act_Usu
	-- Add the parameters for the stored procedure here
		@Usu_Id int, @Usu_Nombre nvarchar(100), @Usu_Email nvarchar(100), @Usu_Contraseña nvarchar(100), @Usu_Rol nvarchar(20), @Usu_SucId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Usuarios set Usu_Nombre = @Usu_Nombre, Usu_Email = @Usu_Email, Usu_Contraseña = @Usu_Contraseña, Usu_Rol = @Usu_Rol, Usu_SucId = @Usu_SucId 
	Where Usu_Id = @Usu_Id;
END
GO
