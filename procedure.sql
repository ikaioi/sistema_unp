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
-- Author:		Kaio
-- Create date: 27/05/2019
-- Description:	Procedure Listar Movimentação
-- =============================================
CREATE PROCEDURE _sp_ListarMovimentacao 
	-- Add the parameters for the stored procedure here
	@date_inicial date = "2019-05-26", 
	@date_final date = "2019-05-28", 
	@tipo_movimentacao nvarchar(1) = "D"
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @date_inicial, @date_final, @tipo_movimentacao

	SELECT *  
    FROM dbo.movimentacao  
    WHERE	DataCriacao >= @date_inicial AND 
			DataCriacao <= @date_final AND 
			TipoMovimentacao = @tipo_movimentacao ; 
END
GO
