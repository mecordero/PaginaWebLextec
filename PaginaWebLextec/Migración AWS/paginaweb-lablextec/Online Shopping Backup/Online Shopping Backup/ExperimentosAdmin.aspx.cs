using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Online_Shopping_Backup.WebServiceLextec;

namespace Online_Shopping_Backup
{
    public partial class ExperimentosAdmin : System.Web.UI.Page
    {
        /*
         * Funcionalidad: Cargar la página 
         * Entrada: por default
         * Salida: null 
         */
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
         * Funcionalidad: Volver a la ventana de registro de experimento. 
         * Entrada: por default
         * Salida: null
         */
        protected void btn_back_to_admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistroExp.aspx");
        }

        /*
         * Funcionalidad: Vuelve a la ventana de actualizar de mensaje.
         * Entrada: por default. 
         * Salida: null
         */
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ActualizarMensaje.aspx");
        }

        /*
         * Funcionalidad: Vuelve a la ventana de admin. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void btnRUonClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin.aspx");
        }

        /*
         * Funcionalidad: Boton que filtra los experimentos. 
         * Entrada: por default. 
         * Salida: null.
         */
        protected void BtnFilter_Click(object sender, EventArgs e)
        {
            
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            DataTable dt = new DataTable();

            dt = ws.SRSP_VisualizarExperimento5Param(ddlNameSearch.SelectedValue, ddlTypeSearch.SelectedValue, ddlClassSearch.SelectedValue, TxtFromSearch.Text, TxtToSearch.Text);
            

            foreach (DataRow row in dt.Rows)
            {
                System.Diagnostics.Debug.WriteLine("row-1 " + row[1].ToString());
                System.Diagnostics.Debug.WriteLine("row-2 " + row[2].ToString());
                System.Diagnostics.Debug.WriteLine("row-3 " + row[3].ToString());
            }

            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            updatepanelonly.Update();	
        
        }


        /*
         * Funcionalidad: mostrar el cambio de clase. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void ChangeDivNclase(object sender, EventArgs e)
        {
            if (DDLclase.SelectedItem.Text == "Nueva")
                divNClase.Visible = true;
            else
                divNClase.Visible = false;
        }

        /*
         * Funcionalidad: Cambiar el tipo en la interfaz. 
         * Entrada:default 
         * Salida: null
         */
        protected void ChangeDivNtipo(object sender, EventArgs e)
        {
            if (DDLtipo.SelectedItem.Text == "Nuevo")
                divNtipo.Visible = true;
            else
                divNtipo.Visible = false;
        }

        /*
         * Funcionalidad: Obtener el id de la clase del experimento que se va a crear o editar
         * Entrada: NULL
         * Salida: id de la clase del experimento
         */
        private int getClassID()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            String className = DDLclase.Items[DDLclase.SelectedIndex].Text;
            bool isNewClass = className.Equals("Nueva");
            int classID = 0;

            if (isNewClass)
            {
                className = TextREclase.Text;

                ws.SRSP_InsertarClase(className);

                object objClass = ws.GetIdClaseFromNombre(className);

                if (objClass != null)
                    classID = int.Parse(objClass.ToString());
                                
                else
                    return 0;
            }
            else
                classID = int.Parse(DDLclase.Items[DDLclase.SelectedIndex].Value);

            return classID;
        }


        /*
         * Funcionalidad: Obtener el id del tipo del experimento que se va a crear o editar
         * Entrada: NULL
         * Salida: id del tipo del experimento
         */
        private int getTypeID()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            string typeName = DDLtipo.Items[DDLtipo.SelectedIndex].Text;
            bool isNewType = typeName.Equals("Nuevo");
            int typeID;

            if (isNewType)
            {
                typeName = TextRETipo.Text;

                ws.SRSP_InsertarTipo(typeName);


                object objTipo = ws.GetIdTipoFromNombre(typeName);

                if (objTipo != null)
                    typeID = int.Parse(objTipo.ToString());
                else
                    return 0;

            }
            else
                typeID = int.Parse(DDLtipo.Items[DDLtipo.SelectedIndex].Value);

            return typeID;
        }


        /*
         * Funcionalidad: Limpiar entradas de control. 
         * Entrada: null
         * Salida: null
         */
        private void ClearInputControls()
        {
            TextREnombre.Text = "";
            TxtREPublico.Text = "";
            TextRENote.Text = "";
            txtREDescription.Text = "";
            TextRElugar.Text = "";
            selectRAbierto.Items[selectRAbierto.SelectedIndex].Selected = false;
            DDLclase.Items[DDLclase.SelectedIndex].Selected = false;
            DDLtipo.Items[DDLtipo.SelectedIndex].Selected = false;
            selectCompleted.Items[selectCompleted.SelectedIndex].Selected = false;
            TxtREFI.Text = "";
            textREFF.Text = "";
            TextREclase.Text = "";
            TextRETipo.Text = "";
            divNClase.Visible = false;
            divNtipo.Visible = false;
            DivCompleted.Visible = false;
        }

        /*
         * Funcionalidad: Botón que abre el modal de crear experimento
         * Entrada: por default 
         * Salida: null
         */
        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            ClearInputControls();
            selectCompleted.Items.FindByText("No").Selected = true;
            ModalTitle.InnerText = "Crear nuevo experimento";
            BtnEdit.Visible = false;
            BtnRegister.Visible = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        /*
         * Funcionalidad: funcionalidad que inserta un experimento a la base de datos. 
         * Entrada: por default. 
         * Salida: null 
         */
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            String name = TextREnombre.Text;
            String publicName = TxtREPublico.Text;
            String note = TextRENote.Text;
            String description = txtREDescription.Text;
            String place = TextRElugar.Text;
            String completed = selectCompleted.Items[selectCompleted.SelectedIndex].Text;
            bool isCompleted = completed.Equals("Si");
            String available = selectRAbierto.Items[selectRAbierto.SelectedIndex].Text;
            bool isOpen = available.Equals("Si");          
            String startDate = TxtREFI.Text;
            String endDate = textREFF.Text;
            int classID = getClassID();                
            int typeID = getTypeID();
            int AdminID = int.Parse(Request.Cookies["u_pk"].Value);


            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            ws.SRSP_InsertarExperimento(name, publicName, note, description, place, isOpen,
                classID, typeID, startDate, endDate, isCompleted, AdminID);
            
        }

        /*
         * Funcionalidad: Selecciona a todos. 
         * Entrada: por default 
         * Salida: null
         */
        protected void CbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectAll = (CheckBox)sender;
            bool checkState = selectAll.Checked;
            List<int> selectedExperimentsRecords;
            CheckBox rowCB;
            int experimentID;

            if (ViewState["SelectedExperimentsRecords"] == null)
                selectedExperimentsRecords = new List<int>();
            else
                selectedExperimentsRecords = (List<int>)ViewState["SelectedExperimentsRecords"];

            foreach (GridViewRow row in GridView1.Rows)
            {
                rowCB = (CheckBox)row.Cells[0].FindControl("CbSelect");
                rowCB.Checked = checkState;
                experimentID = int.Parse(GridView1.DataKeys[row.RowIndex].Value.ToString());

                if (checkState)
                    selectedExperimentsRecords.Add(experimentID);
                else
                    selectedExperimentsRecords.Remove(experimentID);
            }

            ViewState["SelectedExperimentsRecords"] = selectedExperimentsRecords;
        }

        /*
         * Funcionalidad: selecciona algunos 
         * Entrada: por default 
         * Salida: null 
         */
        protected void CbSelect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelect = (CheckBox)sender;
            GridViewRow cbRow = (GridViewRow)cbSelect.NamingContainer;
            int experimentID = int.Parse(GridView1.DataKeys[cbRow.RowIndex].Value.ToString());
            List<int> selectedExperimentsRecords;

            if (ViewState["SelectedExperimentsRecords"] == null)
                selectedExperimentsRecords = new List<int>();
            else
                selectedExperimentsRecords = (List<int>)ViewState["SelectedExperimentsRecords"];

            if (cbSelect.Checked)
            {
                if (!selectedExperimentsRecords.Contains(experimentID))
                    selectedExperimentsRecords.Add(experimentID);
            }
            else
            {
                if (selectedExperimentsRecords.Contains(experimentID))
                    selectedExperimentsRecords.Remove(experimentID);
            }

            ViewState["SelectedExperimentsRecords"] = selectedExperimentsRecords;
        }

        /*
         * Funcionalidad: selecciona todas las sesiones
         * Entrada: por default
         * Salida: null 
         */
        protected void CbSelectAllSession_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectAll = (CheckBox)sender;
            bool checkState = selectAll.Checked;
            List<int> selectedSessionRecords;
            CheckBox rowCB;
            int sessionID;
            GridViewRow cbRow = (GridViewRow)selectAll.NamingContainer;
            GridView gvSessions = (GridView)cbRow.NamingContainer;
            if (ViewState["SelectedSessionRecords"] == null)
                selectedSessionRecords = new List<int>();
            else
                selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            
            foreach (GridViewRow row in gvSessions.Rows)
            {
                rowCB = (CheckBox)row.Cells[0].FindControl("CbSelectSession");
                rowCB.Checked = checkState;
                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());

                if (checkState)
                    if (!selectedSessionRecords.Contains(sessionID))
                    {
                        selectedSessionRecords.Add(sessionID);
                        rowCB.Checked = true;
                    }


                    else {
                        selectedSessionRecords.Remove(sessionID);
                        rowCB.Checked = false;
                    }
                        selectedSessionRecords.Remove(sessionID);
            }
            System.Diagnostics.Debug.WriteLine(string.Join(",", selectedSessionRecords.ToArray()));
            ViewState["SelectedSessionRecords"] = selectedSessionRecords;
        }

        /*
         * Funcionalidad: selecciona una sesión 
         * Entrada: por default 
         * Salida: null 
         */
        protected void CbSelectSession_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelect = (CheckBox)sender;
            GridViewRow cbRow = (GridViewRow)cbSelect.NamingContainer;
            GridView gv = (GridView)cbRow.NamingContainer;
            int sessionID = int.Parse(gv.DataKeys[cbRow.RowIndex].Value.ToString());
            List<int> selectedSessionRecords;

            if (ViewState["SelectedSessionRecords"] == null)
                selectedSessionRecords = new List<int>();
            else
                selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];

            if (cbSelect.Checked)
            {
                if (!selectedSessionRecords.Contains(sessionID))
                    selectedSessionRecords.Add(sessionID);
            }
            else
            {
                if (selectedSessionRecords.Contains(sessionID))
                    selectedSessionRecords.Remove(sessionID);
            }
            System.Diagnostics.Debug.WriteLine(string.Join(",", selectedSessionRecords.ToArray()));
            ViewState["SelectedSessionRecords"] = selectedSessionRecords;
        
        }

        /*
         * Funcionalidad: activa el modificar sesión. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnModifySession_Click(object sender, EventArgs e)
        {

            if (ViewState["SelectedSessionRecords"] == null)
                return;

            BeginEditingProcessSession(sender, e);
        }

        /*
         * Funcionalidad: Editar Proceso de la Sesión
         * Entrada: por default. 
         * Salida: null. 
         */
        private void BeginEditingProcessSession(Object sender, EventArgs e)
        {
            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            GridViewRow sessionRow = null;
            int sessionID = -1;
            ImageButton btn = (ImageButton)sender;

            GridView gvSessions = (GridView)btn.FindControl("gvSessions");
            foreach (GridViewRow row in gvSessions.Rows)
            {

                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());
                if (selectedSessionRecords.Contains(sessionID))
                {
                    sessionRow = row;
                    break;
                }
            }

            if (sessionRow == null)
                return;
            clearElementsSession(); 
            TxtFechaSesion.Text = Convert.ToDateTime(sessionRow.Cells[2].Text).ToString("yyyy-MM-dd");
            TxtStartTime.Text = sessionRow.Cells[3].Text;
            TxtEndTime.Text = sessionRow.Cells[4].Text;
            TxtCapacity.Text = sessionRow.Cells[5].Text;
            Modal_title_session.InnerText = "Editar Sesión";
            BtnEditSession.Visible = true;
            BtnRegisterSession.Visible = false;
            ViewState["SessionID"] = sessionID;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openSessionModal();", true);
        }

        /*
         * Funcionalidad: Eliminar sesión
         * Entrada: por default.
         * Salida: null. 
         */
        protected void BtnDeleteSession_Click(object sender, EventArgs e)
        {

            if (ViewState["SelectedSessionRecords"] == null)
                return;

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            foreach(int record in selectedSessionRecords)
            {
                ws.SRSP_EliminarSesion(record);
            }

            Response.Redirect("~/ExperimentosAdmin.aspx");                       

        }

        /*
         * Funcionalidad: Eliminar experimento. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (ViewState["SelectedExperimentsRecords"] == null)
                return;

            List<int> selectedExperimentsRecords = (List<int>)ViewState["SelectedExperimentsRecords"];

            try
            {                
                foreach (int record in selectedExperimentsRecords)
                {
                    ws.SRSP_EliminarExperimento(record);
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto quak" + "');", true);
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                Response.Redirect("~/ExperimentosAdmin.aspx");
            }
        }

        /*
         * Funcionalidad: Modificar Experimento. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedExperimentsRecords"] == null)
                return;

            BeginEditingProcess();
        }

        /*
         * Funcionalidad inicir proceso de edición. 
         * Entrada: null 
         * Salida: null. 
         */
        private void BeginEditingProcess()
        {
            List<int> selectedExperimentsRecords = (List<int>)ViewState["SelectedExperimentsRecords"];
            GridViewRow experimentRow = null;
            int experimentID = -1;


            foreach (GridViewRow row in GridView1.Rows)
            {
                experimentID = int.Parse(GridView1.DataKeys[row.RowIndex].Value.ToString());

                if (selectedExperimentsRecords.Contains(experimentID))
                {
                    experimentRow = row;
                    break;
                }
            }

            if (experimentRow == null)
                return;

            ClearInputControls();
            DivCompleted.Visible = true;
            ModalTitle.InnerText = "Editar experimento";
            BtnEdit.Visible = true;
            BtnRegister.Visible = false;

            string completed = experimentRow.Cells[8].Text;
            completed = completed.Equals("True") ? "Si" : "No";

            string open = experimentRow.Cells[9].Text;
            open = open.Equals("True") ? "Si" : "No";

            string eType = HttpUtility.HtmlDecode(experimentRow.Cells[13].Text);
            string eClass = HttpUtility.HtmlDecode(experimentRow.Cells[14].Text);

            TextREnombre.Text = experimentRow.Cells[3].Text;
            TxtREPublico.Text = experimentRow.Cells[4].Text;
            TextRENote.Text = experimentRow.Cells[5].Text;
            txtREDescription.Text = experimentRow.Cells[6].Text;
            TextRElugar.Text = experimentRow.Cells[7].Text;
            selectCompleted.Items.FindByText(completed).Selected = true;
            selectRAbierto.Items.FindByText(open).Selected = true;
            TxtREFI.Text = Convert.ToDateTime(experimentRow.Cells[11].Text).ToString("yyyy-MM-dd");
            textREFF.Text = Convert.ToDateTime(experimentRow.Cells[12].Text).ToString("yyyy-MM-dd");
            DDLtipo.Items.FindByText(eType).Selected = false;
            DDLclase.Items.FindByText(eClass).Selected = false;

            ViewState["EditingID"] = experimentID;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        /*
         * Funcionalidad: Editar experimento. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            try
            {
                string name = TextREnombre.Text;
                string publicName = TxtREPublico.Text;
                string note = TextRENote.Text;
                string description = txtREDescription.Text;
                string place = TextRElugar.Text;
                string completed = selectCompleted.Items[selectCompleted.SelectedIndex].Text;
                bool isCompleted = completed.Equals("Si");
                string available = selectRAbierto.Items[selectRAbierto.SelectedIndex].Text;
                bool isOpen = available.Equals("Si");
                string startDate = TxtREFI.Text;
                string endDate = textREFF.Text;
                int classID = getClassID();
                int typeID = getTypeID();
                int AdminID = int.Parse(Request.Cookies["u_pk"].Value);
                int ID = int.Parse(ViewState["EditingID"].ToString());


                ws.SRSP_ActualizarExperimento(name, publicName, note, description, place, isOpen, 
                    classID, typeID, startDate, endDate, isCompleted, AdminID, ID);

                List<int> selectedExperimentsRecords = (List<int>)ViewState["SelectedExperimentsRecords"];
                int editingID = (int)ViewState["EditingID"];

                selectedExperimentsRecords.Remove(editingID);
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto quak" + "');", true);
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                Response.Redirect("~/ExperimentosAdmin.aspx");
            }
        }

        /*
         * Funcionalidad: Obtiene las sesiones por experimento. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void gvSession_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                int idExperimento = int.Parse(GridView1.DataKeys[e.Row.RowIndex].Value.ToString());
                var gvSessions = (GridView)e.Row.FindControl("gvSessions");

               
                try
                {
                       
                    System.Diagnostics.Debug.WriteLine("idExperimento: " + idExperimento.ToString());
                    DataTable dt = ws.SRSP_VerSesionesdeExperimento(idExperimento);
                        
                    gvSessions.DataSource = dt;
                        
                    gvSessions.DataBind();
                        

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
         * Funcionalidad: Actualizar las sesiones. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void gvSessions_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string date = e.NewValues["fecha"].ToString().Split(',')[1];
            e.NewValues["fecha"] = Convert.ToDateTime(date);

            string startTime = e.NewValues["horaInicio"].ToString().Split(',')[1];
            e.NewValues["horaInicio"] = Convert.ToDateTime(startTime);

            string endTime = e.NewValues["horaFinal"].ToString().Split(',')[1];
            e.NewValues["horaFinal"] = Convert.ToDateTime(endTime);

            string filled = e.NewValues["lleno"].ToString().Split(',')[1];
            e.NewValues["lleno"] = filled.Equals("Si");

            string capacity = e.NewValues["cupo"].ToString().Split(',')[1];
            e.NewValues["cupo"] = int.Parse(capacity);
        }

        /*
         * Funcionalidad: Limpiar elementos de sesion. 
         * Entrada: null. 
         * Salida: null. 
         */
        protected void clearElementsSession() {
            TxtFechaSesion.Text = "";
            TxtStartTime.Text = "";
            TxtEndTime.Text = "";
            TxtCapacity.Text = ""; 
        }

        /*
         * Funcionalidad: Crear una sesión. 
         * Entrada: default. 
         * Salida: null. 
         */
        protected void BtnCreateSession_Click(object sender, EventArgs e)
        {
            clearElementsSession(); 
            BtnEditSession.Visible = false;
            BtnRegisterSession.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openSessionModal();", true);
        }

        /*
         * Funcionalidad: Crear sesión.
         * Entrada: Por default. 
         * Salida: null. 
         */
        protected void BtnCreateSession_Command(object sender, CommandEventArgs e)
        {
            ViewState["ExperimentID"] = e.CommandArgument.ToString();
            Modal_title_session.InnerText = "Registar nueva Sesión";
            BtnRegisterSession.Visible = true;
            BtnEditSession.Visible = false; 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openSessionModal();", true);
        }

        /*
         * Funcionalidad: Registrar sesión. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnRegisterSession_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            int experimentID = int.Parse(ViewState["ExperimentID"].ToString());
            DateTime date = DateTime.Parse(TxtFechaSesion.Text);
            DateTime startTime = DateTime.Parse(TxtStartTime.Text);
            DateTime endTime = DateTime.Parse(TxtEndTime.Text);
            int capacity = int.Parse(TxtCapacity.Text);

            ws.SRSP_InsertarSesion(experimentID, date,startTime, endTime, false, capacity);

            Response.Redirect("~/ExperimentosAdmin.aspx");

        }

        /*
         * Funcionalidad: Editar sesión. 
         * Entrada: por default.
         * Salida: null. 
         */
        protected void BtnEditSession_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            int sessionID = int.Parse(ViewState["SessionID"].ToString());
            DateTime date = DateTime.Parse(TxtFechaSesion.Text);
            DateTime startTime = DateTime.Parse(TxtStartTime.Text);
            DateTime endTime = DateTime.Parse(TxtEndTime.Text);
            int capacity = int.Parse(TxtCapacity.Text);
            bool full = false;
            if (capacity == 0)
                full = true;


            ws.SRSP_ActualizarSesion(sessionID, date, startTime, endTime, full, capacity);

            Response.Redirect("~/ExperimentosAdmin.aspx");
        }

        /*
         * Funcionalidad: Actualizar archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnUploadFile_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedSessionRecords"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "No hay sesiones seleccionadas" + "');", true);
                return;
            }
                

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            int sessionID = -1;
            ImageButton btn = (ImageButton)sender;

            GridView gvSessions = (GridView)btn.FindControl("gvSessions");
            foreach (GridViewRow row in gvSessions.Rows)
            {
                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());
                if (selectedSessionRecords.Contains(sessionID))
                {
                    ViewState["SessionID"] = sessionID; break;
                }
            }
            modal_archive_title.InnerText = "Subir Archivos de Sesion #" + sessionID.ToString();
            fileUpDiv.Visible = true; 
            fileDownDiv.Visible = false;
            BtnModifyFileM.Visible = false;
            BtnDownloadFileM.Visible = false;
            BtnDeleteFileM.Visible = false; 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFileModal();", true);
        }

        /*
         * Funcionalidad:Modificar un archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnModifiyFile_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedSessionRecords"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "No hay sesiones seleccionadas" + "');", true);
                return;
            }

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            int sessionID = -1;
            ImageButton btn = (ImageButton)sender;

            GridView gvSessions = (GridView)btn.FindControl("gvSessions");
            foreach (GridViewRow row in gvSessions.Rows)
            {
                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());
                if (selectedSessionRecords.Contains(sessionID))
                {
                    ViewState["SessionID"] = sessionID; break;
                }
            }
            LoadArchives();
            modal_archive_title.InnerText = "Substituir Archivos de Sesion #" + sessionID.ToString();
            fileUpDiv.Visible = true; 
            fileDownDiv.Visible = true;
            BtnAddFileM.Visible = false;
            BtnModifyFileM.Visible = true;
            BtnDownloadFileM.Visible = false;
            BtnDeleteFileM.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFileModal();", true);
        }

        /*
         * Funcionalidad: Agregar un Archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnAddFileM_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            if (FileUpload1.HasFile)
            {
                HttpPostedFile file = FileUpload1.PostedFile;
                BinaryReader br = new BinaryReader(file.InputStream);
                byte[] buffer = br.ReadBytes(file.ContentLength);

                int sessionID = int.Parse(ViewState["SessionID"].ToString());
                String name = file.FileName;
                int position = name.LastIndexOf("\\");
                name = name.Substring(position + 1);

                ws.SRSP_InsertarResultado(sessionID, name, file.ContentType, file.ContentLength, buffer);

                Response.Redirect("~/ExperimentosAdmin.aspx");
            }            
        }

        /*
         * Funcionalidad: Descargar un Archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnDownloadFile_Click(object sender, EventArgs e)
        {

            if (ViewState["SelectedSessionRecords"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "No hay sesiones seleccionadas" + "');", true);
                return;
            }

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            int sessionID = -1;
            ImageButton btn = (ImageButton)sender;

            GridView gvSessions = (GridView)btn.FindControl("gvSessions");
            foreach (GridViewRow row in gvSessions.Rows)
            {
                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());
                if (selectedSessionRecords.Contains(sessionID))
                {
                    ViewState["SessionID"] = sessionID;
                    System.Diagnostics.Debug.WriteLine("the session id: " + sessionID.ToString()); 
                    break;
                }
            }
            LoadArchives();
            modal_archive_title.InnerText = "Descargar Archivos de Sesion #" + sessionID.ToString(); 
            fileUpDiv.Visible = false;
            fileDownDiv.Visible = true;
            BtnAddFileM.Visible = false;
            BtnModifyFileM.Visible = false;
            BtnDownloadFileM.Visible = true;
            BtnDeleteFileM.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFileModal();", true);
        }

        /*
         * Funcionalidad: Cargar archivos. 
         * Entrada: null
         * Salida: null
         */
        protected void LoadArchives()
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();
                        
            int sessionID = int.Parse(ViewState["SessionID"].ToString());
                        
            DataTable files = ws.SRSP_VerResultadoxSesion(sessionID);

            ddlFiles.DataSource = files;
            ddlFiles.DataTextField = "nombre";
            ddlFiles.DataValueField = "ID Resultado";
            ddlFiles.DataBind();

        }

        /*
         * Funcionalidad: Descargar Archivos. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnDownloadFileM_Click(object sender, EventArgs e)
        {
            int selectedValue = int.Parse(ddlFiles.SelectedItem.Value);
            System.Diagnostics.Debug.WriteLine("val " + selectedValue.ToString());
            DataTable file = new DataTable();

            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            file = ws.SRSP_VerResultado(selectedValue);
            DataRow row = file.Rows[0];
            string name = (string)row["nombre"];
            string contentType = (string)row["tipo"];
            Byte[] data = (Byte[])row["Archivo en Bin"];

            // Send the file to the browser
            Response.AddHeader("Content-type", contentType);
            Response.AddHeader("Content-Disposition", "attachment; filename=" + name);
            Response.BinaryWrite(data);
            Response.Flush();
            Response.End();            
        }

        /*
         * Funcionalidad: Eliminar un archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnEliminateFile_Click(object sender, EventArgs e)
        {

            if (ViewState["SelectedSessionRecords"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "No hay sesiones seleccionadas" + "');", true);
                return;
            }

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            int sessionID = -1;
            ImageButton btn = (ImageButton)sender;

            GridView gvSessions = (GridView)btn.FindControl("gvSessions");
            foreach (GridViewRow row in gvSessions.Rows)
            {
                sessionID = int.Parse(gvSessions.DataKeys[row.RowIndex].Value.ToString());
                if (selectedSessionRecords.Contains(sessionID))
                {
                    ViewState["SessionID"] = sessionID;
                    System.Diagnostics.Debug.WriteLine("the session id: " + sessionID.ToString());
                    break;
                }
            }
            LoadArchives();
            modal_archive_title.InnerText = "Eliminar Archivos de Sesion #" + sessionID.ToString();
            fileUpDiv.Visible = false;
            fileDownDiv.Visible = true;
            BtnAddFileM.Visible = false;
            BtnModifyFileM.Visible = false;
            BtnDownloadFileM.Visible = false;
            BtnDeleteFileM.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFileModal();", true);
        }

        /*
         * Funcionalidad: Eliminar un Archivo 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnDeleteFileM_Click(object sender, EventArgs e)
        {
            int selectedValue = int.Parse(ddlFiles.SelectedItem.Value);
            System.Diagnostics.Debug.WriteLine("val " + selectedValue.ToString());
            
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            ws.SRSP_EliminarResultado(selectedValue);

            Response.Redirect("~/ExperimentosAdmin.aspx");
                        
        }
        /*
         * Funcionalidad: Modificar Archivo. 
         * Entrada: por default. 
         * Salida: null. 
         */

        protected void BtnModifyFileM_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();
            try
            {
                if (FileUpload1.HasFile)
                {
                    HttpPostedFile file = FileUpload1.PostedFile;
                    BinaryReader br = new BinaryReader(file.InputStream);
                    byte[] buffer = br.ReadBytes(file.ContentLength);
                    int selectedValue = int.Parse(ddlFiles.SelectedItem.Value);
                    System.Diagnostics.Debug.WriteLine("val " + selectedValue.ToString());
                    int sessionID = int.Parse(ViewState["SessionID"].ToString());
                    string name = file.FileName;
                    int position = name.LastIndexOf("\\");
                    name = name.Substring(position + 1);

                    DataTable changeFile = ws.SRSP_ActualizarResultado(selectedValue,sessionID, name, file.ContentType, file.ContentLength, buffer);

                    Response.Redirect("~/ExperimentosAdmin.aspx");
                          
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("THIS IS THE MSGGG: " + ex.Message);
            }
        }

        /*
         * Funcionalidad: Exportar usuarios en un archivo .csv
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnExportUsers_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedSessionRecords"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "No hay sesiones seleccionadas" + "');", true);
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openCsvModal();", true);
        }
        /*
         * Funcionalidad: Descargar archivo .csv
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnDownloadCsv_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            System.Diagnostics.Debug.WriteLine("selectedSessionRecords " + selectedSessionRecords);
            if (selectedSessionRecords.Count == 0)
            {

            }
            else
            {

                int record = selectedSessionRecords[0];

                try
                {

                    DataTable dt = ws.SRSP_SesionExportarUsuarios(record);

                    var lines = new List<string>();

                    string[] columnNames = dt.Columns.Cast<DataColumn>().
                                                            Select(column => column.ColumnName).
                                                            ToArray();

                    string header = string.Join(";", columnNames);
                    System.Diagnostics.Debug.WriteLine(header);
                    lines.Add(header);

                    EnumerableRowCollection valueLines = dt.AsEnumerable()
                                            .Select(row => string.Join(";", row.ItemArray));
                    System.Diagnostics.Debug.WriteLine(valueLines.ToString());
                    foreach (var row in valueLines)
                    {
                        System.Diagnostics.Debug.WriteLine(row.ToString());
                        lines.Add(row.ToString());
                    }
                    var result = String.Join("\n", lines.ToArray());
                    string name = "attachment;filename=SR_usuarios_x_sesion_" + record.ToString() + ".csv";
                    Response.AddHeader("content-disposition", name);
                    Response.Charset = "";
                    Response.ContentType = "application/text";
                    Response.Output.Write(result);
                    Response.Flush();

                }

                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto " + "');", true);
                    System.Diagnostics.Debug.WriteLine("No se pudo exportar: " + ex.Message);
                }
                finally
                {

                    Response.End();
                }    
            }


        }


        /*
         * Funcionalidad: agregar la fila de sesión. 
         * Entrada: un objeto tipo experimento. 
         * Salida: fila de la sesión. 
         */
        public string MyNewRowSession(object idExperimento)
        {
            System.Diagnostics.Debug.WriteLine("se vuelve a inicializar");
            return String.Format(@"</td></tr><tr id ='tr{0}' runat='server' class='collapsed-row'>
        <td></td><td colspan='100' style='padding:0px; margin:0px;'>", idExperimento);
        }

        /*
         * Funcionalidad: enviar un correo por sesión. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void BtnSendEmailToSession_Click(object sender, EventArgs e)
        {
            if(ViewState["SelectedSessionRecords"] == null)
            {
                return;
            }

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];

            if(selectedSessionRecords.Count > 1)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "alertMessage", "alert('Seleccione solo una sesión para enviar el correo.');", true);
                return;
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openEmailModal();", true);
        }

        /*
         * Funcionalidad: enviar un correo por experimento. 
         * Entrada: por default. 
         * Salida: null. 
         */
        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            WebServiceLextecSoapClient ws = new WebServiceLextecSoapClient();

            List<int> selectedSessionRecords = (List<int>)ViewState["SelectedSessionRecords"];
            int sessionID = selectedSessionRecords[0];
            List<string> registeredUsers = new List<string>();
            try
            {
                DataTable dt = ws.SRSP_SesionExportarUsuarios(sessionID);

                foreach (DataRow dr in dt.Rows)
                {
                    string user = dr["email"].ToString();
                    registeredUsers.Add(user);
                }

                string subject = EmailSubject.Text;
                string body = EmailBody.Text;

                ISendEmail sendEmail = SendGmailEmail.Instance;
                sendEmail.SendEmail(registeredUsers, subject, body);
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
                System.Diagnostics.Debug.WriteLine("No se pudo exportar: " + ex.Message);
            }
            finally
            {
                Response.Redirect("~/ExperimentosAdmin.aspx");
            }
        }
    }
}