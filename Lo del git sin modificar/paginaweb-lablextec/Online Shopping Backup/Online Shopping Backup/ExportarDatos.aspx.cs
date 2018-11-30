using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Online_Shopping_Backup
{
    public partial class ExportarDatos : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);
		//parte de SR1 no del SR2 
        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void Page_Load(object sender, EventArgs e)
        {
  

        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        // funcion para exportar los usuarios
        protected void exportarUsuarios(object sender, EventArgs e)
        {
            con.Open();
            String query = "select * from dbo.ViewUsuarios";
            String csv = String.Empty;
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            csv += "Id Usuario" + ';' + "Nombre" + ';' + "Primer Apellido" + ';' + "Segundo Apellidos" + ';' +
                  "Numero de cedula" + ';' + "Email" + ';' + "Especialidad" + ';' + "Nacionalidad" + ';' + "Grado Estudio" + ';'
                  + "Genero" + ';' + "Habilitado" + ';' + "Estudiante" + ';' + "Fecha de Nacimiento" + ';'
                  + "Telefono" + ';' + "Anno Ingreso Carrera"  + ';' + "Fecha Registro" + ';' +
                  "Fecha Desabilitado" + ';' + '\n';

            while (dr.Read())
            {
                csv += dr["ID Usuario"].ToString() + ';';
                csv += dr["Nombre"].ToString() + ';';
                csv += dr["Primer Apellido"].ToString() + ';';
                csv += dr["Segundo Apellido"].ToString() + ';';
                csv += dr["Numero de Cedula"].ToString() + ';';
                csv += dr["Email"].ToString() + ';';
                csv += dr["Especialidad"].ToString() + ';';
                csv += dr["Nacionalidad"].ToString() + ';';
                csv += dr["Grado Estudio"].ToString() + ';';
                csv += dr["Genero"].ToString() + ';';
                csv += dr["Habilitado"].ToString() + ';';
                csv += dr["Estudiante"].ToString() + ';';
                csv += dr["Fecha de Nacimiento"].ToString() + ';';
                csv += dr["Telefono"].ToString() + ';';
                csv += dr["Anno Ingreso Carrera"].ToString() + ';';
                csv += dr["Fecha Registro"].ToString() + ';';
                csv += dr["Fecha Desabilitado"].ToString() + ';';
                csv += "\r\n";
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SRUsuarios.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.Output.Write(csv);
            Response.Flush();
            Response.End();
            con.Close();
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        //funcion para exportar los experimentos
        protected void exportarExperimentos(object sender, EventArgs e)
        {
            con.Open();
            String query = "select * from dbo.ViewExperimentos";
            String csv = String.Empty;
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            csv += "Tipo" + ';' + "Clase" + ';' + "ID Experimento" + ';' + "Experimento" + ';' +
                  "Nombre Publico" + ';' + "Nota" + ';' + "Descripcion" + ';' + "Lugar" +  ';'
                  + "Completado" + ';' + "Abierto" + ';' + "Fecha Registro" + ';' + "Fecha Inicio" + ';'
                  + "Fecha Final" + ';' + '\n';

            while (dr.Read())
            {
                csv += dr["Tipo"].ToString() + ';';
                csv += dr["Clase"].ToString() + ';';
                csv += dr["ID Experimento"].ToString() + ';';
                csv += dr["Experimento"].ToString() + ';';
                csv += cutString(dr["Nombre Publico"].ToString()) + ';';
                csv += dr["Nota"].ToString() + ';';
                csv += dr["Descripcion"].ToString() + ';';
                csv += dr["Lugar"].ToString() + ';';
                csv += dr["Completado"].ToString() + ';';
                csv += dr["Abierto"].ToString() + ';';
                csv += dr["Fecha Registro"].ToString() + ';';
                csv += dr["Fecha Inicio"].ToString() + ';';
                csv += dr["Fecha Final"].ToString() + ';';
                csv += "\r\n";
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SRExperimentos.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.Output.Write(csv);
            Response.Flush();
            Response.End();
            con.Close();
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        // Funcion para exportar todos los datos
        protected void exportAllDatas(object sender, EventArgs e)
        {
            con.Open();
            String query = "select * from dbo.VistaExportarDatosUsuariosXSesion";
            String csv = String.Empty;
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            csv += "Nombre Usuario" + ';' + "Primer Apellido" + ';' + "Segundo Apellido" + ';' + "Telefono" + ';' + "Genero" + ';' + "Cedula" + ';' + "Email" + ';' + "Especialidad" + ';'
                  + "Nacionalidad" + ';' + "Estudiante" + ';' + "Grado Estudio" + ';' + "Habilitado" + ';' + "Fecha Nacimiento" + ';' + "Anno Ingreso Carrera" + ';' + "Fecha Registro" + ';' +
                  "Fecha Desabilitado" + ';' + "Clase Experimento " + ';' + "Experimento" + ';' + "Nombre Publico" + ';'
                  + "Nota" + ';' + "Descripcion" + ';' + "Lugar" + ';' + "Completado" + ';' +
                   "Abierto" + ';' + "Nombre Tipo" + ';' + "ID Experimento" + ';' +  "ID Usuario" + ';' + "ID Sesion" + ';' + "Fecha Sesion" + ';' +
				   "Hora Inicio" + ';' + "Hora Final" + ';' + '\n';

			while (dr.Read())
            {
				csv += dr["NombreUsuario"].ToString() + ';';
                csv += dr["PrimerApellidoUsuario"].ToString() + ';';
                csv += dr["SegundoApellidoUsuario"].ToString() + ';';
                csv += dr["TelefonoUsuario"].ToString() + ';';
                csv += dr["GeneroUsuario"].ToString() + ';';
                csv += dr["NumeroCedulaUsuario"].ToString() + ';';
                csv += dr["EmailUsuario"].ToString() + ';';
                csv += dr["EspecialidadUsuario"].ToString() + ';';
                csv += dr["NacionalidadUsuario"].ToString() + ';';
                csv += dr["EstudianteUsuario"].ToString() + ';';
                csv += dr["GradoEstudioUsuario"].ToString() + ';';
                csv += dr["HabilidatoUsuario"].ToString() + ';';
                csv += dr["FechaNacimiento"].ToString() + ';';
                csv += dr["AnnoIngresoCarreraUsuario"].ToString() + ';';
                csv += dr["FechaRegistroUsuario"].ToString() + ';';
                csv += dr["FechaDeshabilitadoUsuario"].ToString() + ';';
                csv += dr["Clase"].ToString() + ';';
                csv += dr["Experimento"].ToString() + ';';
                csv += cutString(dr["NombrePublico"].ToString()) + ';';
                csv += dr["Nota"].ToString() + ';';
                csv += dr["Descripcion"].ToString() + ';';
                csv += dr["Lugar"].ToString() + ';';
                csv += dr["Completado"].ToString() + ';';
                csv += dr["Abierto"].ToString() + ';';
				csv += dr["NombreTipo"].ToString() + ';';
				csv += dr["IDExperimento"].ToString() + ';';
				csv += dr["IDUsuario"].ToString() + ';';
				csv += dr["IDSesion"].ToString() + ';';
				csv += dr["Fecha"].ToString() + ';';
				csv += dr["HoraInicio"].ToString() + ';';
				csv += dr["HoraFinal"].ToString() + ';';
				csv += "\r\n";
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SRUsuarios_y_Experimentos.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.Output.Write(csv);
            Response.Flush();
            Response.End();
            con.Close();
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        string cutString(string pCadena)
        {
            pCadena = pCadena.Trim();
            pCadena = pCadena.Replace(" ",String.Empty);
            pCadena = pCadena.ToLower();

            return pCadena;
        }
    }
}