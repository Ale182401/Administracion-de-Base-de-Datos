USE [master]
GO
/****** Object:  Database [AkirasBoutiques]    Script Date: 26/7/2022 17:11:20 ******/
CREATE DATABASE [AkirasBoutiques]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkirasBoutiques', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AkirasBoutiques_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AkirasBoutiques] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AkirasBoutiques].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ARITHABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AkirasBoutiques] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET  MULTI_USER 
GO
ALTER DATABASE [AkirasBoutiques] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AkirasBoutiques] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AkirasBoutiques] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AkirasBoutiques] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AkirasBoutiques] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AkirasBoutiques] SET QUERY_STORE = OFF
GO
USE [AkirasBoutiques]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[apellido] [text] NOT NULL,
	[direccion] [text] NOT NULL,
	[fec_nac] [date] NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_detalle] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [date] NULL,
	[id_detalle] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[precio] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (1, N'Blusa', N'Prenda abierta de tela fina , similar a la camisa , que usan las mujeres y los niños , y que cubre la parte superior del cuerpo')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (2, N'Falda', N'Prenda de vestir que cuelga de la cintura y cubre las piernas, al menos en parte. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (3, N'Pantalón', N'Prenda de vestir que se ajusta a la cintura y llega generalmente hasta el pie , cubriendo cada pierna separadamente .')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (4, N'Pijama', N'Conjunto de chaqueta o camiseta y pantalón a juego que se usa para dormir.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (5, N'Camisa', N'Prenda de vestir que cubre el tronco hasta la cadera o medio muslo, con cuello, manga corta o larga, que se abrocha por delante con botones; suele llevar un canesú en la espalda que permite dar amplitud al cuerpo de la prenda.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (6, N'Zapato', N'pieza de calzado que protege al pie, brindándole comodidad a la persona a la hora de llevar a cabo diferentes acciones')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (7, N'Chamarra', N'Prenda amplia de vestir, rústica, de abrigo, que cubre el cuerpo hasta medio muslo, hecha de piel con lana o pelo por fuera o por dentro.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (8, N'Suéter', N'Prenda de punto elástico, manual o mecánico, de lana, algodón o alguna fibra sintética, cerrado o abierto por delante, con escote o cuello de distinto tipo y generalmente manga larga, que cubre el cuerpo hasta la cadera o medio muslo.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (9, N'Vestido', N'Prenda que se asocia con la elegancia femenina y clásica. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (10, N'Accesorios', N'Completan el look, le dan un aire renovado a nuestras prendas. Collares, accesorios para el pelo, joyas, zapatos, carteras, cinturones')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (0, N'María Antonieta', N'García Meléndez ', N'Calle las Girasol #305 col. Jardines ', CAST(N'1989-06-15' AS Date), 1828921321, N'mariantonia@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (1, N'Óscar Germán', N'Wong Tabares ', N'Calle Revolución #879 col. México', CAST(N'1994-01-28' AS Date), 2035672143, N'germanwong@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (2, N'Valentina Anastasia', N'Huerta Corral', N'Calle Flamenco #3493 col. Aviar', CAST(N'1992-07-03' AS Date), 0, N'valehue92@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (3, N'Luisa Beatriz ', N'Rodríguez Estrada', N'Calle Ruiseño #1903 col. Aviar', CAST(N'1995-02-21' AS Date), 2034598383, N'betyrodri@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (4, N'Ana Maribel ', N'Cedillo Núñez ', N'Calle Ecuador #278 col. Latinoamérica', CAST(N'1986-09-25' AS Date), 1783920982, N'anamari86@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (5, N'Sara Valeria ', N'Jiménez Sánchez', N'calle Amarillo #890 col. Colores', CAST(N'1990-10-23' AS Date), 1025675109, N'valesarita@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (6, N'Rodrigo Enrique', N'García Monreal ', N'Calle Guadiana #905 fracc. Guadiana', CAST(N'1993-03-29' AS Date), 2146982372, N'rodrimonreal@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (7, N'Marina Gabriela', N'Villanueva Barrios', N'Calle Luna #560 fracc. Cosmos', CAST(N'1993-06-04' AS Date), 1161728372, N'marigaby@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (8, N'Luis Francisco', N'Bernal Casas', N'Calle Porfirio #246 col. Revolución', CAST(N'1996-01-22' AS Date), 2034573621, N'luispacober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (9, N'Rebeca Elizabeth ', N'Puentes Ríos', N'Calle Domingo #1929 col. Buendia', CAST(N'1988-10-18' AS Date), 123459834, N'rebepuentes88@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (10, N'Yesenia Beatriz', N'Quintanilla Torres', N'Calle Roble #405 col. Singapur', CAST(N'1984-01-24' AS Date), 1328902183, N'betyquintanilla@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (11, N'Rodrigo Ismael', N'Silva Ugarte', N'Calle Tamarino #1209 fracc. Mezquital', CAST(N'1996-05-14' AS Date), 1436784145, N'rodriisma@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (12, N'Rosa Hortencia ', N'Rosas Morales', N'Calle Margarita #2892 col Jardines', CAST(N'1983-01-15' AS Date), 1923925489, N'rositarosas@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (13, N'Gabriela Cassandra', N'Quiñones Escobar', N'Calle Dolores #239 col. Del Río', CAST(N'1987-11-15' AS Date), 2113840192, N'cassqui87@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (14, N'Sara Roberta ', N'Moreno Moreno', N'Calle Colinas #912 col. Colinas del norte', CAST(N'1982-12-14' AS Date), 1244930285, N'saritarober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (15, N'María Fernanda', N'Ávila Nuñez', N'Calle Nunó #594 col. Personajes', CAST(N'1995-09-13' AS Date), 1207583929, N'mariafer95@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (16, N'Camilo Isaac', N'Peña Huerta', N'Calle Niños Héroes #1239 col. México ', CAST(N'1987-01-20' AS Date), 1293904389, N'camisac@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (17, N'Zayra Manuela', N'Gómez López ', N'Calle Rosales #390 Fracc. Las flores', CAST(N'1977-10-28' AS Date), 1283094033, N'zaygom77@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (18, N'Rosa Alicia ', N'Reyes Nájera ', N'Calle Flautín #1459 col. La Orquesta', CAST(N'1984-11-20' AS Date), 125940940, N'rosealice84@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (19, N'Juan Roberto  ', N'Ortega Rincón', N'Calle Los Álamos #4902 Fracc. Monreal', CAST(N'1986-07-31' AS Date), 1489328581, N'roberortega@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (21, N'Sandra Isabella ', N'Pereyra Félix ', N'Calle Azalea #901 Fracc. Las Flores', CAST(N'1990-04-09' AS Date), 1289394301, N'peyfex90@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (22, N'Rogelia Margarita ', N'Cruz Santos ', N'Calle Golondrinas #9023 col. Felipe Ángeles', CAST(N'1986-05-11' AS Date), 1925678302, N'margaritacruz@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (23, N'Julieta Odette ', N'Rocha Ramazzoti', N'Calle Río Bravo #2013 Fracc. TierraBlanca', CAST(N'1993-07-16' AS Date), 1293391028, N'julyramazzoti@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (24, N'Dante Eduardo', N'Dolores Meza', N'Calle Miguel Ángel #439 col. Renacimiento', CAST(N'1993-07-15' AS Date), 2023950349, N'danteduardo93@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (25, N'Bianca Alejandra', N'Rosales Rosas', N'Calle Rueda #1924 col. Emprendedores ', CAST(N'1987-06-26' AS Date), 1821039583, N'rosasbianca@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (26, N'Fabiola Elena', N'Reséndiz Amador ', N'Calle Melchor Ocampo #901 col. Libertadores', CAST(N'1994-08-18' AS Date), 1294024901, N'fabielle94@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (27, N'Miriam Karina', N'Lara Ruíz', N'Sta. María del Oro #423 col. Nazas', CAST(N'1990-07-26' AS Date), 2014893018, N'mirilara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (28, N'Valeria Jimena', N'De la O Tabares ', N'Calle Crisantema #311 col. PRI Amp', CAST(N'1986-08-15' AS Date), 1024792478, N'valejimena@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (29, N'Juan Humberto', N'Martínez Fuentes', N'Calle Agustín de Anda #608 fracc. Valle del Guadiana', CAST(N'1989-10-17' AS Date), 1924802840, N'juanmar@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (30, N'Melissa Ximena', N'Zaragoza Suárez', N'Calle Río Piaxtla #4380 col Valle del Sur', CAST(N'1986-05-15' AS Date), 2018438929, N'melizara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (31, N'Cristina Miranda ', N'Morales Rueda ', N'Calle Magnolia #113 Fracc Jardines', CAST(N'1987-08-16' AS Date), 1034920394, N'crismiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (32, N'Bruno Alejandro', N'Miranda López', N'Calle del Roble #702, fracc. Jardines del Real IV', CAST(N'1988-06-29' AS Date), 1893019749, N'brunomiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (33, N'Helena Emilia', N'Robles Espinoza ', N'Calle Plan de Agua Prieta #128 Col Emiliano Zapata', CAST(N'1987-10-28' AS Date), 1892081803, N'helenarobles@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (34, N'Teresa Renata', N'Zavala Piña', N'Calle Chiapas #205 col. Morga', CAST(N'1985-02-20' AS Date), 1029482019, N'terezavala@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (35, N'Wendy Carolina ', N'Piña Quiñones', N'Calle Gral Fco. Arrieta #211 col. Gral Domingo Arrieta', CAST(N'1995-07-19' AS Date), 1928001001, N'carowendy@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (36, N'Jesús Alberto', N'Hidalgo Correa ', N'Calle 3 de Agosto #308, col Tierra y Libertad', CAST(N'1985-01-18' AS Date), 1890290832, N'chuybeto@gmail.com')
GO
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (1, 32, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (2, 8, 3, 690)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (3, 39, 4, 200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (4, 26, 1, 110)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (5, 30, 4, 1800)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (6, 2, 5, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (7, 14, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (8, 36, 2, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (9, 25, 1, 1050)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (10, 34, 1, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (11, 12, 6, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (12, 13, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (13, 21, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (14, 24, 8, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (15, 31, 2, 900)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (16, 22, 1, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (17, 5, 7, 1750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (18, 3, 4, 400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (19, 11, 2, 558)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (20, 4, 6, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (21, 7, 6, 720)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (22, 10, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (23, 33, 4, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (24, 39, 10, 500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (25, 20, 8, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (26, 27, 2, 1400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (27, 35, 4, 4200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (28, 29, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (29, 38, 6, 450)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (30, 28, 1, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (31, 18, 6, 1620)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (32, 25, 6, 6300)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (33, 30, 3, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (34, 26, 5, 5500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (35, 40, 10, 1000)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (36, 21, 9, 4950)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (37, 12, 3, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (38, 8, 6, 1380)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (39, 11, 4, 1116)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (40, 4, 8, 800)
GO
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (1, 9, CAST(N'2021-12-22' AS Date), 1)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (2, 9, CAST(N'2021-10-11' AS Date), 2)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (3, 4, CAST(N'2021-12-07' AS Date), 3)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (4, 4, CAST(N'2021-08-24' AS Date), 4)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (5, 1, CAST(N'2021-09-24' AS Date), 5)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (6, 1, CAST(N'2022-01-08' AS Date), 6)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (7, 0, CAST(N'2022-01-01' AS Date), 7)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (8, 0, CAST(N'2021-12-28' AS Date), 8)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (9, 3, CAST(N'2022-01-11' AS Date), 9)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (10, 3, CAST(N'2022-01-16' AS Date), 10)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (11, 2, CAST(N'2021-07-13' AS Date), 11)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (12, 2, CAST(N'2022-01-05' AS Date), 12)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (13, 6, CAST(N'2022-01-12' AS Date), 13)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (14, 6, CAST(N'2021-12-22' AS Date), 14)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (15, 5, CAST(N'2021-11-18' AS Date), 15)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (16, 5, CAST(N'2022-01-09' AS Date), 16)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (17, 7, CAST(N'2021-10-12' AS Date), 17)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (18, 7, CAST(N'2021-12-30' AS Date), 18)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (19, 8, CAST(N'2022-01-17' AS Date), 19)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (20, 8, CAST(N'2021-12-21' AS Date), 20)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (21, 26, CAST(N'2021-10-08' AS Date), 21)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (22, 30, CAST(N'2022-01-19' AS Date), 22)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (23, 31, CAST(N'2021-07-16' AS Date), 23)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (24, 35, CAST(N'2021-09-23' AS Date), 24)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (25, 25, CAST(N'2021-06-14' AS Date), 25)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (26, 29, CAST(N'2021-08-19' AS Date), 26)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (27, 27, CAST(N'2021-11-10' AS Date), 27)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (28, 24, CAST(N'2022-01-22' AS Date), 28)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (29, 26, CAST(N'2022-01-11' AS Date), 29)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (30, 36, CAST(N'2022-01-04' AS Date), 30)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (31, 12, CAST(N'2021-12-07' AS Date), 31)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (32, 14, CAST(N'2022-01-06' AS Date), 32)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (33, 24, CAST(N'2022-01-03' AS Date), 33)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (34, 17, CAST(N'2021-11-11' AS Date), 34)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (35, 31, CAST(N'2021-11-16' AS Date), 35)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (36, 36, CAST(N'2022-01-10' AS Date), 36)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (37, 23, CAST(N'2021-11-17' AS Date), 37)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (38, 29, CAST(N'2022-01-03' AS Date), 38)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (39, 26, CAST(N'2021-12-14' AS Date), 39)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (40, 18, CAST(N'2022-01-20' AS Date), 40)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (1, N'Blusa de flores', 200, 70, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (2, N'Blusa tipo escocesa ', 150, 35, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (3, N'Blusa rayada manga larga', 100, 37, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (4, N'Blusa con estampado animado', 100, 26, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (5, N'Falda larga', 200, 45, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (6, N'Falda tipo escocesa ', 250, 12, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (7, N'Falda tipo escolar ', 120, 68, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (8, N'Falda ejecutiva ', 230, 20, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (9, N'Pantalón acampanado ', 350, 23, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (10, N'Skinny Jeans', 300, 56, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (11, N'Pantalón Pants ', 279, 30, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (12, N'Shorts de Mezclilla', 250, 48, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (13, N'Camisón', 150, 9, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (14, N'Conjunto de pijama', 400, 26, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (15, N'Blusa de pijama', 100, 45, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (16, N'Pantalón de pijama', 150, 20, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (17, N'Camisa ejecutiva ', 240, 36, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (18, N'Camisa de flores', 270, 40, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (19, N'Camisa tipo escolar', 290, 59, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (20, N'Camisa con bordado', 300, 10, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (21, N'Tennis suela alta', 550, 9, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (22, N'Zapato de tacón ', 600, 23, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (23, N'Bota alta', 650, 1, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (24, N'Pantuflas', 200, 24, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (25, N'Abrigo largo', 1050, 3, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (26, N'Chamarra pluma de ganso', 1100, 17, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (27, N'Chamarra delgada ', 700, 20, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (28, N'Cazadora', 750, 12, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (29, N'Suéter cerrado', 300, 23, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (30, N'Sudadera deportiva', 450, 45, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (31, N'Suéter tejido', 450, 35, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (32, N'Suéter estampado', 400, 19, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (33, N'Vestido corto de día', 600, 3, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (34, N'Vestido de noche largo ', 1350, 23, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (35, N'Vestido ejecutivo', 1050, 67, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (36, N'Vestido fantasía para niña', 750, 5, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (37, N'Collar', 150, 9, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (38, N'Pulseras', 75, 78, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (39, N'Aretes', 50, 59, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (40, N'Accesorios para el cabello ', 100, 30, 10)
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [id_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_detalle] FOREIGN KEY([id_detalle])
REFERENCES [dbo].[detalle] ([id_detalle])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_detalle]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [id_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [id_categoria]
GO
USE [master]
GO
ALTER DATABASE [AkirasBoutiques] SET  READ_WRITE 
GO

CREATE TABLE Empleados (
    id_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    edad INT NOT NULL,
    id_sucursal INT NOT NULL,
	sucursal VARCHAR (30) NOT NULL,
	encargado VARCHAR(50) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal) ON DELETE CASCADE
);

SET IDENTITY_INSERT Empleados ON;

SET IDENTITY_INSERT Empleados OFF;

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('1' , 'Ana Sanchez' , 'Av Insurgentes Sur 1235' , '7221822319' , '25' , '1' , 'Las Mercedes' ,'Sonia Alejandra Fernandez Moreno' , 'anasanchez10.outlook.es' , 'An4S4nchez')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('2' , 'Ricardo Peralta' , 'Av 5 de Mayo 150' , '7221304785' , '20' , '1' , 'Las Mercedes' ,'Sonia Alejandra Fernandez Moreno' , 'ricardopera.gmail.com' , 'R1c4rd0P3r')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('3' , 'Carmen Corona' , 'Lerdo Poniente 3000' , '7291473256' , '21' , '1' , 'Las Mercedes' , 'Sonia Alejandra Fernandez Moreno' , 'carmencorona18.hotmail.com' , 'C4rm3nC0r0')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('4' , 'Pedro Colin' , 'Bo Miguel Aleman 175' , '5510379126' , '26' , '1' , 'Las Mercedes' , 'Sonia Alejandra Fernandez Moreno' , 'colinpedro.outlook.es' , 'c0l1nPedr0')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('5' , 'Rosa Sosa' , 'Instituto Literario 100' , '7124781039' , '22' , '1' , 'Las Mercedes' , 'Sonia Alejandra Fernandez Moreno' , 'rososa14.yahoo.com' , 'Ros4505A')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('6' , 'Patricia Contreras' , 'Vega del Campo 1110' , '3215901759' , '25' ,'2' ,  'Obraje' , 'Fernando Calderon Ayala' , 'contreraspaty.yahoo.com.mx' , 'c0ntr3r4SP')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña) 
VALUES ('7' , 'Natalia Jimenez' , 'Rosales 54 ' , '3491265479' , '26' , '2' , 'Obraje' , 'Fernando Calderon Ayala' , 'nattjimenezz.outlook.com' , 'Nt1J7m3n3z')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('8' , 'Miguel Miranda' , 'Cam. de Casas vieja 200' , '3106974169' , '28' ,'2',  'Obraje' , 'Fernando Calderon Ayala' , 'mirandamiguell.hotmail.com' , 'M1r4ndaM1')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('9' , 'Luis Estrada' , 'San Antonio Albarranes 386' , '3710369413' , '34' ,'2' ,  'Obraje' , 'Fernando Calderon Ayala' , 'estradaluiis.outlook.es' , 'Luu1sit00')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('10' , 'Maria Esquivel' , 'Cieneguillas de Gonzalez 1000' , '3004618734' , '24' , '2' , 'Obraje' , 'Fernando Calderon Ayala' , 'esquimaria.yahoo.com' , 'Ma4r135v3l')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('11' , 'Miguel Medina' ,'San Pablo Autopan' , '4269785610' , '38' , '2' , 'Obraje' , 'Fernando Calderon Ayala' , 'medinnamige30.outlook.es' , 'm3dinaam1e')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('12' , 'Leonardo Morales' , 'San Mateo Almolola 224' , '6671384130' , '31' , '3' , 'Galerias Mazatlan' ,'Daniela Fernanda Diaz Ordaz' , 'leomorales.outlook.es' , 'Mor4L300do')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('13' , 'Javier Carmona' , 'San Simon Guerrero 300' , '6661032489' , '26' , '3' , 'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'javiercarmonaa.gmail.com' , 'C4rmonit4J')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('14' , 'Gabriel Escutia' , 'San Isidro Xochitla 5003' , '6631489569' , '35' ,'3',  'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'escutiiagabo.hotmail.com' , 'Gabito.E5s')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('15' , 'Laura Gaxiola' , 'San Miguel Ixtapan 1500' , '6614851589' , '29' , '3' , 'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'gaxiiolalau.outlook.es' , 'GaxLau1496')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('16' , 'Isabel Lavanderos' , 'Las Esmeraldas 10' , '6641592168' , '32' , '3' , 'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'lavanderosisabel.hotmail.com' , 'Lavendeisa')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('17' , 'Sulema Colin' , 'Patzcuaro Centro' , '3319520795' , '26' , '3' , 'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'suleemacolin78.outlook.es' , 's1e25d896f')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('18' , 'Monserrath Estevez' , 'San Anotonio del Rosario' , '4416520016' , '37' , '4', 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'monseestevez.outlook.es' , 'Est3Mon637')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('19' , 'Daniela Camacho' , 'Tlalchichipa 0123' , '4419985659' , '20' , '4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'daniecamacho.gmail.com' , '485DaniCa8')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('20' , 'Lucero Castillo' , 'San Miguel Tecomatlan' , '4413694442' , '22' , '4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'castillitolucero.hotmail.com' , 'Cast759Luc')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('21' , 'Johan Torres' , 'Tixtla de Guerrero' , '4478510136' , '29' ,'4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'torresjohan.outlook.es' , 'T0rr525es6')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('22' , 'Luis Murillo' , 'Ciudad Altamirano Sur' , '4410123698' , '33' , '4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'luismurilloo.yahoo.com' , 'mur458L06s')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('23' , 'Esteban Lazcano' , 'San Luis Mextepec' , '6621796305' , '23' , '4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'lazcanoesteban.hotmail.com' , '3st4be2la5')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('24' , 'Hugo Carmona' , 'Palo Blanco Norte' , '5510318798' , '26' , '5' , 'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'huguitocarmona.outlook.es' , 'C4rm85d3a9')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('25' , 'Abraham Garcia' , 'Tierra Colorada' , '5541369854' , '21' , '5' , 'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'garciaabrhaam.gmail.com' , 'gar254s96r')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('26' , 'Jaqueline Estrada' , 'Jaleaca de Catalan' , '5533321698' , '24' , '5' , 'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'estradajaque18.hotmail.com' , '3sst4tr627')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('27' , 'Ingrid Bizarro' , 'Puerto Escondido' , '5541697586' , '30' ,'5' , 'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'bizaaroingridd85.outlook.es' , 'b1zso5e2fz')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('28' , 'Fabian Camacho' , 'El Puente Alto' , '5513269785' , '20' ,'5' ,  'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'fabicamacho24.yahoo.com' , 'Cam4ach0f4')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('29' , 'Miguel Angel Gaxiola' , 'La Higuerita 6963' , '9691044246' , '39' ,'6' ,  'Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'miguelangelgax.outlook.es' , 'gax471m1g3')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('30' , 'Jared Gomez' , 'San Pedro Jorullo' , '3341877963' , '38' ,'6' , 'Constitucion' , 'Tamara Alejandra Bernal Ramos', 'jareddgommez4.gmail.com' , 'gom3zzj4r3')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('31' , 'Anahi Lujan' , 'Santa Clara del Cobre' , '7701442893' , '33' , '6' , 'Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'lujaanana63.hotmail.com' , 'ju1an5ah1a')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('32' , 'Jassiel Dorasco' , 'San Andres Zirondaro' , '4861173570' , '26' ,'6' , 'Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'jassieldorasco236.outlook.es' , '256j4s1e11')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('33' , 'Josue Garcia' , 'Cuidad de Quiroga' , '3411861079' , '22' , '6'  , 'Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'jossgarcia17.yahoo.com' , 'j0s4f6t4ss')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('34' , 'Maria Fabiola' , 'San Javier 1300' , '7126304896' , '25' , '6'  , 'Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'mariafabiola10.yahoo.com' , 'ma1r4df258')

INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('35' , 'Adrian Estrada' , 'Colonia Erendira' , '7221901120' , '20' ,'7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'estradaadrian1994.outlook.es' , 'a14s2tr6a5')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('36' , 'Adrian Reyes' , 'Guamuchil 325' , '7221323471' , '18' , '7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'reyessadrian85.gmail.com' , 'r3s4ad1r5e')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('37' , 'Omar Peralta' , 'Sinaloa de Leyva' , '7221889595' , '21' , '7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'omarperalta615.hotmail.com' , 'ome1aor23s')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('38' , 'Martin Gutierrez' ,'Los Mochis 3426' , '7221795474' , '19' , '7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'martingutierrez.outlook.es' , 'gu1tez3rr7')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('39' , 'Armando Castillo' , 'San Miguel Zapotiltan' , '7221901120' , '30' , '7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'armandocasstillo75.yahoo.com' , 'ar4d1t25sf')
INSERT INTO Empleados (id_Empleado , nombre , direccion , telefono , edad , id_sucursal , sucursal , encargado , correo  , contraseña)
VALUES ('40' , 'Guadalupe Jaramillo' , 'San Miguel Zinacantepec' , '7221796358' , '38' , '7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'jaramillolupita96.gmail.com' , 'ja4d2s89tg')

CREATE TABLE Sucursales(
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    encargado VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL
);
SET IDENTITY_INSERT Sucursales ON;

SET IDENTITY_INSERT Sucursales OFF;

INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('1' , 'Las Merdeces' , 'Sonia Alejandra Fernandez Moreno' , 'Calle Roble 507 Fracc. Las Mercedes' , '4447831225' , 'San Luis Potosi' , 'San Luis Potosi' )
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad, estado)
VALUES ('2' , 'Obraje' , 'Fernando Calderon Ayala' , 'Calle Dr. Jesus Diaz de Leon 438 col. Obraje' , '4493780921' , 'Aguascalientes' , 'Aguascalientes' )
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('3', 'Galerias Mazatlan' , 'Daniela Fernanda Diaz Ordaz' , 'Av. de la Marina 6204, Marina, local 35' , '6692932059' , 'Mazatlan' , 'Sinaloa')
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('4' , 'Zapopan' , 'Mario Alberto Jimenez Salcido' , 'Av. Manuel J Clouthier 525 col. Benito Juarez' , '3337841230' , 'Zapopan' , 'Jalisco' )
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('5' , 'Melchor' , 'Yesenia Guadalupe Campos Rojo' , 'Av. Melchor Ocampo 2528 Zona Centro' , '6143906721' , 'Chihuahua' , 'Chihuahua' )
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('6' , ' Constitucion' , 'Tamara Alejandra Bernal Ramos' , 'Calle Constitucion 106 Zona Centro' , '6181962954' , 'Durango' , 'Durango')
INSERT INTO Sucursales (id_sucursal , nombre , encargado , direccion , telefono , ciudad , estado)
VALUES ('7' , 'Centro' , 'Samuel Enrique Barrios Enciso' , 'Av. Hidalgo 338 Zacatecas Centro' , '4929301250' , 'Zacatecas' , 'Zacatecas') 




SELECT id_cliente
FROM factura  
WHERE id_cliente > 5;




select * from factura 
select * from categoria
SELECT * FROM producto
select * from detalle


SELECT nombre, precio, stock 
FROM producto 
ORDER BY stock DESC;




select nombre 
From Empleados

Select * from sucursales
select * from categoria
drop table Sucursales
delete from Empleados 

create view vista_categoria AS 
select descripcion 
from categoria;

select * from vista_categoria