using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;


namespace WebServiceLextec
{
    /// <summary>
    /// Summary description for WebServiceLextec
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceLextec : System.Web.Services.WebService
    {
        [WebMethod]
        public void Desmatricular_Usuario(int sessionID, String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.Desmatricular_Usuario @idSesion, @email";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            System.Diagnostics.Debug.WriteLine(sessionID);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.ExecuteNonQuery();

         
            conn.Close();
        }

        [WebMethod]
        public List<String> GetAllUsers()
        {
            List<String> users = new List<String>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "select * from dbo.ViewUsuarios";

            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                users.Add(sdr[5].ToString());
            }

            conn.Close();

            return users;
        }

        [WebMethod]
        public DataTable GetAllClases()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            string query = "select Clase.nombre from Clase ";

            SqlCommand cmd = new SqlCommand(query, conn);

            DataTable dt = new DataTable("Clases");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;

        }

        [WebMethod]
        public DataTable GetAllTipos()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            string query = "select Tipo.nombre from Tipo";

            SqlCommand cmd = new SqlCommand(query, conn);

            DataTable dt = new DataTable("Clases");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;
        }

        [WebMethod]
        public object GetIdAdministradorFromNombre(string name)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            string query = "SELECT Administrador.idAdmin from Administrador where Administrador.nombre = @Nombre";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", name);

            object value = cmd.ExecuteScalar();

            conn.Close();

            return value;
        }

        [WebMethod]
        public object GetIdClaseFromNombre(String name)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "SELECT idClase FROM Clase WHERE nombre = @Nombre";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", name);

            object value = cmd.ExecuteScalar();

            conn.Close();

            return value;

        }

        [WebMethod]
        public object GetIdTipoFromNombre(String name)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "SELECT idTipo FROM Tipo WHERE nombre = @Nombre";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", name);

            object value = cmd.ExecuteScalar();

            conn.Close();

            return value;
        }

        [WebMethod]
        public void Matricular_Usuario(int sessionID, String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.Matricular_Usuario @idSesion, @email";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.ExecuteNonQuery();

            conn.Close();

        }

        [WebMethod]
        public int SRSP_ActualizarAdministrador(String name, String last_name1, String last_name2, String gender, String email, bool admin)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "SRSP_ActualizarAdministrador @nombre, @apellido1, @apellido2,@genero,@email,@admin";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@nombre", name);
            cmd.Parameters.AddWithValue("@apellido1", last_name1);
            cmd.Parameters.AddWithValue("@apellido2", last_name2);
            cmd.Parameters.AddWithValue("@genero", gender);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@admin", admin);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_ActualizarExperimento(String name, String publicName, String note, String description, String place, bool isOpen, int classID, int typeID, String startDate, String endDate, bool isCompleted, int AdminID, int ID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_ActualizarExperimento @Tipo, @Clase, @ID ,@Nombre, @NombrePublico, @Nota, @Descripcion, @Lugar, @Completado, @Abierto, @FechaRegistro, @fechaInicio, @FechaFin";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Tipo", typeID);
            cmd.Parameters.AddWithValue("@Clase", classID);
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Nombre", name);
            cmd.Parameters.AddWithValue("@NombrePublico", publicName);
            cmd.Parameters.AddWithValue("@Nota", note);
            cmd.Parameters.AddWithValue("@Descripcion", description);
            cmd.Parameters.AddWithValue("@Lugar", place);
            cmd.Parameters.AddWithValue("@Completado", isCompleted);
            cmd.Parameters.AddWithValue("@Abierto", isOpen);
            cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Today);
            cmd.Parameters.AddWithValue("@FechaInicio", startDate);
            cmd.Parameters.AddWithValue("@FechaFin", endDate);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;

        }
        
        [WebMethod]
        public DataTable SRSP_ActualizarResultado(int resultID, int sessionID, String name, String type, int size, byte[] file)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_ActualizarResultado @idResultado, @idSesion, @nombre, @tipo, @tamano, @archivo;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idResultado", resultID);
            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            cmd.Parameters.AddWithValue("@nombre", name);
            cmd.Parameters.AddWithValue("@tipo", type);
            cmd.Parameters.AddWithValue("@tamano", size);
            cmd.Parameters.AddWithValue("@archivo", file);

            DataTable dt = new DataTable("Actualizacion Resultado");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;
        }

        [WebMethod]
        public int SRSP_ActualizarSesion(int sessionID, DateTime date, DateTime startTime, DateTime endTime, bool full, int capacity)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_ActualizarSesion @idSesion, @fecha, @horaInicio, @horaFinal, @lleno, @cupo;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            cmd.Parameters.AddWithValue("@fecha", date);
            cmd.Parameters.AddWithValue("@horaInicio", startTime);
            cmd.Parameters.AddWithValue("@horaFinal", endTime);
            cmd.Parameters.AddWithValue("@lleno", full);
            cmd.Parameters.AddWithValue("@cupo", capacity);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_ActualizarUsuario(String name, String lastName1, String lastName2, String id, String email, String speciality, String nationality, String careerLevel, char gender, bool isStudent, String birthDate, String phone, String careerYear)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_ActualizarUsuario @Nombre, @Apellido1, @Apellido2 ,@Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio, @Genero, @Habilitado, @Estudiante, @fechaNacimiento, @Telefono, @AnnoIngreso, @FechaRegistro, @FechaDeshabilitado";

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
            cmd.Parameters.AddWithValue("@GradoEstudio", (careerLevel == null) ? DBNull.Value.ToString() : careerLevel);
            cmd.Parameters.AddWithValue("@AnnoIngreso", (careerYear == null) ? DBNull.Value.ToString() : careerYear);
            cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Today);
            cmd.Parameters.AddWithValue("@FechaDeshabilitado", DBNull.Value);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_EliminarAdministrador(String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_EliminarAdministrador @Email";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Email", email);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_EliminarExperimento(int experimentID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_EliminarExperimento @ID";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@ID", experimentID);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;

        }
        
        [WebMethod]
        public int SRSP_EliminarResultado(int resultID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_EliminarResultado @idResultado;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idResultado", resultID);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_EliminarSesion(int sesssionID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_EliminarSesion @idSesion";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sesssionID);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_EliminarUsuario(Int64 id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_EliminarUsuario @Cedula";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Cedula", id);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }
        
        [WebMethod]
        public DataTable SRSP_FiltrarUsuariosLike(String like, String speciality, String nationality, String careerLevel, String sex, String notExperiment, String student, String startDate, String endDate, String startQuatity, String endQuantity, String startRegisterDate, String endRegisterDate)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.SRSP_FiltrarUsuariosLike @Like, @Especialidad, @Nacionalidad, @Grado, @Sexo, @Estudiante, @fechaInicio,@fechaFinal, @cantidadParticipacionInicio,@cantidadParticipacionFin, @idTipoExperimento, @fechaInicioRegistro,@fechaFinalRegistro";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Like", (like != "") ? like : "N");
            cmd.Parameters.AddWithValue("@Especialidad", (speciality != "") ? speciality : "N");
            cmd.Parameters.AddWithValue("@Nacionalidad", (nationality != "") ? nationality : "N");
            cmd.Parameters.AddWithValue("@Grado", (careerLevel != "") ? careerLevel : "N");
            cmd.Parameters.AddWithValue("@Sexo", (sex != "") ? sex : "N");
            if (notExperiment == "")
                cmd.Parameters.AddWithValue("@idTipoExperimento", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@idTipoExperimento", notExperiment);

            if (student == "")
                cmd.Parameters.AddWithValue("@Estudiante", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@Estudiante", (student == "SI") ? 1.ToString() : 0.ToString());

            if (startDate != "")
                cmd.Parameters.AddWithValue("@fechaInicio", startDate);
            else
                cmd.Parameters.AddWithValue("@fechaInicio", DBNull.Value);

            if (endDate != "")
                cmd.Parameters.AddWithValue("@fechaFinal", endDate);
            else
                cmd.Parameters.AddWithValue("@fechaFinal", DBNull.Value);

            if (startQuatity != "")
                cmd.Parameters.AddWithValue("@cantidadParticipacionInicio", startQuatity);
            else
                cmd.Parameters.AddWithValue("@cantidadParticipacionInicio", DBNull.Value);
            if (endQuantity != "")
                cmd.Parameters.AddWithValue("@cantidadParticipacionFin", endQuantity);
            else
                cmd.Parameters.AddWithValue("@cantidadParticipacionFin", DBNull.Value);
            if (startRegisterDate != "")
            {
                System.Diagnostics.Debug.WriteLine("Registro:" + startRegisterDate);

                cmd.Parameters.AddWithValue("@fechaInicioRegistro", startRegisterDate);
            }
            else
                cmd.Parameters.AddWithValue("@fechaInicioRegistro", DBNull.Value);

            if (endRegisterDate != "")
                cmd.Parameters.AddWithValue("@fechaFinalRegistro", endRegisterDate);
            else
                cmd.Parameters.AddWithValue("@fechaFinalRegistro", DBNull.Value);

            DataTable dt = new DataTable("Usuarios Filtrados");

            dt.Load(cmd.ExecuteReader());

            return dt;
        }
        
        [WebMethod]
        public int SRSP_InsertarAdministrador(String name, String last_name1, String last_name2, String gender, String email, String password, String admin, String real_admin)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = " exec SRSP_InsertarAdministrador @Nombre , @Apellido1, @Apellido2, @Genero, @Email, @Contrasenna,@Admin,@AdminReal";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", name);
            cmd.Parameters.AddWithValue("@Apellido1", last_name1);
            cmd.Parameters.AddWithValue("@Apellido2", last_name2);
            cmd.Parameters.AddWithValue("@Genero", gender);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Contrasenna", password);
            cmd.Parameters.AddWithValue("@Admin", admin);
            cmd.Parameters.AddWithValue("@AdminReal", real_admin);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_InsertarClase(String name)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_InsertarClase @Nombre";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", name);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;

        }


        [WebMethod]
        public int SRSP_InsertarExperimento(String name, String publicName, String note, String description, String place, bool isOpen, int classID, int typeID, String startDate, String endDate, bool isCompleted, int AdminID)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_InsertarExperimento @Tipo, @Clase, @Admin, @Nombre, @NombrePublico, @Nota, @Descripcion, @Lugar, @Completado, @Abierto, @FechaRegistro, @FechaInicio, @FechaFin;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Tipo", typeID);
            cmd.Parameters.AddWithValue("@Clase", classID);
            cmd.Parameters.AddWithValue("@Admin", AdminID);
            cmd.Parameters.AddWithValue("@Nombre", name);
            cmd.Parameters.AddWithValue("@NombrePublico", publicName);
            cmd.Parameters.AddWithValue("@Nota", note);
            cmd.Parameters.AddWithValue("@Descripcion", description);
            cmd.Parameters.AddWithValue("@Lugar", place);
            cmd.Parameters.AddWithValue("@Completado", isCompleted);
            cmd.Parameters.AddWithValue("@Abierto", isOpen);
            cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Today);
            cmd.Parameters.AddWithValue("@FechaInicio", startDate);
            cmd.Parameters.AddWithValue("@FechaFin", endDate);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_InsertarResultado(int sessionID, String name, String type, int size, byte[] file)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_InsertarResultado @idSesion, @nombre, @tipo, @tamano, @archivo;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            cmd.Parameters.AddWithValue("@nombre", name);
            cmd.Parameters.AddWithValue("@tipo", type);
            cmd.Parameters.AddWithValue("@tamano", size);
            cmd.Parameters.AddWithValue("@archivo", file);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_InsertarSesion(int experimentID, DateTime date, DateTime startTime, DateTime endTime, bool full, int capacity)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_InsertarSesion @idExperimento, @Fecha, @horaInicio, @horaFinal, @lleno, @cupo;";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idExperimento", experimentID);
            cmd.Parameters.AddWithValue("@Fecha", date);
            cmd.Parameters.AddWithValue("@horaInicio", startTime);
            cmd.Parameters.AddWithValue("@horaFinal", endTime);
            cmd.Parameters.AddWithValue("@lleno", full);
            cmd.Parameters.AddWithValue("@cupo", capacity);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_InsertarSesionxUsuario(int userID, int sessionID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.SRSP_InsertarSesionxUsuario @idUsuario, @idSesion, @matriculado";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idUsuario", userID);
            cmd.Parameters.AddWithValue("@idSesion", sessionID);
            cmd.Parameters.AddWithValue("@matriculado", 0);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public int SRSP_InsertarTipo(String nombre)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_InsertarTipo @Nombre";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Nombre", nombre);

            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }
              
        [WebMethod]
        public int SRSP_InsertarUsuario(String name, String lastName1, String lastName2, String id, String email, String speciality, String nationality, String careerLevel, char gender, bool isStudent, String birthDate, String phone, String careerYear)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_InsertarUsuario @Nombre, @Apellido1, @Apellido2 ,@Cedula, @Email, @Especialidad, @Nacionalidad, @GradoEstudio, @Genero, @Habilitado, @Estudiante, @fechaNacimiento, @Telefono, @AnnoIngreso, @FechaRegistro, @FechaDeshabilitado";

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
            cmd.Parameters.AddWithValue("@GradoEstudio", (careerLevel == null) ? DBNull.Value.ToString() : careerLevel);
            cmd.Parameters.AddWithValue("@AnnoIngreso", (careerYear == null) ? DBNull.Value.ToString() : careerYear);
            cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Today);
            cmd.Parameters.AddWithValue("@FechaDeshabilitado", DBNull.Value);
            
            int result = cmd.ExecuteNonQuery();

            conn.Close();

            return result;
        }

        [WebMethod]
        public DataTable SRSP_SeleccionarInvitacionesXCorreo(String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.SRSP_SeleccionarInvitacionesXCorreo @email";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@email", email);

            SqlDataReader lines = cmd.ExecuteReader();

            DataTable dt = new DataTable("Invitaciones X Correo");
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Nombre", typeof(string)),
                            new DataColumn("Sesion", typeof(int)),
                            new DataColumn("Fecha",typeof(string)),
                            new DataColumn("Hora Inicio",typeof(string)),
                            new DataColumn("Hora Final",typeof(string)),
                            new DataColumn("Cupo",typeof(int))
                            });

            while (lines.Read())
            {

                dt.Rows.Add(lines[0], lines[1], lines[2], lines[3], lines[4], lines[5]);          
            }

            conn.Close();

            return dt;
        }

        [WebMethod]
        public List<int> SRSP_SeleccionarInvitacionesXCorreoValues(String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.SRSP_SeleccionarInvitacionesXCorreo @email";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@email", email);

            SqlDataReader lines = cmd.ExecuteReader();

            int i = 0;
            List<int> values = new List<int>();

            while (lines.Read())
            {
                if ((bool)lines[6] == false)
                {

                }
                else
                {
                    values.Add(i);



                }
                i++;

                System.Diagnostics.Debug.WriteLine(lines[6]);
            }

            conn.Close();

            return values;
        }

        [WebMethod]
        public List<String> SRSP_SelectInvitados(int experimentID)
        {
            List<string> users = new List<string>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_SelectInvitados @idExperimento";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idExperimento", experimentID);

            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {

                users.Add(sdr[0].ToString());
            }

            conn.Close();

            return users;
        }

        [WebMethod]
        public DataTable SRSP_SesionExportarUsuarios(int sessionID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_SesionExportarUsuarios @idSesion";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);

            DataTable dt = new DataTable("Usuarios Exportados");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VerResultado(int resultID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            String query = "EXEC SRSP_VerResultado @idResultado;";

            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idResultado", resultID);

            DataTable dt = new DataTable("Resultado");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VerResultadoxSesion(int sessionID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            String query = "EXEC SRSP_VerResultadoxSesion @idSesion;";

            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idSesion", sessionID);

            DataTable dt = new DataTable("Resultado X Sesion");

            dt.Load(cmd.ExecuteReader());

            conn.Close();
                
            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VerificarAdministrador()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            String query = "exec SRSP_VerificarAdministrador";
            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);
            DataTable dt = new DataTable("Master Administradores");

            dt.Load(cmd.ExecuteReader());

            conn.Close();

            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VerSesionesdeExperimento(int experimentID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec SRSP_VerSesionesdeExperimento @idExperimento";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@idExperimento", experimentID);

            DataTable dt = new DataTable("Sesiones Experimentos");

            dt.Load(cmd.ExecuteReader());

            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VerUsuario(String email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "exec dbo.SRSP_VerUsuario @email";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@email", email);

            DataTable dt = new DataTable("Usuario");

            dt.Load(cmd.ExecuteReader());

            return dt;
        }

        [WebMethod]
        public DataTable SRSP_VisualizarExperimento5Param(String idExperimiento, String idTipo, String idClase, String fechaInicio, String fechaFinal)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShoppingConnectionString"].ConnectionString);

            conn.Open();

            String query = "EXEC SRSP_VisualizarExperimento5Param @idExperimento, @idTipo, @idClase, @fechaInicio, @FechaFinal;";

            SqlCommand cmd = new SqlCommand(query, conn);

            DataTable dt = new DataTable("Experimentos");


            //revisa los nulos

            //idExperimento
            if (idExperimiento == "")
            {
                cmd.Parameters.AddWithValue("@idExperimento", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@idExperimento", idExperimiento);
            }


            //idTipo
            if (idTipo == "")
            {
                cmd.Parameters.AddWithValue("@idTipo", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@idTipo", idTipo);
            }

            //idClase
            if (idClase == "")
            {
                cmd.Parameters.AddWithValue("@idClase", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@idClase", idClase);
            }

            //fechaInicio
            if (fechaInicio == "")
            {
                cmd.Parameters.AddWithValue("@fechaInicio", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@fechaInicio", fechaInicio);
            }

            //fechaFinal
            if (fechaFinal == "")
            {
                cmd.Parameters.AddWithValue("@fechaFinal", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@fechaFinal", fechaFinal);
            }

            dt.Load(cmd.ExecuteReader());

            conn.Close();
            return dt;

        }
    }
}
