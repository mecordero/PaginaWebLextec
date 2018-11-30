<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Online_Shopping_Backup.Registro" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
    $(function () {
        $("#TextFechaNac").datepicker({
            dateFormat: 'dd/mm/yy',
            minDate: '-100Y ',
            maxDate: '+100Y',
            changeMonth: true,
            changeYear: true,
            numberOfMonths: 2,
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                'Junio', 'Julio', 'Agosto', 'Septiembre',
                'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                'May', 'Jun', 'Jul', 'Ago',
                'Sep', 'Oct', 'Nov', 'Dic']
        });
    });
    
</script>

   <link rel="stylesheet" type="text/css" href="CSS/registro.css" />
 <div class="col-sm-2 col-xs-12" ></div>
  <div class="col-sm-8 col-xs-12">
  <h2><span id="rtr-s-Text_2_0" style="">Registrarse</span></h2>
   <div class="col-sm-6 col-xs-12">
    
    <div class="row col-sm-12 col-xs-12">
        <div class="form-group ">
           
             
            <span class="col-sm-12 col-xs-12" style="font-weight: bold">Nombre</span>
            <div class="col-sm-12 col-xs-12">
                <asp:TextBox CssClass="form-control" ID="TextRname" runat="server" Width="225px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRname"  ErrorMessage="Nombre es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextRname"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12" style="font-weight: bold">Primer Apellido</span>
            <div class="col-sm-12 col-xs-12">
                <asp:TextBox CssClass="form-control" ID="TxtRPApellido"  runat="server" Width="225px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRPApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtRPApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12" style="font-weight: bold">Segundo Apellido</span>
            <div class="col-sm-12 col-xs-12">
                <asp:TextBox CssClass="form-control" ID="TxtRSApellido"  runat="server" Width="225px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRSApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtRSApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12" style="font-weight: bold">Cédula</span>
            <div class="col-sm-12 col-xs-12">
                <asp:TextBox CssClass="form-control" ID="TextCedula" placeholder="########" runat="server" Width="225px" ToolTip="Sin guion o otro caracter especial" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator3" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextCedula"  ErrorMessage="Cédula es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextCedula"
                ValidationExpression="^[\w ]+$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
            <span class="col-sm-12 col-xs-12" style="font-weight: bold">Género</span>
            <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                <select class= "form-control" id="SelectGenero" runat="server" name="selectGenero">
                    <option> </option>
                    <option>F</option>
                    <option>M</option>
                </select>
            </div>
        </div>
        </div>
        <div class="row col-sm-12 col-xs-12" >
        <div class="form-group">
            <br/>
             <span class="col-sm-6 col-xs-6 col-md-6 col-lg-10" style="font-weight: bold">Fecha de Nacimiento</span>
            <div class="col-sm-6 col-xs-12 col-md-6 col-lg-10">
                 <asp:TextBox CssClass="form-control" ID="TextFechaNac"  runat="server"  ClientIdMode="static" Width="225px" ></asp:TextBox>
                 
            </div>
        </div>
        </div>
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
            <span class="col-sm-6 col-xs-6 col-md-6 col-lg-10" style="font-weight: bold">Teléfono</span>
            <div class="col-sm-6 col-xs-12 col-md-6 col-lg-10">
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
         <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
             <span class="col-sm-6 col-xs-6 col-md-6 col-lg-10" style="font-weight: bold">Correo</span>
            <div class="col-sm-6 col-xs-12 col-md-6 col-lg-10">
                <asp:TextBox CssClass="form-control" ID="TextEmail" placeholder="usuario@correo.com" runat="server" Width="225px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator6" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextEmail"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />  
            </div>
        </div>
        </div>
        
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
               <span class="col-sm-12 col-xs-12" style="font-weight: bold">Especialidad</span>
               <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                 <select class= "form-control" id="SelectEspcialidad" runat="server" name="selectEspecialidad" onchange="jsfunction()">
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
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12 col-xs-12" style="font-weight: bold">Nacionalidad</span>
            <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                <select class= "form-control" id="SelectNacionalidad" runat="server" name="selectNacionalidad">
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
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12 col-xs-12" style="font-weight: bold">Estudiante</span>
            <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                <asp:DropDownList class= "form-control" AutoPostBack="True" ID="selectEstudiante" runat="server" OnSelectedIndexChanged="onChangeSE">
                  <asp:ListItem></asp:ListItem> 
                  <asp:ListItem Text="Si" Value="0"></asp:ListItem> 
                  <asp:ListItem Text="No" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        </div>
        <div class="oculto" runat="server" id="DivGEstudio">
        <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12 col-xs-12" style="font-weight: bold">Grado de Estudio</span>
               <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                 <select class= "form-control" id="SelectGE" runat="server" name="selectGE">
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
        </div>
      <div class="oculto" runat="server" id="DivCarrera">
       <div class="row col-sm-12 col-xs-12">
        <div class="form-group">
            <br/>
             <span class="col-sm-12 col-xs-12" style="font-weight: bold">Año Ingreso Carrera</span>
            <div class="col-sm-6 col-xs-6 col-md-6 col-lg-10">
                <asp:DropDownList ID="SelectAC" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                    
                
               
            </div>
        </div>
        </div>
        </div>
        </div>
      <br/>
      <br/>
      <div class="row col-sm-12 col-xs-12" style="text-align: center">
          <br/>
          <div class="col-sm-12 col-xs-12" style="width: 50%; margin: 0 auto; text-align: right">

          <asp:Button ID="btn_register" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Registrar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="btnRUonClick" OnClientClick="return alert('Registrando Usuario');" />
          </div>
      </div>
      
    </div>

    <div class="col-sm-4 col-xs-12">
  
    
    
    </div>
   
    

   

</asp:Content>
