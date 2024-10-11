using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using Proyecto_Mi_tiendita.Clases;
using System.Reflection.Emit;
using System.Net.Sockets;

namespace Proyecto_Mi_tiendita
{
    public partial class Index : System.Web.UI.Page
    {
        string strConexion = "user id=Broderline1_SQLLogin_1; password=i759he2dui; server=MiTiendita.mssql.somee.com; database=MiTiendita";

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario != null)
                Response.Redirect("AcercaDeNosotros.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConexion);
            SqlCommand comando = new SqlCommand();
            SqlDataAdapter adaptador = new SqlDataAdapter();
            DataTable datos = new DataTable();

            if (conn.State == 0)
            {
                conn.Open();
            }
            comando.Connection = conn;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "Bus_usu";
            comando.Parameters.AddWithValue("@Clave", ctUsuario.Text);
            adaptador.SelectCommand = comando;
            adaptador.Fill(datos);

            lbMensaje.Text = "";

            if (datos.Rows.Count > 0)
            {
                Usuario Usu = new Usuario(datos.Rows[0].ItemArray[0].ToString(),
                    datos.Rows[0].ItemArray[1].ToString(),
                    datos.Rows[0].ItemArray[2].ToString(),
                    datos.Rows[0].ItemArray[3].ToString(),
                    Convert.ToInt32(datos.Rows[0].ItemArray[4]),
                    Convert.ToInt32(datos.Rows[0].ItemArray[5]));

                if (ctUsuario.Text == Usu.Usu_Id)
                {
                    if (ctContraseña.Text == Usu.Usu_Contraseña)
                    {
                        //lbMensaje.Text = "Contraseña correcta, puedes continuar";
                        Session["usuario"] = Usu;
                        Response.Redirect("AcercaDeNosotros.aspx");
                    }
                    else
                    {
                        lbMensaje.Text = "Contraseña Incorrecta";
                    }
                }
                else
                {
                    lbMensaje.Text = "Usuario Incorrecto";
                }
            }
            else
            {
                lbMensaje.Text = "Usuario Incorrecto";
            }
        }


    }
}