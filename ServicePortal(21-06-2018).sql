USE [master]
GO
/****** Object:  Database [ServicesPortalApi]    Script Date: 22-Jun-18 9:41:35 AM ******/
CREATE DATABASE [ServicesPortalApi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServicesPortalApi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ServicesPortalApi.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ServicesPortalApi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ServicesPortalApi_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ServicesPortalApi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServicesPortalApi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ServicesPortalApi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ServicesPortalApi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ServicesPortalApi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ServicesPortalApi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ServicesPortalApi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET RECOVERY FULL 
GO
ALTER DATABASE [ServicesPortalApi] SET  MULTI_USER 
GO
ALTER DATABASE [ServicesPortalApi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ServicesPortalApi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ServicesPortalApi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ServicesPortalApi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ServicesPortalApi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ServicesPortalApi', N'ON'
GO
USE [ServicesPortalApi]
GO
/****** Object:  Table [dbo].[Accesories]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accesories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[AccessoryID] [int] NOT NULL,
 CONSTRAINT [PK_Accesories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Descriptiin] [varchar](100) NULL,
	[BranchName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BranchStocks]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BranchStocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[BranchID] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_BranchStocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Brand] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBY] [varchar](50) NULL,
	[Createdon] [date] NULL,
	[ModiBy] [varchar](50) NULL,
	[ModiOn] [date] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Catgory] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [date] NULL,
	[ModiBy] [varchar](50) NULL,
	[ModiOn] [date] NULL,
 CONSTRAINT [PK_Catgory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[ContectPerson] [int] NULL,
	[Email] [varchar](50) NULL,
	[Web] [varchar](50) NULL,
	[Call1] [int] NULL,
	[CAll2] [int] NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[Modifieddate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Logo] [varchar](50) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Country] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cutomers]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cutomers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[CompanyName] [varchar](150) NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_Cutomers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Description] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[createdBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[modifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[CompanyId] [int] NULL,
	[Description] [varchar](100) NULL,
	[CreadtedDate] [datetime] NULL,
	[CreadtedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varbinary](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeDA]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeDA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[GratdeID] [int] NULL,
	[DAType] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[DARate] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[CreadedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_GradeDA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Discription] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeTA]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeTA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[GradeID] [int] NULL,
	[TAType] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[TARate] [float] NULL,
	[CreatedDtae] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varbinary](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_GradeTA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inventryItem]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventryItem](
	[id] [int] NOT NULL,
	[CompanyId] [int] NULL,
	[CatID] [int] NULL,
	[PurchaseDescription] [varchar](250) NULL,
	[SalesDescription] [varchar](250) NULL,
	[ModelID] [int] NULL,
	[TotalQuantity] [int] NULL,
	[AvgPurchasePrice] [float] NULL,
	[LastPurchasePrice] [float] NULL,
	[BottemPrice] [float] NULL,
	[InternalPrice] [float] NULL,
	[TradesPrice] [float] NULL,
	[QoutedPrice] [float] NULL,
	[AvgSalePrice] [float] NULL,
	[LastSalePrice] [float] NULL,
	[LastRecived] [datetime] NULL,
	[LastIssue] [datetime] NULL,
	[LastReturn] [datetime] NULL,
	[LastTransfer] [datetime] NULL,
	[LastInTransit] [datetime] NULL,
	[LastScrap] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[ModifedOn] [date] NULL,
	[SerialNo] [varchar](150) NULL,
	[ManFaceID] [int] NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_inventryItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[IssuedQuantity] [float] NOT NULL,
	[IssuePrice] [float] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProjectID] [int] NULL,
	[IssuedBranchID] [int] NULL,
	[IssuedBy] [varchar](50) NOT NULL,
	[IssuedOn] [datetime] NOT NULL,
	[IssueDocument] [varchar](max) NULL,
	[IssueRemarks] [varchar](250) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemAttribute]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[ItemID] [int] NULL,
	[AttTypeID] [int] NULL,
	[AttributeValue] [varchar](50) NULL,
 CONSTRAINT [PK_ItemAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemAttributeType]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemAttributeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemAttribute] [varchar](50) NOT NULL,
	[ActiveAttribute] [bit] NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifyBy] [varchar](50) NULL,
	[ModifyOn] [datetime] NULL,
 CONSTRAINT [PK_ItemAttributeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemsCatSubCat]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsCatSubCat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[AttTypeID] [int] NOT NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_ItemsCatSubCat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufactuere]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufactuere](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Manufactuere] [varchar](100) NULL,
	[isActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Manufactuere] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Models]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Models] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Modified] [datetime] NULL,
	[M_CatId] [int] NULL,
	[M_SubCatId] [int] NULL,
	[M_ManFacID] [int] NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrganizationDoc]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrganizationDoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[FileName] [varchar](max) NULL,
	[OrganizationID] [int] NULL,
 CONSTRAINT [PK_OrganizationDoc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrganizaationName] [varchar](50) NOT NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Call] [varchar](50) NULL,
	[Lendline] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Url] [varchar](50) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageBranchStock]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PackageBranchStock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[WeighBridgeID] [int] NOT NULL,
 CONSTRAINT [PK_PackageBranchStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageIssue]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PackageIssue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[WeighBridgeID] [int] NOT NULL,
	[IssuedQuantity] [float] NOT NULL,
	[IssuePrice] [float] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProjectID] [int] NULL,
	[IssuedBranchID] [int] NOT NULL,
	[IssuedBy] [varchar](50) NOT NULL,
	[IssuedOn] [datetime] NOT NULL,
	[IssuedDocument] [varchar](max) NULL,
	[IssuedRemarks] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_PackageIssue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Receipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ReceiptQuantity] [float] NOT NULL,
	[ReceiptPrice] [float] NOT NULL,
	[SuplierID] [int] NOT NULL,
	[ReceivedBy] [varchar](50) NOT NULL,
	[ReceivedOn] [datetime] NOT NULL,
	[ReceiptDocument] [varchar](max) NULL,
	[ReceiptRemarks] [varchar](250) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreateOn] [date] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReturnItem]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReturnItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[QuantityReturn] [float] NOT NULL,
	[PriceChargeReturn] [float] NOT NULL,
	[ProjectID] [int] NULL,
	[CustomerID] [int] NULL,
	[ReturnedBranchID] [int] NULL,
	[ReturnBy] [varchar](50) NOT NULL,
	[ReturnedOn] [datetime] NOT NULL,
	[ReturnDocument] [varchar](max) NULL,
	[ReturnRemarks] [varchar](250) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifyBy] [varchar](50) NULL,
	[ModifyOn] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReturnItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[CatId] [int] NOT NULL,
	[SubCat] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[Address1] [varchar](250) NOT NULL,
	[Address2] [varchar](250) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempAccesories]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempAccesories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[AccessoryID] [int] NOT NULL,
 CONSTRAINT [PK_TempAccesories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempItermAttribute]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempItermAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[ItemID] [int] NULL,
	[AttTypeID] [int] NULL,
	[AttributeValue] [varchar](50) NULL,
 CONSTRAINT [PK_TempItermAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[FullName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[UserCal1] [varchar](50) NULL,
	[UserCal2] [varchar](50) NULL,
	[Password] [varchar](200) NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PerAddress1] [varchar](200) NULL,
	[PerAddress2] [varchar](200) NULL,
	[PerCity] [varchar](50) NULL,
	[PerCountry] [varchar](50) NULL,
	[DesigantionId] [int] NULL,
	[DepartmentId] [int] NULL,
	[BranchId] [int] NULL,
	[GradeId] [int] NULL,
	[ReportingMgr] [varchar](50) NULL,
	[PictuerPath] [varchar](max) NULL,
	[JoininDate] [datetime] NULL,
	[LeavingDate] [datetime] NULL,
	[CreatDate] [datetime] NULL,
	[CraatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeighBridge]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeighBridge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_WeighBridge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeighBridgeItemValues]    Script Date: 22-Jun-18 9:41:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeighBridgeItemValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[WeighBridgeID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[PackagePurchasePrice] [float] NULL,
	[PackageSalePrice] [float] NULL,
 CONSTRAINT [PK_WeighBridgeItemValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Accesories]  WITH CHECK ADD  CONSTRAINT [FK_Accesories_Category] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Accesories] CHECK CONSTRAINT [FK_Accesories_Category]
GO
ALTER TABLE [dbo].[Accesories]  WITH CHECK ADD  CONSTRAINT [FK_Accesories_inventryItem] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[Accesories] CHECK CONSTRAINT [FK_Accesories_inventryItem]
GO
ALTER TABLE [dbo].[Accesories]  WITH CHECK ADD  CONSTRAINT [FK_Accesories_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[Accesories] CHECK CONSTRAINT [FK_Accesories_Models]
GO
ALTER TABLE [dbo].[Accesories]  WITH CHECK ADD  CONSTRAINT [FK_Accesories_SubCategory] FOREIGN KEY([SubCatID])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[Accesories] CHECK CONSTRAINT [FK_Accesories_SubCategory]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Companies]
GO
ALTER TABLE [dbo].[BranchStocks]  WITH CHECK ADD  CONSTRAINT [FK_BranchStocks_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[BranchStocks] CHECK CONSTRAINT [FK_BranchStocks_Branches]
GO
ALTER TABLE [dbo].[BranchStocks]  WITH CHECK ADD  CONSTRAINT [FK_BranchStocks_inventryItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[BranchStocks] CHECK CONSTRAINT [FK_BranchStocks_inventryItem]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_Companies]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Catgory_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Catgory_Companies]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Companies]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Companies]
GO
ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_Companies]
GO
ALTER TABLE [dbo].[GradeDA]  WITH CHECK ADD  CONSTRAINT [FK_GradeDA_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[GradeDA] CHECK CONSTRAINT [FK_GradeDA_Companies]
GO
ALTER TABLE [dbo].[GradeDA]  WITH CHECK ADD  CONSTRAINT [FK_GradeDA_Grades] FOREIGN KEY([GratdeID])
REFERENCES [dbo].[Grades] ([id])
GO
ALTER TABLE [dbo].[GradeDA] CHECK CONSTRAINT [FK_GradeDA_Grades]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Companies]
GO
ALTER TABLE [dbo].[GradeTA]  WITH CHECK ADD  CONSTRAINT [FK_GradeTA_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[GradeTA] CHECK CONSTRAINT [FK_GradeTA_Companies]
GO
ALTER TABLE [dbo].[GradeTA]  WITH CHECK ADD  CONSTRAINT [FK_GradeTA_Grades] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grades] ([id])
GO
ALTER TABLE [dbo].[GradeTA] CHECK CONSTRAINT [FK_GradeTA_Grades]
GO
ALTER TABLE [dbo].[inventryItem]  WITH CHECK ADD  CONSTRAINT [FK_inventryItem_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[inventryItem] CHECK CONSTRAINT [FK_inventryItem_Companies]
GO
ALTER TABLE [dbo].[inventryItem]  WITH CHECK ADD  CONSTRAINT [FK_inventryItem_Manufactuere] FOREIGN KEY([ManFaceID])
REFERENCES [dbo].[Manufactuere] ([id])
GO
ALTER TABLE [dbo].[inventryItem] CHECK CONSTRAINT [FK_inventryItem_Manufactuere]
GO
ALTER TABLE [dbo].[inventryItem]  WITH CHECK ADD  CONSTRAINT [FK_inventryItem_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[inventryItem] CHECK CONSTRAINT [FK_inventryItem_Models]
GO
ALTER TABLE [dbo].[inventryItem]  WITH CHECK ADD  CONSTRAINT [FK_inventryItem_SubCategory] FOREIGN KEY([CatID])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[inventryItem] CHECK CONSTRAINT [FK_inventryItem_SubCategory]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Branches]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Branches1] FOREIGN KEY([IssuedBranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Branches1]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Branches2] FOREIGN KEY([IssuedBranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Branches2]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Cutomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Cutomers] ([Id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Cutomers]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_inventryItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_inventryItem]
GO
ALTER TABLE [dbo].[ItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ItemAttribute_inventryItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[ItemAttribute] CHECK CONSTRAINT [FK_ItemAttribute_inventryItem]
GO
ALTER TABLE [dbo].[ItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ItemAttribute_ItemAttributeType] FOREIGN KEY([AttTypeID])
REFERENCES [dbo].[ItemAttributeType] ([Id])
GO
ALTER TABLE [dbo].[ItemAttribute] CHECK CONSTRAINT [FK_ItemAttribute_ItemAttributeType]
GO
ALTER TABLE [dbo].[ItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ItemAttribute_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[ItemAttribute] CHECK CONSTRAINT [FK_ItemAttribute_Models]
GO
ALTER TABLE [dbo].[ItemsCatSubCat]  WITH CHECK ADD  CONSTRAINT [FK_ItemsCatSubCat_Category] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ItemsCatSubCat] CHECK CONSTRAINT [FK_ItemsCatSubCat_Category]
GO
ALTER TABLE [dbo].[ItemsCatSubCat]  WITH CHECK ADD  CONSTRAINT [FK_ItemsCatSubCat_ItemAttributeType] FOREIGN KEY([AttTypeID])
REFERENCES [dbo].[ItemAttributeType] ([Id])
GO
ALTER TABLE [dbo].[ItemsCatSubCat] CHECK CONSTRAINT [FK_ItemsCatSubCat_ItemAttributeType]
GO
ALTER TABLE [dbo].[ItemsCatSubCat]  WITH CHECK ADD  CONSTRAINT [FK_ItemsCatSubCat_SubCategory] FOREIGN KEY([SubCatID])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[ItemsCatSubCat] CHECK CONSTRAINT [FK_ItemsCatSubCat_SubCategory]
GO
ALTER TABLE [dbo].[Manufactuere]  WITH CHECK ADD  CONSTRAINT [FK_Manufactuere_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Manufactuere] CHECK CONSTRAINT [FK_Manufactuere_Companies]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Category] FOREIGN KEY([M_CatId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Category]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Companies]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Manufactuere] FOREIGN KEY([M_ManFacID])
REFERENCES [dbo].[Manufactuere] ([id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Manufactuere]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_SubCategory] FOREIGN KEY([M_SubCatId])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_SubCategory]
GO
ALTER TABLE [dbo].[OrganizationDoc]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationDoc_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([id])
GO
ALTER TABLE [dbo].[OrganizationDoc] CHECK CONSTRAINT [FK_OrganizationDoc_Organizations]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Branches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Branches]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Companies]
GO
ALTER TABLE [dbo].[PackageBranchStock]  WITH CHECK ADD  CONSTRAINT [FK_PackageBranchStock_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[PackageBranchStock] CHECK CONSTRAINT [FK_PackageBranchStock_Branches]
GO
ALTER TABLE [dbo].[PackageBranchStock]  WITH CHECK ADD  CONSTRAINT [FK_PackageBranchStock_WeighBridge] FOREIGN KEY([WeighBridgeID])
REFERENCES [dbo].[WeighBridge] ([Id])
GO
ALTER TABLE [dbo].[PackageBranchStock] CHECK CONSTRAINT [FK_PackageBranchStock_WeighBridge]
GO
ALTER TABLE [dbo].[PackageIssue]  WITH CHECK ADD  CONSTRAINT [FK_PackageIssue_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[PackageIssue] CHECK CONSTRAINT [FK_PackageIssue_Branches]
GO
ALTER TABLE [dbo].[PackageIssue]  WITH CHECK ADD  CONSTRAINT [FK_PackageIssue_Branches1] FOREIGN KEY([IssuedBranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[PackageIssue] CHECK CONSTRAINT [FK_PackageIssue_Branches1]
GO
ALTER TABLE [dbo].[PackageIssue]  WITH CHECK ADD  CONSTRAINT [FK_PackageIssue_Cutomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Cutomers] ([Id])
GO
ALTER TABLE [dbo].[PackageIssue] CHECK CONSTRAINT [FK_PackageIssue_Cutomers]
GO
ALTER TABLE [dbo].[PackageIssue]  WITH CHECK ADD  CONSTRAINT [FK_PackageIssue_WeighBridge] FOREIGN KEY([WeighBridgeID])
REFERENCES [dbo].[WeighBridge] ([Id])
GO
ALTER TABLE [dbo].[PackageIssue] CHECK CONSTRAINT [FK_PackageIssue_WeighBridge]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Branches]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_inventryItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_inventryItem]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Supplier] FOREIGN KEY([SuplierID])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Supplier]
GO
ALTER TABLE [dbo].[ReturnItem]  WITH CHECK ADD  CONSTRAINT [FK_ReturnItem_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[ReturnItem] CHECK CONSTRAINT [FK_ReturnItem_Branches]
GO
ALTER TABLE [dbo].[ReturnItem]  WITH CHECK ADD  CONSTRAINT [FK_ReturnItem_Branches1] FOREIGN KEY([ReturnedBranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[ReturnItem] CHECK CONSTRAINT [FK_ReturnItem_Branches1]
GO
ALTER TABLE [dbo].[ReturnItem]  WITH CHECK ADD  CONSTRAINT [FK_ReturnItem_Cutomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Cutomers] ([Id])
GO
ALTER TABLE [dbo].[ReturnItem] CHECK CONSTRAINT [FK_ReturnItem_Cutomers]
GO
ALTER TABLE [dbo].[ReturnItem]  WITH CHECK ADD  CONSTRAINT [FK_ReturnItem_inventryItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[ReturnItem] CHECK CONSTRAINT [FK_ReturnItem_inventryItem]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Companies]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Branches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Branches]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Companies]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Departments]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Designation] FOREIGN KEY([DesigantionId])
REFERENCES [dbo].[Designation] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Designation]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Grades] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grades] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Grades]
GO
ALTER TABLE [dbo].[WeighBridgeItemValues]  WITH CHECK ADD  CONSTRAINT [FK_WeighBridgeItemValues_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[WeighBridgeItemValues] CHECK CONSTRAINT [FK_WeighBridgeItemValues_Branches]
GO
ALTER TABLE [dbo].[WeighBridgeItemValues]  WITH CHECK ADD  CONSTRAINT [FK_WeighBridgeItemValues_inventryItem1] FOREIGN KEY([ItemID])
REFERENCES [dbo].[inventryItem] ([id])
GO
ALTER TABLE [dbo].[WeighBridgeItemValues] CHECK CONSTRAINT [FK_WeighBridgeItemValues_inventryItem1]
GO
ALTER TABLE [dbo].[WeighBridgeItemValues]  WITH CHECK ADD  CONSTRAINT [FK_WeighBridgeItemValues_WeighBridge1] FOREIGN KEY([WeighBridgeID])
REFERENCES [dbo].[WeighBridge] ([Id])
GO
ALTER TABLE [dbo].[WeighBridgeItemValues] CHECK CONSTRAINT [FK_WeighBridgeItemValues_WeighBridge1]
GO
USE [master]
GO
ALTER DATABASE [ServicesPortalApi] SET  READ_WRITE 
GO
