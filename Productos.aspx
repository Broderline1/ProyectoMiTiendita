<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_Mi_tiendita.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
    <title>Abarrotes Mi Tiendita</title>
    <link rel="stylesheet" href="Styles/StylesProduc.css"/>
</head>
<body class="productos">
    <form id="form1">
        <div class="header">
            <div>
               
                <span id="ti" aria-atomic="False">Productos</span>
            </div>
        </div>
        <div class="container1">
            <table border="2"; class="tabla1">
                   <tr>
                         <tr>
           <td>
               Clave:
           </td>
           <td colspan="2">
               <asp:TextBox ID="ctClave" runat="server" AutoPostBack="True" OnTextChanged="ctClave_TextChanged"></asp:TextBox>
           </td>
       </tr>
       <tr>
           <td>
               Nombre:
           </td>
           <td colspan="2">
               <asp:TextBox ID="ctNombre" runat="server"></asp:TextBox>
           </td>
       </tr>
        <tr>
    <td>
        Descripcion:
    </td>
    <td colspan="2">
        <asp:TextBox ID="ctDescripcion" runat="server" AutoPostBack="True" ></asp:TextBox>
    </td>
</tr>
        <tr>
    <td>
        Stock:
    </td>
    <td colspan="2">
        <asp:TextBox ID="ctStock" runat="server"></asp:TextBox>
    </td>
</tr>
       <tr>
           <td>
               Precio:
           </td>
           <td colspan="2">
               <asp:TextBox ID="ctPrecio" runat="server" AutoPostBack="True" OnTextChanged="ctPrecio_TextChanged"></asp:TextBox>
           </td>
       </tr>
       <tr>
           <td>
               Fecha Ingreso:
           </td>
           <td colspan="2">
               <asp:TextBox ID="ctFIngreso" runat="server" TextMode="Date"></asp:TextBox>
           </td>
       </tr>
       <tr>
           <td>
              <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />

           </td>
           <td>
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
           </td>
           <td>
               <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
           </td>
       </tr>
                 <td colspan="3" style="text-align:center">
     <asp:Label ID="lbMensaje" runat="server" Font-Bold="True" ForeColor="Black" ></asp:Label>
 </td>
                </table>
            <div class="search-bar">
    <input type="text" id="searchBox" placeholder="Buscar..." runat="server" />
    <asp:Button ID="btnBuscar" Text="Buscar" runat="server" OnClick="btnBuscar_Click" />
</div>
             <div style="text-align: center;">
    <asp:Label ID="lbMensaje2" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
             </div>
            <br />

  
            <asp:GridView ID="grid" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#A40000" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="grid_SelectedIndexChanged">
     <Columns>
         <asp:BoundField DataField="Pro_Cve" HeaderText="Clave">
         <ItemStyle Width="95px" />
         </asp:BoundField>
         <asp:BoundField DataField="Pro_Nombre" HeaderText="Descripcion">
         <ItemStyle Width="200px" />
         </asp:BoundField>
         <asp:BoundField DataField="Pro_Precio" DataFormatString="{0:c}" HeaderText="Precio">
         <ItemStyle Width="80px" />
         </asp:BoundField>
         <asp:BoundField DataField="Pro_FechaCaducidad" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ingreso">
         <ItemStyle Width="85px" />
         </asp:BoundField>
         <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True">
         <ItemStyle Width="85px" />
         </asp:CommandField>
     </Columns>
     <FooterStyle BackColor="#CCCCCC" />
     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
     <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
     <RowStyle BackColor="White" />
     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
     <SortedAscendingCellStyle BackColor="#F1F1F1" />
     <SortedAscendingHeaderStyle BackColor="Gray" />
     <SortedDescendingCellStyle BackColor="#CAC9C9" />
     <SortedDescendingHeaderStyle BackColor="#383838" />
 </asp:GridView>
        </div>
    </form>
</body>
</asp:Content>