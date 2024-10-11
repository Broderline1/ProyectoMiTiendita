<%@ Page Title="Pagina Principal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_Mi_tiendita._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <title>Abarrotes mi Tiendita</title>
        <link rel="stylesheet" href="Styles\Stylesinicio.css" />
    </head>
    <body class="inicio">
        <header class ="encabezadoInicio">
            <div class="logo">
                <img src="Imagenes/MI TIENDITA LOGO.png" alt="Logo de Abarrotes mi Tiendita" />
                <h1>Abarrotes mi tiendita</h1>
            </div>
            <div class="user-info">

            <nav id="manualyAyuda">
                <asp:Button class="nav-button" ID="ayudaP" runat="server" Text="Ayuda" OnClick="ayudaP_Click" /> <img src="Imagenes\ayuda.png" />
            </nav>

           </div>
        </header>
        <main>

            <asp:LinkButton ID="btnHistorial" runat="server" CssClass="menu-option historial" OnClick="btnHistorial_Click">
                <img src="Imagenes/Historial.png" alt="Historial" />
                <span>Historial</span>
            </asp:LinkButton>

            <asp:LinkButton ID="btnProductos" runat="server" CssClass="menu-option productos" OnClick="btnProductos_Click">
                <img src="Imagenes/Productos.png" alt="Productos" />
                <span>Productos</span>
            </asp:LinkButton>

            <asp:LinkButton ID="btnCuentas" runat="server" CssClass="menu-option cuentas" OnClick="btnCuentas_Click">
                <img src="Imagenes/cuentas.png" alt="Cuentas" />
                <span>Cuentas</span>
            </asp:LinkButton>

        </main>
    </body>
</asp:Content>