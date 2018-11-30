using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Online_Shopping_Backup
{

    public partial class Login : System.Web.UI.Page
    {

        /*
         * Funcionalidad: Función para cargar los datos de la página.
         * Entrada: por default.
         * Salida: null
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Response.Cookies["fechaInicio"].Value = "N";
            Response.Cookies["fechaFinal"].Value = "N";
            Response.Cookies["genero"].Value = "N";
            Response.Cookies["nacionalidad"].Value = "N";
            Response.Cookies["grado"].Value = "N";
            Response.Cookies["estudiante"].Value = "N";
            Response.Cookies["experimento"].Value = "N";
        }








        /*
         * Funcionalidad: Inicia sesión de administrador con correo y contraseña. 
         * Entrada: por default.
         * Salida: null.
         */
        protected void btn_admin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select AM.idAdmin, AM.email, AM.contrasenna from Administrador AM ", conn);

                cmd.CommandTimeout = 10000;

                if (conn.State == ConnectionState.Open)
                {
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        if (sdr[1].ToString().Equals(txtusername.Text) && sdr[2].ToString().Equals(txtpassword.Text))
                        {
                            Response.Cookies["u_pk"].Value = sdr[0].ToString();
                            Response.Cookies["u_id"].Value = sdr[1].ToString();
                            FormsAuthentication.RedirectFromLoginPage(txtusername.Text, false);
                            if (conn != null)
                                conn.Close();
                            Response.Redirect("~/HomeAdmin.aspx");

                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Usuario o Contraseña Incorrecta');", true);
                        }

                    }

                }

                else
                {

                }
            }
            finally
            {
                if (conn != null)
                    conn.Close();

                
            }
        }
        /*
         * Funcionalidad: Redirige la página a la de forget_password.aspx
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void btn_admin_Contrasena(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/forget_password.aspx");
        }
    }
}