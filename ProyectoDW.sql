USE [master]
GO
/****** Object:  Database [ProyectoDesWeb]    Script Date: 8/09/2020 20:38:47 ******/
CREATE DATABASE [ProyectoDesWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoDesWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProyectoDesWeb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoDesWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProyectoDesWeb_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProyectoDesWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoDesWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoDesWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoDesWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoDesWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoDesWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoDesWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoDesWeb] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoDesWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoDesWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoDesWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoDesWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProyectoDesWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoDesWeb', N'ON'
GO
USE [ProyectoDesWeb]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[IdAlmacen] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Lote] [nchar](10) NULL,
	[FechaEntrada] [datetime] NULL,
	[FechaSalida] [datetime] NULL,
	[IdArticulo] [int] NULL,
 CONSTRAINT [PK_Almacen] PRIMARY KEY CLUSTERED 
(
	[IdAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IdArticulo] [int] NOT NULL,
	[IdCategoria] [int] NULL,
	[IdProveedor] [int] NULL,
	[Codigo] [nchar](10) NULL,
	[Nombre] [nchar](10) NULL,
	[PrecioVenta] [decimal](18, 0) NULL,
	[Stock] [int] NULL,
	[Descripcion] [nchar](10) NULL,
	[Imagen] [nchar](10) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categoría]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoría](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Descripcion] [nchar](10) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Categoría] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Nit] [nchar](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Cantidad] [int] NULL,
	[total] [decimal](18, 0) NULL,
	[IdArticulo] [int] NULL,
	[IdPago] [int] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CuentasporCobrar]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasporCobrar](
	[IdCuentaCobrar] [int] NOT NULL,
	[NombreCuenta] [nchar](10) NULL,
	[Activo] [nchar](10) NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_CuentasporCobrar] PRIMARY KEY CLUSTERED 
(
	[IdCuentaCobrar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleIngreso]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleIngreso](
	[IdDetalleIngreso] [int] NOT NULL,
	[IdIngreso] [int] NULL,
	[IdArticulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetalleIngreso] PRIMARY KEY CLUSTERED 
(
	[IdDetalleIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] NOT NULL,
	[IdVenta] [int] NULL,
	[IdArticulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Descuento] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturación]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturación](
	[IdFactura] [int] NOT NULL,
	[IdPedido] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Facturación] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormadePago]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormadePago](
	[IdFormaPago] [int] NOT NULL,
	[NombrePago] [nchar](10) NULL,
	[IdVentas] [int] NULL,
 CONSTRAINT [PK_FormadePago] PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IdIngreso] [int] NOT NULL,
	[IdProveedor] [int] NULL,
	[IdUsuario] [int] NULL,
	[Fecha] [datetime] NULL,
	[Impuesto] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdInventario] [int] NOT NULL,
	[IdAlmacen] [int] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdCuentasCobrar] [int] NOT NULL,
	[IdRecursosH] [int] NULL,
	[IdInventario] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [int] NOT NULL,
	[IdVenta] [int] NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] NOT NULL,
	[NombreProveedor] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Telefono] [nchar](10) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecursosHumanos]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecursosHumanos](
	[IdEmpleados] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Apellidos] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Telefono] [nchar](10) NULL,
	[DPI] [nchar](10) NULL,
	[TipoEmpleado] [nchar](10) NULL,
	[CargoEmpleado] [nchar](10) NULL,
 CONSTRAINT [PK_RecursosHumanos] PRIMARY KEY CLUSTERED 
(
	[IdEmpleados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Descripcion] [nchar](10) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TalonarioPagos]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TalonarioPagos](
	[IdPago] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
	[MesPago] [nchar](10) NULL,
	[TipoPago] [nchar](10) NULL,
 CONSTRAINT [PK_TalonarioPagos] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NULL,
	[Nombre] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Telefono] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[Clave] [nchar](10) NULL,
	[Estado] [bit] NULL,
	[TipoDocumento] [nchar](10) NULL,
	[NumDocumento] [nchar](10) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 8/09/2020 20:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] NOT NULL,
	[IdCliente] [int] NULL,
	[IdUsuario] [int] NULL,
	[Fecha] [datetime] NULL,
	[Impuesto] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[Estado] [bit] NULL,
	[TipoComprobante] [nchar](10) NULL,
	[SerieComprobante] [nchar](10) NULL,
	[NumComprobante] [nchar](10) NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Articulo]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoría] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoría] ([IdCategoria])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoría]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Proveedor]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Articulo]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_FormadePago] FOREIGN KEY([IdPago])
REFERENCES [dbo].[FormadePago] ([IdFormaPago])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_FormadePago]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Articulo]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Ingreso] FOREIGN KEY([IdIngreso])
REFERENCES [dbo].[Ingreso] ([IdIngreso])
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Ingreso]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Articulo]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
ALTER TABLE [dbo].[Facturación]  WITH CHECK ADD  CONSTRAINT [FK_Facturación_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[Facturación] CHECK CONSTRAINT [FK_Facturación_Pedido]
GO
ALTER TABLE [dbo].[FormadePago]  WITH CHECK ADD  CONSTRAINT [FK_FormadePago_Venta] FOREIGN KEY([IdVentas])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[FormadePago] CHECK CONSTRAINT [FK_FormadePago_Venta]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Usuario]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Almacen] FOREIGN KEY([IdAlmacen])
REFERENCES [dbo].[Almacen] ([IdAlmacen])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Almacen]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_CuentasporCobrar] FOREIGN KEY([IdCuentasCobrar])
REFERENCES [dbo].[CuentasporCobrar] ([IdCuentaCobrar])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_CuentasporCobrar]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Inventario] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[Inventario] ([IdInventario])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Inventario]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_RecursosHumanos] FOREIGN KEY([IdRecursosH])
REFERENCES [dbo].[RecursosHumanos] ([IdEmpleados])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_RecursosHumanos]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Venta]
GO
ALTER TABLE [dbo].[TalonarioPagos]  WITH CHECK ADD  CONSTRAINT [FK_TalonarioPagos_RecursosHumanos] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[RecursosHumanos] ([IdEmpleados])
GO
ALTER TABLE [dbo].[TalonarioPagos] CHECK CONSTRAINT [FK_TalonarioPagos_RecursosHumanos]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
USE [master]
GO
ALTER DATABASE [ProyectoDesWeb] SET  READ_WRITE 
GO
