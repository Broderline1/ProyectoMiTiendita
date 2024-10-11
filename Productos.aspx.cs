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
    public partial class Productos : System.Web.UI.Page
    {
        string strConexion = "user id=Broderline1_SQLLogin_1; password=i759he2dui; server=MiTiendita.mssql.somee.com; database=MiTiendita";
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario == null)
                Response.Redirect("index.aspx");

            llenargrid();
        }



        void llenargrid()
        {

            SqlConnection conn = new SqlConnection(strConexion);
            SqlCommand comando = new SqlCommand();
            SqlDataAdapter adaptador = new SqlDataAdapter();
            DataTable datos = new DataTable();

            if (conn.State == 0)
                conn.Open();
            comando.Connection = conn;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "Ls_Pro";
            adaptador.SelectCommand = comando;
            adaptador.Fill(datos);
            grid.DataSource = datos;
            grid.DataBind();
            conn.Close();


        }

        void LlenarForma(string clave)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConexion);
                SqlCommand comando = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable datos = new DataTable();

                if (conn.State == 0)
                    conn.Open();
                comando.Connection = conn;
                comando.CommandType = CommandType.StoredProcedure;
                comando.CommandText = "Bus_Pro";
                comando.Parameters.AddWithValue("@Pro_Cve", clave);
                adapter.SelectCommand = comando;
                adapter.Fill(datos);
                if (datos.Rows.Count > 0)
                {
                    ctClave.Text = datos.Rows[0].ItemArray[0].ToString();
                    ctNombre.Text = datos.Rows[0].ItemArray[1].ToString();
                    ctDescripcion.Text = datos.Rows[0].ItemArray[2].ToString();
                    ctStock.Text = datos.Rows[0].ItemArray[3].ToString();
                    ctPrecio.Text = Convert.ToDouble(datos.Rows[0].ItemArray[4]).ToString("N");
                    DateTime fecha = Convert.ToDateTime(datos.Rows[0].ItemArray[5]);
                    ctFIngreso.Text = fecha.Year.ToString("0000") + "-" +
                   fecha.Month.ToString("00") + "-" +
                   fecha.Day.ToString("00");
                    ctClave.Enabled = false;

                }
                ctNombre.Focus();
                conn.Close();
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + err.Message + "');</script>");
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
            ctDescripcion.Text = "";
            ctStock.Text = "";
            ctPrecio.Text = "0.00";
            ctFIngreso.Text = DateTime.Today.Year.ToString("0000") + "-" +
                DateTime.Today.Month.ToString("00") + "-" +
                DateTime.Today.Day.ToString("00");
            ctClave.Focus();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            lbMensaje.Text = "";
            if (ctClave.Text.Trim() == "")
            {
                lbMensaje.Text = "Favor de teclear la clave";
                ctClave.Focus();
                return;
            }

            if (ctNombre.Text.Trim() == " ")
            {
                lbMensaje.Text = "Favor de teclear el nombre del articulo";
                ctNombre.Focus();
                return;
            }

            if (ctPrecio.Text.Trim() == "")
            {
                lbMensaje.Text = "Favor de teclear el precio";
                ctPrecio.Text = "0.00";
                ctPrecio.Focus();
                return;
            }

            if (ctFIngreso.Text.Trim() == "")
            {
                lbMensaje.Text = "Favor de teclear la fecha";
                ctPrecio.Focus();
                return;

            }
            else
            {
                try
                {
                    DateTime cfecha = Convert.ToDateTime(ctFIngreso.Text);
                }
                catch
                {
                    lbMensaje.Text = "Favor de seleccionar una fecha válida";
                    ctFIngreso.Focus();
                    return;
                }
            }
            /**********Guardar Registro*********/
            string clave = ctClave.Text;
            string nombre = ctNombre.Text;
            double precio = Convert.ToDouble(ctPrecio.Text);
            string desc = ctDescripcion.Text;
            double stock = Convert.ToInt32(ctStock.Text);
            DateTime fecha = Convert.ToDateTime(ctFIngreso.Text);

            SqlConnection conn = new SqlConnection(strConexion);
            if (conn.State == 0)
                conn.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conn;
            comando.CommandType = CommandType.StoredProcedure;
            if (ctClave.Enabled)
            {
                comando.CommandText = "Ins_Pro";
            }
            else
            {
                comando.CommandText = "Act_Pro";
            }
            comando.Parameters.AddWithValue("@Pro_Cve", clave);
            comando.Parameters.AddWithValue("@Pro_Nombre", nombre);
            comando.Parameters.AddWithValue("@Pro_Descripcion", desc);
            comando.Parameters.AddWithValue("@Pro_Stock", stock);
            comando.Parameters.AddWithValue("@Pro_Precio", precio);
            comando.Parameters.AddWithValue("@Pro_FechaCaducidad", fecha);
            comando.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Producto Guardado Exitosamente  ');</script>");
            ctClave.Enabled = false;
            llenargrid();
        }

        protected void ctPrecio_TextChanged(object sender, EventArgs e)
        {
            try
            {
                double precio = Convert.ToDouble(ctPrecio.Text);
                ctPrecio.Text = precio.ToString("N");
            }

            catch
            {
                ctPrecio.Text = "0.00";
            }

        }

        protected void ctClave_TextChanged(object sender, EventArgs e)
        {
            if (ctClave.Text.Trim() != "") ;
            LlenarForma(ctClave.Text);
        }

        protected void grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string clave = grid.Rows[grid.SelectedRow.RowIndex].Cells[0].Text;
            LlenarForma(clave);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!ctClave.Enabled) // if(ctClave.Enabled == False)
            {
                if (ctClave.Text.Trim() != "")
                    Eliminar(ctClave.Text);
            }
            else
            {
                Response.Write("<script>alert('El producto aun no se guarda');</script>");
            }
        }

        void Eliminar(string clave)
        {
            SqlConnection conn = new SqlConnection(strConexion);
            SqlCommand comando = new SqlCommand();
            if (conn.State == 0)
                conn.Open();
            comando.Connection = conn;

            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "Eli_Pro";
            comando.Parameters.AddWithValue("Pro_Cve", clave);
            comando.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Producto eliminado');</script>");
            llenargrid();
            Nuevo();



        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string clave = searchBox.Value.Trim();

            if (!string.IsNullOrEmpty(clave))
            {
                SqlConnection conn = new SqlConnection(strConexion);
                SqlCommand comando = new SqlCommand();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                DataTable datos = new DataTable();

                try
                {
                    conn.Open();
                    comando.Connection = conn;
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.CommandText = "Bus_Pro";
                    comando.Parameters.AddWithValue("@Pro_Cve", clave);

                    adaptador.SelectCommand = comando;
                    adaptador.Fill(datos);

                    grid.DataSource = datos;
                    grid.DataBind();
                }
                catch (Exception ex)
                {
                    lbMensaje2.Text = "Error al buscar el producto: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                lbMensaje2.Text = "Por favor, ingrese un término de búsqueda.";
            }
        }
    }
}
