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

    public partial class Registro : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                SelectAC.Items.Clear();

                for (int year = 0; year < DateTime.Now.Year-1959; year++)
                {
                    string targetYear = String.Format("{0}", 1960 + year);
                    SelectAC.Items.Add(new ListItem(targetYear, year.ToString()));
                }
            }
        }

        protected void YearList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


        /*
         * Funcionalidad: metodo del boton para ingresar datos a la base de datos
         * Entrada:por default. 
         * Salida: null. 
         */

        protected void btnRUonClick(object sender, EventArgs e)
        {
            if (validacionNull() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {


				System.Diagnostics.Debug.WriteLine("a ver si sirve");

				//asignacion de variables
				char genero = char.Parse(SelectGenero.Items[SelectGenero.SelectedIndex].Text);
                String especialidad = SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Value;
                String gradoEstudio = SelectGE.Items[SelectGE.SelectedIndex].Value;
				String nacionalidad = SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Text;
                DateTime date = DateTime.Now;
				string iDate = TextFechaNac.Text;
				DateTime oDate = Convert.ToDateTime(iDate);
			


				try
                {
					
					String query = "exec SRSP_InsertarUsuario @Nombre, @Apellido1, @Apellido2 ,@Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio, @Genero, @Habilitado, @Estudiante, @fechaNacimiento, @Telefono, @AnnoIngreso, @FechaRegistro, @FechaDeshabilitado";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Nombre", TextRname.Text);
					
					cmd.Parameters.AddWithValue("@Apellido1", TxtRPApellido.Text);
					
					cmd.Parameters.AddWithValue("@Apellido2", TxtRSApellido.Text);
					
                    cmd.Parameters.AddWithValue("@Cedula", TextCedula.Text.Trim());
					
                    cmd.Parameters.AddWithValue("@Email", TextEmail.Text.Trim().ToLower());
					
					cmd.Parameters.AddWithValue("@Especialidad", especialidad);
					
					cmd.Parameters.AddWithValue("@Nacionalidad", nacionalidad);
					
					cmd.Parameters.AddWithValue("@Genero", genero);
					
					cmd.Parameters.AddWithValue("@Habilitado", true);
					
					cmd.Parameters.AddWithValue("@Estudiante", esEstudiante());
					
					cmd.Parameters.AddWithValue("@fechaNacimiento", oDate);
					
					cmd.Parameters.AddWithValue("@Telefono", TextPhone.Text);
					
					cmd.Parameters.AddWithValue("@GradoEstudio", gradoEstudio);
					
					cmd.Parameters.AddWithValue("@AnnoIngreso", annoCarrera);
					
					cmd.Parameters.AddWithValue("@FechaRegistro", date);
					
					cmd.Parameters.AddWithValue("@FechaDeshabilitado", DBNull.Value);
					
					cmd.ExecuteNonQuery();
                    conn.Close();
					Response.Redirect("~/Pages/Home.aspx");
				}
                catch (SqlException esql)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto" + "');", true);
					System.Diagnostics.Debug.WriteLine("SQL Problem");
					System.Diagnostics.Debug.WriteLine(esql.Message);
				}
				catch (Exception ex)
				{
					ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto quak" + "');", true);
					System.Diagnostics.Debug.WriteLine(ex.Message);
				}

				
            }

        }

        /*
         * Funcionalidad: De acuerdo al select de estudiante, se guarda el booleano correspondiente.
         * Entrada: null
         * Salida: boolean del select
         */
        
        protected Boolean esEstudiante()
        {
            if (selectEstudiante.SelectedItem.Text == "Si")
            {
                annoCarrera = int.Parse(SelectAC.Items[SelectAC.SelectedIndex].Text);

                return true;
            }
            else
            {
                return false;
            }
        }

        /*
         * Funcionalidad: para habilitar los div de los campos anno carrera y tipo de estudio.
         * Entrada: por default.
         * Salida: null.
         */
     
        protected void onChangeSE(object sender, EventArgs e)
        {

            if (selectEstudiante.SelectedItem.Text == "Si")
            {
                DivCarrera.Attributes["class"] = "visible";
                DivGEstudio.Attributes["class"] = "visible";
            }
            else
            {
                DivCarrera.Attributes["class"] = "oculto";
                DivGEstudio.Attributes["class"] = "oculto";
            }
        }


        /*
         * Funcionalidad:validacion de espacios vacios en el registro.
         * Entrada:null
         * Salida: boolean que dice que verifica si hay espacios vacíos. 
         */
        
        protected Boolean validacionNull()
        {
            if (TextRname.Text == "" ||
               TxtRPApellido.Text == "" ||
               TxtRSApellido.Text == "" ||
               TextCedula.Text == "" ||
               SelectGenero.SelectedIndex == 0 ||
               TextFechaNac.Text == "" ||
               TextPhone.Text == "" ||
               TextEmail.Text == "" ||
               SelectEspcialidad.SelectedIndex == 0 ||
               SelectNacionalidad.SelectedIndex == 0 ||
               selectEstudiante.SelectedIndex == 0)
            {
                return true;
            }
            else if (selectEstudiante.SelectedIndex == 1 &&
                     (SelectGE.SelectedIndex == 0 ||
                      SelectAC.SelectedIndex == 0))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /*
         * Funcionalidad: Verifica el iniciar sesión. 
         * Entrada: por default. 
         * Salida: null
         */
        


    }

   
}