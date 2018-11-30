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
using Online_Shopping_Backup.WebServiceLextec;

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
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (validacionNullRAdmin() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {
                int a = ws.SRSP_InsertarAdministrador(textRAnombre.Text, TxtRAPApellido.Text, TxtRASApellido.Text, SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Text, TextRAemail.Text, TxtRAContra.Text, DDLclase.SelectedValue, Request.Cookies["u_id"].Value);

                if (a == -1)
                {
                    System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para crear administradores", "Operación", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
 
                }
                

                Response.Redirect("~/HomeAdmin.aspx");
            }
        }
    }
}