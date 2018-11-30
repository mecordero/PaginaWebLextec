using ClosedXML.Excel;
using ClosedXML.Excel;
using Online_Shopping_Backup.WebServiceLextec;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace Online_Shopping_Backup
{
    public partial class UsuariosAdmin : System.Web.UI.Page
    {
        List<string> users = new List<string>();
        HtmlSelect select;
        bool selectedAll = false;
      


        /*
         * Funcionalidad: -
         * Entrada: 
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
            if (!Page.IsPostBack)
            {
                SelectAC.Items.Clear();

                for (int year = 0; year < DateTime.Now.Year - 1959; year++)
                {
                    string targetYear = String.Format("{0}", 1960 + year);
                    SelectAC.Items.Add(new ListItem(targetYear, year.ToString()));
                }
            }
        }


        /*
         * Funcionalidad: se carga a una variable fija la lista para elegir el sexo 
         * Entrada:
          *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void SexoChanged(object sender, EventArgs e)
        {
            DropDownList ddlSexo = (DropDownList)sender;
        }

        /*
         * Funcionalidad: Cambia el estado de todos los combo box de la interfaz para que salgan como elegidos 
         *				y los guarda en una variable tipo cookie de "SelectedRecords" -> lo que guarda es el ID de los usuarios
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void CbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectAll = (CheckBox)sender;
            bool checkState = selectAll.Checked;
            if (!selectedAll)
            {
                selectedAll = true;
            }
            else
            {
                selectedAll = false;
            }
            List<Int64> selectedRecords;
            CheckBox rowCB;
            Int64 userID;

            if (ViewState["SelectedRecords"] == null)
                selectedRecords = new List<Int64>();
            else
                selectedRecords = (List<Int64>)ViewState["SelectedRecords"];
           
     
                foreach (GridViewRow row in GridView1.Rows)
                     {
                    rowCB = (CheckBox)row.Cells[0].FindControl("CbSelect");
                    rowCB.Checked = checkState;
                   String userCedula=String.Join("", GridView1.DataKeys[row.RowIndex].Value.ToString().Split(' ', '-'));
                   userID = Int64.Parse(userCedula);

                    if (checkState)
                        selectedRecords.Add(userID);
                    else
                        selectedRecords.Remove(userID);
                    }
    

            ViewState["SelectedRecords"] = selectedRecords;
        }

        /*
         * Funcionalidad:
         *		Recorre todos los checkbox de los usuarios (fijarse en interfaz) para preguntarse si 
         *		estan elegidos o no, si lo estan, los agrega en la variable/cookies de "SelectedRecords"
         *		Y llega a guardar el ID de los usuarios 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void CbSelect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelect = (CheckBox)sender;
            GridViewRow cbRow = (GridViewRow)cbSelect.NamingContainer;
            Int64 userID = Int64.Parse(GridView1.DataKeys[cbRow.RowIndex].Value.ToString());
            List<Int64> selectedRecords;

            if (ViewState["SelectedRecords"] == null)
                selectedRecords = new List<Int64>();
            else
                selectedRecords = (List<Int64>)ViewState["SelectedRecords"];

            if (cbSelect.Checked)
            {
                if (!selectedRecords.Contains(userID))
                    selectedRecords.Add(userID);
            }
            else
            {
                if (selectedRecords.Contains(userID))
                    selectedRecords.Remove(userID);
            }

            ViewState["SelectedRecords"] = selectedRecords;
        }

        /*
         * Funcionalidad: carga los usuarios dentro del gridview1, transforma los datos que sean 
         *			diferentes de string, toma en cuenta los guardados en la variable/cookie "SelectedRecords" 
         *			para que se vuelvan a cargar de esta forma 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (ViewState["SelectedRecords"] == null)
                return;

            List<Int64> selectedRecords;
            CheckBox rowCB;
            Int64 userID;
            selectedRecords = (List<Int64>)ViewState["SelectedRecords"];

                foreach (GridViewRow row in GridView1.Rows)
                {
                    rowCB = (CheckBox)row.Cells[0].FindControl("CbSelect");
                    int index = row.RowIndex;
                String userCedula = String.Join("", GridView1.DataKeys[row.RowIndex].Value.ToString().Split(' ', '-'));
                userID = Int64.Parse(userCedula);

                    if (selectedRecords.Contains(userID))
                        rowCB.Checked = true;
                }

            ViewState["SelectedRecords"] = selectedRecords;
        }

        /*
         * Funcionalidad: 
         *		Revisa si la persona elegida es estudiante, y dado este detalle muestra o no 
         *		un div correspondiente a la carrera y los estudios
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: -
         */
        protected void selectEstudiante_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList isStudent = (DropDownList)sender;
            string value = isStudent.Items[isStudent.SelectedIndex].Text;

            if (value.Equals("No"))
            {
                DivGEstudio.Visible = false;
                DivCarrera.Visible = false;
            }
            else
            {
                DivGEstudio.Visible = true;
                DivCarrera.Visible = true;
            }
        }

        /*
         * Funcionalidad: Agrega un usuario dado la información de la interfaz
         *		Detalles: crea una conexion con la base de datos, ejecuta el procedure guardado en la BD para insertar usuarios 
         *		los parametros los toma de CreateParameters(los inputs) 
         *		Y contiene validaciones con diferentes excepciones 
         * Entrada:
         * Salida:
         */
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            try
            {

                string name = TextRname.Text;
                string lastName1 = TxtRPApellido.Text;
                string lastName2 = TxtRSApellido.Text;
                string email = TextEmail.Text;
                string id = TextCedula.Text;
                string birthDate = TextFechaNac.Text;
                string phone = TextPhone.Text;
                char gender = char.Parse(SelectGenero.Items[SelectGenero.SelectedIndex].Text);
                string speciality = SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Value;
                string nationality = SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Text;
                bool isStudent = selectEstudiante.Items[selectEstudiante.SelectedIndex].Text.Equals("Si");
                string careerYear = null, careerLevel = null;

                email = email.Trim().ToLower();
                id = id.Trim();

                if (isStudent)
                {
                    careerYear = SelectAC.Items[SelectAC.SelectedIndex].Text;
                    careerLevel = SelectGE.Items[SelectGE.SelectedIndex].Value;
                }

                ws.SRSP_InsertarUsuario(name, lastName1, lastName2, id, email, speciality,
                    nationality, careerLevel, gender, isStudent, birthDate, phone, careerYear);

            }
            catch (SqlException esql)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto SQL" + "');", true);
                System.Diagnostics.Debug.WriteLine("SQL Problem");
                System.Diagnostics.Debug.WriteLine(esql.Message);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto" + "');", true);
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                Response.Redirect("~/UsuariosAdmin.aspx");
            }

        }

        /*
         * Funcionalidad: Elimina usuarios segun las cedulas 
         *		Crea una coenxion sql, donde ejecuta el procedure de eliminar usuario de la BD, 
         *		recorre la variable/cookie que guarda los usuarios seleccionados para aplicarles 
         *		el proceso de borrado 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: - 
         */
        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (ViewState["SelectedRecords"] == null)
                return;

            List<Int64> selectedRecords = (List<Int64>)ViewState["SelectedRecords"];

            try
            {

                foreach (Int64 record in selectedRecords)
                {
                    ws.SRSP_EliminarUsuario(record);

                }
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
            finally
            {
                Response.Redirect("~/UsuariosAdmin.aspx");
            }
           
        }

        /*
         * Funcionalidad: crea una conexion sql con el servidor 
         * Entrada: - 
         * Salida: devuelve la conexion establecida para ser eventualmente utilizada. 
         */
        private SqlConnection CreateSqlConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
        }

        /*
         * Funcionalidad: toma los valores ingresador en los diferentes componentes de la interfaz para guardarlos  
         *			en los parametros del comando de SQL 
         * Entrada: 
         *			SqlConnection conn : la conexion con el servidor 
         *			string query: la consulta que desea realizar o ejecutar dentro de la base de datos.
         * Salida: SqlCommand cmd : donde toma el query para aplicarlo en la conexion, y guarda los parametros en 
         *			el comando 
         */
        private SqlCommand CreateParameters(SqlConnection conn, string query)
        {

            string name = TextRname.Text;
            string lastName1 = TxtRPApellido.Text;
            string lastName2 = TxtRSApellido.Text;
            string email = TextEmail.Text;
            string id = TextCedula.Text;
            string birthDate = TextFechaNac.Text;
            string phone = TextPhone.Text;
            char gender = char.Parse(SelectGenero.Items[SelectGenero.SelectedIndex].Text);
            string speciality = SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Value;
            string nationality = SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Text;
            bool isStudent = selectEstudiante.Items[selectEstudiante.SelectedIndex].Text.Equals("Si");
            string carrerYear = null, carrerLevel = null;

            email = email.Trim().ToLower();
            id = id.Trim();

            if (isStudent)
            {
                carrerYear = SelectAC.Items[SelectAC.SelectedIndex].Text;
                carrerLevel = SelectGE.Items[SelectGE.SelectedIndex].Value;
            }

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Nombre", name);
            cmd.Parameters.AddWithValue("@Apellido1", lastName1);
            cmd.Parameters.AddWithValue("@Apellido2", lastName2);
            cmd.Parameters.AddWithValue("@Cedula", id);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Especialidad", speciality);
            cmd.Parameters.AddWithValue("@Nacionalidad", nationality);
            cmd.Parameters.AddWithValue("@Genero", gender);
            cmd.Parameters.AddWithValue("@Habilitado", true);
            cmd.Parameters.AddWithValue("@Estudiante", isStudent);
            cmd.Parameters.AddWithValue("@fechaNacimiento", birthDate);
            cmd.Parameters.AddWithValue("@Telefono", phone);
            cmd.Parameters.AddWithValue("@GradoEstudio", (carrerLevel == null) ? DBNull.Value.ToString() : carrerLevel);
            cmd.Parameters.AddWithValue("@AnnoIngreso", (carrerYear == null) ? DBNull.Value.ToString() : carrerYear);
            cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Today);
            cmd.Parameters.AddWithValue("@FechaDeshabilitado", DBNull.Value);

            return cmd;
        }

        /*
         * Funcionalidad: limpia los componentes de la interfaz 
         * Entrada: - 
         * Salida: - 
         */
        private void ClearInputControls()
        {
            TextRname.Text = "";
            TxtRPApellido.Text = "";
            TxtRSApellido.Text = "";
            TextEmail.Text = "";
            TextCedula.Text = "";
            TextFechaNac.Text = "";
            TextPhone.Text = "";
            SelectGenero.Items[SelectGenero.SelectedIndex].Selected = false;
            SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Selected = false;
            SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Selected = false;
            selectEstudiante.Items[selectEstudiante.SelectedIndex].Selected = false;
            SelectAC.Items[SelectAC.SelectedIndex].Selected = false;
            SelectGE.Items[SelectGE.SelectedIndex].Selected = false;
        }

        /*
         * Funcionalidad: verifica si hay usuarios seleccionados, sino detiene el flujo 
         * Entrada: 
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida: llama 
         */
        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedRecords"] == null)
                return;

            BeginEditingProcess();
        }

        /*
         * Funcionalidad: leer los valores del usuario y cargarlos en el modal 
         * Entrada:
         * Salida:
         */
        private void BeginEditingProcess()
        {
            List<Int64> selectedRecords = (List<Int64>)ViewState["SelectedRecords"];
            GridViewRow userRow = null;
            Int64 userID;

            foreach (GridViewRow row in GridView1.Rows)
            {
                String userCedula = String.Join("", GridView1.DataKeys[row.RowIndex].Value.ToString().Split(' ', '-'));
                userID = Int64.Parse(userCedula);

                if (selectedRecords.Contains(userID))
                {
                    userRow = row;
                    break;
                }
            }

            if (userRow == null)
                return;

            ClearInputControls();

            SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Selected = false;
            SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Selected = false;
            SelectGE.Items[SelectGE.SelectedIndex].Selected = false;
            SelectGenero.Items[SelectGenero.SelectedIndex].Selected = false;
            selectEstudiante.Items[selectEstudiante.SelectedIndex].Selected = false;
            SelectAC.Items[SelectAC.SelectedIndex].Selected = false;

            TableCell controlEspecialidad = userRow.Cells[6];
            string especialidad = Regex.Replace(controlEspecialidad.Text, "  |\n|\r", "");

            TableCell controlNacionalidad = userRow.Cells[7];
            string nacionalidad = Regex.Replace(controlNacionalidad.Text, "  |\n|\r", "");

            TableCell controlGE = userRow.Cells[8];
            string ge = Regex.Replace(controlGE.Text, "  |\n|\r", "");

            TableCell controlGenero = userRow.Cells[9];
            string genero = Regex.Replace(controlGenero.Text, "  |\n|\r", "");

            TableCell controlEstudiante = userRow.Cells[10];
            string estudiante = Regex.Replace(controlEstudiante.Text, "  |\n|\r", "");
            estudiante = estudiante.Equals("True") ? "Si" : "No";

            TextRname.Text = userRow.Cells[1].Text;
            TxtRPApellido.Text = userRow.Cells[2].Text;
            TxtRSApellido.Text = userRow.Cells[3].Text;
            TextCedula.Text = userRow.Cells[4].Text;
            TextEmail.Text = userRow.Cells[5].Text;
            SelectEspcialidad.Items.FindByValue(especialidad).Selected = true;
            SelectNacionalidad.Items.FindByValue(nacionalidad).Selected = true;
            SelectGenero.Items.FindByValue(genero).Selected = true;
            selectEstudiante.Items.FindByText(estudiante).Selected = true;
            TextFechaNac.Text =
            TextPhone.Text = userRow.Cells[12].Text;

            ModalTitle.InnerText = "Editar usuario";
            BtnEdit.Visible = true;
            BtnRegister.Visible = false;

            if (estudiante.Equals("No"))
            {
                DivGEstudio.Visible = false;
                DivCarrera.Visible = false;
            }
            else
            {
                DivGEstudio.Visible = true;
                DivCarrera.Visible = true;

                SelectAC.Items.FindByText(userRow.Cells[13].Text).Selected = true;
                SelectGE.Items.FindByValue(ge).Selected = true;
            }

            ViewState["EditingID"] = Int64.Parse(TextCedula.Text);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        /*
         * Funcionalidad: abre el modal para crear un usuario 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            ClearInputControls();
            ModalTitle.InnerText = "Registrar usuario";
            BtnEdit.Visible = false;
            BtnRegister.Visible = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        /*
         * Funcionalidad: a nivel de db actualiza el usuario 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            try
            {

                string name = TextRname.Text;
                string lastName1 = TxtRPApellido.Text;
                string lastName2 = TxtRSApellido.Text;
                string email = TextEmail.Text;
                string id = TextCedula.Text;
                string birthDate = TextFechaNac.Text;
                string phone = TextPhone.Text;
                char gender = char.Parse(SelectGenero.Items[SelectGenero.SelectedIndex].Text);
                string speciality = SelectEspcialidad.Items[SelectEspcialidad.SelectedIndex].Value;
                string nationality = SelectNacionalidad.Items[SelectNacionalidad.SelectedIndex].Text;
                bool isStudent = selectEstudiante.Items[selectEstudiante.SelectedIndex].Text.Equals("Si");
                string careerYear = null, careerLevel = null;

                email = email.Trim().ToLower();
                id = id.Trim();

                if (isStudent)
                {
                    careerYear = SelectAC.Items[SelectAC.SelectedIndex].Text;
                    careerLevel = SelectGE.Items[SelectGE.SelectedIndex].Value;
                }

                ws.SRSP_ActualizarUsuario(name, lastName1, lastName2, id, email, speciality, nationality, careerLevel, gender, isStudent, birthDate, phone, careerYear);

                List<Int64> selectedRecords = (List<Int64>)ViewState["SelectedRecords"];
                    Int64 editingID = (Int64)ViewState["EditingID"];

                    selectedRecords.Remove(editingID);
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
                finally
                {

                    Response.Redirect("~/UsuariosAdmin.aspx");
                }
        }
        
        /*
         * Funcionalidad: a nivel de db filtra los usuarios 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            BindUser();
        }

        /*
         * Funcionalidad: abre modal de pedir procentaje para elegir usuarios aleatorios 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void btnSeleccionarAleatorio_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "POP", "ShowModalPercent();", true);
        }

        /*
         * Funcionalidad: toma todos los usuarios 
         * Entrada: - 
         * Salida: devuelve todos los usuarios tomados de DB 
         */
        protected List<string> getAllUsers()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();


            List<string> users = new List<string>(ws.GetAllUsers());

            return users;
        }


        protected List<string> getInvitedAndEnrolledUsuario(int idExperiment)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            List<string> users = new List<string>(ws.SRSP_SelectInvitados(idExperiment));

            return users;

        }




        /*
         * Funcionalidad:  toma usuarios y emails y elige segun el porcentaje aleatoriamente a personas , y luego 
         * abre modal con la gente elegida 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void btnOkSeleccionarAleatorio(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            string texto = TxtPercent.Text;


            int perc_select = Int32.Parse(texto);

            List<string> users = new List<string>();
            Random rnd = new Random();
            List<string> random_users = new List<string>();
            List<int> random_usersID = new List<int>();
            DataTable dt = new DataTable();

            if (ViewState["UsersEmails"] == null)
                ViewState["UsersEmails"] = getAllUsers();

            users = (List<string>)ViewState["UsersEmails"];
            System.Diagnostics.Debug.WriteLine("users count: " + users.Count.ToString());
            int idExp = Int32.Parse(ddlNameSearch.SelectedItem.Value);
            List<string> invited = getInvitedAndEnrolledUsuario(idExp);
            System.Diagnostics.Debug.WriteLine("invited count: " + invited.Count.ToString());
            List<string> result = users.Except(invited).ToList();
            System.Diagnostics.Debug.WriteLine("result count: " + result.Count.ToString());
            users = result;
            if (result.Count == 0)
            {
                string code = "\"" + "No hay más correos por invitar" + "\"";
                HtmlGenericControl divpart = new HtmlGenericControl("div");
                string codeA = "<a href = \"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";
                divpart.InnerHtml = codeA;
                divpart.Attributes.Add("class", "alert alert-success");
                divpart.Attributes.Add("style", "width: 300px ;height: 50px; ");
                HtmlGenericControl divul = new HtmlGenericControl("ul");
                HtmlGenericControl divli = new HtmlGenericControl("li");
                divli.InnerHtml = code;
                divul.Controls.Add(divli);
                divpart.Controls.Add(divul);
                divUsers.Attributes.Add("style", "height: 200px; overflow: scroll");
                divUsers.Controls.Add(divpart);
                btnEnviarInvitacion.Enabled = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "POP", "ShowModalUsers();", true);

            }
            else
            {
                btnEnviarInvitacion.Enabled = true;
                if (dt.Columns.Count == 0)
                    dt.Columns.Add("email", typeof(string));
                int i = 0;
                foreach (string correo in users)
                {

                    int compare = rnd.Next(1, 100);
                    if (compare <= perc_select)
                    {
                        // tengo que meter en la nueva lista rara :v 
                        random_users.Add(correo);
                        random_usersID.Add(getUserID(correo));
                        string code = "\"" + correo + "\"";
                        HtmlGenericControl divpart = new HtmlGenericControl("div");
                        string codeA = "<a href = \"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";
                        divpart.InnerHtml = codeA;
                        divpart.Attributes.Add("class", "alert alert-success");
                        divpart.Attributes.Add("style", "width: 300px ;height: 50px; ");
                        HtmlGenericControl divul = new HtmlGenericControl("ul");
                        HtmlGenericControl divli = new HtmlGenericControl("li");
                        divli.InnerHtml = code;
                        divul.Controls.Add(divli);
                        divpart.Controls.Add(divul);
                        divUsers.Attributes.Add("style", "height: 200px; overflow: scroll");
                        divUsers.Controls.Add(divpart);
                        i++;
                        if (i >= 500)
                        {
                            break;
                        }
                    }
                }
                selectedUsers.InnerText = "Se han seleccionado: " + i + " Personas";
                ViewState["UsersEmailRandom"] = random_users;
                ViewState["UsersIDRandom"] = random_usersID;


                SqlDataSource2.SelectParameters.Add("SelectCommand", "EXEC SRSP_VerNombresExperimentos");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "POP", "ShowModalUsers();", true);
            }
            ddlNameSearchSesion.Items.Clear();
            ddlNameSearchSesion.Items.Add(new ListItem("Todas", "-1"));


            DataTable data = ws.SRSP_VerSesionesdeExperimento(idExp);

            foreach (DataRow row in data.Rows)
            {
                ddlNameSearchSesion.Items.Add(new ListItem("ID: " + row["idSesion"].ToString() + " Fecha:" + row["fecha"].ToString(), row["idSesion"].ToString()));
            }

        }

        /*
         * Funcionalidad: toma el id dado el email en DB 
         * Entrada: string correo: el correo de quien quiero consultar 
         * Salida::  int idUser : el id con el que se identifica. 
         */
        protected int getUserID(string correo)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            try
            {

                int idUser = 0;
                DataTable dt = ws.SRSP_VerUsuario(correo);
                foreach(DataRow row in dt.Rows)
                {
                    idUser = (int)row[0];
                }
                return idUser;
            }
            catch (Exception e)
            {

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto SQL." + "');", true);
            return 0;
            }


        }


        /*
         * Funcionalidad: dadon un experimento, conuslta las sesiones para  luego cargarlas a un combobox o en la matricula (sesionxusuario)
         * Entrada: - 
         * Salida: devuelve las sesiones  
         */
        protected List<int> getSessionsSelected() {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            List<int> sesionsID = new List<int>();
            DataTable dt;

            if (ddlNameSearchSesion.SelectedValue == "-1")
            {

                if (ddlNameSearch.SelectedValue != "")
                {
                    dt = ws.SRSP_VerSesionesdeExperimento(Int32.Parse(ddlNameSearch.SelectedValue));
                            ViewState["ExperimentName"] = ddlNameSearch.SelectedItem.Text;
                }
                else
                {
                    return new List<int>();
                }
                List<int> Sesiones = new List<int>();
                foreach(DataRow row in dt.Rows)
                {
                    int result = (int)row[0];
                    Sesiones.Add(result);
                }
                return Sesiones;
            }
            else {
                List<int> Sesiones = new List<int>();
                Sesiones.Add(Int32.Parse(ddlNameSearchSesion.SelectedValue));
                return Sesiones;

            }

        }

        /*
         * Funcionalidad: envia un correo por individual para invitarlo a una sesion / experimento 
         * Entrada: 
         *		int idSesion: la sesion a la que quiero invitarlo 
         *		int idUsuario: el usuario que quiero invitar 
         * Salida: - 
         */
        protected void sendInvitationIndividual(int idSesion, int idUser, string subject, string body)
        {

            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            ws.SRSP_InsertarSesionxUsuario(idUser, idSesion);
            
        }

        protected void OpenEmailModal(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openEmailModal();", true);
        }

        protected void OpenLoadModal()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openloadModal();", true);
        }
        protected void CloseLoadModal()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeloadModal();", true);
        }
        /*
         * Funcionalidad: carga las sesiones del experimento seleccionado y recorre todos los id de los usuarios 
         * que se eligieron a lo random para enviar una invtacion individual. 
         * Entrada:
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void send_UserInvitation(object sender, EventArgs e) 
        {
            
            List<int> sesiones = getSessionsSelected();
            List<int> usersid = (List<int>)ViewState["UsersIDRandom"];

            string subject = EmailSubject.Text;
            string body = EmailBody.Text;

            foreach (int sesion in sesiones)
            {
                foreach (int user in usersid)
                {
                    sendInvitationIndividual(sesion, user, subject, body);
                }
            }

            List<String> emails = (List<string>)ViewState["UsersEmailRandom"];
            ISendEmail sendEmail = SendGmailEmail.Instance;
            bool sendResult = sendEmail.SendEmail(emails, subject, body);

            if(!sendResult) 
            {
                // An Exception occured during the email proccess, so procced to
                // create a csv file with the emails that were supposed to be on
                // the email and download it to the user's machine.

                string resultcsv = String.Join("\n", emails.ToArray());

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=SRUsuariosLigados.csv");
                Response.Charset = "";
                Response.ContentType = "application/text";
                Response.Output.Write(resultcsv);
                Response.Flush();
                Response.End();
            }
        }

        /*
         * Funcionalidad: saca los usuarios de la tabla y se puede descargar un csv de los usuarios 
         * Entrada: 
         *		object sender: encargado de llamar esta funcion 
         *		EventArgs e: los argumentos del evento
         * Salida:
         */
        protected void btnExportar_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            try
            {
                                
                String like = txtSearchMaster.Text;
                String speciality = DDLEspecialidad.SelectedValue;
                String nationality = ddlNacionalidad.SelectedValue;
                String careerLevel = ddlGradoEstudio.SelectedValue;
                String sex = ddlSexo.SelectedValue;
                String notExperiment = NotExperiment.SelectedValue;
                String student = ddlEstudiante.SelectedValue;
                String startDate = TxtFromSearch.Text;
                String endDate = TxtToSearch.Text;
                String startQuantity = TxtParticipacionesFrom.Text;
                String endQuantity = TxtParticipacionesTo.Text;
                String startRegisterDate = TxtFromRegister.Text;
                String endRegisterDate = TxtToRegister.Text;

                DataTable dt = ws.SRSP_FiltrarUsuariosLike(like, speciality, nationality, careerLevel, sex, notExperiment, student, startDate, endDate, startQuantity, endQuantity, startRegisterDate, endRegisterDate);
                
                var lines = new List<string>();

                string[] columnNames = dt.Columns.Cast<DataColumn>().
                                                    Select(column => column.ColumnName).
                                                    ToArray();
                    
                string header = string.Join(";", columnNames);
                    
                lines.Add(header);
                    
                EnumerableRowCollection valueLines = dt.AsEnumerable()
                                    .Select(row => string.Join(";", row.ItemArray));
                    
                foreach (var row in valueLines) {
                        
                    lines.Add(row.ToString()); 
                }
                var result = String.Join("\n", lines.ToArray());

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=SRUsuarios.csv");
                Response.Charset = "";
                Response.ContentType = "application/text";
                Response.Output.Write(result);
                Response.Flush();
                Response.End();
                

                }
                catch (SqlException esql)
                {
                    System.Diagnostics.Debug.WriteLine("SQL Problem");
                    System.Diagnostics.Debug.WriteLine(esql.Message);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto " + "');", true);
                    System.Diagnostics.Debug.WriteLine("No se pudo exportar: " + ex.Message);
                }
                
        }



        protected void btnOkSeleccionarEspecifica(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();
                 
            List<string> users = new List<string>();
            if (ViewState["SelectedRecords"] == null)
                return;
            int idExp = Int32.Parse(ddlNameSearch.SelectedItem.Value);
            List<Int64> selectedRecords = (List<Int64>)ViewState["SelectedRecords"];
            CheckBox rowCB;
            List<string> random_users = new List<string>();
            List<int> random_usersID = new List<int>();
            int i = 0;
                   
            foreach (GridViewRow row in GridView1.Rows)
            {
                        
                rowCB = (CheckBox)row.Cells[0].FindControl("CbSelect");
                if (rowCB.Checked)
                {
                    users.Add(row.Cells[5].Text);
                    random_users.Add(row.Cells[5].Text);
                    random_usersID.Add(getUserID(row.Cells[5].Text));
                    string code = "\"" + row.Cells[5].Text + "\"";
                    HtmlGenericControl divpart = new HtmlGenericControl("div");
                    string codeA = "<a href = \"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";
                    divpart.InnerHtml = codeA;
                    divpart.Attributes.Add("class", "alert alert-success");
                    divpart.Attributes.Add("style", "width: 300px ;height: 50px; ");
                    HtmlGenericControl divul = new HtmlGenericControl("ul");
                    HtmlGenericControl divli = new HtmlGenericControl("li");
                    divli.InnerHtml = code;
                    divul.Controls.Add(divli);
                    divpart.Controls.Add(divul);
                    divUsers.Attributes.Add("style", "height: 200px; overflow: scroll");
                    divUsers.Controls.Add(divpart);
                    btnEnviarInvitacion.Enabled = true;
                    i++;
                    if (i >= 500) {
                        break;
                    }
                }
            }


            selectedUsers.InnerText = "Se han seleccionado: " + i + " Personas";
            ViewState["UsersEmailRandom"] = random_users;
            ViewState["UsersIDRandom"] = random_usersID;
            ddlNameSearchSesion.Items.Clear();
            ddlNameSearchSesion.Items.Add(new ListItem("Todas", "-1"));


            DataTable dt = ws.SRSP_VerSesionesdeExperimento(idExp);
            foreach(DataRow row in dt.Rows)
            {
                ddlNameSearchSesion.Items.Add(new ListItem("ID: " + row["idSesion"].ToString() + " Fecha:" + row["fecha"].ToString(), row["idSesion"].ToString()));

            }

            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "POP", "ShowModalUsers();", true);

               
        }

        public void BindUser()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            
            try
            {

                String like = txtSearchMaster.Text;
                String speciality = DDLEspecialidad.SelectedValue;
                String nationality = ddlNacionalidad.SelectedValue;
                String careerLevel = ddlGradoEstudio.SelectedValue;
                String sex = ddlSexo.SelectedValue;
                String notExperiment = NotExperiment.SelectedValue;
                String student = ddlEstudiante.SelectedValue;
                String startDate = TxtFromSearch.Text;
                String endDate = TxtToSearch.Text;
                String startQuantity = TxtParticipacionesFrom.Text;
                String endQuantity = TxtParticipacionesTo.Text;
                String startRegisterDate = TxtFromRegister.Text;
                String endRegisterDate = TxtToRegister.Text;

                DataTable dt = ws.SRSP_FiltrarUsuariosLike(like, speciality, nationality, careerLevel, sex, notExperiment, student, startDate, endDate, startQuantity, endQuantity, startRegisterDate, endRegisterDate);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dt;


                GridView1.DataBind();
                users = new List<string>();
                int i = 0;
                foreach (DataRow row in ((DataTable)GridView1.DataSource).Rows)
                {
                    users.Add(row[5].ToString());
                    i++;
                    if (i >= 500) {
                        break;
                    }

                }

                ViewState["UsersEmails"] = users;


                }
            catch (SqlException esql)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto SQL" + "');", true);
                System.Diagnostics.Debug.WriteLine("SQL Problem");
                System.Diagnostics.Debug.WriteLine(esql.Message);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto " + "');", true);
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
                
        }

    }

}

          

            
