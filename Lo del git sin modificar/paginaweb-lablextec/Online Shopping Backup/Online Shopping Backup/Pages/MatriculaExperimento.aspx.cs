using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Diagnostics;
using System.Threading;
using System.Windows.Forms;
using System.Web.UI.HtmlControls;

namespace Online_Shopping_Backup
{

    public partial class MatriculaExperimento : System.Web.UI.Page
    {
        //String de coneccion 
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
        SendGmailEmail sendGmailEmail = SendGmailEmail.Instance;
        /*
         * Funcionalidad: Carga la página. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            String email=Request["email"];
            
            con.Open();
            String query = "exec dbo.SRSP_SeleccionarInvitacionesXCorreo @email";
            SqlCommand cmd = new SqlCommand(query, con);
            
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader lines = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Nombre", typeof(string)),
                            new DataColumn("Sesion", typeof(int)),
                            new DataColumn("Fecha",typeof(string)),
                            new DataColumn("Hora Inicio",typeof(string)),
                            new DataColumn("Hora Final",typeof(string)),
                            new DataColumn("Cupo",typeof(int))
                            });

            GridViewMatricular.Columns[6].HeaderText = "Matricular";

            int i = 0;
            List<int> values = new List<int>();

            while (lines.Read()) {
                
                dt.Rows.Add(lines[0], lines[1], lines[2], lines[3], lines[4], lines[5]);
                System.Diagnostics.Debug.WriteLine(lines[6]);

                if ((bool)lines[6] == false)
                {
                  
                    




                }
                else {
                    values.Add(i);

                  
                    
                }
                i++;
                
            }
            GridViewMatricular.DataSource = dt;
            GridViewMatricular.DataBind();
            foreach (int j in values) {
                System.Web.UI.WebControls.ImageButton linkbtn = (System.Web.UI.WebControls.ImageButton)GridViewMatricular.Rows[j].FindControl("BtnMatricular");
               
                linkbtn.ImageUrl = "~/Images/Exito.png";
            }
            con.Close();



        }
        /*
         * Funcionalidad: Matricula la sesión en la base de datos. 
         * Entrada: el idSesion es un id de la sesión a matricular. 
         * Salida: null. 
         */
        protected void MatricularSesion(int idSesion) {
            String email = Request["email"];
            con.Open();
            String query = "exec dbo.Matricular_Usuario @idSesion, @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@idSesion", idSesion);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Se ha matriculado con Éxito.')", true);

        }
        /*
         * Funcionalidad: desmatricula una sesión desde la base de datos. 
         * Entrada: idSesión que es un identificador de la sesión. 
         * Salida: null. 
         */
        protected void DesmatricularSesion(int idSesion) {
            String email = Request["email"];
            con.Open();
            String query = "exec dbo.Desmatricular_Usuario @idSesion, @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@idSesion", idSesion);
            System.Diagnostics.Debug.WriteLine(idSesion);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Se ha desmatriculado con Éxito.')", true);

        }
        /*
         * Funcionalidad: Activa la función de matricular y desmatricular. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void btn_Matricular(object sender, CommandEventArgs e)
        {
            System.Web.UI.WebControls.ImageButton lb = (System.Web.UI.WebControls.ImageButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (row != null)
            {
                int index = row.RowIndex; //gets the row index selected
                ViewState["Sesion"] = e.CommandArgument.ToString();
                
                    
                System.Web.UI.WebControls.ImageButton linkbtn = (System.Web.UI.WebControls.ImageButton)GridViewMatricular.Rows[index].FindControl("BtnMatricular");

                String v = row.Cells[5].Text.ToString();
               
                if (linkbtn.ImageUrl.Equals("~/Images/simple2.png"))
                {
                    if (v != "0")
                    {
                        MatricularSesion(Int32.Parse(e.CommandArgument.ToString()));
                        linkbtn.ImageUrl = "~/Images/Exito.png";

                        String email = Request["email"];
                        String body = "¡Felicidades!\n Usted se ha logrado matricular con éxito.";
                        sendGmailEmail.SendEmail(email, "Matricula a Experimento", body);
                    }
                }
                else
                {
                    
                        DesmatricularSesion(Int32.Parse(e.CommandArgument.ToString()));

                        linkbtn.ImageUrl = "~/Images/simple2.png";
                    
                   
                }
            }
            
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }






























    }
}