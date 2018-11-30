using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.Web.Security;
using System.Diagnostics;
using System.Threading;
using System.Windows.Forms;
using System.Web.UI.HtmlControls;
using Online_Shopping_Backup.WebServiceLextec;

namespace Online_Shopping_Backup
{

    public partial class MatriculaExperimento : System.Web.UI.Page
    {
        
        SendGmailEmail sendGmailEmail = SendGmailEmail.Instance;
        /*
         * Funcionalidad: Carga la página. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            String email =Request["email"];

            DataTable dt = new DataTable();

            dt = ws.SRSP_SeleccionarInvitacionesXCorreo(email);

            GridViewMatricular.Columns[6].HeaderText = "Matricular";

            int i = 0;
            int [] values = ws.SRSP_SeleccionarInvitacionesXCorreoValues(email);
                       
            GridViewMatricular.DataSource = dt;
            GridViewMatricular.DataBind();
            foreach (int j in values) {
                System.Web.UI.WebControls.ImageButton linkbtn = (System.Web.UI.WebControls.ImageButton)GridViewMatricular.Rows[j].FindControl("BtnMatricular");
               
                linkbtn.ImageUrl = "~/Images/Exito.png";
            }


        }
        /*
         * Funcionalidad: Matricula la sesión en la base de datos. 
         * Entrada: el idSesion es un id de la sesión a matricular. 
         * Salida: null. 
         */
        protected void MatricularSesion(int idSesion) {
            String email = Request["email"];

            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            ws.Matricular_Usuario(idSesion, email);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Se ha matriculado con Éxito.')", true);

        }
        /*
         * Funcionalidad: desmatricula una sesión desde la base de datos. 
         * Entrada: idSesión que es un identificador de la sesión. 
         * Salida: null. 
         */
        protected void DesmatricularSesion(int idSesion) {
            String email = Request["email"];

            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            ws.Desmatricular_Usuario(idSesion, email);

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