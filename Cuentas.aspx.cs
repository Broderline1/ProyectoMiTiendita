using Proyecto_Mi_tiendita.Clases;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Mi_tiendita
{
    public partial class Cuentas : System.Web.UI.Page
    {
        string strConexion = "user id=Broderline1_SQLLogin_1; password=i759he2dui; server=MiTiendita.mssql.somee.com; database=MiTiendita";

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario == null)
                Response.Redirect("index.aspx");

            if (!IsPostBack)
            {
                llenarGrid();
            }
        }

        void llenarGrid()
        {
            SqlConnection conn = new SqlConnection(strConexion);
            SqlCommand comando = new SqlCommand();
            SqlDataAdapter adaptador = new SqlDataAdapter();
            DataTable datos = new DataTable();

            comando.Connection = conn;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "Ls_Usu";
            adaptador.SelectCommand = comando;
            adaptador.Fill(datos);
            grid.DataSource = datos;
            grid.DataBind();
        }

        void LlenarForma(string clave)
        {
            SqlConnection conn = new SqlConnection(strConexion);
            SqlCommand comando = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable datos = new DataTable();

            comando.Connection = conn;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "Bus_Usu";
            comando.Parameters.AddWithValue("@Clave", clave);
            adapter.SelectCommand = comando;
            adapter.Fill(datos);

            if (datos.Rows.Count > 0)
            {
                ctClave.Text = datos.Rows[0]["Usu_Id"].ToString();
                ctNombre.Text = datos.Rows[0]["Usu_Nombre"].ToString();
                ctEmail.Text = datos.Rows[0]["Usu_Email"].ToString();
                ctPassword.Text = datos.Rows[0]["Usu_Contraseña"].ToString();
                ctRol.Text = datos.Rows[0]["Usu_Rol"].ToString();
                ctSucId.Text = datos.Rows[0]["Usu_SucId"].ToString();
                ctClave.Enabled = false;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Nuevo();
        }

        void Nuevo()
        {
            ctClave.Enabled = true;
            ctClave.Text = "";
            ctNombre.Text = "";
            ctEmail.Text = "";
            ctPassword.Text = "";
            ctRol.Text = "";
            ctSucId.Text = "";
            ctClave.Focus();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarFormulario())
            {
                string clave = ctClave.Text;
                string nombre = ctNombre.Text;
                string email = ctEmail.Text;
                string password = ctPassword.Text;
                int rol = Convert.ToInt32(ctRol.Text);
                int sucursalId = Convert.ToInt32(ctSucId.Text);

                SqlConnection conn = new SqlConnection(strConexion);
                SqlCommand comando = new SqlCommand();

                comando.Connection = conn;
                comando.CommandType = CommandType.StoredProcedure;
                if (ctClave.Enabled)
                {
                    comando.CommandText = "Ins_Usu";
                }
                else
                {
                    comando.CommandText = "Act_Usu";
                }
                comando.Parameters.AddWithValue("@Usu_Id", clave);
                comando.Parameters.AddWithValue("@Usu_Nombre", nombre);
                comando.Parameters.AddWithValue("@Usu_Email", email);
                comando.Parameters.AddWithValue("@Usu_Contraseña", password);
                comando.Parameters.AddWithValue("@Usu_Rol", rol);
                comando.Parameters.AddWithValue("@Usu_SucId", sucursalId);

                conn.Open();
                comando.ExecuteNonQuery();
                conn.Close();

                lbMensaje.Text = "Usuario guardado exitosamente.";
                llenarGrid();
                Nuevo();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!ctClave.Enabled && !string.IsNullOrEmpty(ctClave.Text))
            {
                SqlConnection conn = new SqlConnection(strConexion);
                SqlCommand comando = new SqlCommand();

                comando.Connection = conn;
                comando.CommandType = CommandType.StoredProcedure;
                comando.CommandText = "Eli_Usu";
                comando.Parameters.AddWithValue("@Usu_Id", ctClave.Text);

                conn.Open();
                comando.ExecuteNonQuery();
                conn.Close();

                lbMensaje.Text = "Usuario eliminado exitosamente.";
                llenarGrid();
                Nuevo();
            }
            else
            {
                lbMensaje.Text = "Por favor, seleccione un usuario para eliminar.";
            }
        }

        protected void ctClave_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ctClave.Text))
            {
                LlenarForma(ctClave.Text);
            }
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string clave = grid.SelectedRow.Cells[0].Text;
            LlenarForma(clave);
        }

        bool ValidarFormulario()
        {
            lbMensaje.Text = "";
            if (string.IsNullOrWhiteSpace(ctClave.Text))
            {
                lbMensaje.Text = "Favor de teclear la clave.";
                ctClave.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(ctNombre.Text))
            {
                lbMensaje.Text = "Favor de teclear el nombre.";
                ctNombre.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(ctEmail.Text))
            {
                lbMensaje.Text = "Favor de teclear el email.";
                ctEmail.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(ctPassword.Text))
            {
                lbMensaje.Text = "Favor de teclear la contraseña.";
                ctPassword.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(ctRol.Text) || !int.TryParse(ctRol.Text, out _))
            {
                lbMensaje.Text = "Favor de teclear un rol válido.";
                ctRol.Focus();
                return false;
            }
            if (string.IsNullOrWhiteSpace(ctSucId.Text) || !int.TryParse(ctSucId.Text, out _))
            {
                lbMensaje.Text = "Favor de teclear un ID de sucursal válido.";
                ctSucId.Focus();
                return false;
            }
            return true;
        }
    }
}