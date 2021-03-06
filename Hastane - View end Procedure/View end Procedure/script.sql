USE [MHRSHospital]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[AppointmentTime] [datetime] NOT NULL,
	[AppointmentStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicID] [int] IDENTITY(1,1) NOT NULL,
	[ClinicBranch] [nvarchar](50) NOT NULL,
	[TimeRange] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorFirstName] [nvarchar](50) NOT NULL,
	[DoctorLastName] [nvarchar](50) NOT NULL,
	[TittleID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [nvarchar](50) NOT NULL,
	[TownID] [int] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HospitalClinic]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalClinic](
	[HospitalID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalClinic] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC,
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IdentitiyNumber] [bigint] NOT NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CellPhone] [bigint] NOT NULL,
	[HomePhone] [bigint] NOT NULL,
	[SecurityQuestion] [nvarchar](50) NOT NULL,
	[Answer] [nvarchar](50) NOT NULL,
	[PlaceOfBirth] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
	[Picture] [varchar](50) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientLogin]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientLogin](
	[UserID] [int] NOT NULL,
	[IdentitiyNumber] [bigint] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PatientLogin] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tittle]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tittle](
	[TittleID] [int] IDENTITY(1,1) NOT NULL,
	[TittleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tittle] PRIMARY KEY CLUSTERED 
(
	[TittleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[TownName] [nvarchar](50) NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vW_GetAppointment]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vW_GetAppointment]
AS
select AppointmentID,pati.PatientID,pati.FirstName + ' ' + pati.LastName [PatientFullName],doc.DoctorID,DoctorFirstName+ ' '+doc.DoctorLastName [DoctorFullName] ,AppointmentDate,AppointmentTime from Appointment apo
inner join Patient pati on pati.PatientID=apo.PatientID
inner join Doctor doc on doc.DoctorID=apo.DoctorID
    where AppointmentStatus=0
WITH CHECK OPTION 
GO
/****** Object:  View [dbo].[vW_GetHospitalDetails]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vW_GetHospitalDetails]
AS
SELECT c.CityID,c.CityName,t.TownID,t.TownName,h.HospitalID,h.HospitalName,cli.ClinicBranch,cli.ClinicID,cli.EndTime,cli.StartTime,cli.TimeRange,doc.Deleted,doc.DoctorFirstName + ' ' + doc.DoctorLastName [DoctorFullName],doc.DoctorID,tit.TittleID,tit.TittleName from City c
join Town t ON t.CityID = c.CityID
join Hospital h on h.TownID = t.TownID
join HospitalClinic hc on hc.HospitalID = h.HospitalID
join Clinic cli on cli.ClinicID = hc.ClinicID
join Doctor doc on doc.ClinicID = cli.ClinicID
join Tittle tit on tit.TittleID = doc.TittleID
with check option

GO
/****** Object:  View [dbo].[vW_GetPatient]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vW_GetPatient]
AS
Select PatientID,FirstName+' '+LastName [FullName], IdentitiyNumber,Gender,DateOfBirth,Email,Password,CellPhone,HomePhone,SecurityQuestion,Answer,PlaceOfBirth,MotherName,FatherName From Patient Where Deleted=0
WITH CHECK OPTION

GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [DoctorID], [AppointmentDate], [AppointmentTime], [AppointmentStatus]) VALUES (5, 1, 2, CAST(N'2016-10-07 00:00:00.000' AS DateTime), CAST(N'2016-10-07 17:00:00.000' AS DateTime), 0)
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [DoctorID], [AppointmentDate], [AppointmentTime], [AppointmentStatus]) VALUES (7, 4, 3, CAST(N'2016-10-11 00:00:00.000' AS DateTime), CAST(N'2016-10-07 15:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Istanbul')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N's')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'Ankara')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Clinic] ON 

INSERT [dbo].[Clinic] ([ClinicID], [ClinicBranch], [TimeRange], [StartTime], [EndTime]) VALUES (1, N'Iç Hastalıkları', 10, CAST(N'2016-10-07 08:00:00.000' AS DateTime), CAST(N'2016-10-07 16:30:00.000' AS DateTime))
INSERT [dbo].[Clinic] ([ClinicID], [ClinicBranch], [TimeRange], [StartTime], [EndTime]) VALUES (2, N'KBB', 15, CAST(N'2016-10-07 08:00:00.000' AS DateTime), CAST(N'2016-10-07 16:30:00.000' AS DateTime))
INSERT [dbo].[Clinic] ([ClinicID], [ClinicBranch], [TimeRange], [StartTime], [EndTime]) VALUES (3, N'Yoğun Bakım', 10, CAST(N'2016-10-07 08:00:00.000' AS DateTime), CAST(N'2016-10-07 16:30:00.000' AS DateTime))
INSERT [dbo].[Clinic] ([ClinicID], [ClinicBranch], [TimeRange], [StartTime], [EndTime]) VALUES (4, N'Çocuk Hastalıkları', 10, CAST(N'2016-10-07 08:00:00.000' AS DateTime), CAST(N'2016-10-07 16:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Clinic] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DoctorID], [DoctorFirstName], [DoctorLastName], [TittleID], [ClinicID], [Deleted]) VALUES (2, N'Yiğit', N'Taş', 1, 2, 0)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorFirstName], [DoctorLastName], [TittleID], [ClinicID], [Deleted]) VALUES (3, N'Serkan', N'Soydam', 2, 3, 0)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorFirstName], [DoctorLastName], [TittleID], [ClinicID], [Deleted]) VALUES (4, N'Ayça', N'Calayır', 4, 1, 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorFirstName], [DoctorLastName], [TittleID], [ClinicID], [Deleted]) VALUES (5, N'Muhittin', N'Mu', 1, 2, 0)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [TownID]) VALUES (1, N'Doktor Sadi Konuk', 1)
INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [TownID]) VALUES (2, N'Balta Limanı Araştırma Hastanesi', 1)
INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [TownID]) VALUES (3, N'Numune Hastanesi', 2)
INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [TownID]) VALUES (4, N'Acıbadem Medipol Hastanesi', 2)
SET IDENTITY_INSERT [dbo].[Hospital] OFF
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (1, 1)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (1, 2)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (1, 4)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (2, 1)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (3, 2)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (3, 4)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (4, 1)
INSERT [dbo].[HospitalClinic] ([HospitalID], [ClinicID]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [IdentitiyNumber], [Gender], [DateOfBirth], [Email], [Password], [CellPhone], [HomePhone], [SecurityQuestion], [Answer], [PlaceOfBirth], [MotherName], [FatherName], [Deleted], [Picture]) VALUES (1, N'Turgay', N'Kaya', 12345678910, N'Erkek', CAST(N'1933-03-14 00:00:00.000' AS DateTime), N'yiwit.tas@gmail.com', N'123456', 53737125869, 2164875412, N'Köpeğin İsmi', N'AT', N'Istanbul', N'Ayşe', N'Mahmut', 0, NULL)
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [IdentitiyNumber], [Gender], [DateOfBirth], [Email], [Password], [CellPhone], [HomePhone], [SecurityQuestion], [Answer], [PlaceOfBirth], [MotherName], [FatherName], [Deleted], [Picture]) VALUES (4, N'Ozan', N'Kuş', 12345678510, N'Kadın', CAST(N'1990-02-14 00:00:00.000' AS DateTime), N'aop@gmail.com', N'564787', 54542135548, 124548783, N'Atın ismi', N'köpek', N'Izmır', N'Mahmut', N'Ayşe', 1, NULL)
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [IdentitiyNumber], [Gender], [DateOfBirth], [Email], [Password], [CellPhone], [HomePhone], [SecurityQuestion], [Answer], [PlaceOfBirth], [MotherName], [FatherName], [Deleted], [Picture]) VALUES (6, N'Ferhat', N'Yılmaz', 560982213874, N'Male', CAST(N'1992-04-04 00:00:00.000' AS DateTime), N'ferht@gmail.com', N'1', 4567976547, 7359093645, N'En sevdiğin Pokomon', N'Balbazaar', N'Konya', N' ', N' ', 0, N' ')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [IdentitiyNumber], [Gender], [DateOfBirth], [Email], [Password], [CellPhone], [HomePhone], [SecurityQuestion], [Answer], [PlaceOfBirth], [MotherName], [FatherName], [Deleted], [Picture]) VALUES (7, N'Ferhat', N'Yılmaz', 560982213874, N'Male', CAST(N'1992-04-04 00:00:00.000' AS DateTime), N'ferht@gmail.com', N's', 4567976547, 7359093645, N'En sevdiğin Pokomon', N'Balbazaar', N'Konya', N' ', N' ', 0, N' ')
INSERT [dbo].[Patient] ([PatientID], [FirstName], [LastName], [IdentitiyNumber], [Gender], [DateOfBirth], [Email], [Password], [CellPhone], [HomePhone], [SecurityQuestion], [Answer], [PlaceOfBirth], [MotherName], [FatherName], [Deleted], [Picture]) VALUES (8, N'Ferhat', N'Yılmaz', 560982213874, N'Male', CAST(N'1992-04-04 00:00:00.000' AS DateTime), N'ferht@gmail.com', N'1234566', 4567976547, 7359093645, N'En sevdiğin Pokomon', N'Balbazaar', N'Konya', N' ', N' ', 0, N' ')
SET IDENTITY_INSERT [dbo].[Patient] OFF
INSERT [dbo].[PatientLogin] ([UserID], [IdentitiyNumber], [Password]) VALUES (1, 12345678910, N'123456')
INSERT [dbo].[PatientLogin] ([UserID], [IdentitiyNumber], [Password]) VALUES (4, 12345678510, N'564787')
SET IDENTITY_INSERT [dbo].[Tittle] ON 

INSERT [dbo].[Tittle] ([TittleID], [TittleName]) VALUES (1, N'Uzman Doktor')
INSERT [dbo].[Tittle] ([TittleID], [TittleName]) VALUES (2, N'Profösör')
INSERT [dbo].[Tittle] ([TittleID], [TittleName]) VALUES (3, N'Doçent')
INSERT [dbo].[Tittle] ([TittleID], [TittleName]) VALUES (4, N'Doçent Yardımcısı')
INSERT [dbo].[Tittle] ([TittleID], [TittleName]) VALUES (5, N'Pratisyen')
SET IDENTITY_INSERT [dbo].[Tittle] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([TownID], [TownName], [CityID]) VALUES (1, N'Bakırköy', 1)
INSERT [dbo].[Town] ([TownID], [TownName], [CityID]) VALUES (2, N'Kadıköy', 1)
INSERT [dbo].[Town] ([TownID], [TownName], [CityID]) VALUES (3, N'Karşıyaka', 2)
INSERT [dbo].[Town] ([TownID], [TownName], [CityID]) VALUES (4, N'Bornova', 2)
INSERT [dbo].[Town] ([TownID], [TownName], [CityID]) VALUES (5, N'Kızılay', 3)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Doctor]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Patient]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Clinic]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Tittle] FOREIGN KEY([TittleID])
REFERENCES [dbo].[Tittle] ([TittleID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Tittle]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_Town] FOREIGN KEY([TownID])
REFERENCES [dbo].[Town] ([TownID])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_Town]
GO
ALTER TABLE [dbo].[HospitalClinic]  WITH CHECK ADD  CONSTRAINT [FK_HospitalClinic_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[HospitalClinic] CHECK CONSTRAINT [FK_HospitalClinic_Clinic]
GO
ALTER TABLE [dbo].[HospitalClinic]  WITH CHECK ADD  CONSTRAINT [FK_HospitalClinic_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([HospitalID])
GO
ALTER TABLE [dbo].[HospitalClinic] CHECK CONSTRAINT [FK_HospitalClinic_Hospital]
GO
ALTER TABLE [dbo].[PatientLogin]  WITH CHECK ADD  CONSTRAINT [FK_PatientLogin_Patient] FOREIGN KEY([UserID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[PatientLogin] CHECK CONSTRAINT [FK_PatientLogin_Patient]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_City]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddPatient]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AddPatient]
@FirtsName nvarchar(50),
@LastName nvarchar(50),
@IdentityNumber bigint,
@Gender nvarchar(5),
@DateOfBirth datetime,
@Email nvarchar(50),
@Password nvarchar(50),
@CellPhone bigint,
@HomePhone bigint,
@SecurityQuestion nvarchar(50),
@Answer nvarchar(50),
@PlaceOfBirth nvarchar(50)=' ',
@MotherName nvarchar(50)=' ',
@FatherName nvarchar(50)=' ',
@Picture nvarchar(50)=' ',
@Deleted bit =0
AS
BEGIN
Insert into Patient (FirstName,LastName,IdentitiyNumber,Gender,DateOfBirth,Email,Password,CellPhone,HomePhone,SecurityQuestion,Answer,PlaceOfBirth,MotherName,FatherName,Picture,Deleted) Values(@FirtsName,@LastName,@IdentityNumber,@Gender,@DateOfBirth,@Email,@Password,@CellPhone,@HomePhone,@SecurityQuestion,@Answer,@PlaceOfBirth,@MotherName,@FatherName,@Picture,@Deleted)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAppointmentID]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_GetAppointmentID]
@AppointmentID int
AS
BEGIN
SELECT *FROM vW_GetAppointment where AppointmentID=@AppointmentID
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPatientID]    Script Date: 7.10.2016 21:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_GetPatientID]
@PatientId int
AS
BEGIN
SELECT*FROM [vW_GetPatient] where PatientID=@PatientId
END 
GO
