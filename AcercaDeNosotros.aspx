<%@ Page Title="Acerca De Nosotros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AcercaDeNosotros.aspx.cs" Inherits="Proyecto_Mi_tiendita.AcercaDeNosotros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <title>Acerca de</title>
        <link rel="stylesheet" href="Styles/styleAcerca.css">
    </head>
  <body class="cuerpoDeNosotros">
      <div class="header">
        <div>
                <img src="Imagenes/MI TIENDITA LOGO.png" alt="Logo" />
                &nbsp;<span id="ti" aria-atomic="False">Abarrotes Mi Tiendita</span>
        </div>    
       </div>

        <section>
            <div>
                <h3>Que creamos </h3>
                <p>Creamos un software que fue creado para el beneficio de una empresa la cual necesita una eficiencia y facilidad 
               <br>al momento de usarlo para la compra y venta de los productos de "Mi Tiendita", la cual su anterior administracion
               <br>no era muy ordenada y carecia de logica al momento de añadir productos, eliminarlos y actualizarlos. </p>
            </div>
        </section>

        <section>
            <div>
                <h3>Nuestro Equipo</h3>
                <p>Contamos con una cantidad de personas muy pequeña pero que siempre logra dar una buena satisfaccion al cliente,
                <br>somos 4 personas decididas al creciemiento de mas proyectos para seguir mirando al futuro.
                <br>Informacion sobre nosotros:</p>
                    <ul>
                        <li>Omar Campos Acosta es el encargado de que el equipo siga con las practicas del proyecto, ayuda a guiar <br> 
                            al equipo y remueve todo tipo de obstaculos para la rapidez del progreso.
                        </li>
               
                        <li>
                            Lucia Leyva Alvarez se ocupa de estar priorizando la lista de los trabajos penientes ayudando a comunicar<br>
                            la vision del producto a los interesados, revisa, acepta y/o rechaza el trabajo completado por el equipo <br>
                            de desarrollo
                        </li>
             
                        <li>
                            Jose Acuña Rivera y Stephany Valenzuela Rodriguez son el equipo de desarrollo lo cuales trabajan en el <br>
                            incremento del producto, el equipo decide como abordar cada complicacion trabajando en equipo para <br>
                            asegurar la calidad del producto.
                        </li>
                    </ul>
            </div>
        </section>
        <section>
            <div>
                <h3>Nuestra Meta</h3>
                <p>Nuestra meta siempre sera solucionar problemas usando ideas inovadoras siendo de buena calidad mientras nos <br>
                   ayudamos para resolver problemas colaborativamente para motivar a nuestros empleados.<br>
                   Nos adaptamos a nuevas tecnologias, buscando constantemente mejorar y adaptar nuestros servicios para superar<br>
                   las espectativas del cliente y contribuir a la comunidad.
                </p>
            </div>
        </section>
    </body>
</asp:Content>