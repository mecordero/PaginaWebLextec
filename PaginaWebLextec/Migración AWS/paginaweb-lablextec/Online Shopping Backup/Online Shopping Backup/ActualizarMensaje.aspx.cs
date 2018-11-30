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

    public partial class ActualizarMensajes : System.Web.UI.Page
    { 

   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
        /*
         * Funcionalidad: Carga la página 
         * Entrada:por default 
         * Salida: null 
         */
        protected void Page_Load(object sender, EventArgs e)
        {

            if (! IsPostBack)
            {

                DDLclase.Items.Add(new ListItem(""));
                con.Open();
                string query = "select Experimento.nombre from Experimento ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DDLclase.Items.Add(new ListItem(dr["nombre"].ToString()));
                }
             
                con.Close();
            }
        }
        /*
         * Funcionalidad: función que sirve para abrir el model de ingresas experimento. 
         * Entrada: por default
         * Salida: null 
         */

        protected void ingresarExp (object sender, EventArgs e)
        {
            if (validacionNullRE() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {
                String Mensaje = textREFF.Text;
                String Experimento = DDLclase.Text;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
                DateTime date = DateTime.Now;
                String query = " exec SRSP_ActualizarMensaje @Experimento , @Mensaje";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Experimento", Experimento);
                cmd.Parameters.AddWithValue("@Mensaje", Mensaje);


                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/ActualizarMensaje.aspx");
            }
        }
        /*
         * Funcionalidad: Verificar que no hayan espacios vacíos
         * Entrada: null
         * Salida: Boolean retorna un true o un false. 
         */
        protected Boolean validacionNullRE()
        {
            if (
               DDLclase.SelectedIndex           == 0  ||
               textREFF.Text == ""  )
            {
                return true;
            }

            else
            {
                return false;
            }
        }


    }
}