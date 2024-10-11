using Proyecto_Mi_tiendita.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Mi_tiendita
{
    public partial class Historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario == null)
                Response.Redirect("index.aspx");

            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string strConexion = "user id=Broderline1_SQLLogin_1; password=i759he2dui; server=MiTiendita.mssql.somee.com; database=MiTiendita";
            using (SqlConnection con = new SqlConnection(strConexion))
            {
                string query = "SELECT Pro_Cve, Operacion, Fecha FROM Historial ORDER BY Fecha DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvHistorial.DataSource = dt;
                    gvHistorial.DataBind();
                }
            }
        }
    }
}