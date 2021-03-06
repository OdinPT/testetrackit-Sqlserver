USE [master]
GO
/****** Object:  Database [TRAKTICKETSYS]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE DATABASE [TRAKTICKETSYS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRAKTICKETSYS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLNOTEWINDOWS10\MSSQL\DATA\TRAKTICKETSYS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRAKTICKETSYS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLNOTEWINDOWS10\MSSQL\DATA\TRAKTICKETSYS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TRAKTICKETSYS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRAKTICKETSYS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRAKTICKETSYS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TRAKTICKETSYS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRAKTICKETSYS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRAKTICKETSYS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRAKTICKETSYS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRAKTICKETSYS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TRAKTICKETSYS] SET  MULTI_USER 
GO
ALTER DATABASE [TRAKTICKETSYS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRAKTICKETSYS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRAKTICKETSYS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRAKTICKETSYS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRAKTICKETSYS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRAKTICKETSYS] SET QUERY_STORE = OFF
GO
USE [TRAKTICKETSYS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TRAKTICKETSYS]
GO
/****** Object:  Schema [emails]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE SCHEMA [emails]
GO
/****** Object:  Schema [m2ss]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  UserDefinedFunction [emails].[MostraIdDepartamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[MostraIdDepartamento] 
( 
   @_Nome nvarchar(40)
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp int

      SELECT @temp = funcionario.id_departamento_funcionarios
      FROM emails.funcionario
      WHERE funcionario.username = @_Nome

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[MostraIdDepartamento_id]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[MostraIdDepartamento_id] 
( 
   @_id int
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp int

      SELECT @temp = funcionario.id_departamento_funcionarios
      FROM emails.funcionario
      WHERE funcionario.id_funcionario = @_id

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[MudaEstado]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE FUNCTION [emails].[MudaEstado] 
( 
   @_estado int
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @a int

      IF (@_estado = 1)
         SET @a = 2
      ELSE 
         IF (@_estado = 2)
            SET @a = 4
         ELSE 
            IF (@_estado = 4)
               SET @a = 5
            ELSE 
               IF (@_estado = 5)
                  SET @a = 6
               ELSE 
                  BEGIN
                     IF (@_estado = 6)
                        SET @a = 5
                  END

      RETURN @a

   END
GO
/****** Object:  UserDefinedFunction [emails].[MudaGrupoTicket]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[MudaGrupoTicket] 
( 
   @_id_grupo int
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @a int

      IF (@_id_grupo = 1)
         SET @a = 2
      ELSE 
         IF (@_id_grupo = 2)
            SET @a = 1
         ELSE 
            SET @a = 2

      RETURN @a

   END
GO
/****** Object:  UserDefinedFunction [emails].[RetornaId]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[RetornaId] 
( 
   @_email nvarchar(300)
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp int

      SELECT @temp = emails.id
      FROM emails.emails
      WHERE emails.email LIKE @_email

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[retornaIdMail]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE FUNCTION [emails].[retornaIdMail] 
( 
   @mail nvarchar(200)
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp int

      SELECT @temp = funcionario.id_funcionario
      FROM emails.funcionario
      WHERE funcionario.username LIKE @mail

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[RetornaMail]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[RetornaMail] 
( 
   @id int
)
/*
*   SSMA informational messages:
*   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
*/

RETURNS varchar(100)
AS 
   BEGIN

      DECLARE
         @temp nvarchar(200)

      SELECT @temp = funcionario.username
      FROM emails.funcionario
      WHERE funcionario.id_funcionario = @id

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[VerificaEmail]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[VerificaEmail] 
( 
   @_email nvarchar(max)
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp bit

      SET @temp = 0

      SELECT @temp = 
         CASE 
            WHEN EXISTS 
               (
                  SELECT emails.email
                  FROM emails.emails
                  WHERE emails.email LIKE @_email
               ) THEN 1
            ELSE 0
         END

      RETURN @temp

   END
GO
/****** Object:  UserDefinedFunction [emails].[VerificaSubject]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE FUNCTION [emails].[VerificaSubject] 
( 
   @_subject nvarchar(max)
)
RETURNS int
AS 
   BEGIN

      DECLARE
         @temp bit

      SET @temp = 0

      SELECT @temp = 
         CASE 
            WHEN EXISTS 
               (
                  SELECT emails.subject
                  FROM emails.emails
                  WHERE emails.subject LIKE @_subject
               ) THEN 1
            ELSE 0
         END

      RETURN @temp

   END
GO
/****** Object:  Table [emails].[comentarios]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[comentarios](
	[ID_Comentario] [int] IDENTITY(7,1) NOT NULL,
	[ID_Ticket] [int] NOT NULL,
	[Data_comentario] [datetime2](0) NOT NULL,
	[Comentario] [varchar](700) NOT NULL,
	[ID_Utilizador] [int] NOT NULL,
 CONSTRAINT [PK_comentarios_ID_Comentario] PRIMARY KEY CLUSTERED 
(
	[ID_Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[departamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[departamento](
	[id_departamento] [int] IDENTITY(9,1) NOT NULL,
	[nome_departamento] [varchar](255) NOT NULL,
 CONSTRAINT [PK_departamento_id_departamento] PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[emails]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[emails](
	[id] [int] IDENTITY(18,1) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[fromaddress] [nvarchar](230) NOT NULL,
	[subject] [nvarchar](250) NOT NULL,
	[datea] [datetime] NULL,
	[body] [varchar](700) NOT NULL,
	[state] [int] NOT NULL,
	[id_departamento_emails] [int] NULL,
	[id_grupo_emails] [int] NOT NULL,
	[id_func_emails] [nvarchar](100) NULL,
	[id_Res_Ticket] [int] NOT NULL,
 CONSTRAINT [PK_emails_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [emails$emails] UNIQUE NONCLUSTERED 
(
	[body] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[estado]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[estado](
	[ID_Estado] [int] IDENTITY(7,1) NOT NULL,
	[Descricao_Estado] [varchar](11) NOT NULL,
 CONSTRAINT [PK_estado_ID_Estado] PRIMARY KEY CLUSTERED 
(
	[ID_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[funcionario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[funcionario](
	[id_funcionario] [int] IDENTITY(61,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[pass] [varchar](100) NOT NULL,
	[id_departamento_funcionarios] [int] NULL,
	[Tipo_Funcionario] [int] NULL,
 CONSTRAINT [PK_funcionario_id_funcionario] PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[grupo]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[grupo](
	[id_grupo] [int] IDENTITY(3,1) NOT NULL,
	[nome_grupo] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_grupo_id_grupo] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[historicoatribuicao]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[historicoatribuicao](
	[ID_Atribuicao] [int] IDENTITY(5,1) NOT NULL,
	[ID_Func_Atribuidor] [int] NULL,
	[DataAtribuicao] [datetime2](0) NULL,
	[ID_DepAtribuicao] [int] NULL,
	[ID_Func_Atribuido] [int] NULL,
	[ID_Ticket_atribuicao] [int] NULL,
 CONSTRAINT [PK_historicoatribuicao_ID_Atribuicao] PRIMARY KEY CLUSTERED 
(
	[ID_Atribuicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[historicodepartamentos]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[historicodepartamentos](
	[idHistoricoDep] [int] IDENTITY(1,1) NOT NULL,
	[IdTicketDep] [int] NULL,
	[HoraAtribuicaoDep] [datetime2](0) NULL,
	[IDDepartamentoDep] [int] NULL,
	[IDFuncEstado] [int] NULL,
 CONSTRAINT [PK_historicodepartamentos_idHistoricoDep] PRIMARY KEY CLUSTERED 
(
	[idHistoricoDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[historicoestados]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[historicoestados](
	[idHistoricoEstados] [int] IDENTITY(42,1) NOT NULL,
	[HoraAtribuicaoEstado] [datetime2](0) NULL,
	[IdTicketEstado] [int] NULL,
	[IDEstadoEstado] [int] NULL,
	[IDFuncEstado] [int] NULL,
	[IdResTicket] [int] NULL,
 CONSTRAINT [PK_historicoestados_idHistoricoEstados] PRIMARY KEY CLUSTERED 
(
	[idHistoricoEstados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[respostas]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[respostas](
	[id_resp] [int] IDENTITY(5,1) NOT NULL,
	[subject_resp] [varchar](150) NOT NULL,
	[body_resp] [nvarchar](700) NOT NULL,
	[datea_resp] [datetime2](0) NULL,
	[id_email] [int] NOT NULL,
 CONSTRAINT [PK_respostas_id_resp] PRIMARY KEY CLUSTERED 
(
	[id_resp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[tipo_resolucao]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[tipo_resolucao](
	[IdTipoRes] [int] IDENTITY(7,1) NOT NULL,
	[DesTipoRes] [varchar](230) NOT NULL,
 CONSTRAINT [PK_tipo_resolucao_IdTipoRes] PRIMARY KEY CLUSTERED 
(
	[IdTipoRes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[tipoutilizador]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[tipoutilizador](
	[ID_TipoUtilizador] [int] IDENTITY(5,1) NOT NULL,
	[Descricao_TipoUtilizador] [varchar](26) NOT NULL,
 CONSTRAINT [PK_tipoutilizador_ID_TipoUtilizador] PRIMARY KEY CLUSTERED 
(
	[ID_TipoUtilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emails].[upload]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emails].[upload](
	[id] [int] IDENTITY(7,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[content] [varbinary](max) NULL,
	[id_ticket] [int] NULL,
	[localizacao] [varchar](200) NULL,
 CONSTRAINT [PK_upload_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [comentarios_FK_ticket]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [comentarios_FK_ticket] ON [emails].[comentarios]
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [funcionarios_FK_comentarios]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [funcionarios_FK_comentarios] ON [emails].[comentarios]
(
	[ID_Utilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Ticket]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [ID_Ticket] ON [emails].[comentarios]
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Ticket_2]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [ID_Ticket_2] ON [emails].[comentarios]
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Ticket_3]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [ID_Ticket_3] ON [emails].[comentarios]
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID_Ticket_4]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [ID_Ticket_4] ON [emails].[comentarios]
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [emails_FK_Departamento]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [emails_FK_Departamento] ON [emails].[emails]
(
	[id_departamento_emails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [emails_FK_estados]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [emails_FK_estados] ON [emails].[emails]
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [emails_FK_grupos]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [emails_FK_grupos] ON [emails].[emails]
(
	[id_grupo_emails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [emails_fk_tipoResolucao]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [emails_fk_tipoResolucao] ON [emails].[emails]
(
	[id_Res_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [id_Res_Ticket]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [id_Res_Ticket] ON [emails].[emails]
(
	[id_Res_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [funcionario_fk_TP]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [funcionario_fk_TP] ON [emails].[funcionario]
(
	[Tipo_Funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [funcionarios_fk_departamentos]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [funcionarios_fk_departamentos] ON [emails].[funcionario]
(
	[id_departamento_funcionarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [historicoAtribuicao_Dep]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [historicoAtribuicao_Dep] ON [emails].[historicoatribuicao]
(
	[ID_DepAtribuicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [historicoatribuicao_FK_funcionarioAtribuido]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [historicoatribuicao_FK_funcionarioAtribuido] ON [emails].[historicoatribuicao]
(
	[ID_Func_Atribuido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [historicoatribuicao_FK_funcionarios]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [historicoatribuicao_FK_funcionarios] ON [emails].[historicoatribuicao]
(
	[ID_Func_Atribuidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [historicoatribuicao_fk_ticket]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [historicoatribuicao_fk_ticket] ON [emails].[historicoatribuicao]
(
	[ID_Ticket_atribuicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDEstadoEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IDEstadoEstado_idx] ON [emails].[historicodepartamentos]
(
	[IDDepartamentoDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDFuncEstado]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IDFuncEstado] ON [emails].[historicodepartamentos]
(
	[IDFuncEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDFuncEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IDFuncEstado_idx] ON [emails].[historicodepartamentos]
(
	[IDFuncEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTicketEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IdTicketEstado_idx] ON [emails].[historicodepartamentos]
(
	[IdTicketDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDEstadoEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IDEstadoEstado_idx] ON [emails].[historicoestados]
(
	[IDEstadoEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDFuncEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IDFuncEstado_idx] ON [emails].[historicoestados]
(
	[IDFuncEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTicketEstado_idx]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [IdTicketEstado_idx] ON [emails].[historicoestados]
(
	[IdTicketEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [respostas_FK_emails]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [respostas_FK_emails] ON [emails].[respostas]
(
	[id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [upload_fk_emails]    Script Date: 8/15/2017 12:05:50 PM ******/
CREATE NONCLUSTERED INDEX [upload_fk_emails] ON [emails].[upload]
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [emails].[emails] ADD  DEFAULT ((1)) FOR [state]
GO
ALTER TABLE [emails].[emails] ADD  DEFAULT ((3)) FOR [id_departamento_emails]
GO
ALTER TABLE [emails].[emails] ADD  DEFAULT ((1)) FOR [id_grupo_emails]
GO
ALTER TABLE [emails].[emails] ADD  CONSTRAINT [DF__emails__id_func]  DEFAULT (N'ND') FOR [id_func_emails]
GO
ALTER TABLE [emails].[emails] ADD  DEFAULT ((1)) FOR [id_Res_Ticket]
GO
ALTER TABLE [emails].[funcionario] ADD  DEFAULT (NULL) FOR [id_departamento_funcionarios]
GO
ALTER TABLE [emails].[funcionario] ADD  DEFAULT (NULL) FOR [Tipo_Funcionario]
GO
ALTER TABLE [emails].[historicoatribuicao] ADD  DEFAULT (NULL) FOR [ID_Func_Atribuidor]
GO
ALTER TABLE [emails].[historicoatribuicao] ADD  DEFAULT (NULL) FOR [DataAtribuicao]
GO
ALTER TABLE [emails].[historicoatribuicao] ADD  DEFAULT (NULL) FOR [ID_DepAtribuicao]
GO
ALTER TABLE [emails].[historicoatribuicao] ADD  DEFAULT (NULL) FOR [ID_Func_Atribuido]
GO
ALTER TABLE [emails].[historicoatribuicao] ADD  DEFAULT (NULL) FOR [ID_Ticket_atribuicao]
GO
ALTER TABLE [emails].[historicodepartamentos] ADD  DEFAULT (NULL) FOR [IdTicketDep]
GO
ALTER TABLE [emails].[historicodepartamentos] ADD  DEFAULT (NULL) FOR [HoraAtribuicaoDep]
GO
ALTER TABLE [emails].[historicodepartamentos] ADD  DEFAULT (NULL) FOR [IDDepartamentoDep]
GO
ALTER TABLE [emails].[historicodepartamentos] ADD  DEFAULT (NULL) FOR [IDFuncEstado]
GO
ALTER TABLE [emails].[historicoestados] ADD  DEFAULT (NULL) FOR [HoraAtribuicaoEstado]
GO
ALTER TABLE [emails].[historicoestados] ADD  DEFAULT (NULL) FOR [IdTicketEstado]
GO
ALTER TABLE [emails].[historicoestados] ADD  DEFAULT ((2)) FOR [IDEstadoEstado]
GO
ALTER TABLE [emails].[historicoestados] ADD  DEFAULT (NULL) FOR [IDFuncEstado]
GO
ALTER TABLE [emails].[historicoestados] ADD  DEFAULT ((1)) FOR [IdResTicket]
GO
ALTER TABLE [emails].[respostas] ADD  DEFAULT (NULL) FOR [datea_resp]
GO
ALTER TABLE [emails].[comentarios]  WITH CHECK ADD  CONSTRAINT [comentarios$comentarios_FK_ticket] FOREIGN KEY([ID_Ticket])
REFERENCES [emails].[emails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[comentarios] CHECK CONSTRAINT [comentarios$comentarios_FK_ticket]
GO
ALTER TABLE [emails].[comentarios]  WITH CHECK ADD  CONSTRAINT [comentarios$funcionarios_FK_comentarios] FOREIGN KEY([ID_Utilizador])
REFERENCES [emails].[funcionario] ([id_funcionario])
GO
ALTER TABLE [emails].[comentarios] CHECK CONSTRAINT [comentarios$funcionarios_FK_comentarios]
GO
ALTER TABLE [emails].[emails]  WITH NOCHECK ADD  CONSTRAINT [emails$emails_FK_Departamento] FOREIGN KEY([id_departamento_emails])
REFERENCES [emails].[departamento] ([id_departamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[emails] NOCHECK CONSTRAINT [emails$emails_FK_Departamento]
GO
ALTER TABLE [emails].[emails]  WITH NOCHECK ADD  CONSTRAINT [emails$emails_FK_estados] FOREIGN KEY([state])
REFERENCES [emails].[estado] ([ID_Estado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[emails] NOCHECK CONSTRAINT [emails$emails_FK_estados]
GO
ALTER TABLE [emails].[emails]  WITH NOCHECK ADD  CONSTRAINT [emails$emails_FK_grupos] FOREIGN KEY([id_grupo_emails])
REFERENCES [emails].[grupo] ([id_grupo])
GO
ALTER TABLE [emails].[emails] NOCHECK CONSTRAINT [emails$emails_FK_grupos]
GO
ALTER TABLE [emails].[emails]  WITH NOCHECK ADD  CONSTRAINT [emails$emails_fk_tipoResolucao] FOREIGN KEY([id_Res_Ticket])
REFERENCES [emails].[tipo_resolucao] ([IdTipoRes])
GO
ALTER TABLE [emails].[emails] NOCHECK CONSTRAINT [emails$emails_fk_tipoResolucao]
GO
ALTER TABLE [emails].[funcionario]  WITH NOCHECK ADD  CONSTRAINT [funcionario$funcionario_fk_TP] FOREIGN KEY([Tipo_Funcionario])
REFERENCES [emails].[tipoutilizador] ([ID_TipoUtilizador])
GO
ALTER TABLE [emails].[funcionario] CHECK CONSTRAINT [funcionario$funcionario_fk_TP]
GO
ALTER TABLE [emails].[funcionario]  WITH NOCHECK ADD  CONSTRAINT [funcionario$funcionario_ibfk_1] FOREIGN KEY([id_departamento_funcionarios])
REFERENCES [emails].[departamento] ([id_departamento])
GO
ALTER TABLE [emails].[funcionario] CHECK CONSTRAINT [funcionario$funcionario_ibfk_1]
GO
ALTER TABLE [emails].[historicoatribuicao]  WITH NOCHECK ADD  CONSTRAINT [historicoatribuicao$historicoAtribuicao_Dep] FOREIGN KEY([ID_DepAtribuicao])
REFERENCES [emails].[departamento] ([id_departamento])
GO
ALTER TABLE [emails].[historicoatribuicao] CHECK CONSTRAINT [historicoatribuicao$historicoAtribuicao_Dep]
GO
ALTER TABLE [emails].[historicoatribuicao]  WITH CHECK ADD  CONSTRAINT [historicoatribuicao$historicoatribuicao_FK_funcionarioAtribuido] FOREIGN KEY([ID_Func_Atribuido])
REFERENCES [emails].[funcionario] ([id_funcionario])
GO
ALTER TABLE [emails].[historicoatribuicao] CHECK CONSTRAINT [historicoatribuicao$historicoatribuicao_FK_funcionarioAtribuido]
GO
ALTER TABLE [emails].[historicoatribuicao]  WITH CHECK ADD  CONSTRAINT [historicoatribuicao$historicoatribuicao_FK_funcionarios] FOREIGN KEY([ID_Func_Atribuidor])
REFERENCES [emails].[funcionario] ([id_funcionario])
GO
ALTER TABLE [emails].[historicoatribuicao] CHECK CONSTRAINT [historicoatribuicao$historicoatribuicao_FK_funcionarios]
GO
ALTER TABLE [emails].[historicoatribuicao]  WITH CHECK ADD  CONSTRAINT [historicoatribuicao$historicoatribuicao_fk_ticket] FOREIGN KEY([ID_Ticket_atribuicao])
REFERENCES [emails].[emails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[historicoatribuicao] CHECK CONSTRAINT [historicoatribuicao$historicoatribuicao_fk_ticket]
GO
ALTER TABLE [emails].[historicodepartamentos]  WITH NOCHECK ADD  CONSTRAINT [historicodepartamentos$historicodepartamentos_fk_departamento] FOREIGN KEY([IDDepartamentoDep])
REFERENCES [emails].[departamento] ([id_departamento])
GO
ALTER TABLE [emails].[historicodepartamentos] CHECK CONSTRAINT [historicodepartamentos$historicodepartamentos_fk_departamento]
GO
ALTER TABLE [emails].[historicodepartamentos]  WITH CHECK ADD  CONSTRAINT [historicodepartamentos$historicodepartamentos_fk_funcionario] FOREIGN KEY([IDFuncEstado])
REFERENCES [emails].[funcionario] ([id_funcionario])
GO
ALTER TABLE [emails].[historicodepartamentos] CHECK CONSTRAINT [historicodepartamentos$historicodepartamentos_fk_funcionario]
GO
ALTER TABLE [emails].[historicoestados]  WITH CHECK ADD  CONSTRAINT [historicoestados$historicoestados_FK_funcionario] FOREIGN KEY([IDFuncEstado])
REFERENCES [emails].[funcionario] ([id_funcionario])
GO
ALTER TABLE [emails].[historicoestados] CHECK CONSTRAINT [historicoestados$historicoestados_FK_funcionario]
GO
ALTER TABLE [emails].[historicoestados]  WITH CHECK ADD  CONSTRAINT [historicoestados$historicoestados_ibfk_1] FOREIGN KEY([IdTicketEstado])
REFERENCES [emails].[emails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[historicoestados] CHECK CONSTRAINT [historicoestados$historicoestados_ibfk_1]
GO
ALTER TABLE [emails].[historicoestados]  WITH NOCHECK ADD  CONSTRAINT [historicoestados$historicoestados_ibfk_2] FOREIGN KEY([IDEstadoEstado])
REFERENCES [emails].[estado] ([ID_Estado])
GO
ALTER TABLE [emails].[historicoestados] CHECK CONSTRAINT [historicoestados$historicoestados_ibfk_2]
GO
ALTER TABLE [emails].[respostas]  WITH CHECK ADD  CONSTRAINT [respostas$respostas_fk_emails] FOREIGN KEY([id_email])
REFERENCES [emails].[emails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [emails].[respostas] CHECK CONSTRAINT [respostas$respostas_fk_emails]
GO
/****** Object:  StoredProcedure [emails].[ApagarComentario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ApagarComentario]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.comentarios
      WHERE comentarios.ID_Comentario = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[ApagarDepartamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ApagarDepartamento]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.departamento
      WHERE departamento.id_departamento = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[ApagarEmails]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ApagarEmails]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.emails
      WHERE emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[ApagaResposta]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ApagaResposta]  
   @_id int
AS 
   BEGIN


      DELETE 
      FROM emails.respostas
      WHERE respostas.id_resp = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[ApagarFuncionario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ApagarFuncionario]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.funcionario
      WHERE funcionario.id_funcionario = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[AtualizaComentario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [emails].[AtualizaComentario]  
   @_comet nvarchar(max),
   @user nvarchar(200),
   @id int
AS 
BEGIN
      UPDATE emails.comentarios
         SET 
            Comentario = @_comet, 
            ID_Utilizador = emails.retornaIdMail(@user), 
            Data_comentario = isnull(getdate(), getdate())
      WHERE comentarios.ID_Comentario = @id
END
GO
/****** Object:  StoredProcedure [emails].[AtualizaDepartamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[AtualizaDepartamento]  
   @_nome nvarchar(200),
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE emails.departamento
         SET 
            nome_departamento = @_nome
      WHERE departamento.id_departamento = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[AtualizaFuncionario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[AtualizaFuncionario]  
   @_user nvarchar(100),
   @_pass nvarchar(100),
   @_iddep int,
   @_tf int,
   @_id int
AS 
   BEGIN

      
      UPDATE emails.funcionario
         SET 
            username = @_user, 
            pass = @_pass, 
            id_departamento_funcionarios = @_iddep, 
            Tipo_Funcionario = @_tf
      WHERE funcionario.id_funcionario = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaDepartamentos]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaDepartamentos]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT departamento.id_departamento, departamento.nome_departamento
      FROM emails.departamento
         ORDER BY departamento.id_departamento

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaDepSelec]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaDepSelec]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT departamento.id_departamento, departamento.nome_departamento
      FROM emails.departamento
      WHERE departamento.id_departamento = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaEstados]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaEstados]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT estado.ID_Estado, estado.Descricao_Estado
      FROM emails.estado

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaFuncionarios]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaFuncionarios]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         departamento.nome_departamento, 
         tipoutilizador.Descricao_TipoUtilizador
      FROM emails.funcionario, emails.departamento, emails.tipoutilizador
      WHERE funcionario.id_departamento_funcionarios = departamento.id_departamento AND funcionario.Tipo_Funcionario = tipoutilizador.ID_TipoUtilizador
         ORDER BY funcionario.id_funcionario

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaFuncionariosDepart]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaFuncionariosDepart]  
   @_func nvarchar(230)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         funcionario.id_departamento_funcionarios, 
         funcionario.Tipo_Funcionario
      FROM emails.funcionario
      WHERE funcionario.username LIKE @_func

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaFuncSelec]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaFuncSelec]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         departamento.nome_departamento, 
         tipoutilizador.Descricao_TipoUtilizador
      FROM emails.funcionario, emails.departamento, emails.tipoutilizador
      WHERE 
         funcionario.id_departamento_funcionarios = departamento.id_departamento AND 
         funcionario.Tipo_Funcionario = tipoutilizador.ID_TipoUtilizador AND 
         funcionario.id_funcionario = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaGridDepartamentoHistorico]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaGridDepartamentoHistorico]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         historicodepartamentos.idHistoricoDep, 
         historicodepartamentos.IdTicketDep, 
		  Convert(varchar(17),[HoraAtribuicaoDep], 121)As HoraAtribuicaoDep,
		 
         historicodepartamentos.IDDepartamentoDep, 
         historicodepartamentos.IDFuncEstado
      FROM emails.historicodepartamentos
      WHERE historicodepartamentos.IdTicketDep = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaHistoricoEstado]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaHistoricoEstado]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         historicoestados.idHistoricoEstados, 
		  Convert(varchar(17),[HoraAtribuicaoEstado], 121)As HoraAtribuicaoEstado,
         historicoestados.IdTicketEstado, 
         estado.Descricao_Estado, 
         funcionario.username, 
         tipo_resolucao.DesTipoRes
      FROM 
         emails.historicoestados, 
         emails.estado, 
         emails.funcionario, 
         emails.tipo_resolucao
      WHERE 
         historicoestados.IDEstadoEstado = estado.ID_Estado AND 
         historicoestados.IDFuncEstado = funcionario.id_funcionario AND 
         historicoestados.IdTicketEstado = @_id AND 
         historicoestados.IdResTicket = tipo_resolucao.IdTipoRes
         ORDER BY historicoestados.idHistoricoEstados DESC

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaInfo]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaInfo]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT emails.id,
	   datea,
	    emails.state, departamento.nome_departamento
      FROM emails.emails, emails.departamento
      WHERE emails.id_departamento_emails = departamento.id_departamento AND emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaRespostaSelecionada]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaRespostaSelecionada]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         respostas.id_resp, 
         respostas.subject_resp, 
         respostas.body_resp, 
		  Convert(varchar(17),[datea_resp], 121)As datea_resp,
         respostas.id_email
      FROM emails.respostas
      WHERE respostas.id_resp = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaTiposResolução]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaTiposResolução]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT tipo_resolucao.IdTipoRes, tipo_resolucao.DesTipoRes
      FROM emails.tipo_resolucao

   END
GO
/****** Object:  StoredProcedure [emails].[CarregaTiposUtilizador]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[CarregaTiposUtilizador]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT tipoutilizador.ID_TipoUtilizador, tipoutilizador.Descricao_TipoUtilizador
      FROM emails.tipoutilizador
         ORDER BY tipoutilizador.ID_TipoUtilizador

   END
GO
/****** Object:  StoredProcedure [emails].[ForcLimpeza]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ForcLimpeza]
AS 
   
   BEGIN

	  
      TRUNCATE TABLE emails.upload
      TRUNCATE TABLE emails.respostas
      TRUNCATE TABLE emails.historicoestados
      TRUNCATE TABLE emails.historicodepartamentos
      TRUNCATE TABLE emails.comentarios
      TRUNCATE TABLE emails.historicoatribuicao

           



   END
GO
/****** Object:  StoredProcedure [emails].[InserirComentario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirComentario]  
   @idTicket int,
   @comet nvarchar(max),
   @func nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      /*
      *   SSMA informational messages:
      *   M2SS0231: Zero-date, zero-in-date and invalid dates to not null columns has been replaced with GetDate()/Constant date
      */

      INSERT emails.comentarios(emails.comentarios.ID_Ticket, emails.comentarios.Data_comentario, emails.comentarios.Comentario, emails.comentarios.ID_Utilizador)
         VALUES (@idTicket, isnull(getdate(), getdate()), @comet, emails.retornaIdMail(@func))

   END
GO
/****** Object:  StoredProcedure [emails].[InserirDepartamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirDepartamento]  
   @_nomedepartamento4 nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.departamento(emails.departamento.nome_departamento)
         VALUES (@_nomedepartamento4)

   END
GO
/****** Object:  StoredProcedure [emails].[InserirFicheiro]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirFicheiro]  
   @_file nvarchar(100),
   @_data varbinary(max),
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.upload(emails.upload.nome, emails.upload.content, emails.upload.id_ticket)
         VALUES (@_file, @_data, @_id)

   END
GO
/****** Object:  StoredProcedure [emails].[InserirFuncionario]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirFuncionario]  
   @_name nvarchar(100),
   @_pass nvarchar(100),
   @_idDepar int,
   @_TP int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.funcionario(emails.funcionario.username, emails.funcionario.pass, emails.funcionario.id_departamento_funcionarios, emails.funcionario.Tipo_Funcionario)
         VALUES (@_name, @_pass, @_idDepar, @_TP)

   END
GO
/****** Object:  StoredProcedure [emails].[InserirHistoricoAtribuicao]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirHistoricoAtribuicao]  
   @_funcionarioAtribui nvarchar(200),
   @funcionario nvarchar(200),
   @_id int
AS 
   BEGIN

            INSERT emails.historicoatribuicao(
               historicoatribuicao.ID_Func_Atribuidor, 
               historicoatribuicao.DataAtribuicao, 
               historicoatribuicao.ID_DepAtribuicao, 
               historicoatribuicao.ID_Func_Atribuido, 
               historicoatribuicao.ID_Ticket_atribuicao)
               VALUES (
                  
                  emails.retornaIdMail(@_funcionarioAtribui), 
                  getdate(), 
                  emails.MostraIdDepartamento(@_funcionarioAtribui), 
                  emails.retornaIdMail(@funcionario), 
                  @_id)

      UPDATE emails.emails
         SET 
            id_func_emails = @funcionario, 
            state = 4
      WHERE emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[InserirHistoricoDepartamentos]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirHistoricoDepartamentos]  
   @IdTicket int,
   @IDDepart int,
   @IDFunc nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.historicodepartamentos(emails.historicodepartamentos.IdTicketDep, emails.historicodepartamentos.HoraAtribuicaoDep, emails.historicodepartamentos.IDDepartamentoDep, emails.historicodepartamentos.IDFuncEstado)
         VALUES (@IdTicket, getdate(), @IDDepart, emails.retornaIdMail(@IDFunc))

      UPDATE emails.emails
         SET 
            id_departamento_emails = @IDDepart
      WHERE emails.id = @IdTicket

   END
GO
/****** Object:  StoredProcedure [emails].[inserirhistoricoestados]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[inserirhistoricoestados]  
   @IdTicket int,
   @IDEstado int,
   @IDFuncEst nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado, emails.historicoestados.IDFuncEstado)
         VALUES (getdate(), @IdTicket, @IDEstado, emails.retornaIdMail(@IDFuncEst))

      UPDATE emails.emails
         SET 
            state = @IDEstado
      WHERE emails.id = @IdTicket

      /* 
      *   SSMA error messages:
      *   M2SS0016: Identifier idREs cannot be converted because it was not resolved.

      UPDATE emails.emails
         SET 
            id_Res_Ticket = idREs
      WHERE emails.id = @IdTicket      */



   END
GO
/****** Object:  StoredProcedure [emails].[inserirhistoricoestados2]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[inserirhistoricoestados2]  
   @IdTicket int,
   @IDFuncEstado nvarchar(100),
   @idREs int
AS 
   BEGIN

      INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
         VALUES (getdate(), @IdTicket, emails.retornaIdMail(@IDFuncEstado), @idREs)

      UPDATE emails.emails
         SET 
            id_Res_Ticket = @idREs
      WHERE emails.id = @IdTicket

	  IF (@idREs = 1)
				 
				 INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
						emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
						VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)
						UPDATE emails.emails
					SET 
					state = 2
				WHERE emails.id = @IdTicket
						

	 IF (@idREs = 2)
			     UPDATE emails.emails
		            SET 
					state = 5
				WHERE emails.id = @IdTicket
					INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
					emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
					VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)

	IF (@idREs = 3)
		     UPDATE emails.emails
			    SET 
               state = 5
			WHERE emails.id = @IdTicket

			INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
			emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
			VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)

			IF (@idREs = 4)
		    UPDATE emails.emails
			    SET 
               state = 5
			WHERE emails.id = @IdTicket
				INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
				emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
				VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)


     IF (@idREs = 5)
		    UPDATE emails.emails
			    SET 
               state = 5
			WHERE emails.id = @IdTicket
				INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
				emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
				VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)

      IF (@idREs = 6)

         UPDATE emails.emails
            SET 
               state = 5
         WHERE emails.id = @IdTicket;
		 
			INSERT emails.historicoestados(emails.historicoestados.HoraAtribuicaoEstado, emails.historicoestados.IdTicketEstado, emails.historicoestados.IDEstadoEstado,
			emails.historicoestados.IDFuncEstado, emails.historicoestados.IdResTicket)
			VALUES (getdate(), @IdTicket, 5, emails.retornaIdMail(@IDFuncEstado),@idREs)

   END
GO
/****** Object:  StoredProcedure [emails].[InserirRespostas]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[InserirRespostas]  
   @_subject nvarchar(100),
   @_body nvarchar(230),
   @_id_email int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT emails.respostas(emails.respostas.subject_resp, emails.respostas.body_resp, emails.respostas.datea_resp, emails.respostas.id_email)
         VALUES (@_subject, @_body, getdate(), @_id_email)

   END
GO
/****** Object:  StoredProcedure [emails].[InserirTickets2]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[InserirTickets2]  
   @_from nvarchar(700),
   @_mail nvarchar(700),
   @_subject nvarchar(700),
   @_body nvarchar(700),
   @_user nvarchar(200)
AS 
   BEGIN

      DECLARE
         @temp int

      DECLARE
         @temp2 int

      DECLARE
         @_id int

      SELECT @temp = emails.VerificaEmail(@_mail)

      SELECT @temp2 = emails.VerificaSubject(@_subject)

      SELECT @_id = emails.RetornaId(@_mail)

      IF (@temp =1 AND @temp2 = 1)
         BEGIN
            
            UPDATE emails.emails
               SET 
                  body = @_body, 
                  datea = isnull(getdate(), getdate())
            WHERE emails.id = @_id
         END
      ELSE 
         BEGIN
            

            INSERT emails.emails(
               emails.emails.email, 
               emails.emails.fromaddress, 
               emails.emails.subject, 
               emails.emails.datea, 
               emails.emails.body, 
               emails.emails.id_departamento_emails)
               VALUES (
                  @_mail, 
                  @_from, 
                  @_subject, 
                  isnull(getdate(), getdate()), 
                  @_body, 
                  emails.MostraIdDepartamento(@_user))
         END

   END
GO
/****** Object:  StoredProcedure [emails].[LimpaComentarios]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[LimpaComentarios]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.comentarios
      WHERE comentarios.ID_Ticket = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[LimpaHistorico]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[LimpaHistorico]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.emails
      WHERE (emails.id_grupo_emails = 2)

   END
GO
/****** Object:  StoredProcedure [emails].[LimpaRespostas]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[LimpaRespostas]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DELETE 
      FROM emails.respostas
      WHERE respostas.id_email = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[LimpaTickets]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[LimpaTickets]
AS 
   /*
   *   SSMA warning messages:
   *   M2SS0117: Truncate table may fail if the Table is referenced by foreign key constraints
   */

   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      WHILE @@TRANCOUNT > 0
      
         COMMIT 

      /*
      *   SSMA warning messages:
      *   M2SS0115: The AUTO_INCREMENT counter is reset to zero by TRUNCATE TABLE, regardless of whether there is a foreign key constraint.
      */

      TRUNCATE TABLE emails.emails

   END
GO
/****** Object:  StoredProcedure [emails].[Login]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[Login]  
   @_username nvarchar(100),
   @_password nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         funcionario.id_departamento_funcionarios, 
         funcionario.Tipo_Funcionario
      FROM emails.funcionario
      WHERE funcionario.username = @_username AND funcionario.pass = @_password

   END
GO
/****** Object:  StoredProcedure [emails].[MudaGrupo]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[MudaGrupo]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE emails.emails
         SET 
            id_grupo_emails = emails.MudaGrupoTicket(emails.id_grupo_emails), 
            state = 5
      WHERE emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[RespostaSelecionada]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[RespostaSelecionada]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         respostas.id_resp, 
         respostas.subject_resp, 
         respostas.body_resp, 
		  Convert(varchar(17),[datea_resp], 121)As datea_resp,
         respostas.id_email
      FROM emails.respostas
      WHERE respostas.id_email = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[RetornaAtriSelec]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[RetornaAtriSelec]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         historicoatribuicao.ID_Atribuicao, 
         funcionario.username AS ID_Func_Atribuidor, 
		  Convert(varchar(17),[DataAtribuicao], 121)As DataAtribuicao,
		 departamento.nome_departamento AS ID_DepAtribuicao, 
         emails.RetornaMail(historicoatribuicao.ID_Func_Atribuido) AS ID_Func_Atribuido, 
         emails.id
      FROM 
         emails.historicoatribuicao, 
         emails.emails, 
         emails.funcionario, 
         emails.departamento
      WHERE 
         historicoatribuicao.ID_Func_Atribuidor = funcionario.id_funcionario AND 
         historicoatribuicao.ID_DepAtribuicao = departamento.id_departamento AND 
         historicoatribuicao.ID_Ticket_atribuicao = @_id AND 
         historicoatribuicao.ID_Ticket_atribuicao = emails.id
         ORDER BY historicoatribuicao.ID_Atribuicao DESC

   END
GO
/****** Object:  StoredProcedure [emails].[RetornaComentarioSelec]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[RetornaComentarioSelec]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         comentarios.ID_Comentario, 
         comentarios.ID_Ticket, 
		  Convert(varchar(17),[Data_comentario], 121)As Data_comentario,
		 
         comentarios.Comentario, 
         funcionario.username
      FROM emails.comentarios, emails.funcionario
      WHERE comentarios.ID_Utilizador = funcionario.id_funcionario AND comentarios.ID_Comentario = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[ShowBody]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[ShowBody]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      
      SELECT 
         emails.id, 
         emails.email, 
         emails.subject, 
		 Convert(varchar(17),[datea], 121)As datea,
         emails.body, 
         estado.Descricao_Estado, 
         emails.email, 
         departamento.nome_departamento, 
         tipo_resolucao.DesTipoRes, 
         emails.id_func_emails
      FROM 
         emails.emails, 
         emails.departamento, 
         emails.estado, 
         emails.tipo_resolucao
      WHERE 
         emails.id_departamento_emails = departamento.id_departamento AND 
         (emails.state = estado.ID_Estado) AND 
         (emails.id_Res_Ticket = tipo_resolucao.IdTipoRes) AND 
         (emails.id = @_id)      



   END
GO
/****** Object:  StoredProcedure [emails].[ShowRespostas]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ShowRespostas]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      
      SELECT respostas.id_resp, respostas.subject_resp, respostas.body_resp, 
       Convert(varchar(17),[datea_resp], 121)As datea
	  FROM emails.respostas, emails.emails
      WHERE (respostas.id_email = emails.id)      



   END
GO
/****** Object:  StoredProcedure [emails].[ShowRespostasHistorico]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[ShowRespostasHistorico]  
   @_ID_Ticket int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         respostas.id_resp, 
         respostas.subject_resp, 
         respostas.body_resp, 
         /*FORMAT(respostas.datea_resp,'dd/MM/yyyy HH:mm')as datea_resp,*/
		  Convert(varchar(17),datea_resp, 121)As datea_resp,
         respostas.id_email, 
         grupo.nome_grupo
      FROM emails.emails, emails.respostas, emails.grupo
      WHERE 
         respostas.id_email = emails.id AND 
         grupo.id_grupo = 2 AND 
         (respostas.id_email = @_ID_Ticket)

   END
GO
/****** Object:  StoredProcedure [emails].[ShowRespostasTicket]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*   M2SS0003: The following SQL clause was ignored during conversion: COMMENT 'Mostra as Respostas do Ticket que recebeu o id'.
*/

CREATE PROCEDURE [emails].[ShowRespostasTicket]  
   @_ID_Ticket int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         respostas.id_email, 
		 /*FORMAT(respostas.datea_resp, 'dd/MM/yyyy HH:mm')as datea_resp,*/
		 Convert(varchar(17),[datea], 121)As datea,
         respostas.body_resp, 
         respostas.subject_resp, 
         respostas.id_resp
      FROM emails.respostas, emails.emails
      WHERE respostas.id_email = emails.id AND (respostas.id_email = @_ID_Ticket)

   END
GO
/****** Object:  StoredProcedure [emails].[teste]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[teste]  
   @_funcionario nvarchar(100),
   @_id int,
   @IDEstado int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE emails.emails
         SET 
            id_func_emails = @_funcionario, 
            state = @IDEstado
      WHERE emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[TicketSelec]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[TicketSelec]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

     
      SELECT 
         emails.id, 
         emails.fromaddress, 
         emails.subject, 
         /*FORMAT(emails.datea, 'dd/MM/yyyy HH:mm')as datea,*/
		  Convert(varchar(17),[datea], 121)As datea,
         emails.body, 
         estado.Descricao_Estado, 
         emails.email, 
         departamento.nome_departamento, 
         tipo_resolucao.DesTipoRes, 
         emails.id_func_emails
      FROM 
         emails.emails, 
         emails.departamento, 
         emails.estado, 
         emails.tipo_resolucao
      WHERE 
         emails.id_departamento_emails = departamento.id_departamento AND 
         (emails.state = estado.ID_Estado) AND 
         (emails.id_Res_Ticket = tipo_resolucao.IdTipoRes) AND 
         (emails.id = @_id)      



   END
GO
/****** Object:  StoredProcedure [emails].[TicketSelecHistorico]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[TicketSelecHistorico]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         emails.id, 
         emails.fromaddress, 
         emails.subject, 
         /*FORMAT(emails.datea, 'dd/MM/yyyy HH:mm')as datea,*/
		  Convert(varchar(17),[datea], 121)As datea,
         emails.body, 
         emails.state, 
         departamento.nome_departamento, 
         grupo.nome_grupo
      FROM emails.emails, emails.grupo, emails.departamento
      WHERE 
         (emails.id_departamento_emails = departamento.id_departamento) AND 
         (emails.id_grupo_emails = grupo.id_grupo) AND 
         grupo.id_grupo = 2 AND 
         (emails.id = @_id)

   END
GO
/****** Object:  StoredProcedure [emails].[TiposResolucao]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[TiposResolucao]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT tipo_resolucao.IdTipoRes, tipo_resolucao.DesTipoRes
      FROM emails.tipo_resolucao

   END
GO
/****** Object:  StoredProcedure [emails].[VerComentarioTicket]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[VerComentarioTicket]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         comentarios.ID_Comentario, 
         comentarios.ID_Ticket, 
		 
		 /*FORMAT(comentarios.Data_comentario,  'dd/MM/yyyy HH:mm')as Data_comentario,*/
		  Convert(varchar(17),[Data_comentario], 121)As Data_comentario,
         comentarios.Comentario, 
         emails.RetornaMail(comentarios.ID_Utilizador) AS ID_Utilizador
      FROM emails.comentarios
      WHERE comentarios.ID_Ticket = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[VerDepFunc]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[VerDepFunc]  
   @_tipo int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         funcionario.id_departamento_funcionarios, 
         funcionario.Tipo_Funcionario
      FROM emails.funcionario
      WHERE funcionario.id_departamento_funcionarios = @_tipo

   END
GO
/****** Object:  StoredProcedure [emails].[VerFuncSelecionado]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[VerFuncSelecionado]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         departamento.nome_departamento, 
         tipoutilizador.Descricao_TipoUtilizador AS Tipo_Utilizador
      FROM emails.funcionario, emails.departamento, emails.tipoutilizador
      WHERE 
         (funcionario.id_departamento_funcionarios = departamento.id_departamento) AND 
         funcionario.Tipo_Funcionario = tipoutilizador.ID_TipoUtilizador AND 
         funcionario.id_funcionario = @_id
         ORDER BY funcionario.id_funcionario

   END
GO
/****** Object:  StoredProcedure [emails].[VerHistoricoDepartamento]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[VerHistoricoDepartamento]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         historicodepartamentos.idHistoricoDep, 
         historicodepartamentos.IdTicketDep, 
         /*FORMAT(historicodepartamentos.HoraAtribuicaoDep, 'dd/MM/yyyy HH:mm')as HoraAtribuicaoDep,*/
		  Convert(varchar(17),[HoraAtribuicaoDep], 121)As HoraAtribuicaoDep,

         departamento.nome_departamento, 
         funcionario.username
      FROM emails.historicodepartamentos, emails.departamento, emails.funcionario
      WHERE 
         historicodepartamentos.IDDepartamentoDep = departamento.id_departamento AND 
         historicodepartamentos.IDFuncEstado = funcionario.id_funcionario AND 
         historicodepartamentos.IdTicketDep = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[VerificaAdmin]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[VerificaAdmin]  
   @email nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         funcionario.id_funcionario, 
         funcionario.username, 
         funcionario.pass, 
         funcionario.id_departamento_funcionarios, 
         funcionario.Tipo_Funcionario
      FROM emails.funcionario
      WHERE funcionario.username = @email

   END
GO
/****** Object:  StoredProcedure [emails].[verificausoEmail]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   NO SQL.
*/

CREATE PROCEDURE [emails].[verificausoEmail]  
   @_id int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         emails.id, 
         emails.email, 
         emails.fromaddress, 
         emails.subject, 
		 Convert(varchar(17),[datea], 121)As datea,
		/*         emails.datea, */
         emails.body, 
         emails.state, 
         emails.id_departamento_emails, 
         emails.id_grupo_emails, 
         emails.id_func_emails, 
         emails.id_Res_Ticket
      FROM emails.emails
      WHERE emails.id = @_id

   END
GO
/****** Object:  StoredProcedure [emails].[VerTicket]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[VerTicket]  
   @_iddep int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      

      SELECT 
         emails.id, 
         emails.email, 
         emails.fromaddress, 
         emails.subject, 
         /*FORMAT(emails.datea, 'dd/MM/yyyy HH:mm')as datea,*/
		  Convert(varchar(17),[datea], 121)As datea,
         emails.body, 
         estado.Descricao_Estado, 
         tipo_resolucao.DesTipoRes, 
         emails.id_func_emails, 
         departamento.nome_departamento
      FROM 
         emails.emails, 
         emails.departamento, 
         emails.grupo, 
         emails.estado, 
         emails.tipo_resolucao
      WHERE 
         (emails.id_departamento_emails = departamento.id_departamento) AND 
         (emails.id_grupo_emails = grupo.id_grupo) AND 
         (grupo.nome_grupo = 'Ticket') AND 
         (emails.id_departamento_emails = @_iddep) AND 
         (emails.state = estado.ID_Estado) AND 
         (emails.id_Res_Ticket = tipo_resolucao.IdTipoRes)
         ORDER BY emails.id ASC     



   END
GO
/****** Object:  StoredProcedure [emails].[VerTicketHistorico]    Script Date: 8/15/2017 12:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [emails].[VerTicketHistorico]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      
      SELECT 
         emails.id, 
         emails.email, 
         emails.fromaddress, 
         emails.subject, 
          Convert(varchar(17),[datea], 121)As datea,
		 /*FORMAT(emails.datea, 'dd/MM/yyyy HH:mm')as datea,*/
         emails.body, 
         estado.Descricao_Estado, 
         tipo_resolucao.DesTipoRes, 
         emails.id_func_emails, 
         departamento.nome_departamento
      FROM 
         emails.emails, 
         emails.departamento, 
         emails.grupo, 
         emails.estado, 
         emails.tipo_resolucao
      WHERE 
         (emails.id_departamento_emails = departamento.id_departamento) AND 
         (emails.id_grupo_emails = grupo.id_grupo) AND 
         (grupo.nome_grupo = 'Historico') AND 
         (emails.state = estado.ID_Estado) AND 
         (emails.id_Res_Ticket = tipo_resolucao.IdTipoRes)
         ORDER BY emails.id ASC     



   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ApagarComentario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ApagarComentario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ApagarDepartamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ApagarDepartamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ApagarEmails' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ApagarEmails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ApagaResposta' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ApagaResposta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ApagarFuncionario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ApagarFuncionario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.AtualizaDepartamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'AtualizaDepartamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.AtualizaFuncionario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'AtualizaFuncionario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaDepartamentos' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaDepartamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaDepSelec' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaDepSelec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaEstados' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaEstados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaFuncionarios' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaFuncionarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaFuncionariosDepart' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaFuncionariosDepart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaFuncSelec' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaFuncSelec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaGridDepartamentoHistorico' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaGridDepartamentoHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaHistoricoEstado' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaHistoricoEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaInfo' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaRespostaSelecionada' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaRespostaSelecionada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaTiposResolução' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaTiposResolução'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.CarregaTiposUtilizador' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'CarregaTiposUtilizador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ForcLimpeza' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ForcLimpeza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirComentario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirComentario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirDepartamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirDepartamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirFicheiro' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirFicheiro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirFuncionario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirFuncionario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirHistoricoAtribuicao' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirHistoricoAtribuicao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirHistoricoDepartamentos' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirHistoricoDepartamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.inserirhistoricoestados' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'inserirhistoricoestados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.inserirhistoricoestados2' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'inserirhistoricoestados2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirRespostas' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirRespostas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.InserirTickets2' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'InserirTickets2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.LimpaComentarios' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'LimpaComentarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.LimpaHistorico' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'LimpaHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.LimpaRespostas' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'LimpaRespostas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.LimpaTickets' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'LimpaTickets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.Login' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'Login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.MudaGrupo' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'MudaGrupo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.RespostaSelecionada' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'RespostaSelecionada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.RetornaAtriSelec' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'RetornaAtriSelec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.RetornaComentarioSelec' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'RetornaComentarioSelec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ShowBody' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ShowBody'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ShowRespostas' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ShowRespostas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ShowRespostasHistorico' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ShowRespostasHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.ShowRespostasTicket' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'ShowRespostasTicket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.teste' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'teste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.TicketSelec' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'TicketSelec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.TicketSelecHistorico' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'TicketSelecHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.TiposResolucao' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'TiposResolucao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerComentarioTicket' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerComentarioTicket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerDepFunc' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerDepFunc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerFuncSelecionado' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerFuncSelecionado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerHistoricoDepartamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerHistoricoDepartamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerificaAdmin' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerificaAdmin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.verificausoEmail' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'verificausoEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerTicket' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerTicket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerTicketHistorico' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'PROCEDURE',@level1name=N'VerTicketHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.MostraIdDepartamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'MostraIdDepartamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.MostraIdDepartamento_id' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'MostraIdDepartamento_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.MudaEstado' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'MudaEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.MudaGrupoTicket' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'MudaGrupoTicket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.RetornaId' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'RetornaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.retornaIdMail' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'retornaIdMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.RetornaMail' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'RetornaMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerificaEmail' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'VerificaEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.VerificaSubject' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'FUNCTION',@level1name=N'VerificaSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.comentarios' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'comentarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.departamento' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'departamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.emails' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'emails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.estado' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.funcionario' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'funcionario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.grupo' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'grupo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.historicoatribuicao' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'historicoatribuicao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.historicodepartamentos' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'historicodepartamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.historicoestados' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'historicoestados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.respostas' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'respostas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.tipo_resolucao' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'tipo_resolucao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.tipoutilizador' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'tipoutilizador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emails.upload' , @level0type=N'SCHEMA',@level0name=N'emails', @level1type=N'TABLE',@level1name=N'upload'
GO
USE [master]
GO
ALTER DATABASE [TRAKTICKETSYS] SET  READ_WRITE 
GO
