using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using Online_Shopping_Backup.WebServiceLextec;

namespace Online_Shopping_Backup
{

    public partial class RegistroExp : System.Web.UI.Page
    { 

   
        //parte de SR1 no del SR2 
        /*
         * Funcionalidad: carga las clases y los tipos de experimentos en sus respectivos componentes de interfaz
         * Entrada:
         
         * Salida: 
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (! IsPostBack)
            {

                DDLclase.Items.Add(new ListItem(""));

                DataTable dt = ws.GetAllClases();

                foreach (DataRow row in dt.Rows)
                {
                    DDLclase.Items.Add(new ListItem(row["nombre"].ToString()));
                }

                DDLclase.Items.Add("Nueva"); //esto no funciona

                DDLtipo.Items.Add(new ListItem(""));

                foreach (DataRow row in dt.Rows)
                {
                    DDLtipo.Items.Add(new ListItem(row["nombre"].ToString()));
                }

                DDLtipo.Items.Add("Nuevo"); //esto no funciona

            }
        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void changeDivNclase(object sender, EventArgs e)
        {
           if (DDLclase.SelectedItem.Text == "Nueva")
            {
                divNClase.Attributes["class"] = "visible";
            }
            else
            {
                divNClase.Attributes["class"] = "oculto";
            }
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void changeDivNtipo(object sender, EventArgs e)
        {
           if (DDLtipo.SelectedItem.Text == "Nuevo")
            {
                divNtipo.Attributes["class"] = "visible";
            }
            else
            {
                divNtipo.Attributes["class"] = "oculto";
            }
           
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected int fk_tipo()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            int fkTipo = 0;
            if(TextRETipo.Text != "")
            {
                ws.SRSP_InsertarTipo(TextRETipo.Text);
                fkTipo = (int) ws.GetIdTipoFromNombre(TextRETipo.Text);
                                
            }
            else
            {
                fkTipo = (int) ws.GetIdTipoFromNombre(DDLtipo.Items[DDLtipo.SelectedIndex].Text);

            }
            return fkTipo;
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected int fk_clase()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            int fkClase = 0;
            if (TextREclase.Text != "")
            {
                ws.SRSP_InsertarClase(TextREclase.Text);
                fkClase = (int) ws.GetIdClaseFromNombre(TextREclase.Text);
                
            }
            else
            {
                fkClase = (int) ws.GetIdClaseFromNombre(DDLclase.Items[DDLclase.SelectedIndex].Text);
                
            }
            return fkClase;
        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected int fk_administrador()
        {
            string admin = Response.Cookies["u_id"].Value;
            int fkAdministrador = 0;

            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            fkAdministrador = (int) ws.GetIdAdministradorFromNombre(admin);

           
            return fkAdministrador;
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected Boolean esAbierto()
        {
            if (selectRAbierto.SelectedIndex == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void ingresarExp (object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();


            if (validacionNullRE() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {
                String Dateinicial = TxtREFI.Text;
                String DateFinal = textREFF.Text;
                DateTime date = DateTime.Now;
               
                ws.SRSP_InsertarExperimento(TextREnombre.Text, TxtREPublico.Text, TextRENote.Text, txtREDescription.Text,
                    TextRElugar.Text, esAbierto(), fk_clase(), fk_tipo(), Dateinicial, DateFinal, false, fk_administrador());

                Response.Redirect("~/ExperimentosAdmin.aspx");
            }
        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected Boolean validacionNullRE()
        {
            if (TextREnombre.Text               == "" ||
               TxtREPublico.Text                == "" ||
               TextRENote.Text                  == "" ||
               txtREDescription.Text            == "" ||
               txtREDescription.Text            ==""  ||
               TextRElugar.Text                 == "" ||
               TextCupo.Text                    == "" ||
               DDLclase.SelectedIndex           == 0  ||
               DDLtipo.SelectedIndex            == 0     )
            {
                return true;
            }
            else if (DDLclase.SelectedItem.Text == "Nueva" && TextREclase.Text == "" )
            {
                return true;
            }
            else if (DDLtipo.SelectedItem.Text == "Nuevo" && TextRETipo.Text == "")
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