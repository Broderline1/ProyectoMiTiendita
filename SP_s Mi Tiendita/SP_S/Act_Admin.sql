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
CREATE PROCEDURE Act_Admin	-- Add the parameters for the stored procedure here
	@Adm_Id int, @Adm_Nombre nvarchar(100), @Adm_Contraseña nvarchar(100), @Adm_UsuId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Administrador set Adm_Nombre = @Adm_Nombre, Adm_Contraseña = @Adm_Contraseña, Adm_UsuId = @Adm_UsuId
	WHERE Adm_Id = @Adm_Id;
END
GO
