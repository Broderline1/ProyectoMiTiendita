<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="Proyecto_Mi_tiendita.Cuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
    <title>Abarrotes Mi Tiendita - Usuarios</title>
    <link rel="stylesheet" href="Styles/StylesProduc.css" />
</head>
<body class="usuarios">
    <form id="form1">
        <div class="header">
            <div>
                <span id="ti" aria-atomic="False">Usuarios</span>
            </div>
        </div>
        <div class="container1">
            <table border="2" class="tabla1">
                <tr>
                    <td>Clave:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctClave" runat="server" AutoPostBack="True" OnTextChanged="ctClave_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctNombre" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Rol:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctRol" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Sucursal ID:</td>
                    <td colspan="2">
                        <asp:TextBox ID="ctSucId" runat="server"></asp:TextBox>
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
                <tr>
                    <td colspan="3" style="text-align:center">
                        <asp:Label ID="lbMensaje" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="grid" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="#A40000" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="grid_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Usu_Id" HeaderText="Clave">
                        <ItemStyle Width="95px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Usu_Nombre" HeaderText="Nombre">
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Usu_Email" HeaderText="Email">
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Usu_Rol" HeaderText="Rol">
                        <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Usu_SucId" HeaderText="Sucursal ID">
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
