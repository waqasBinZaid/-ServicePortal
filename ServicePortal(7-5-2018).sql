USE [master]
GO
/****** Object:  Database [ServicesPortalApi]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Accesories]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
	[AccessoryID] [int] NULL,
 CONSTRAINT [PK_Accesories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[BranchStocks]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Cutomers]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Designation]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[GradeDA]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Grades]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[GradeTA]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[inventryItem]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Issue]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[ItemAttribute]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[ItemAttributeType]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[ItemsCatSubCat]    Script Date: 05-Jul-18 7:54:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemsCatSubCat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatID] [int] NOT NULL,
	[SubCatID] [int] NOT NULL,
	[AttTypeID] [int] NOT NULL,
	[ItemID] [int] NULL,
	[AttributeType] [varchar](50) NULL,
 CONSTRAINT [PK_ItemsCatSubCat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufactuere]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Models]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[OrganizationDoc]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Organizations]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[PackageBranchStock]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[PackageIssue]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Receipt]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[ReturnItem]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[TempAccesories]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[TempItermAttribute]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[WeighBridge]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
/****** Object:  Table [dbo].[WeighBridgeItemValues]    Script Date: 05-Jul-18 7:54:10 PM ******/
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
SET IDENTITY_INSERT [dbo].[Accesories] ON 

INSERT [dbo].[Accesories] ([Id], [CatID], [SubCatID], [ModelID], [Description], [AccessoryID]) VALUES (5, 47, 1072, 23, N'No', 2)
INSERT [dbo].[Accesories] ([Id], [CatID], [SubCatID], [ModelID], [Description], [AccessoryID]) VALUES (12, 46, 1071, 22, N'No', NULL)
INSERT [dbo].[Accesories] ([Id], [CatID], [SubCatID], [ModelID], [Description], [AccessoryID]) VALUES (13, 46, 1071, 22, N'Item', 1)
INSERT [dbo].[Accesories] ([Id], [CatID], [SubCatID], [ModelID], [Description], [AccessoryID]) VALUES (1007, 47, 1072, 1028, N'Load Cell Ohuas', NULL)
INSERT [dbo].[Accesories] ([Id], [CatID], [SubCatID], [ModelID], [Description], [AccessoryID]) VALUES (1008, 60, 2077, 1029, N'XYZ', NULL)
SET IDENTITY_INSERT [dbo].[Accesories] OFF
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 3, N'test', N'Lahore Office', N'3334531612', CAST(N'2018-01-26 11:57:16.893' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 3, N'ww', N'Islamabad Office', N'123', CAST(N'2018-01-26 12:42:09.253' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1002, 2002, N'Lahore Office', N'Krachi office', N'123', CAST(N'2018-01-29 18:26:38.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1003, 2002, N'test', N'Multan office', N'123', CAST(N'2018-01-29 18:27:26.420' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2002, 1002, N'Abc', N'FaisalAbad', N'123', CAST(N'2018-03-27 12:27:45.090' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2003, 3, N'It is an it company', N'RawalPindi', N'03334147309', CAST(N'2018-04-27 10:21:03.397' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Branches] ([id], [CompanyID], [Descriptiin], [BranchName], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2004, 3, N'Sugar Mill', N'Peshawar', N'1244', CAST(N'2018-04-30 18:19:10.660' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Branches] OFF
SET IDENTITY_INSERT [dbo].[BranchStocks] ON 

INSERT [dbo].[BranchStocks] ([Id], [ItemID], [BranchID], [Quantity], [CreatedBy]) VALUES (53, 12, 2003, 1, N'Naveed Ahmad')
SET IDENTITY_INSERT [dbo].[BranchStocks] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CompanyID], [Catgory], [IsActive], [CreatedBy], [CreatedOn], [ModiBy], [ModiOn]) VALUES (46, 3, N'Load Cells', 0, N'Haris Bin Zaid', CAST(N'2018-06-20' AS Date), NULL, NULL)
INSERT [dbo].[Category] ([Id], [CompanyID], [Catgory], [IsActive], [CreatedBy], [CreatedOn], [ModiBy], [ModiOn]) VALUES (47, 3, N'Indicator', 0, N'Haris Bin Zaid', CAST(N'2018-06-21' AS Date), NULL, NULL)
INSERT [dbo].[Category] ([Id], [CompanyID], [Catgory], [IsActive], [CreatedBy], [CreatedOn], [ModiBy], [ModiOn]) VALUES (48, 3, N'platform', 0, N'Haris Bin Zaid', CAST(N'2018-06-27' AS Date), NULL, NULL)
INSERT [dbo].[Category] ([Id], [CompanyID], [Catgory], [IsActive], [CreatedBy], [CreatedOn], [ModiBy], [ModiOn]) VALUES (60, 3, N'Weighbridge', 0, N'Haris Bin Zaid', CAST(N'2018-07-02' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([id], [CompanyName], [ContectPerson], [Email], [Web], [Call1], [CAll2], [Address1], [Address2], [City], [Country], [CreatedDate], [CreatedBy], [Modifieddate], [ModifiedBy], [Status], [Logo]) VALUES (1, N'SuperAdmin', 1234, N'IBTS.com', N'www.IBts.com', 1234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Companies] ([id], [CompanyName], [ContectPerson], [Email], [Web], [Call1], [CAll2], [Address1], [Address2], [City], [Country], [CreatedDate], [CreatedBy], [Modifieddate], [ModifiedBy], [Status], [Logo]) VALUES (3, N'LibraScale', NULL, N'libra@s.com', N'www.com', NULL, NULL, N'21-L model town', NULL, N'Lahore', N'Pakistan', CAST(N'2018-01-25 11:20:02.597' AS DateTime), N'waqas', NULL, NULL, 1, N'/Files/636524760025933125.png')
INSERT [dbo].[Companies] ([id], [CompanyName], [ContectPerson], [Email], [Web], [Call1], [CAll2], [Address1], [Address2], [City], [Country], [CreatedDate], [CreatedBy], [Modifieddate], [ModifiedBy], [Status], [Logo]) VALUES (1002, N'kapco', NULL, N'abc@x.com', N'www.com', NULL, NULL, N'21-L model town', NULL, N'Lahore', N'Pakistan', CAST(N'2018-01-25 16:11:49.923' AS DateTime), N'waqas', NULL, NULL, 1, N'/Files/636524935098646214.png')
INSERT [dbo].[Companies] ([id], [CompanyName], [ContectPerson], [Email], [Web], [Call1], [CAll2], [Address1], [Address2], [City], [Country], [CreatedDate], [CreatedBy], [Modifieddate], [ModifiedBy], [Status], [Logo]) VALUES (2002, N'Abc', 123, N'abc@gmail.com', N'www.com', 123, NULL, N'w', NULL, N'Lahore', N'Pakistan', CAST(N'2018-01-29 18:19:52.947' AS DateTime), N'waqas', NULL, NULL, 1, N'/Files/user.jpg')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 3, N'Germany', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 3, N'France', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 3, N'USA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 3, N'China', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 3, N'pakistann', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:20:01.657' AS DateTime), NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 3, N'Australia', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:20:57.567' AS DateTime), NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 3, N'West Indies', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:21:39.677' AS DateTime), NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 3, N'India', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:23:10.067' AS DateTime), NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, 3, N'Sri Lanka', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:25:54.510' AS DateTime), NULL, NULL)
INSERT [dbo].[Country] ([id], [CompanyID], [Country], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (10, 3, N'UK', NULL, N'Haris Bin Zaid', CAST(N'2018-04-26 18:38:16.877' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Cutomers] ON 

INSERT [dbo].[Cutomers] ([Id], [CustomerName], [Email], [PhoneNo], [Address], [City], [Country], [CompanyName], [Designation]) VALUES (1, N'Mubbasher', N'mubashar@mail.com', N'03334147309', N'streen no 2', N'Lahore', N'Pakistan', N'IBTS', N'Developer')
INSERT [dbo].[Cutomers] ([Id], [CustomerName], [Email], [PhoneNo], [Address], [City], [Country], [CompanyName], [Designation]) VALUES (2, N'Waqas Bin Zaid', N'it.naveedahmad@gmail.com', N'03334147309', N'streen no 1', N'Lahore', N'Pakistan', NULL, NULL)
INSERT [dbo].[Cutomers] ([Id], [CustomerName], [Email], [PhoneNo], [Address], [City], [Country], [CompanyName], [Designation]) VALUES (4, N'Aqeel ', N'It@gmail.com', N'03334147309', N'house no 2', N'Lahore', N'Pakistan', NULL, NULL)
INSERT [dbo].[Cutomers] ([Id], [CustomerName], [Email], [PhoneNo], [Address], [City], [Country], [CompanyName], [Designation]) VALUES (5, N'Naveed', N'naveed@mail.com', N'9999', N'lah', N'laaa', N'pakistan', N'codx', N'manager')
SET IDENTITY_INSERT [dbo].[Cutomers] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1, 1, N'SuperAdmin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1002, 3, N'Service', CAST(N'2018-01-29 10:55:52.063' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1003, 3, N'IT', CAST(N'2018-01-29 10:55:59.830' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1004, 3, N'Accounts', CAST(N'2018-01-29 10:56:28.320' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1006, 2002, N'Markiting', CAST(N'2018-01-29 18:32:16.410' AS DateTime), N'Ahmad', NULL, NULL, NULL)
INSERT [dbo].[Departments] ([id], [CompanyID], [Description], [CreatedDate], [createdBy], [ModifiedDate], [modifiedBy], [Status]) VALUES (1007, 2002, N'Oprations', CAST(N'2018-01-29 18:32:49.333' AS DateTime), N'Ahmad', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, N'SuperAdmin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 3, N'Markiting', CAST(N'2018-01-29 17:24:20.153' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 3, N'Service Manager', CAST(N'2018-01-29 17:24:39.203' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 2002, N'Manager', CAST(N'2018-01-29 18:35:20.200' AS DateTime), N'Ahmad', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, 2002, N'Super wiser ', CAST(N'2018-01-29 18:35:39.463' AS DateTime), N'Ahmad', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1003, 3, N'CEO', CAST(N'2018-02-02 11:37:55.283' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1005, 3, N'Head of Marketing', CAST(N'2018-02-02 11:40:58.953' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1007, 3, N'Chairman', CAST(N'2018-02-02 11:41:15.257' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1008, 3, N'Head of Serivce', CAST(N'2018-02-02 11:41:42.110' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1009, 3, N'Head of A/C', CAST(N'2018-02-02 11:42:02.073' AS DateTime), N'Ali', NULL, NULL, NULL)
INSERT [dbo].[Designation] ([id], [CompanyId], [Description], [CreadtedDate], [CreadtedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1013, 3, NULL, CAST(N'2018-04-27 16:53:01.610' AS DateTime), N'Haris Bin Zaid', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([id], [CompanyId], [Discription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, N'SuperAdmin', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Grades] OFF
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (1, 3, 1071, N'Nothing', N'Nothing', 22, NULL, 100, NULL, 34, 32, 44, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 10:03:11.050' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (2, 3, 1071, N'30 Tons', N'30Tons', 22, NULL, 21, NULL, 34, 32, 44, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 10:05:17.133' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (3, 3, 1071, N'Nothing', N'Nothing', 22, NULL, 21, NULL, 34, 32, 44, 22, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 10:07:35.120' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (4, 3, 1071, N'no', N'no', 22, NULL, 21, NULL, 34, 32, 44, 22, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 10:08:24.237' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (5, 3, 1071, N'NO', N'NO', 22, NULL, 21, NULL, 34, 32, 32, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 10:34:00.957' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (6, 3, 1073, N'Bending Beam Load Cell', N'Minebea Load Cell', 24, NULL, 300, NULL, 350, 350, 350, 350, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-22 12:29:32.683' AS DateTime), NULL, NULL, N'No', 10, N'/Files/636652673726760497.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (7, 3, 1073, N'Bending Beam Load Cell 57', N'Minebea Load Cell 57', 25, NULL, 400, NULL, 450, 430, 450, 550, 550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-22 12:35:19.063' AS DateTime), NULL, NULL, N'No', 10, N'/Files/636652677190537155.jpeg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (8, 3, 2073, N'0', N'0', 1024, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:31:41.357' AS DateTime), NULL, NULL, N'No', 1010, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (9, 3, 2073, N'0', N'0', 1024, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:33:10.003' AS DateTime), NULL, NULL, N'No', 1010, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (10, 3, 2073, N'0', N'0', 1024, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:34:15.813' AS DateTime), NULL, NULL, N'No', 1010, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (11, 3, 2073, N'0', N'0', 1024, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:37:33.630' AS DateTime), NULL, NULL, N'No', 1010, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (12, 3, 1072, N'fd', N'fd', 1028, NULL, 21, NULL, 34, 32, 32, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 12:19:29.970' AS DateTime), NULL, NULL, N'No', 1010, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (13, 3, 2077, N'ABC', N'XYZ', 1029, NULL, 21, NULL, 34, 32, 32, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:16:55.067' AS DateTime), NULL, NULL, N'No', 1015, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (14, 3, 1071, N'asdf', N't', 22, NULL, 21, NULL, 34, 32, 44, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-07-04 10:51:42.877' AS DateTime), NULL, NULL, N'No', 9, N'/Files/user.jpg')
INSERT [dbo].[inventryItem] ([id], [CompanyId], [CatID], [PurchaseDescription], [SalesDescription], [ModelID], [TotalQuantity], [AvgPurchasePrice], [LastPurchasePrice], [BottemPrice], [InternalPrice], [TradesPrice], [QoutedPrice], [AvgSalePrice], [LastSalePrice], [LastRecived], [LastIssue], [LastReturn], [LastTransfer], [LastInTransit], [LastScrap], [CreatedBy], [CreatedOn], [ModifedBy], [ModifedOn], [SerialNo], [ManFaceID], [Image]) VALUES (15, 3, 2076, N'fsd', N'asdf', 1032, NULL, 21, NULL, 34, 32, 32, 42, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Haris Bin Zaid', CAST(N'2018-07-05 17:13:14.693' AS DateTime), NULL, NULL, N'No', 1015, N'/Files/user.jpg')
SET IDENTITY_INSERT [dbo].[ItemAttribute] ON 

INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (84, 22, 46, 1071, 1, 18, N' C5 15e')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (85, 22, 46, 1071, 1, 19, N'20 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (86, 22, 46, 1071, 1, 20, N'+-0.011 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (87, 22, 46, 1071, 1, 21, N'+-0.0016 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (88, 22, 46, 1071, 1, 22, N'+-0.0012 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (89, 22, 46, 1071, 1, 23, N'+-0.021 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (90, 22, 46, 1071, 1, 24, N'C5')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (91, 22, 46, 1071, 1, 25, N'20 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (92, 22, 46, 1071, 1, 26, N'5 000  OILML')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (93, 22, 46, 1071, 1, 27, N' Emax/15 000 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (94, 22, 46, 1071, 1, 28, N' 5 000')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (95, 22, 46, 1071, 2, 18, N' C5 15e')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (96, 22, 46, 1071, 2, 19, N'30 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (97, 22, 46, 1071, 2, 20, N'+-0.011 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (98, 22, 46, 1071, 2, 21, N'+-0.0016 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (99, 22, 46, 1071, 2, 22, N'+-0.0012 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (100, 22, 46, 1071, 2, 23, N'+-0.021 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (101, 22, 46, 1071, 2, 24, N'C5')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (102, 22, 46, 1071, 2, 25, N'30 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (103, 22, 46, 1071, 2, 26, N'5 000  OILML')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (104, 22, 46, 1071, 2, 27, N' Emax/15 000 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (105, 22, 46, 1071, 2, 28, N' 5 000')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (106, 22, 46, 1071, 3, 18, N' C5 15e')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (107, 22, 46, 1071, 3, 19, N'40 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (108, 22, 46, 1071, 3, 20, N'+-0.011 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (109, 22, 46, 1071, 3, 21, N'+-0.0016 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (110, 22, 46, 1071, 3, 22, N'+-0.0012 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (111, 22, 46, 1071, 3, 23, N'+-0.021 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (112, 22, 46, 1071, 3, 24, N'C5')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (113, 22, 46, 1071, 3, 25, N'40 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (114, 22, 46, 1071, 3, 26, N'5 000  OILML')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (115, 22, 46, 1071, 3, 27, N' Emax/15 000 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (116, 22, 46, 1071, 3, 28, N' 5 000')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (117, 22, 46, 1071, 4, 18, N' C5 15e')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (118, 22, 46, 1071, 4, 19, N'60 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (119, 22, 46, 1071, 4, 20, N'+-0.011 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (120, 22, 46, 1071, 4, 21, N'+-0.0016 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (121, 22, 46, 1071, 4, 22, N'+-0.0012 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (122, 22, 46, 1071, 4, 23, N'+-0.021 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (123, 22, 46, 1071, 4, 24, N'C5')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (124, 22, 46, 1071, 4, 25, N'60 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (125, 22, 46, 1071, 4, 26, N'5 000  OILML')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (126, 22, 46, 1071, 4, 27, N' Emax/15 000 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (127, 22, 46, 1071, 4, 28, N' 5 000')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (128, 22, 46, 1071, 5, 18, N' C5 15e')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (129, 22, 46, 1071, 5, 19, N'90 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (130, 22, 46, 1071, 5, 20, N'+-0.011 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (131, 22, 46, 1071, 5, 21, N'+-0.0016 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (132, 22, 46, 1071, 5, 22, N'+-0.0012 %C/C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (133, 22, 46, 1071, 5, 23, N'+-0.021 %C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (134, 22, 46, 1071, 5, 24, N'C5')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (135, 22, 46, 1071, 5, 25, N'90 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (136, 22, 46, 1071, 5, 26, N'5 000  OILML')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (137, 22, 46, 1071, 5, 27, N' Emax/15 000 tons')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (138, 22, 46, 1071, 5, 28, N' 5 000')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (139, 1024, 48, 2073, 8, 29, N'ms')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (140, 1024, 48, 2073, 8, 30, N'20X20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (141, 1024, 48, 2073, 9, 29, N'ss')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (142, 1024, 48, 2073, 9, 30, N'20X20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (145, 1028, 47, 1072, 12, 19, N'20x20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (146, 1028, 47, 1072, 12, 21, N'30C')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (147, 1029, 60, 2077, 13, 30, N'20x20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (148, 1029, 60, 2077, 13, 29, N'Steel')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (149, 1029, 60, 2077, 13, 19, N'20C20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (161, 22, 46, 1071, 14, 18, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (162, 22, 46, 1071, 14, 19, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (163, 22, 46, 1071, 14, 20, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (164, 22, 46, 1071, 14, 21, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (165, 22, 46, 1071, 14, 22, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (166, 22, 46, 1071, 14, 23, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (167, 22, 46, 1071, 14, 24, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (168, 22, 46, 1071, 14, 25, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (169, 22, 46, 1071, 14, 26, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (170, 22, 46, 1071, 14, 27, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (171, 22, 46, 1071, 14, 28, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (172, 1032, 60, 2076, 15, 19, NULL)
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (173, 1032, 60, 2076, 15, 20, N'2018-07-13')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (174, 1032, 60, 2076, 15, 21, N'20C20')
INSERT [dbo].[ItemAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (175, 1032, 60, 2076, 15, 31, N'fgd')
SET IDENTITY_INSERT [dbo].[ItemAttribute] OFF
SET IDENTITY_INSERT [dbo].[ItemAttributeType] ON 

INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (18, N'0 Metrological', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:52:40.130' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (19, N'Rated Capacity', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:56:19.670' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (20, N'Combined Error', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:56:40.987' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (21, N'Temperature effect on zero', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:56:57.203' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (22, N'Temperature effect on sensitivity', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:57:12.690' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (23, N'Creep error (30 min.)', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:57:27.283' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (24, N'Accuracy class', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:57:42.147' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (25, N'Maximum capacity', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:57:59.617' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (26, N'Max. number of LC intervals', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:58:13.687' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (27, N' Min. verification interval', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:58:25.910' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (28, N' Z=Emax/(2xDR)', 0, N'Haris Bin Zaid', CAST(N'2018-06-20 09:58:41.247' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (29, N'Material', 0, N'Haris Bin Zaid', CAST(N'2018-06-27 16:25:05.157' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (30, N'size', 0, N'Haris Bin Zaid', CAST(N'2018-06-27 16:25:57.740' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (31, N'TAHIR KHAN', 0, N'Haris Bin Zaid', CAST(N'2018-07-05 15:54:52.350' AS DateTime), NULL, NULL)
INSERT [dbo].[ItemAttributeType] ([Id], [ItemAttribute], [ActiveAttribute], [CreatedBy], [CreatedOn], [ModifyBy], [ModifyOn]) VALUES (32, N'NaVeeD KhaAn', 0, N'Haris Bin Zaid', CAST(N'2018-07-05 16:42:19.523' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ItemAttributeType] OFF
SET IDENTITY_INSERT [dbo].[ItemsCatSubCat] ON 

INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (76, 46, 1071, 18, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (77, 46, 1071, 19, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (78, 46, 1071, 20, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (79, 46, 1071, 21, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (80, 46, 1071, 22, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (81, 46, 1071, 23, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (82, 46, 1071, 24, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (83, 46, 1071, 25, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (84, 46, 1071, 26, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (85, 46, 1071, 27, 1, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (87, 48, 2073, 29, 8, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (88, 48, 2074, 30, 8, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (89, 48, 2074, 29, 8, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (90, 48, 2073, 30, 8, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (91, 46, 1073, 19, 12, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (92, 46, 2075, 20, 12, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (93, 47, 1072, 19, 12, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (94, 47, 1072, 21, 12, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (95, 60, 2077, 30, 13, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (96, 60, 2077, 29, 13, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (97, 60, 2077, 19, 13, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (99, 60, 2078, 18, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (100, 60, 2078, 19, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (101, 60, 2078, 24, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (102, 60, 2078, 20, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (103, 60, 2078, 26, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (104, 60, 2078, 29, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (105, 60, 2078, 30, 15, NULL)
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (114, 46, 1071, 28, 15, N'Text')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (127, 60, 2076, 19, 15, N'Number')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (128, 60, 2076, 20, 15, N'Date')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (129, 60, 2076, 21, 15, N'TextNumber')
INSERT [dbo].[ItemsCatSubCat] ([Id], [CatID], [SubCatID], [AttTypeID], [ItemID], [AttributeType]) VALUES (131, 60, 2076, 31, 15, N'Text')
SET IDENTITY_INSERT [dbo].[ItemsCatSubCat] OFF
SET IDENTITY_INSERT [dbo].[Manufactuere] ON 

INSERT [dbo].[Manufactuere] ([id], [CompanyId], [Manufactuere], [isActive], [CreatedBy], [CreatedOn], [ModifiedBy]) VALUES (9, 3, N'Scaime', 1, N'Haris Bin Zaid', CAST(N'2018-06-20 09:43:42.997' AS DateTime), N'Haris Bin Zaid')
INSERT [dbo].[Manufactuere] ([id], [CompanyId], [Manufactuere], [isActive], [CreatedBy], [CreatedOn], [ModifiedBy]) VALUES (10, 3, N'Minebea', 1, N'Haris Bin Zaid', CAST(N'2018-06-22 12:26:14.823' AS DateTime), N'Haris Bin Zaid')
INSERT [dbo].[Manufactuere] ([id], [CompanyId], [Manufactuere], [isActive], [CreatedBy], [CreatedOn], [ModifiedBy]) VALUES (1010, 3, N'Libra', 1, N'Haris Bin Zaid', CAST(N'2018-06-27 16:27:07.243' AS DateTime), N'Haris Bin Zaid')
INSERT [dbo].[Manufactuere] ([id], [CompanyId], [Manufactuere], [isActive], [CreatedBy], [CreatedOn], [ModifiedBy]) VALUES (1015, 3, N'IBTS', 1, N'Haris Bin Zaid', CAST(N'2018-07-02 14:11:42.727' AS DateTime), N'Haris Bin Zaid')
SET IDENTITY_INSERT [dbo].[Manufactuere] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (22, 3, N'CB50X-DL', NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 09:44:13.107' AS DateTime), NULL, NULL, 46, 1071, 9)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (23, 3, N'M500', NULL, N'Haris Bin Zaid', CAST(N'2018-06-21 16:47:47.147' AS DateTime), NULL, NULL, 47, 1072, 9)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (24, 3, N'MP47', NULL, N'Haris Bin Zaid', CAST(N'2018-06-22 12:26:41.467' AS DateTime), NULL, NULL, 46, 1073, 10)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (25, 3, N'MP57', NULL, N'Haris Bin Zaid', CAST(N'2018-06-22 12:33:24.793' AS DateTime), NULL, NULL, 46, 1073, 10)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1024, 3, N'att', NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:27:37.137' AS DateTime), NULL, NULL, 48, 2073, 1010)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1025, 3, N'medrics2', NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:55:25.500' AS DateTime), NULL, NULL, 46, 1073, 9)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1026, 3, N'test', NULL, N'Haris Bin Zaid', CAST(N'2018-06-29 10:50:41.197' AS DateTime), NULL, NULL, 46, 1071, 9)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1027, 3, N'ss', NULL, N'Haris Bin Zaid', CAST(N'2018-06-29 11:04:53.517' AS DateTime), NULL, NULL, 46, 2075, 10)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1028, 3, N'M500', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 12:17:38.867' AS DateTime), NULL, NULL, 47, 1072, 1010)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1029, 3, N'M500', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:12:02.257' AS DateTime), NULL, NULL, 60, 2077, 1015)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1030, 3, N'M600', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:12:18.463' AS DateTime), NULL, NULL, 60, 2077, 1015)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1031, 3, N'200', NULL, N'Haris Bin Zaid', CAST(N'2018-07-04 14:13:56.987' AS DateTime), NULL, NULL, 60, 2078, 1015)
INSERT [dbo].[Models] ([id], [CompanyID], [Models], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [Modified], [M_CatId], [M_SubCatId], [M_ManFacID]) VALUES (1032, 3, N'm200', NULL, N'Haris Bin Zaid', CAST(N'2018-07-04 16:12:00.820' AS DateTime), NULL, NULL, 60, 2076, 1015)
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Organizations] ON 

INSERT [dbo].[Organizations] ([id], [OrganizaationName], [CompanyId], [BranchId], [Address], [City], [Province], [ZipCode], [Country], [Call], [Lendline], [Fax], [Email], [Url], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'PEL', 2002, 1003, N'lahore walten road', N'Lahore', N'Punjab', N'54000', N'Pakistan', N'123', N'123', N'3334531612', N'naveed4147@gmail.com', N'www', 1, N'Krachi', CAST(N'2018-02-02' AS Date), NULL, NULL)
INSERT [dbo].[Organizations] ([id], [OrganizaationName], [CompanyId], [BranchId], [Address], [City], [Province], [ZipCode], [Country], [Call], [Lendline], [Fax], [Email], [Url], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'SWI', 3, 2003, N'bhpd', N'lahore', N'punjab', N'54000', N'pakistan', N'2222', N'53343', N'343', N'swi@mail.com', N'swi.net', 1, N'Libra Scales', CAST(N'2018-04-27' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Organizations] OFF
SET IDENTITY_INSERT [dbo].[PackageBranchStock] ON 

INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (1, 2003, 11, N'Naveed Ahmad', 1)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (2, 2003, 18, N'Naveed Ahmad', 2)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (3, 2003, 12, N'Naveed Ahmad', 4)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (5, 2004, 36, N'naveed', 1)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (6, 2004, 21, N'naveed', 2)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (7, 2004, 11, N'naveed', 3)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (8, 2004, 23, N'naveed', 4)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (9, 2003, 12, N'Naveed Ahmad', 3)
INSERT [dbo].[PackageBranchStock] ([Id], [BranchID], [Quantity], [CreatedBy], [WeighBridgeID]) VALUES (10, 2, 12, N'Naveed Ahmad', 3)
SET IDENTITY_INSERT [dbo].[PackageBranchStock] OFF
SET IDENTITY_INSERT [dbo].[PackageIssue] ON 

INSERT [dbo].[PackageIssue] ([Id], [BranchID], [WeighBridgeID], [IssuedQuantity], [IssuePrice], [CustomerID], [ProjectID], [IssuedBranchID], [IssuedBy], [IssuedOn], [IssuedDocument], [IssuedRemarks], [ModifiedBy], [ModifiedOn]) VALUES (1, 2003, 1, 12, 0, 1, NULL, 2003, N'Naveed Ahmad', CAST(N'2018-05-18 10:33:01.633' AS DateTime), NULL, N'gfg', NULL, NULL)
INSERT [dbo].[PackageIssue] ([Id], [BranchID], [WeighBridgeID], [IssuedQuantity], [IssuePrice], [CustomerID], [ProjectID], [IssuedBranchID], [IssuedBy], [IssuedOn], [IssuedDocument], [IssuedRemarks], [ModifiedBy], [ModifiedOn]) VALUES (2, 2003, 1, 12, 0, 2, NULL, 2004, N'Naveed Ahmad', CAST(N'2018-05-18 10:33:28.043' AS DateTime), NULL, N'fa', NULL, NULL)
INSERT [dbo].[PackageIssue] ([Id], [BranchID], [WeighBridgeID], [IssuedQuantity], [IssuePrice], [CustomerID], [ProjectID], [IssuedBranchID], [IssuedBy], [IssuedOn], [IssuedDocument], [IssuedRemarks], [ModifiedBy], [ModifiedOn]) VALUES (3, 2003, 2, 21, 0, 2, NULL, 2004, N'Naveed Ahmad', CAST(N'2018-05-18 10:34:38.417' AS DateTime), NULL, N'fadf', NULL, NULL)
INSERT [dbo].[PackageIssue] ([Id], [BranchID], [WeighBridgeID], [IssuedQuantity], [IssuePrice], [CustomerID], [ProjectID], [IssuedBranchID], [IssuedBy], [IssuedOn], [IssuedDocument], [IssuedRemarks], [ModifiedBy], [ModifiedOn]) VALUES (4, 2004, 2, 12, 200, 2, NULL, 2003, N'naveed', CAST(N'2018-05-18 10:43:44.573' AS DateTime), NULL, N'gfa', NULL, NULL)
INSERT [dbo].[PackageIssue] ([Id], [BranchID], [WeighBridgeID], [IssuedQuantity], [IssuePrice], [CustomerID], [ProjectID], [IssuedBranchID], [IssuedBy], [IssuedOn], [IssuedDocument], [IssuedRemarks], [ModifiedBy], [ModifiedOn]) VALUES (5, 2003, 1, 12, 12, 2, NULL, 2004, N'Naveed Ahmad', CAST(N'2018-05-21 08:41:44.410' AS DateTime), NULL, N'fd', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PackageIssue] OFF
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([Id], [BranchID], [ItemID], [ReceiptQuantity], [ReceiptPrice], [SuplierID], [ReceivedBy], [ReceivedOn], [ReceiptDocument], [ReceiptRemarks], [CreatedBy], [CreateOn], [ModifiedBy], [ModifiedOn]) VALUES (17, 2003, 12, 1, 200, 1, N'Naveed Ahmad', CAST(N'2018-07-05 17:32:58.717' AS DateTime), NULL, N'gre', N'Naveed Ahmad', CAST(N'2018-07-05' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1071, 3, 46, N'Digital Compression', NULL, N'Haris Bin Zaid', CAST(N'2018-06-20 09:42:41.270' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1072, 3, 47, N'Process', NULL, N'Haris Bin Zaid', CAST(N'2018-06-21 16:46:55.177' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1073, 3, 46, N'Bending Beam', NULL, N'Haris Bin Zaid', CAST(N'2018-06-22 12:25:49.747' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2073, 3, 48, N'weighbridge', NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:24:17.633' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2074, 3, 48, N'banch scale', NULL, N'Haris Bin Zaid', CAST(N'2018-06-27 16:24:37.633' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2075, 3, 46, N'TestLoadCell', NULL, N'Haris Bin Zaid', CAST(N'2018-06-29 10:46:42.227' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2076, 3, 60, N'Concrete', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:08:48.407' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2077, 3, 60, N'Steel', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:09:00.537' AS DateTime))
INSERT [dbo].[SubCategory] ([id], [CompanyId], [CatId], [SubCat], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2078, 3, 60, N'MiX', NULL, N'Haris Bin Zaid', CAST(N'2018-07-02 14:09:15.160' AS DateTime))
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [SupplierName], [Address1], [Address2], [City], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (1, N'Mubashar', N'Stree No2', N'Near Scool', N'Lahore', N'Pakistan', N'Haris Bin Zaid', CAST(N'2018-05-21 11:08:30.687' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Supplier] ([Id], [SupplierName], [Address1], [Address2], [City], [Country], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (2, N'Waqas', N'Street4', N'lahore', N'lahore', N'pakistan', N'Haris Bin Zaid', CAST(N'2018-05-21 11:30:16.313' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[TempItermAttribute] ON 

INSERT [dbo].[TempItermAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (339, 1032, 60, 2076, 15, 19, NULL)
INSERT [dbo].[TempItermAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (340, 1032, 60, 2076, 15, 20, N'2018-07-13')
INSERT [dbo].[TempItermAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (341, 1032, 60, 2076, 15, 21, N'20C20')
INSERT [dbo].[TempItermAttribute] ([Id], [ModelID], [CatID], [SubCatID], [ItemID], [AttTypeID], [AttributeValue]) VALUES (342, 1032, 60, 2076, 15, 31, N'fgd')
SET IDENTITY_INSERT [dbo].[TempItermAttribute] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (1003, 1, N'waqas', N'SuperAdmin', N'naveed4147@gmail.com', N'03334531612', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Files/636524039231524669.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'SuperAdmin')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3002, 1002, N'abc', N'Kapco', N'kapco@s.com', N'111', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'HeadOffice')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3008, 3, N'Naveed Ahmad', N'waqas', N'it.naveedahmad@gmail.com', N'03334531612', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3009, 3, N'Tahir', N'mtkhan', N'mtkhan@gmail.com', N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3013, 2002, N'Ahmad', N'Ahmad', N'Ahmad@mail.com', N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'HeadOffice')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3014, 2002, N'tariq', N'Tariq', N'Tariq@mail.com', N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1002, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3015, 2002, N'abbas', N'Abbas', N'Abbas@mail.com', N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1003, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (3017, 2002, N'Shaid Akber', N'Shaid', N's@s.com', N'03334531612', NULL, N'123', N'21-L model town', NULL, N'Lahore', N'Pakistan', NULL, NULL, NULL, NULL, 4, 1006, 1002, NULL, NULL, N'/Files/user.jpg', CAST(N'2018-01-23 00:00:00.000' AS DateTime), NULL, CAST(N'2018-01-29 00:00:00.000' AS DateTime), NULL, NULL, 1, N'Staff')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5012, 1002, N'waqas', N'qw', N'wa@mail.com', N'123', NULL, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2002, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5014, 3, N'Haris Bin Zaid', N'naveed', N'waqas4531@gmail.com', N'00000', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'HeadOffice')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5015, 3, N'Naveed Ahmad', N'naveedahmad', N'naveed@mail.com', N'00000', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5016, 3, N'Naveed Ahmad', N'libra', N'libra@gmail.com', N'03334147309', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2003, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5020, 3, N'waqas bin zaid', N'naaa', N'naaa@mail.com', N'03334147309', N'12345', N'12345', N'lahoe', N'qainchi', N'lahore', N'pakistan', NULL, NULL, NULL, NULL, 3, 1004, 2003, NULL, NULL, N'/Files/user.jpg', CAST(N'2018-04-09 00:00:00.000' AS DateTime), NULL, CAST(N'2018-04-27 00:00:00.000' AS DateTime), NULL, NULL, 1, N'Staff')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5022, 3, N'naveed', N'naveed2', N'navd@gmail.com', N'12345', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2004, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5023, 3, N'Naveed Ahmad', N'nvd123', N'Abc@mail.com', N'00000', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Branch')
INSERT [dbo].[Users] ([id], [CompanyId], [FullName], [UserName], [Email], [UserCal1], [UserCal2], [Password], [Address1], [Address2], [City], [Country], [PerAddress1], [PerAddress2], [PerCity], [PerCountry], [DesigantionId], [DepartmentId], [BranchId], [GradeId], [ReportingMgr], [PictuerPath], [JoininDate], [LeavingDate], [CreatDate], [CraatedBy], [ModifiedDate], [Status], [UserType]) VALUES (5025, 3, N'Kamran Qaiser', N'kamran', N'kamran@gmail.com', N'123456', NULL, N'12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1003, NULL, NULL, NULL, NULL, N'/Files/user.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'HeadOffice')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[WeighBridge] ON 

INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (1, N'Package One', N'Haris Bin Zaid', CAST(N'2018-05-08 16:12:20.607' AS DateTime))
INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (2, N'WeighBridge Light', N'Haris Bin Zaid', CAST(N'2018-05-08 16:13:35.083' AS DateTime))
INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (3, N'WeighBridge Main', N'Haris Bin Zaid', CAST(N'2018-05-08 16:47:41.260' AS DateTime))
INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (4, N'Naveed', N'Haris Bin Zaid', CAST(N'2018-05-10 14:24:14.260' AS DateTime))
INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (5, N'Large Factory Weighbridge', N'Haris Bin Zaid', CAST(N'2018-05-21 08:58:29.640' AS DateTime))
INSERT [dbo].[WeighBridge] ([Id], [Name], [CreatedBy], [CreatedOn]) VALUES (6, N'Small Business', N'Haris Bin Zaid', CAST(N'2018-06-05 09:13:07.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[WeighBridge] OFF
ALTER TABLE [dbo].[Accesories]  WITH CHECK ADD  CONSTRAINT [FK_Accesories_Category] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Accesories] CHECK CONSTRAINT [FK_Accesories_Category]
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
