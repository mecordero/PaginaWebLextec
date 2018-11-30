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

    public partial class forget_password : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
        /*
         * Funcionalidad: Carga de la Página 
         * Entrada: por default.  
         * Salida: null
         */
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        /*
         * Funcionalidad: Cambia la contaseña de un usuario cuando se da click. 
         * Entrada: por default 
         * Salida: ninguna
         */
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
            conn.Open();
            string usuario = txt_username.Text;
            SqlCommand cmd = new SqlCommand("select AM.contrasenna from Administrador AM where AM.email='"+usuario+"' ", conn);

            cmd.CommandTimeout = 10000;

            if (conn.State == ConnectionState.Open)
            {
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {

        
                        string toAddress = usuario; string subject = "Recuperación Contraseña";
                        string body = "Contraseña: " + sdr[0].ToString();
                      
                        string senderID = "execlabtec@gmail.com";// use sender’s email id here..
                        const string senderPassword = "VernonSmith"; // sender password here…
                        try
                        {
                            SmtpClient smtp = new SmtpClient
                            {
                                Host = "smtp.gmail.com", // smtp server address here…
                                Port = 587,
                                EnableSsl = true,
                                DeliveryMethod = SmtpDeliveryMethod.Network,
                                Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                                Timeout = 30000,
                            };
                            MailMessage message = new MailMessage(senderID, toAddress, subject, body);
                            smtp.Send(message);
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Correo enviado correctamente');", true);

                    }
                        catch (Exception)
                    {
                           
                        }
                    

                }

            }

            else
            {

            }
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Administrador inexistente, por favor ingrese un correo válido');", true);
            conn.Close();
             }



            
        }
    }
