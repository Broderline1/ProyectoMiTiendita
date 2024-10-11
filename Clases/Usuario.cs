using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_Mi_tiendita.Clases
{
    public class Usuario
    {
        public string Usu_Id;
        public string Usu_Nombre;
        public string Usu_Email;
        public string Usu_Contraseña;
        public int Usu_Rol;
        public int Usu_SucId;

        public Usuario(string usu_Id, string usu_Nombre, string usu_Email, string usu_Contraseña, int usu_Rol, int usu_SucId)
        {
            Usu_Id = usu_Id;
            Usu_Nombre = usu_Nombre;
            Usu_Email = usu_Email;
            Usu_Contraseña = usu_Contraseña;
            Usu_Rol = usu_Rol;
            Usu_SucId = usu_SucId;
        }
    }
}