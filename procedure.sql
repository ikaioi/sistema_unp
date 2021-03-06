USE [dbCorrentistas]
GO
/****** Object:  StoredProcedure [dbo].[_sp_ListarMovimentacao]    Script Date: 27/05/2019 12:31:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kaio
-- Create date: 27/05/2019
-- Description:	Procedure Listar Movimentação
-- =============================================
ALTER PROCEDURE [dbo].[_sp_ListarMovimentacao] 
	-- Add the parameters for the stored procedure here
	@date_inicial date = "2019.05.27", 
	@date_final date = "2019.05.28", 
	@tipo_movimentacao nvarchar(1) = "D"
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @date_inicial, @date_final, @tipo_movimentacao

	SELECT *  
    FROM dbo.movimentacoes  
    WHERE	cast(DataCriacao as date) >= @date_inicial AND 
			cast(DataCriacao as date) <= @date_final AND 
			TipoMovimentacao = @tipo_movimentacao ; 
END
