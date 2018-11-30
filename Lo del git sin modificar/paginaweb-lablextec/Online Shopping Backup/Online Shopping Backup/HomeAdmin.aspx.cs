using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Online_Shopping_Backup
{
    public partial class HomeaAdmin : System.Web.UI.Page
    {

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		/*
        Funcionalidad: Cambia el estado de todos los combo box de la interfaz para que salgan como elegidos 
		 *				y los guarda en una variable tipo cookie de "SelectedRecords" -> lo que guarda es el ID de los administradores
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento
         * Salida: - 
		 * 
		 */
		protected void CbSelectAll_CheckedChanged(object sender, EventArgs e)
		{
			CheckBox selectAll = (CheckBox)sender;
			bool checkState = selectAll.Checked;
			List<string> selectedRecords;
			CheckBox rowCB;
			string userID;

			if (ViewState["SelectedRecords"] == null)
				selectedRecords = new List<string>();
			else
				selectedRecords = (List<string>)ViewState["SelectedRecords"];

			foreach (GridViewRow row in GridView1.Rows)
			{
				rowCB = (CheckBox)row.Cells[0].FindControl("CbSelect");
				rowCB.Checked = checkState;
				userID = GridView1.DataKeys[row.RowIndex].Value.ToString();

				if (checkState)
					selectedRecords.Add(userID);
				else
					selectedRecords.Remove(userID);
			}

			ViewState["SelectedRecords"] = selectedRecords;
		}

		/*
         * Funcionalidad:
		 *		Recorre todos los checkbox de los administradores (fijarse en interfaz) para preguntarse si 
		 *		estan elegidos o no, si lo estan, los agrega en la variable/cookies de "SelectedRecords"
		 *		Y llega a guardar el ID de los administradores
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento
         * Salida:
         */

		protected void CbSelect_CheckedChanged(object sender, EventArgs e)
		{
			CheckBox cbSelect = (CheckBox)sender;
			GridViewRow cbRow = (GridViewRow)cbSelect.NamingContainer;
			System.Diagnostics.Debug.WriteLine(GridView1.DataKeys[cbRow.RowIndex].Value.ToString());
			string userID = GridView1.DataKeys[cbRow.RowIndex].Value.ToString();
			List<string> selectedRecords;

			if (ViewState["SelectedRecords"] == null)
				selectedRecords = new List<string>();
			else
				selectedRecords = (List<string>)ViewState["SelectedRecords"];

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
         * Funcionalidad: limpia los componentes de la interfaz 
         * Entrada:
         * Salida:
         */
        private void ClearInputControls()
		{
			textRAnombre.Text = "";
			TxtRAPApellido.Text = ""; 
			TxtRASApellido.Text = "";
			SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Selected = false; 
			TextRAemail.Text = "";
			TxtRAContra.Text = "";
			TxtRRAContra.Text = "";
			DDLclase.Items[DDLclase.SelectedIndex].Selected = false;  
		}

        /*
         * Funcionalidad: verifica si el administrador master por medio de la DB 
         * Entrada:
         * Salida: int a:  si es 0 no lo es, 1 si lo es. 
         */
        protected int check_admin_master() {
			SqlConnection conn = CreateSqlConnection();
			String query = " exec SRSP_VerificarAdministrador";
			conn.Open();
			SqlCommand cmd = new SqlCommand(query, conn);
            DataTable dt = new DataTable();
            int a = 0; 
            dt.Load(cmd.ExecuteReader());
            foreach (DataRow row in dt.Rows)
            {
                if (row[0].ToString() == Request.Cookies["u_id"].Value) {
                    a = 1;
                    break; 
                }

            }
            System.Diagnostics.Debug.WriteLine("A es = " + a.ToString());
			return a; 
		}

		/*
         * Funcionalidad: carga modal para agregar admin 
		 * cambia componentes a nivel de interfaz, revisa si es admin master y muestra el modal 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 
         * Salida:
         */
		protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ClearInputControls();
            TxtRAContra.Enabled = true;
            passwordReq1.Enabled = true;
            TxtRRAContra.Enabled = true;
            confirmPasswordReq.Enabled = true;
            comparePasswords.Enabled = true;
            ModalTitle.InnerText = "Registrar Administrador";
			BtnEdit.Visible = false;
			BtnRegister.Visible = true;
            
			int a = check_admin_master(); 
			if (a != 1)
			{
				System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para crear administradores", "Operación", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Exclamation);
			}
			else
			{
				ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openAdminModal();", true);
			}
		}

        /*
         * Funcionalidad: carga modal de modificar administrador 
		 *		revisa si hay admin elegidos, los carga en el modal y lo abre 
         * Entrada:
         * Salida:
         */
        private void BeginEditingProcess()
		{
			System.Diagnostics.Debug.WriteLine("entro a begim editing");
			List<string> selectedRecords = (List<string>)ViewState["SelectedRecords"];
			GridViewRow userRow = null;
			string userID;

			foreach (GridViewRow row in GridView1.Rows)
			{
				userID = GridView1.DataKeys[row.RowIndex].Value.ToString();

				if (selectedRecords.Contains(userID))
				{
					userRow = row;
					break;
				}
			}
			 
			if (userRow == null)
				return;

			ClearInputControls();
			SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Selected = false;
			DDLclase.Items[DDLclase.SelectedIndex].Selected = false;
			
			System.Diagnostics.Debug.WriteLine("1" +userRow.Cells[1].Text); // nom
			System.Diagnostics.Debug.WriteLine("2" + userRow.Cells[2].Text); // ap1 
			System.Diagnostics.Debug.WriteLine("3" + userRow.Cells[3].Text); // ap2 
			System.Diagnostics.Debug.WriteLine("4" + userRow.Cells[4].Text); // genero
			System.Diagnostics.Debug.WriteLine("5" + userRow.Cells[5].Text);// correo
			System.Diagnostics.Debug.WriteLine("6" + userRow.Cells[6].Text); // masterAdmi


			string master = userRow.Cells[6].Text;
		
		
			System.Diagnostics.Debug.WriteLine("master" + master); // masterAdmi
			textRAnombre.Text = userRow.Cells[1].Text;
			TxtRAPApellido.Text = userRow.Cells[2].Text;
			TxtRASApellido.Text = userRow.Cells[3].Text;
			SelectRAgenero.Items.FindByValue(userRow.Cells[4].Text).Selected = true;
			TextRAemail.Text = userRow.Cells[5].Text;
			TxtRAContra.Enabled = false;
			passwordReq1.Enabled = false;
			TxtRRAContra.Enabled = false;
			confirmPasswordReq.Enabled = false;
			comparePasswords.Enabled = false; 
			DDLclase.Items.FindByValue(master).Selected = true;
			
			ModalTitle.InnerText = "Editar Administrador";
			BtnEdit.Visible = true;
			BtnRegister.Visible = false;

			ViewState["EditingID"] = TextRAemail.Text; 
			ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openAdminModal();", true);
		}

        /*
         * Funcionalidad: redirige a pagina de filtrar admin  - obsoleto 
         * Entrada:
         * Salida:
         */
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FiltarAdmin.aspx");
        }

        /*
         * Funcionalidad: verifica los componentes de agregar administradores 
         * Entrada:
         * Salida:
         */
        protected Boolean validacionNullRAdmin()
		{
			if (textRAnombre.Text == "" ||
			   TxtRAPApellido.Text == "" ||
			   TxtRASApellido.Text == "" ||
			   TextRAemail.Text == "" ||
			   SelectRAgenero.SelectedIndex == 0 ||
			   TxtRAContra.Text == "" ||
			   TxtRRAContra.Text == "")
			{
				return true;
			}

			else
			{
				return false;
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
         * Funcionalidad: agrega un administrador a nivel de BD 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 		 
         * Salida:
         */
		protected void BtnRegister_Click(object sender, EventArgs e)
		{
			using(SqlConnection conn = CreateSqlConnection())
            {
                try
                {
					if (validacionNullRAdmin() == true)
					{
						ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
					}
					else
					{
						String date = DateTime.Now.ToString("dd-MM-yyyy");
						String query = " exec SRSP_InsertarAdministrador @Nombre , @Apellido1, @Apellido2, @Genero, @Email, @Contrasenna,@Admin,@AdminReal";
						conn.Open();
						SqlCommand cmd = new SqlCommand(query, conn);
						cmd.Parameters.AddWithValue("@Nombre", textRAnombre.Text);
						cmd.Parameters.AddWithValue("@Apellido1", TxtRAPApellido.Text);
						cmd.Parameters.AddWithValue("@Apellido2", TxtRASApellido.Text);
						cmd.Parameters.AddWithValue("@Genero", SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Text);
						cmd.Parameters.AddWithValue("@Email", TextRAemail.Text);
						cmd.Parameters.AddWithValue("@Contrasenna", TxtRAContra.Text);
						cmd.Parameters.AddWithValue("@Admin", DDLclase.SelectedValue);
						cmd.Parameters.AddWithValue("@AdminReal", Request.Cookies["u_id"].Value);
						int a = cmd.ExecuteNonQuery();
						System.Diagnostics.Debug.WriteLine("A es = " + a.ToString());
						conn.Close();
						if (a == -1)
						{
							System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para crear administradores", "Operación", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Exclamation);

						}
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
                    if(conn != null)
                        conn.Close();

					Response.Redirect("~/HomeAdmin.aspx");
				}
            }
			
		}

		/*
         * Funcionalidad: cargar modal para modificar administrador  
		 *		carga componentes de interfaz, verifica si es admin master y carga el modal 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 
         * Salida:
         */
		protected void BtnEdit_Click(object sender, EventArgs e)
		{
			ModalTitle.InnerText = "Modificar Administrador";
			System.Diagnostics.Debug.WriteLine("asdasd");
			if (ViewState["SelectedRecords"] == null)
				return;
			System.Diagnostics.Debug.WriteLine("asdas2d");

			BtnEdit.Visible = false;
			BtnRegister.Visible = true;
			int a = check_admin_master();
			System.Diagnostics.Debug.WriteLine("asdasd3");

			if (a != 1)
			{
				System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para modificar administradores", "Operación", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Exclamation);
			}
			else
			{
				ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openAdminModal();", true);
				System.Diagnostics.Debug.WriteLine("asdasd4");
				BeginEditingProcess();
			}
		}


		/*
         * Funcionalidad: modificar el administrador a nivel de DB 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 
         * Salida:
         */
		protected void BtnModificar_Click(object sender, EventArgs e)
			{
				using (SqlConnection conn = CreateSqlConnection())
				{
					try
					{
						String query = "SRSP_ActualizarAdministrador @nombre, @apellido1, @apellido2,@genero,@email,@admin";
						conn.Open();
						System.Diagnostics.Debug.WriteLine("entra a modificar");
						SqlCommand cmd = new SqlCommand(query, conn);
						cmd.Parameters.AddWithValue("@nombre", textRAnombre.Text);
						cmd.Parameters.AddWithValue("@apellido1", TxtRAPApellido.Text);
						cmd.Parameters.AddWithValue("@apellido2", TxtRASApellido.Text);
						cmd.Parameters.AddWithValue("@genero", SelectRAgenero.Items[SelectRAgenero.SelectedIndex].Text);
						cmd.Parameters.AddWithValue("@email", TextRAemail.Text);
						cmd.Parameters.AddWithValue("@admin", (DDLclase.SelectedValue == "True") ? 1 : 0);
						int i = cmd.ExecuteNonQuery();
						System.Diagnostics.Debug.WriteLine("i del sp:" + i.ToString());
						System.Diagnostics.Debug.WriteLine("entra a mod2");
						List<string> selectedRecords = (List<string>)ViewState["SelectedRecords"];
						string editingID = (string)ViewState["EditingID"];
						selectedRecords.Remove(editingID);
						System.Diagnostics.Debug.WriteLine("entra a mod3");
					}
					catch (SqlException esql)
					{
						ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto -> En la Base de Datos" + "');", true);
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
						if (conn != null)
							conn.Close();

						Response.Redirect("~/HomeAdmin.aspx");
					}
			}
		}


		/*
         * Funcionalidad: revisa si es admin master, si lo es eliminar el admin a nivel de DB 
         * Entrada:
		 *		object sender: encargado de llamar esta funcion 
		 *		EventArgs e: los argumentos del evento 
         * Salida:
         */
		protected void BtnEliminar_Click(object sender, EventArgs e)
		{
			if (ViewState["SelectedRecords"] == null)
				return;
			int a = check_admin_master();
            System.Diagnostics.Debug.WriteLine("a es: " + a.ToString());
			if (a != 1)
			{
				System.Windows.Forms.MessageBox.Show("Usted no tiene permisos para modificar administradores", "Operación", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Exclamation);
				return; 
			}
			List<string> selectedRecords = (List<string>)ViewState["SelectedRecords"];
			SqlCommand command;
            System.Diagnostics.Debug.WriteLine("llega aca");
            String query = "exec SRSP_EliminarAdministrador @Email";

			using (SqlConnection conn = CreateSqlConnection())
			{
				try
				{
					conn.Open();

					foreach (string record in selectedRecords)
					{
						command = new SqlCommand(query, conn);
						command.Parameters.AddWithValue("@Email", record.ToString());
						command.ExecuteNonQuery();
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
					ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error Imprevisto" + "');", true);
					System.Diagnostics.Debug.WriteLine(ex.Message);
				}
				finally
				{
					if (conn != null)
						conn.Close();
					Response.Redirect("~/HomeAdmin.aspx");
				}
			}
		}



	}
}