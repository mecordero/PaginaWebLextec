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
using System.Windows.Forms;

namespace Online_Shopping_Backup
{

    public partial class RegistroAdmin : System.Web.UI.Page
    {
		//parte de SR1 no del SR2 
		/*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
		protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
         * Funcionalidad: verificar si los componentes de la interfaz estan vacios 
         * Entrada:
         * Salida: booleano (si estan vacios -> true, sino false ) 
         */

        protected Boolean validacionNullRAdmin()
        {
            if (textRAnombre.Text           == "" ||
               TxtRAPApellido.Text          == "" ||
               TxtRASApellido.Text          == "" ||
               TextRAemail.Text             == "" ||
               SelectRAgenero.SelectedIndex == 0 ||
               TxtRAContra.Text             == "" ||
               TxtRRAContra.Text            == "")
            {
                return true;
            }

            else
            {
                return false;
            }
        }


		/*
         * Funcionalidad: registrar un administrador a nivel de base de datos 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 
         * Salida:
         */
		protected void registrarAdministrador(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
            if (validacionNullRAdmin() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {
                String date = DateTime.Now.ToString("dd-MM-yyyy");
                String query = " exec SRSP_InsertarAdministrador @Nombre , @Apellido1, @Apellido2, @Genero, @Email, @Contrasenna,@Admin,@AdminReal";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Nombre", textRAnombre.Text);
                cmd.Parameters.AddWithValue("@Apellido1", TxtRAPApellido.Text);
                cmd.Parameters.AddWithValue("@Apellido2", TxtRASApellido.Text);
                cmd.Parameters.AddWithValue("@Genero", SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Text);
                cmd.Parameters.AddWithValue("@Email", TextRAemail.Text);
                cmd.Parameters.AddWithValue("@Contrasenna", TxtRAContra.Text);
                cmd.Parameters.AddWithValue("@Admin", DDLclase.SelectedValue);
                cmd.Parameters.AddWithValue("@AdminReal", Request.Cookies["u_id"].Value);
                int a=cmd.ExecuteNonQuery();
                conn.Close();
                if (a == -1)
                {
                    System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para crear administradores", "Operación", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
 
                }
                

                Response.Redirect("~/HomeAdmin.aspx");
            }
        }
    }
}