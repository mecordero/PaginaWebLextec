<%@ Page Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="UsuariosAdmin.aspx.cs" Inherits="Online_Shopping_Backup.UsuariosAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
    <link rel="stylesheet" type="text/css" href="CSS/usuarioAdmin.css" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
            SelectCommand="EXEC SRSP_FiltrarUsuariosOld 'N','N','N','N' " >
        </asp:SqlDataSource>
  <div class="col-xs-9 col-sm-9 col-md-12 col-lg-12" > 

   <br/>
   <br/>
  <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
    <h2 style="margin-bottom:-1%;">Usuarios</h2>
   
    <br/>
    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblNombre"> Nombre: </label>           
            <asp:TextBox ID="txtSearchMaster" runat="server" Height="35px" CssClass="form-control" Width="200px"></asp:TextBox>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblEspecialidad"> Especialidad: </label>
            <asp:DropDownList ID="DDLEspecialidad" runat="server" Height="35px" CssClass="form-control" AppendDataBoundItems = "true" ForeColor="Black"  Width="200px">
                <asp:ListItem Text="" Value="" />
                <asp:ListItem Text = "Bellas Artes" Value = "Bellas Artes"></asp:ListItem>
                <asp:ListItem Text = "Letras" Value = "Letras"></asp:ListItem>
                <asp:ListItem Text = "Ciencias Agroalimentarias" Value = "Ciencias Agroalimentarias"></asp:ListItem>
                <asp:ListItem Text = "Educacion" Value = "Educacion"></asp:ListItem>
                <asp:ListItem Text = "Ciencias Economicas" Value = "Ciencias Economicas"></asp:ListItem>
                <asp:ListItem Text = "Ciencias Sociales" Value = "Ciencias Sociales"></asp:ListItem>
                <asp:ListItem Text = "Ciencias Basicas" Value = "Ciencias Basicas"></asp:ListItem>
                <asp:ListItem Text = "Ciencias Medicas" Value = "Ciencias Medicas"></asp:ListItem>
                <asp:ListItem Text = "Ingenieria" Value = "Ingenieria"></asp:ListItem>
                <asp:ListItem Text = "Otra" Value = "Otra"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblNacionalidad"> Nacionalidad: </label>
            <asp:DropDownList ID="ddlNacionalidad" runat="server"  Height="35px" AppendDataBoundItems = "true" BackColor="Transparent" CssClass="form-control" Width="200px">
                <asp:ListItem Text = "" Value = ""></asp:ListItem>
                <asp:ListItem Text = "Belice" Value = "Belice"></asp:ListItem>
                <asp:ListItem Text = "Colombia" Value = "Colombia"></asp:ListItem>
                <asp:ListItem Text = "Costa Rica" Value = "Costa Rica"></asp:ListItem>
                <asp:ListItem Text = "Guatemala" Value = "Guatemala"></asp:ListItem>
                <asp:ListItem Text = "Honduras" Value = "Honduras"></asp:ListItem>
                <asp:ListItem Text = "Mexico" Value = "Mexico"></asp:ListItem>
                <asp:ListItem Text = "El Salvador" Value = "El Salvador"></asp:ListItem>
                <asp:ListItem Text = "Otro Latinoamericano" Value = "Otro Latinoamericano"></asp:ListItem>
            </asp:DropDownList>
        </div>

    </div>
    <br/>
    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <br/>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblGradoEstudio"> Grado de Estudio: </label>
           <asp:DropDownList ID="ddlGradoEstudio" runat="server" Height="35px" AppendDataBoundItems = "true" BackColor="Transparent" CssClass="form-control" Width="200px">
                <asp:ListItem Text = "" Value = ""></asp:ListItem>
                <asp:ListItem Text = "Tecnico" Value = "Tecnico"></asp:ListItem>
                <asp:ListItem Text = "Bachillerato" Value = "Bachillerato"></asp:ListItem>
                <asp:ListItem Text = "Licenciatura" Value = "Licenciatura"></asp:ListItem>
                <asp:ListItem Text = "Maestria" Value = "Maestria"></asp:ListItem>
                <asp:ListItem Text = "Doctorado" Value = "Doctorado"></asp:ListItem>
                <asp:ListItem Text = "Otro" Value = "Otro"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblSexo"> Sexo: </label>
            <asp:DropDownList ID="ddlSexo" runat="server" Height="35px" AppendDataBoundItems = "true" BackColor="Transparent" CssClass="form-control" Width="200px">
                <asp:ListItem Text = "" Value = ""></asp:ListItem>
                <asp:ListItem Text = "M" Value = "M"></asp:ListItem>
                <asp:ListItem Text = "F" Value = "F"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblEstudiante"> Estudiante: </label>
            <asp:DropDownList ID="ddlEstudiante" runat="server" Height="35px" OnSelectedIndexChanged = "SexoChanged" AppendDataBoundItems = "true" BackColor="Transparent" CssClass="form-control" Width="200px">
                <asp:ListItem Text = "" Value = ""></asp:ListItem>
                <asp:ListItem Text = "SI" Value = "SI"></asp:ListItem>
                <asp:ListItem Text = "NO" Value = "NO"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div> 
     <br/>
    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <br/>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblFrom"> Última participación desde: </label>
            <asp:TextBox type="date" CssClass="form-control" ID="TxtFromSearch"  Height="35px" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblTo"> Última participación hasta: </label>
            <asp:TextBox type="date" CssClass="form-control" ID="TxtToSearch" Height="35px" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblParticipaciones"> Cantidad de participaciones desde: </label>
            <asp:TextBox ID="TxtParticipacionesFrom" runat="server" Height="35px" CssClass="form-control" Width="200px"></asp:TextBox>
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="TxtParticipacionesFrom" ErrorMessage="Debe ser un valor entero, por ejemplo: 3" />
        </div>
       
    </div>  
     <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
         <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblParticipaciones"> Cantidad de participaciones hasta: </label>
            <asp:TextBox ID="TxtParticipacionesTo" runat="server" Height="35px" CssClass="form-control" Width="200px"></asp:TextBox>
            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="TxtParticipacionesTo" ErrorMessage="Debe ser un valor entero, por ejemplo: 3" />
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
             <label for="lblEstudiante">Tipo Experimento: </label>
             <asp:SqlDataSource ID="typesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VerTiposExperimento"></asp:SqlDataSource>
            <asp:DropDownList CssClass="form-control" ID="NotExperiment" runat="server" Width="200px" Height="30"  DataSourceID="typesDS" DataTextField="nombre" DataValueField="idTipo"  AppendDataBoundItems="true">
                <asp:ListItem Text="" Value="" />
            </asp:DropDownList> 
            
          
        </div>
         <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
                <label for="lblFrom"> Fecha de Registro desde: </label>
                <asp:TextBox type="date" CssClass="form-control" ID="TxtFromRegister"  Height="35px" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
            </div>
           
    </div>   
     <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
             <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
                <label for="lblTo"> Fecha de Registro hasta: </label>
                <asp:TextBox type="date" CssClass="form-control" ID="TxtToRegister" Height="35px" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
           </div>
         </div>
    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
     
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
             <br />
             <asp:Button ID="BtnFilter" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Buscar" Height="30px" Width="200px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnSearch_Click" />
             <br />
             <br/>
        </div>
    </div>     
    <br/>
    
    <asp:ScriptManager runat="server"></asp:ScriptManager>
     <div id="grid" class="col-xs-9 col-sm-9 col-md-12 col-lg-12" style="margin-left:-1%; width: 100%; height:100%; overflow: auto" >
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
            <ContentTemplate>
         <asp:GridView ID="GridView1" runat="server" OnDataBound="GridView1_DataBound" HeaderStyle-CssClass="FixedHeader" AutoGenerateColumns="False" CellPadding="4" CellSpacing="5" DataKeyNames="numeroCedula" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="table table-hover">

            <AlternatingRowStyle BackColor="White" />
            <Columns>
               <asp:templatefield ControlStyle-Width="12">
                   <HeaderTemplate>
                       <asp:checkbox ID="CbSelectAll" CssClass="gridCB" runat="server" AutoPostBack="true" OnCheckedChanged="CbSelectAll_CheckedChanged" />
                   </HeaderTemplate>
                    <itemtemplate>
                        <asp:checkbox ID="CbSelect" CssClass="gridCB" runat="server" AutoPostBack="true" OnCheckedChanged="CbSelect_CheckedChanged" />
                    </itemtemplate>
                </asp:templatefield> 
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido1" HeaderText="Primer Apellido" SortExpression="apellido1" />
                <asp:BoundField DataField="apellido2" HeaderText="Segundo Apellido" SortExpression="apellido2" />
                <asp:BoundField DataField="numeroCedula" ReadOnly="true" HeaderText="Cédula" SortExpression="numeroCedula" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"  />
                <asp:BoundField DataField="especialidad" HeaderText="Especialidad" SortExpression="especialidad" />
                <asp:BoundField DataField="nacionalidad" HeaderText="Nacionalidad" SortExpression="nacionalidad" />
                <asp:BoundField DataField="gradoEstudio" HeaderText="Grado Estudio" SortExpression="gradoEstudio" />
                <asp:BoundField DataField="genero" HeaderText="Género" SortExpression="genero" />
                <asp:BoundField DataField="estudiante" HeaderText="Estudiante" SortExpression="estudiante" />
                <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento" SortExpression="fechaNacimiento" />
                <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono" />
                <asp:BoundField DataField="annoIngreso" HeaderText="Ingreso Carrera" SortExpression="annoIngreso" />
                <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Registro" SortExpression="fechaRegistro" />
                <asp:BoundField DataField="fechaUltimaParticipacion" HeaderText="Última Participación" SortExpression="fechaUltimaParticipacion" />
                 <asp:BoundField DataField="cantidadParticipacion" HeaderText="Participaciones" SortExpression="cantidadParticipacion" />
           </Columns>
            
           <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
           <HeaderStyle BackColor="#0a3152" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
           <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
           <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
           <SortedAscendingHeaderStyle BackColor="#0000A9" />
           <SortedDescendingCellStyle BackColor="#CAC9C9" />
           <SortedDescendingHeaderStyle BackColor="#000065" />
       </asp:GridView>
         </div>
        </ContentTemplate>
    </asp:UpdatePanel>
     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
     <br/>
     <br/>
     <asp:Button ID="BtnCreate" CssClass="btn btn-primary" runat="server" Text="Registrar" OnClick="BtnCreate_Click" />
     <asp:Button ID="BtnModificar" CssClass="btn btn-primary" runat="server" Text="Modificar" OnClick="BtnModificar_Click" />
     <asp:Button ID="BtnEliminar" CssClass="btn btn-primary" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click"/>
     <asp:Button ID="btnSeleccionarAleatorio" CssClass="btn btn-primary" runat="server" Text="Enviar Invitación"  OnClick="btnSeleccionarAleatorio_Click" data-toggle="modal" data-target="#myModal"/>
     <asp:Button ID="btnExportar" CssClass="btn btn-primary" runat="server" Text="Exportar" OnClick="btnExportar_Click"/>
     </div>
</div>  
    </div>
        </div>

    <!-- Modal -->
<div id="userModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="ModalTitle" class="modal-title" runat="server">Registrar nuevo usuario</h4>
      </div>
      <div class="modal-body">
          <asp:UpdatePanel runat="server">
              <ContentTemplate>
        <div class="row">
   <div class="col-sm-6 col-xs-12">
    <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Nombre</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TextRname" runat="server" Width="225px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRname"  ErrorMessage="Nombre es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextRname"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Primer apellido</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRPApellido"  runat="server" Width="225px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRPApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtRPApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Segundo apellido</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRSApellido"  runat="server" Width="225px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRSApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtRSApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>

       <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Correo</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TextEmail" placeholder="usuario@correo.com" runat="server" Width="225px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator6" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextEmail"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />  
            </div>
        </div>
        </div>
        
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Cédula</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TextCedula" placeholder="########" runat="server" Width="225px" ToolTip="Sin guion o otro caracter especial" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator3" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextCedula"  ErrorMessage="Cédula es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextCedula"
                ValidationExpression="^[\w ]+$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        
        <div class="col-sm-12 col-xs-12" >
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Fecha nacimiento</span>
                </div>
            <div class="row">
                 <asp:TextBox ID="TextFechaNac" runat="server" type="date"></asp:TextBox>
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Teléfono</span>
                </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TextPhone" placeholder="########" runat="server"  Width="225px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator5" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextPhone"  ErrorMessage="Teléfono es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextPhone"
                ValidationExpression="[0-9]+" ErrorMessage="Solo digitos" Display="Dynamic" ForeColor="Red"  />  
            </div>
        </div>
        </div>
        </div>
       <div class="col-sm-6 col-xs-12">
           <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Genero</span>
                </div>
            <div class="row">
                <select class="form-control" id="SelectGenero" runat="server">
                    <option> </option>
                    <option>F</option>
                    <option>M</option>
                </select>
            </div>
        </div>
        </div>
        
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Especialidad</span>
                </div>
            <div class="row">
                 <select class="form-control"  id="SelectEspcialidad" runat="server" name="selectEspecialidad">
                    <option> </option>
                    <option value="Bellas Artes">Bellas Artes</option>
                    <option value="Letras">Letras</option>
                    <option value="Ciencias Agroalimentarias">Ciencias Agroalimentarias</option>
                    <option value="Educacion">Educación</option>
                    <option value="Ciencias Economicas">Ciencias Económicas</option>
                     <option value="Ciencias Sociale">Ciencias Sociales</option>
                     <option value="Ciencias Basicas">Ciencias Básicas</option>
                     <option value="Ciencias Medicas">Ciencias Médicas</option>
                     <option value="Ingenieria">Ingeniería</option>
                     <option value="Otra">Otra</option>
                </select>
               </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Nacionalidad</span>
                </div>
            <div class="row">
                <select class="form-control" id="SelectNacionalidad" runat="server" name="selectNacionalidad">
                    <option> </option>
                    <option>Belice</option>
                    <option>Colombia</option>
                    <option>Costa Rica</option>
                    <option>Guatemala</option>
                    <option>Honduras</option>
                    <option>Mexico</option>
                    <option>El Salvador</option>
                    <option>Otro Latinoamericano</option>
                    <option>Otra</option>
                </select>
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">¿Estudiante?</span>
                </div>
            <div class="row">
                <asp:DropDownList class="form-control" AutoPostBack="True" ID="selectEstudiante" runat="server" OnSelectedIndexChanged="selectEstudiante_SelectedIndexChanged">
                  <asp:ListItem></asp:ListItem> 
                  <asp:ListItem Text="Si" Value="0"></asp:ListItem> 
                  <asp:ListItem Text="No" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12" runat="server" id="DivGEstudio">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Grado de estudio</span>
                </div>
            <div class="row">
                 <select class="form-control" id="SelectGE" runat="server" name="selectGE">
                    <option> </option>
                     <option value="Tecnico">Técnico</option>
                    <option value="Bachillerato">Bachillerato</option>
                    <option value="Licenciatura">Licenciatura</option>
                    <option value="Maestria">Maestría</option>
                    <option value="Doctorado">Doctorado</option>
                    <option value="Otro">Otro</option>
                </select>
               </div>
        </div>
        </div>
       <div class="col-sm-12 col-xs-12" id="DivCarrera" runat="server">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Año Ingreso Carrera</span>
                </div>
            <div class="row">
                <asp:DropDownList ID="SelectAC" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
               
            </div>
        </div>
        </div>
        </div>
      
    </div>
      </div>
                  </ContentTemplate>
          </asp:UpdatePanel>
                  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <asp:Button ID="BtnRegister" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Registrar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnRegister_Click" />
        <asp:Button ID="BtnEdit" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Modificar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="false" OnClick="BtnEdit_Click" />
      </div>
    </div>
        </div>
  </div>
 </div>




 <div id="modalPercent" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="Modal_title_session" class="modal-title" runat="server">Selecciones Participantes</h4>
      </div>
      <div class="modal-body">
          <div class="row">
            <div class="form-group">
                    <span class="col-sm-5" style="font-weight: bold">Porcentaje</span>
                <div class="col-sm-4">
                    <asp:TextBox CssClass="form-control" ID="TxtPercent" runat="server" Width="200px" type="number"></asp:TextBox>
                </div>
            </div>
              
 
          
          </div>
          <br>
          <div class="row" id="activeExperiments" runat="server">
 
            <div class="form-group">
 
                    <span class="col-sm-5" style="font-weight: bold">Experimento</span>
 
                <div class="col-sm-4">
 
                    <asp:SqlDataSource ID="experimentNamesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VerNombresExperimentos"></asp:SqlDataSource>
                    <asp:DropDownList CssClass="form-control" ID="ddlNameSearch" runat="server" Width="200px" Height="30"  DataSourceID="experimentNamesDS" DataTextField="nombre" DataValueField="idExperimento"  AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
 
          </div>
 
          <div class="modal-footer">
            <asp:Button ID="BtnSelect" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Selección Específica" Height="37px" Width="200px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" onclick="btnOkSeleccionarEspecifica" OnClientClick="openloadModal();"/>
   
            <asp:Button ID="BtnOK" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Selección Aleatoria" Height="37px" Width="200px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" onclick="btnOkSeleccionarAleatorio"/>
     
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                 </div>
        </div>
     </div>
  </div>
</div>
</div>


 <div id="modalUsers" class="modal fade" role="dialog">
  <div class="modal-dialog">
  <asp:UpdatePanel runat="server">
  <ContentTemplate>
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="H1" class="modal-title" runat="server">Usuarios Seleccionados</h4>
         <h5 id="selectedUsers" runat="server">Se han seleccionado: 500 Personas</h5>
             
       
           

       
      </div>
     
      <div class="modal-body" >
         
       <div id="divUsers" runat="server">

       </div>
         
             
          <div class="row" id="Div1" runat="server">
 
            <div class="form-group">
                
                
                <span class="col-sm-5" style="font-weight: bold">Sesiones</span>
               
                <div class="col-sm-4">
 
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"></asp:SqlDataSource>
                    <asp:DropDownList CssClass="form-control" ID="ddlNameSearchSesion" runat="server" Width="200px" Height="30"  DataTextField="name"  DataValueField="idSesion"  AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
 
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
          <asp:Button id= "btnEnviarInvitacion" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Enviar Invitación" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="OpenEmailModal" />
       </div>
      </div>
     </div>
   </ContentTemplate>
   </asp:UpdatePanel>
 </div>
</div>

<div id="emailModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
          <asp:UpdatePanel runat="server">
              <ContentTemplate>
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="H2" class="modal-title" runat="server">Enviar email de invitación</h4>
      </div>
      <div class="modal-body">
      
               <div class="row">
                    <div class="form-group">
                        <br/>
                        <span class="col-sm-2" style="font-weight: bold">Asunto</span>
                        <div class="col-sm-offset-1 col-sm-4">
                             <asp:TextBox TextMode="SingleLine" CssClass="form-control" ID="EmailSubject" runat="server" Width="391px"></asp:TextBox>
                        </div>
                    </div>
                </div>

          <div class="row">
                <div class="form-group">
                    <br/>
                    <span class="col-sm-2" style="font-weight: bold">Cuerpo</span>
                    <div class="col-sm-offset-1 col-sm-4">
                            <asp:TextBox TextMode="MultiLine" CssClass="form-control emailBody" ID="EmailBody" runat="server" Width="391px"></asp:TextBox>
                    </div>
                </div>
            </div>
          <hr />

      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="btnSendEmail" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Enviar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="send_UserInvitation" />
      </div>
    </div>
   </div>
    <div class="modal hide fade" id="myModal">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>Modal header</h3>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
      </div>
    </div>
  </div>
                         </ContentTemplate>
          </asp:UpdatePanel>
</div>
</div>

<div id="loadModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 id="H3" class="modal-title" runat="server">Cargando...</h4>
      </div>
      <div class="modal-body">
        <div class="loader"></div>
          

    </div>
   </div>
</div>
</div>



    <script type="text/javascript">
        function ShowModalPercent() {
               $('#modalPercent').modal('show');
            
               //$("#btnSeleccionarAleatorio").click();
        }
        function ShowModalUsers() {
            $('#modalPercent').modal('toggle');
            $('#modalUsers').modal('show');

           
        }
        function openModal() {
            $('#userModal').modal('show');
        }
        function openEmailModal() {
            $('#emailModal').modal('show');
        }
        function openloadModal() {
            $('#loadModal').modal('show');
        }
        function closeloadModal() {
            $('#loadModal').modal('toggle');
        }
    </script>

</asp:Content>

