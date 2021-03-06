USE [crud-webforms]
GO

CREATE TABLE [dbo].[tab_cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[cpf] [varchar](20) NULL,
	[telefone] [varchar](20) NULL,
	[cep] [varchar](12) NULL,
	[estado] [varchar](50) NULL,
	[cidade] [varchar](50) NULL,
	[bairro] [varchar](50) NULL,
	[endereco] [varchar](50) NULL,
 CONSTRAINT [PK_tab_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tab_recibo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NOT NULL,
	[servico_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
 CONSTRAINT [PK_tab_recibo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tab_servico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
	[valor] [decimal](10, 2) NULL,
 CONSTRAINT [PK_tab_servico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tab_recibo]  WITH CHECK ADD  CONSTRAINT [FK_tab_recibo_tab_cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[tab_cliente] ([id])
GO
ALTER TABLE [dbo].[tab_recibo] CHECK CONSTRAINT [FK_tab_recibo_tab_cliente]
GO
ALTER TABLE [dbo].[tab_recibo]  WITH CHECK ADD  CONSTRAINT [FK_tab_recibo_tab_servico] FOREIGN KEY([servico_id])
REFERENCES [dbo].[tab_servico] ([id])
GO
ALTER TABLE [dbo].[tab_recibo] CHECK CONSTRAINT [FK_tab_recibo_tab_servico]
GO
