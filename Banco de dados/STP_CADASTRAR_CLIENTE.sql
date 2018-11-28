USE[crud-webforms]
GO
-- =============================================
-- Author:		Marivaldo Almeida
-- Create date: 28/11/2018
-- Description:	Procedure para cadastrar novo cliente
-- =============================================
CREATE PROCEDURE STP_CADASTRAR_CLIENTE
(
	@prmNome		varchar(100),
	@prmEmail		varchar(50),
	@prmCPF			varchar(200),
	@prmTelefone	varchar(20),
	@prmCEP 		varchar(12),
	@prmEstado 		varchar(50),
	@prmCidade 		varchar(50),
	@prmBairro 		varchar(50),
	@prmEndereco	varchar(50)
)
AS
BEGIN
	IF EXISTS (SELECT id FROM tab_cliente WHERE email = @prmEmail)
	BEGIN	
		RAISERROR('Já existe um cliente cadastrado com este email.', 16, 1)
		RETURN -1
	END
	IF EXISTS (SELECT id FROM tab_cliente WHERE cpf = @prmCPF)
	BEGIN	
		RAISERROR('Já existe um cliente cadastrado com este cpf.', 16, 1)
		RETURN -1
	END
		INSERT INTO tab_cliente
	(
		nome,
		email,
		cpf,
		telefone,
		cep,
		estado,
		cidade,
		bairro,
		endereco
	)
	VALUES
	( 
		@prmNome,	
		@prmEmail,	
		@prmCPF,	
		@prmTelefone,
		@prmCEP,	
		@prmEstado, 	
		@prmCidade, 	
		@prmBairro, 	
		@prmEndereco
	)

	select scope_identity()
END
GO
