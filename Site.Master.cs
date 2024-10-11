using Proyecto_Mi_tiendita.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Mi_tiendita
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario != null)
            {
                lbUsuario.Text = usuario.Usu_Id;
                if (usuario.Usu_Rol == 1)
                    lbRol.Text = "Administrador";
                else
                {
                    lbRol.Text = "Usuario";
                }
            }
        }

        protected void lbtcerrar_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect(this.Page.Request.AppRelativeCurrentExecutionFilePath);
        }
    }
}
