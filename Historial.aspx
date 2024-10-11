<%@ Page Title="Historial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="Proyecto_Mi_tiendita.Historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <title>Historial</title>
        <link rel="stylesheet" href="Styles/StyleHistorial.css" />
    </head>
    <body>


        <div class="container">
            <div class="main-content">
                <div class="table-container1">
                    <div class="recently-added">
                        <h3>Agregado recientemente...</h3>
                        <img src="Imagenes/Agregado recientemente.png" alt="agregado" />
                    </div>
                </div>
             
                    <!-- GridView para mostrar los datos de la tabla Historial -->
                    <asp:GridView ID="gvHistorial" runat="server" AutoGenerateColumns="False" CssClass="gridview-class" style="color:black!important">
                        <Columns>
                            <asp:BoundField  DataField="Pro_Cve" HeaderText="Código Usuario" />
        
                            <asp:BoundField DataField="Operacion" HeaderText="Operación" />
        
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
        
                        </Columns>
                    </asp:GridView>
                
            </div>
        </div>
    </body>
</asp:Content>
