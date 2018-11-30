using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Online_Shopping_Backup.Pages
{

    public partial class IngresarMatricula : System.Web.UI.Page
    {
        /*
          * Funcionalidad: Carga de la Página 
          * Entrada: por default.  
          * Salida: null
          */

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        /*
         * Funcionalidad:Funcion para ingresar a al ventana experimentos
         * Entrada: por default 
         * Salida:null 
         */
        protected void Ingresar(object sender, EventArgs e)
        {
           // Codigo para verificar si existe un usuario
            SqlDataAdapter da2 = new SqlDataAdapter();
            if (conn.State == ConnectionState.Closed)
            { conn.Open(); }
            SqlCommand Totalf = new SqlCommand("SELECT dbo.SRF_ExisteEmail (@Email)", conn);
            Totalf.CommandType = CommandType.Text;
            SqlParameter code1 = new SqlParameter("@Email", SqlDbType.NVarChar);
            code1.Value = txtEmail.Text;
            Totalf.Parameters.Add(code1);
            var SAIDA = Totalf.ExecuteScalar();
            Boolean num = (Boolean)SAIDA;
            
            // codigo para redigirir opcion
            if(num == true)
            {
                Response.Cookies["UEmail"].Value = txtEmail.Text;
                Response.Redirect("~/Pages/MatriculaExperimento.aspx");
                
            }
            else
            {
              // Funcion JavaScript para rederigir a registro de usuario
               Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Confirm()", true);
            }
        }




    }
    }
