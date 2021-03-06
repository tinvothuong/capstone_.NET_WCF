USE [master]
GO
/****** Object:  Database [Capstone]    Script Date: 03/10/2014 20:53:51 ******/
CREATE DATABASE [Capstone] ON  PRIMARY 
( NAME = N'Capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Capstone.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Capstone_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Capstone] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Capstone] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Capstone] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Capstone] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Capstone] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Capstone] SET ARITHABORT OFF
GO
ALTER DATABASE [Capstone] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Capstone] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Capstone] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Capstone] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Capstone] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Capstone] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Capstone] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Capstone] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Capstone] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Capstone] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Capstone] SET  DISABLE_BROKER
GO
ALTER DATABASE [Capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Capstone] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Capstone] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Capstone] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Capstone] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Capstone] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Capstone] SET  READ_WRITE
GO
ALTER DATABASE [Capstone] SET RECOVERY FULL
GO
ALTER DATABASE [Capstone] SET  MULTI_USER
GO
ALTER DATABASE [Capstone] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Capstone] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Capstone', N'ON'
GO
USE [Capstone]
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[IDZone] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[IDZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourCompany]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourCompany](
	[IDCompany] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[LegalRepresentative] [nvarchar](50) NOT NULL,
	[TransactionName] [nvarchar](50) NOT NULL,
	[TaxCode] [int] NOT NULL,
	[BusinessLicense] [int] NOT NULL,
	[CertifiedDate] [datetime] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[WebAddress] [nvarchar](100) NULL,
	[Verify] [bit] NULL,
	[ActivationDate] [datetime] NULL,
 CONSTRAINT [PK_TourCompany] PRIMARY KEY CLUSTERED 
(
	[IDCompany] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](70) NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[IdentityCard] [bigint] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Nationality] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IdentityCard] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityTour]    Script Date: 03/10/2014 20:53:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityTour](
	[IDCityTour] [int] IDENTITY(1,1) NOT NULL,
	[IDTour] [int] NULL,
	[IDCity] [int] NULL,
 CONSTRAINT [PK_CityTour] PRIMARY KEY CLUSTERED 
(
	[IDCityTour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTourCompany]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddTourCompany]
			    @IDCompany nvarchar(50)
			   ,@CompanyName nvarchar(200)
			   ,@LegalRepresentative nvarchar(50)
			   ,@TransactionName nvarchar(50)
			   ,@TaxCode int
			   ,@BusinessLicense int
			   ,@CertifiedDate datetime
			   ,@Address nvarchar(200)
			   ,@Phone nvarchar(50)
			   ,@Email nvarchar(50)
			   ,@Password nvarchar(100)
			   ,@WebAddress nvarchar(100)			   
			  
AS
BEGIN
	INSERT INTO TourCompany
			   (IDCompany
			   ,[CompanyName]
			   ,[LegalRepresentative]
			   ,[TransactionName]
			   ,[TaxCode]
			   ,[BusinessLicense]
			   ,[CertifiedDate]
			   ,[Address]
			   ,[Phone]
			   ,[Email]
			   ,[Password]
			   ,[WebAddress]
			   ,[Verify]
			   )
		 VALUES
			   (
				@IDCompany
			   ,@CompanyName
			   ,@LegalRepresentative
			   ,@TransactionName 
			   ,@TaxCode
			   ,@BusinessLicense
			   ,@CertifiedDate
			   ,@Address
			   ,@Phone
			   ,@Email
			   ,@Password
			   ,@WebAddress
			   ,'False'			
			   )

END
GO
/****** Object:  Table [dbo].[RoleDetail]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleDetail](
	[IDDetail] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NOT NULL,
	[AddArticle] [bit] NOT NULL,
	[EditArticle] [bit] NOT NULL,
	[DeleteArticle] [bit] NOT NULL,
	[VerifyArticle] [bit] NULL,
	[VerifyTour] [bit] NULL,
 CONSTRAINT [PK_RoleDetail] PRIMARY KEY CLUSTERED 
(
	[IDDetail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[IDCity] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[IDZone] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[IDCity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestAndRespone]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestAndRespone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCompany] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NULL,
	[Contents] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_RequestAndRespone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[IDRole] [int] NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](70) NULL,
	[Gender] [nvarchar](20) NULL,
	[Image] [nvarchar](max) NULL,
	[Birthday] [datetime] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DateCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCategory]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updateCategory]
		@IDCategory int,
		@NameCategory nvarchar(70),
		@Priority int
AS		
BEGIN
	UPDATE Category
	SET [NameCategory] = @NameCategory
		,[Priority] = @Priority
	WHERE IDCategory =@IDCategory
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategory]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertCategory]
	 @NameCategory nvarchar(70),
     @Priority int
AS
BEGIN
	INSERT INTO Category(NameCategory,Priority)
	VALUES
           (@NameCategory,
            @Priority)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAccount]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertAccount]
			@UserName nvarchar(100)
           ,@Password nvarchar(100)
           ,@Status bit
           ,@IDRole int
           ,@FullName nvarchar(150)          
           ,@Image nvarchar(max)
           ,@DateCreate datetime
           
AS
BEGIN
	INSERT INTO Account
           (UserName
           ,[Password]
           ,[Status]
           ,IDRole
           ,FullName
           ,[Image] 
           ,DateCreate         
           )
     VALUES
           (
			@UserName
           ,@Password
           ,@Status
           ,@IDRole 
           ,@FullName          
           ,@Image
			,@DateCreate
           )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRole]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateRole]
			 @IDRole int
			,@RoleName nvarchar(50)
			,@Description nvarchar(200)
			--Detail
			,@AddArticle  bit
			,@EditArticle bit
			,@DeleteArticle bit
			,@VerifyArticle bit
			,@VerifyTour bit
			

AS
BEGIN
	--Đã tồn tại
	IF EXISTS(SELECT 1 FROM [Role] WHERE IDRole=@IDRole)
		BEGIN
			UPDATE [Role]
				SET [RoleName] = @RoleName
				  ,[Description] = @Description
				WHERE IDRole=@IDRole
			--Update detail Role			
			UPDATE RoleDetail
				SET 
				   [AddArticle] = @AddArticle
				  ,[EditArticle] = @EditArticle
				  ,[DeleteArticle] = @DeleteArticle
				  ,[VerifyArticle] = @VerifyArticle
				  ,[VerifyTour] = @VerifyTour
				WHERE IDRole = @IDRole
		END
	ELSE --INSERT 
		BEGIN
			INSERT INTO [Role]
			   ([RoleName]
			   ,[Description])
			VALUES
				(@RoleName
				,@Description)
				
			DECLARE @IDRoleNew AS INT
			SET @IDRoleNew = @@IDENTITY
		--Detail
			INSERT INTO [RoleDetail]
				   ([IDRole]
				   ,[AddArticle]
				   ,[EditArticle]
				   ,[DeleteArticle]
				   ,[VerifyArticle]
				   ,[VerifyTour])
			 VALUES
				   (@IDRoleNew
				   ,@AddArticle
				   ,@EditArticle
				   ,@DeleteArticle
				   ,@VerifyArticle
				   ,@VerifyTour)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updatePasswordAccount]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updatePasswordAccount]
			 @UserName nvarchar(100)          
			,@Password nvarchar(100)
AS
BEGIN
	UPDATE Account
	SET         
       [Password] = @Password   
 WHERE [UserName] = @UserName   
		
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateAccount]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updateAccount]
			@UserName nvarchar(100)          
           ,@FullName nvarchar(150)
           ,@Address nvarchar(100)
           ,@Email nvarchar(70)
           ,@Gender nvarchar(20)
           ,@Image nvarchar(max)
           ,@Birthday date
           ,@PhoneNumber nvarchar(50)
AS
BEGIN
	UPDATE Account
	SET         
       FullName = @FullName
      ,[Address] = @Address
      ,Email = @Email
      ,Gender = @Gender
      ,[Image] = @Image
      ,Birthday = @Birthday
      ,PhoneNumber = @PhoneNumber
 WHERE UserName = @UserName   
		
	
END
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[IDTerms] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](max) NOT NULL,
	[DateUpdate] [datetime] NOT NULL,
	[Verify] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[IDTerms] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourInfor]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourInfor](
	[IDTour] [int] IDENTITY(1,1) NOT NULL,
	[NameTour] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IDCompany] [nvarchar](50) NULL,
	[ImageTour] [nvarchar](max) NOT NULL,
	[PriceTour] [money] NULL,
	[ExpiredDate] [datetime] NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[DepartPosition] [nvarchar](50) NULL,
	[DepartDate] [datetime] NULL,
	[DayUpdate] [datetime] NOT NULL,
	[IDZone] [int] NULL,
	[TransMethod] [nvarchar](50) NULL,
	[UserName] [nvarchar](100) NULL,
	[Verify] [bit] NOT NULL,
	[EmailNganLuongAcc] [nvarchar](50) NULL,
 CONSTRAINT [PK_TourInfor] PRIMARY KEY CLUSTERED 
(
	[IDTour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[IDArticle] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Contents] [nvarchar](max) NOT NULL,
	[DateOfPost] [datetime] NOT NULL,
	[Source] [nvarchar](50) NOT NULL,
	[Verify] [bit] NULL,
	[MapAdd] [nvarchar](max) NULL,
	[IDCategory] [int] NULL,
	[IDCity] [int] NULL,
	[UserName] [nvarchar](100) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Article_1] PRIMARY KEY CLUSTERED 
(
	[IDArticle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[IDLog] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Contents] [nvarchar](100) NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Task Diary ] PRIMARY KEY CLUSTERED 
(
	[IDLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Introduction]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introduction](
	[IDIntro] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](max) NOT NULL,
	[DateUpdate] [date] NULL,
	[Verifi] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Introduction] PRIMARY KEY CLUSTERED 
(
	[IDIntro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[IDContact] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Tiltle] [nvarchar](200) NULL,
	[Contents] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Contacted] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[IDContact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[IDComment] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ContentCom] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[IDArticle] [int] NOT NULL,
	[Fullname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[IDComment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[insertArticle]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertArticle]
	
	@Title nvarchar(200),
	@Contents nvarchar(max),    
    @Source nvarchar(50),    
    @MapAdd nvarchar(max),
    @IDCategory int,
    @IDCity int,
    @UserName nvarchar(100),
    @Image nvarchar(max)
AS
BEGIN
	INSERT INTO Article
	(
		Title,
		Contents,
		DateOfPost,
		[Source],    
		MapAdd,
		IDCategory,
		IDCity,
		UserName,
		[Image]
		)
	VALUES
	(
		@Title,
		@Contents,
		GETDATE(),
		@Source,    
		@MapAdd,
		@IDCategory,
		@IDCity,
		@UserName,
		@Image
	)
	
END
GO
/****** Object:  Table [dbo].[BookingTour]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingTour](
	[IDBooking] [int] IDENTITY(1,1) NOT NULL,
	[IDTour] [int] NULL,
	[IdentityCard] [bigint] NULL,
	[NumberOfTickets] [int] NULL,
	[TotalAmount] [float] NULL,
	[Status] [bit] NULL,
	[DateBooking] [datetime] NULL,
 CONSTRAINT [PK_BookingTour] PRIMARY KEY CLUSTERED 
(
	[IDBooking] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[updateArticle]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateArticle]
	@IDArticle int,
	@Title nvarchar(200),
	@Contents nvarchar(max),   
    @Source nvarchar(50),    
    @MapAdd nvarchar(max),
    @IDCategory int,
    @IDCity int,
    @UserName nvarchar(100),
    @Image nvarchar(max)
	
AS
BEGIN
	UPDATE Article
	SET 
			Title=@Title,
			Contents=@Contents,
			DateOfPost=GETDATE(),
			[Source]=@Source,			
			MapAdd=@MapAdd,
			IDCategory=@IDCategory,
			IDCity=@IDCity,
			UserName=@UserName,
			[Image]=@Image
   
 WHERE IDArticle = @IDArticle
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTour]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTour]
		   @NameTour nvarchar(50)
		  ,@Description nvarchar(max)		 
		  ,@ImageTour nvarchar(max)
		  ,@PriceTour money		  
		  ,@Duration nvarchar(50)
		  ,@OrderQuantity int
		  ,@DepartPosition  nvarchar(50)
		  ,@DepartDate datetime		 
		  ,@IDZone int
		  ,@TransMethod nvarchar(50)
		  ,@EmailNganLuongAcc nvarchar(50)
		  ,@IDTour int
AS
BEGIN
	UPDATE TourInfor
	   SET [NameTour] = @NameTour
		  ,[Description] = @Description		 
		  ,[ImageTour] = @ImageTour
		  ,[PriceTour] = @PriceTour		
		  ,[Duration] = @Duration
		  ,[OrderQuantity] = @OrderQuantity
		  ,[DepartPosition] = @DepartPosition
		  ,[DepartDate] = @DepartDate
		  ,[DayUpdate] = GETDATE()
		  ,[IDZone] = @IDZone
		  ,[TransMethod] = @TransMethod
		  ,[EmailNganLuongAcc] = @EmailNganLuongAcc
		  
	 WHERE IDTour=@IDTour
	 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTerms]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTerms]
		 @Contents nvarchar(max)
		,@UserName nvarchar(100)

AS
BEGIN
	UPDATE Terms
		SET [Contents] = @Contents
		  ,[DateUpdate] = GETDATE()
		  ,[Verify] = 'true'
		  ,[UserName] = @UserName
		
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PostTour]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PostTour]
			@NameTour nvarchar(50)
           ,@Description nvarchar(max)
           ,@IDCompany nvarchar(50)
           ,@ImageTour nvarchar(max)
           ,@PriceTour money           
           ,@Duration nvarchar(50)
           ,@OrderQuantity int
           ,@DepartPosition nvarchar(50)
           ,@DepartDate datetime     
           ,@IDZone int
           ,@TransMethod nvarchar(50)
           ,@EmailNganLuongAcc nvarchar(50)

AS
BEGIN
	INSERT INTO [TourInfor]
           ([NameTour]
           ,[Description]
           ,[IDCompany]
           ,[ImageTour]
           ,[PriceTour]           
           ,[Duration]
           ,[OrderQuantity]
           ,[DepartPosition]
           ,[DepartDate]
           ,[DayUpdate]
           ,[IDZone]
           ,[TransMethod]           
           ,[Verify]
           ,[EmailNganLuongAcc])
     VALUES
           (
            @NameTour
           ,@Description
           ,@IDCompany
           ,@ImageTour
           ,@PriceTour           
           ,@Duration
           ,@OrderQuantity
           ,@DepartPosition
           ,@DepartDate
           ,GETDATE()
           ,@IDZone
           ,@TransMethod    
           ,'false'
           ,@EmailNganLuongAcc
			)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Log]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Log]
			@UserName nvarchar(100)
           ,@Contents nvarchar(100)  
AS
BEGIN
	INSERT INTO [Log]
           ([UserName]
           ,[Contents]
           ,[DateTime])
     VALUES
          (
			@UserName,
			@Contents,
			GETDATE()
          )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertTour]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertTour]
   @NameTour nvarchar(50),
   @Description nvarchar(max),
   @IDCompany int,
   @ImageTour nvarchar(max),
   @PriceTour money,
   @ExpiredDate datetime,
   @Duration nvarchar(50),
   @OrderQuantity int,
   @DepartPosition nvarchar(50),
   @DepartDate datetime,
   @DayUpdate datetime,
   @IDZone int,
   @TransMethod nvarchar(50),
   
   @EmailNganLuongAcc nvarchar(50)
 
 
 
AS
BEGIN
--
INSERT INTO TourInfor
           ([NameTour]
           ,[Description]
           ,[IDCompany]
           ,[ImageTour]
           ,[PriceTour]
           ,[ExpiredDate]
           ,[Duration]
           ,[OrderQuantity]
           ,[DepartPosition]
           ,[DepartDate]
           ,[DayUpdate]
           ,[IDZone]
           ,[TransMethod]
           ,[UserName]
           ,[Verify]
           ,[EmailNganLuongAcc])
     VALUES
           (
		   @NameTour,
		   @Description,
		   @IDCompany,
		   @ImageTour,
		   @PriceTour,
		   @ExpiredDate,
		   @Duration,
		   @OrderQuantity,
		   @DepartPosition,
		   @DepartDate,
		   @DayUpdate,
		   @IDZone,
		   @TransMethod,
		   NULL,
		   'False',
		   @EmailNganLuongAcc
           )
--

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertContact]
			@FullName nvarchar(20)
           ,@Address nvarchar(50)
           ,@Phone nvarchar(50)
           ,@Email nvarchar(50)
           ,@Tiltle nvarchar(200)
           ,@Contents nvarchar(max)
          

AS
BEGIN
	INSERT INTO [Capstone].[dbo].[Contact]
           ([FullName]
           ,[Address]
           ,[Phone]
           ,[Email]
           ,[Tiltle]
           ,[Contents]
           ,[Date]
           , Contacted)
     VALUES
           (@FullName
           ,@Address
           ,@Phone
           ,@Email 
           ,@Tiltle 
           ,@Contents 
           ,GETDATE()
           , 'false')
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateIntroduction]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateIntroduction]
		 @Contents nvarchar(max)
		,@UserName nvarchar(100)
AS
BEGIN
		UPDATE Introduction
	    SET [Contents] = @Contents
		  ,[DateUpdate] = GETDATE()
		  ,[Verifi] = 'true'
		  ,[UserName] = @UserName
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bookingTour]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_bookingTour]
	  @IDTour int
     ,@IdentityCard bigint
     ,@NumberOfTickets int
     ,@TotalAmount float     
     --Infor customer
     ,@FullName nvarchar(50)
     ,@Address nvarchar(200)
     ,@Gender nvarchar(50)
     ,@Phone nvarchar(50)
     ,@Email nvarchar(50)    
    
     
AS
BEGIN
	--Update Customer
	--Đã tồn tại khách hàng-update
	IF EXISTS(SELECT 1 FROM Customer WHERE IdentityCard=@IdentityCard)
		BEGIN
			UPDATE Customer
			   SET 
				   [FullName] = @FullName
				  ,[Address] = @Address
				  ,[Gender] = @Gender
				  ,[Phone] = @Phone
				  ,[Email] = @Email	
			 WHERE [IdentityCard] = @IdentityCard
		END
	ELSE --INSERT customer
		BEGIN
			INSERT INTO Customer
           ([IdentityCard]
           ,[FullName]
           ,[Address]
           ,[Gender]
           ,[Phone]
           ,[Email])
     VALUES
           (@IdentityCard,
           @FullName, 
           @Address, 
           @Gender,
           @Phone, 
           @Email)          
          
		END
	--Booking
	INSERT INTO BookingTour
           ([IDTour]
           ,[IdentityCard]
           ,[NumberOfTickets]
           ,[TotalAmount]
           ,[Status])
     VALUES
           (@IDTour
           ,@IdentityCard
           ,@NumberOfTickets
           ,@TotalAmount
           ,'FALSE')
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertComment]    Script Date: 03/10/2014 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertComment]
			@Date datetime
           ,@ContentCom nvarchar(max)
           ,@Email nvarchar(100)
           ,@IDArticle int
           ,@Fullname nvarchar(50)
AS
BEGIN
	INSERT INTO Comment
	       ([Date]
           ,[ContentCom]
           ,[Email]
           ,[IDArticle]
           ,[Fullname])
     VALUES
           (@Date 
           ,@ContentCom
           ,@Email 
           ,@IDArticle
           ,@Fullname )
	
END
GO
/****** Object:  ForeignKey [FK_RoleDetail_Role]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[RoleDetail]  WITH CHECK ADD  CONSTRAINT [FK_RoleDetail_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleDetail] CHECK CONSTRAINT [FK_RoleDetail_Role]
GO
/****** Object:  ForeignKey [FK_City_Zone]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Zone] FOREIGN KEY([IDZone])
REFERENCES [dbo].[Zone] ([IDZone])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Zone]
GO
/****** Object:  ForeignKey [FK_RequestAndRespone_TourCompany]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[RequestAndRespone]  WITH CHECK ADD  CONSTRAINT [FK_RequestAndRespone_TourCompany] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[TourCompany] ([IDCompany])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestAndRespone] CHECK CONSTRAINT [FK_RequestAndRespone_TourCompany]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_Terms_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Terms]  WITH CHECK ADD  CONSTRAINT [FK_Terms_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Terms] CHECK CONSTRAINT [FK_Terms_Account]
GO
/****** Object:  ForeignKey [FK_TourInfor_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[TourInfor]  WITH CHECK ADD  CONSTRAINT [FK_TourInfor_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TourInfor] CHECK CONSTRAINT [FK_TourInfor_Account]
GO
/****** Object:  ForeignKey [FK_TourInfor_TourCompany]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[TourInfor]  WITH CHECK ADD  CONSTRAINT [FK_TourInfor_TourCompany] FOREIGN KEY([IDCompany])
REFERENCES [dbo].[TourCompany] ([IDCompany])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TourInfor] CHECK CONSTRAINT [FK_TourInfor_TourCompany]
GO
/****** Object:  ForeignKey [FK_TourInfor_Zone]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[TourInfor]  WITH CHECK ADD  CONSTRAINT [FK_TourInfor_Zone] FOREIGN KEY([IDZone])
REFERENCES [dbo].[Zone] ([IDZone])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TourInfor] CHECK CONSTRAINT [FK_TourInfor_Zone]
GO
/****** Object:  ForeignKey [FK_Article_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Account]
GO
/****** Object:  ForeignKey [FK_Article_Category]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([IDCategory])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
/****** Object:  ForeignKey [FK_Article_City]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_City] FOREIGN KEY([IDCity])
REFERENCES [dbo].[City] ([IDCity])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_City]
GO
/****** Object:  ForeignKey [FK_Log_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Account]
GO
/****** Object:  ForeignKey [FK_Introduction_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Introduction]  WITH CHECK ADD  CONSTRAINT [FK_Introduction_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Introduction] CHECK CONSTRAINT [FK_Introduction_Account]
GO
/****** Object:  ForeignKey [FK_Contact_Account]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([UserName])
REFERENCES [dbo].[Account] ([UserName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
/****** Object:  ForeignKey [FK_Comment_Article]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([IDArticle])
REFERENCES [dbo].[Article] ([IDArticle])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
/****** Object:  ForeignKey [FK_BookingTour_Customer]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[BookingTour]  WITH CHECK ADD  CONSTRAINT [FK_BookingTour_Customer] FOREIGN KEY([IdentityCard])
REFERENCES [dbo].[Customer] ([IdentityCard])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[BookingTour] CHECK CONSTRAINT [FK_BookingTour_Customer]
GO
/****** Object:  ForeignKey [FK_BookingTour_TourInfor]    Script Date: 03/10/2014 20:54:37 ******/
ALTER TABLE [dbo].[BookingTour]  WITH CHECK ADD  CONSTRAINT [FK_BookingTour_TourInfor] FOREIGN KEY([IDTour])
REFERENCES [dbo].[TourInfor] ([IDTour])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[BookingTour] CHECK CONSTRAINT [FK_BookingTour_TourInfor]
GO
