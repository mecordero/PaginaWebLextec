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
using System.Web.Services.Description;
using System.Windows.Forms;

namespace Online_Shopping_Backup
{

    public partial class IniciarSesion : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

        //variable para validar el registro.
        int annoCarrera;


        /*
         * Funcionalidad: Carga la página. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


    
    

        
        
        
        /*
         * Funcionalidad: Verifica el iniciar sesión. 
         * Entrada: por default. 
         * Salida: null
         */
        protected void LoginUser(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select u.email from Usuario u ", conn);
                if (conn.State == ConnectionState.Open)
                {
                    SqlDataReader sdr = cmd.ExecuteReader();
                    string email = txtEmailSubmit.Text.Trim().ToLower();
                    string emaildb = "";

                    while (sdr.Read())
                    {
                        emaildb = sdr[0].ToString().Trim().ToLower();

                        if (emaildb.Equals(email))
                        {
                            if (conn != null)
                                conn.Close();
                            Response.Cookies["UEmail"].Value = txtEmailSubmit.Text;
                            Response.Redirect("~/Pages/MatriculaExperimento.aspx?email=" + txtEmailSubmit.Text);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('El Correo que se Selecciono, no pertenece a ningún Usuario.')", true);


                        }


                    }

                }
            }
            finally
            {
                if (conn != null)
                    conn.Close();

               
            }
        }


    }

   
}