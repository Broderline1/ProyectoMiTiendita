<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Feedback.aspx.cs" Inherits="Proyecto_Mi_tiendita.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<head>
    <title>Abarrotes Mi Tiendita</title>
    <link rel="stylesheet" href="Styles/StylesFeed.css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
    <body class="envioEmail">
        <form id="formEmail">
            <div class="header">
                <div>
                    <img src="Imagenes\MI TIENDITA LOGO.png" alt="Logo" />
                    <span id="ti" aria-atomic="False">Abarrotes Mi Tiendita</span>
                </div>
          </div>
          <div class="FEED">
            <h2>Tu opinion nos importa, en caso de errores o dudas estamos a tu orden para ello</h2>
          </div>
          <div class="containerEmail">
            <h1>Envianos un correo.</h1>
            <a href="#" class="button" onclick="sendEmail()">Preciona aqui</a>
          </div>
            <script>
                function sendEmail() {
                    const recipient = 'proyectomitiendita2024@gmail.com';
                    const subject = 'Pon aquí tu asunto';
                    const body = 'Detalla tu problema o retroalimentación para que podamos ayudarte.';

                    // Construir la URL para Gmail
                    const gmailLink = `https://mail.google.com/mail/u/0/?view=cm&fs=1&to=${encodeURIComponent(recipient)}&su=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;

                    // Abrir la URL en una nueva ventana o pestaña
                    window.open(gmailLink, '_blank');
                }
            </script>
        </form>
    </body>
</asp:Content>