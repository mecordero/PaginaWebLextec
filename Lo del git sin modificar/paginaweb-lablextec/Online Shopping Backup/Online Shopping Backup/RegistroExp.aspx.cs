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

namespace Online_Shopping_Backup
{

    public partial class RegistroExp : System.Web.UI.Page
    { 

   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

		//parte de SR1 no del SR2 
		/*
         * Funcionalidad: carga las clases y los tipos de experimentos en sus respectivos componentes de interfaz
         * Entrada:
		 
         * Salida: 
         */
		protected void Page_Load(object sender, EventArgs e)
        {

            if (! IsPostBack)
            {

                DDLclase.Items.Add(new ListItem(""));
                con.Open();
                string query = "select Clase.nombre from Clase ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DDLclase.Items.Add(new ListItem(dr["nombre"].ToString()));
                }
                DDLclase.Items.Add("Nueva");
                con.Close();

                DDLtipo.Items.Add(new ListItem(""));
                con.Open();
                query = "select Tipo.nombre from Tipo";
                cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DDLtipo.Items.Add(new ListItem(dr["nombre"].ToString()));
                }
                DDLtipo.Items.Add("Nuevo");
                con.Close();

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
            int fkTipo = 0;
            if(TextRETipo.Text != "")
            {
                String query = "exec SRSP_InsertarTipo @Nombre";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Nombre", TextRETipo.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                con.Open();
                query = "select Tipo.idTipo from Tipo where Tipo.nombre ='" + TextRETipo.Text + "'";
                cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    fkTipo = int.Parse(dr["idTipo"].ToString());
                }

                con.Close();
                
            }
            else
            {
                con.Open();
                string query = "select Tipo.idTipo from Tipo where Tipo.nombre ='" + DDLtipo.Items[DDLtipo.SelectedIndex].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    fkTipo = int.Parse(dr["idTipo"].ToString());
                }

                con.Close();
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
            int fkClase = 0;
            if (TextREclase.Text != "")
            {
                String query = "exec SRSP_InsertarClase @Nombre";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Nombre", TextREclase.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                con.Open();
                query = "select Clase.idClase from Clase where Clase.nombre ='" + TextREclase.Text + "'";
                cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    fkClase = int.Parse(dr["idClase"].ToString());
                }

                con.Close();

            }
            else
            {
                con.Open();
                string query = "select Clase.idClase from Clase where Clase.nombre ='" + DDLclase.Items[DDLclase.SelectedIndex].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    fkClase = int.Parse(dr["idClase"].ToString());
                }

                con.Close();
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
            con.Open();
            string query = "select Administrador.idAdmin from Administrador where Administrador.nombre ='"  + admin + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                fkAdministrador = int.Parse(dr["idAdmin"].ToString());
            }

            con.Close();
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
            
            if (validacionNullRE() == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Datos Incompletos" + "');", true);
            }
            else
            {
                DateTime Dateinicial = DateTime.Parse(TxtREFI.Text);
                DateTime DateFinal = DateTime.Parse(textREFF.Text);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
                DateTime date = DateTime.Now;
                String query = " exec SRSP_InsertarExperimento @FK_tipo , @FK_clase,  @FK_administrador, @Nombre, @NombrePublico, @Nota, @Descripcion, @Lugar, @Cupo, @Completado, @Abierto, @FechaRegistro, @FechaInicio, @FechaFinal";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Fk_Tipo", fk_tipo());
                cmd.Parameters.AddWithValue("@FK_clase", fk_clase());
                cmd.Parameters.AddWithValue("@FK_administrador", fk_administrador());
                cmd.Parameters.AddWithValue("@Nombre", TextREnombre.Text);
                cmd.Parameters.AddWithValue("@NombrePublico", TxtREPublico.Text);
                cmd.Parameters.AddWithValue("@Nota", TextRENote.Text);
                cmd.Parameters.AddWithValue("@Descripcion", txtREDescription.Text);
                cmd.Parameters.AddWithValue("@Lugar", TextRElugar.Text);
                cmd.Parameters.AddWithValue("@Cupo", TextCupo.Text);
                cmd.Parameters.AddWithValue("@Abierto", esAbierto());
                cmd.Parameters.AddWithValue("@FechaRegistro", date);
                cmd.Parameters.AddWithValue("@FechaInicio", Dateinicial);
                cmd.Parameters.AddWithValue("@FechaFinal", DateFinal);
                cmd.Parameters.AddWithValue("@Completado", false);


                cmd.ExecuteNonQuery();
                conn.Close();

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