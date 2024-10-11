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
CREATE PROCEDURE Act_Fac
	-- Add the parameters for the stored procedure here
	@Fac_Id int, @Fac_Total money, @Fac_Fecha smalldatetime, @Fac_VenId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Facturas set Fac_Total = @Fac_Total, Fac_Fecha = @Fac_Fecha, Fac_VenId = @Fac_VenId
	where Fac_Id = @Fac_Id; 
END
GO
