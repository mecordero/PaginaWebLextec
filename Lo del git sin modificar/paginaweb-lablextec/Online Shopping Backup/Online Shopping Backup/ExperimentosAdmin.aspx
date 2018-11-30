<%@ Page UICulture="es" Culture="es-MX" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="ExperimentosAdmin.aspx.cs" Inherits="Online_Shopping_Backup.ExperimentosAdmin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
     <link href="Content/bootstrap.css" rel="stylesheet" />    

     <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>          


<style type="text/css">
    .collapsed-row {
        display:none;
        padding:0px;
        margin:0px;
    }

    .emailBody {
        max-width: 391px;
    }

    .tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 120px;
        background-color: black;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 0;

        /* Position the tooltip */
        position: absolute;
        z-index: 1;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
    }
</style>
<style type="text/css">
        .gridLines td
        {
            border-bottom: 1px solid Gray;
        }
      

    </style>

<script type="text/javascript">
  
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
  

    function ToggleGridPanel(row) {
       
        var current = $('#' + row).css('display');
        if (current == 'none') {
            $('#btnPlus').attr("src", "images/minus.png");
            $('#' + row).show();
         
        } else {
            $('#btnPlus').attr("src", "images/plus.png");
            $('#' + row).hide();
         
        }
        return false;
    }

</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

<link rel="stylesheet" type="text/css" href="CSS/experimentosAdmin.css" />
    <link rel="stylesheet" type="text/css" href="css/util.css">
	
<script src="js/experimentosAdmin.js"></script>

    <div class="col-xs-9 col-sm-9 col-md-12 col-lg-12"> 
    <br/>
    <br/>
    
    <h2 >Experimentos</h2>

    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblNombre"> Nombre: </label>
             <br />
            <asp:SqlDataSource ID="experimentNamesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VerNombresExperimentos"></asp:SqlDataSource>
            <asp:DropDownList CssClass="form-control" ID="ddlNameSearch" runat="server" Width="200px" Height="30"  DataSourceID="experimentNamesDS" DataTextField="nombre" DataValueField="idExperimento"  AppendDataBoundItems="true">
                <asp:ListItem Text="" Value="" />
            </asp:DropDownList>
            <br/>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblTipo"> Tipo: </label>
             <br />
            <asp:DropDownList CssClass="form-control" ID="ddlTypeSearch" runat="server" Width="200px" Height="30" DataSourceID="typesDS" DataTextField="nombre" DataValueField="idTipo"  AppendDataBoundItems="true">
                <asp:ListItem Text="" Value="" />
            </asp:DropDownList>
            <br/>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblClase"> Clase: </label>
             <br />
            <asp:DropDownList CssClass="form-control" ID="ddlClassSearch" runat="server" Width="200px" Height="30" DataSourceID="classesDS" DataTextField="nombre" DataValueField="idClase"  AppendDataBoundItems="true" >
                <asp:ListItem Text="" Value="" />
            </asp:DropDownList>
            <br/>
        </div>
        <br /> 
    </div>

    <br />
    <br />

    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblFrom"> Desde: </label>
            <asp:TextBox type="date" CssClass="form-control" ID="TxtFromSearch" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
        </div>
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
            <label for="lblTo"> Hasta: </label>
            <asp:TextBox type="date" CssClass="form-control" ID="TxtToSearch" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="200px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
        </div>
        <br /> 
        <div class="row col-xs-12 col-sm-12 col-md-4 col-lg-4" >
             <br />
             <asp:Button ID="BtnFilter" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Buscar" Height="30px" Width="200px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnFilter_Click" />
             <br />
             <br/>
        </div>
    </div>     
    <br/>

   
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div id="grid" class="col-xs-9 col-sm-9 col-md-12 col-lg-12" style="margin-left:0%;margin-right:0%; width: 100%; height:400px; overflow: auto" >
        <asp:UpdatePanel ID="updatepanelonly" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idExperimento" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="187px" style="margin-bottom: 116px" Width="1350px" CssClass="table table-hover" OnRowDataBound ="gvSession_RowDataBound" CellSpacing="1" >
           
            <Columns>
                 <asp:templatefield HeaderText="">
                     <HeaderTemplate>
                        <asp:checkbox ID="CbSelectAll" OnCheckedChanged="CbSelectAll_CheckedChanged" AutoPostBack="true"
                        CssClass="gridCB" runat="server"></asp:checkbox>
                     </HeaderTemplate>
                    <itemtemplate>
                        <asp:checkbox ID="CbSelect" OnCheckedChanged="CbSelect_CheckedChanged" AutoPostBack="true"
                        CssClass="gridCB" runat="server"></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield> 
                         <asp:TemplateField>
                            <ItemTemplate>
                                  
                                    
                                    
                                     
                                <button  style="background-color: Transparent;" class="btn" onclick="return ToggleGridPanel('tr<%# Eval("idExperimento") %>')">
                                    <img id="btnPlus" src="images/plus.png">
                                </button> 
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:BoundField DataField="idExperimento" HeaderText="ID  " ReadOnly="true" SortExpression="idExperimento" />
                       <asp:BoundField DataField="nombre" HeaderText="Nombre  " SortExpression="nombre" />
                       <asp:BoundField DataField="nombrePublico" HeaderText=" Nombre Público " SortExpression="nombrePublico" />
                       <asp:BoundField DataField="nota" HeaderText=" Nota " SortExpression="nota" HtmlEncode="true"/>
                        <asp:BoundField DataField="descripcion" HeaderText=" Descripción " SortExpression="descripcion" />
                        <asp:BoundField DataField="lugar" HeaderText=" Lugar " SortExpression="lugar" />
                        <asp:BoundField DataField="completado" HeaderText=" Completado " SortExpression="completado" />
                        <asp:BoundField DataField="abierto" HeaderText=" Abierto " SortExpression="abierto" />
                        <asp:BoundField DataField="fechaRegistro" HeaderText=" Fecha Registro  " SortExpression="fechaRegistro" dataformatstring="{0:MMMM d, yyyy}"/>
                        <asp:BoundField DataField="fechaInicio" HeaderText=" Fecha Inicio " SortExpression="fechaInicio" DataFormatString="{0:dd-MM-yyyy hh:mm tt}"/>
                        <asp:BoundField DataField="fechaFinal" HeaderText=" Fecha Final " SortExpression="fechaFinal" DataFormatString="{0:dd-MM-yyyy hh:mm tt}"/>
                        <asp:BoundField DataField="tipo" HeaderText=" Tipo de Experimento " SortExpression="tipo" />
                        <asp:BoundField DataField="clase" HeaderText=" Clase de Experimento " SortExpression="clase" />
                        <asp:TemplateField HeaderText="Clase de Experimento">
                        <ItemTemplate>
                            <%# MyNewRowSession(Eval("idExperimento")) %>  
                                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 panel panel-default" style="align-content:center;margin-top: 2%;">
        
                                         <asp:ImageButton ID="BtnCreateSession" CssClass="btn"  ToolTip="Crear Sesión" runat="server" ImageUrl="~/Images/AddS.png" OnCommand="BtnCreateSession_Command" CommandArgument='<%# Eval("idExperimento") %>' />
                                         <asp:ImageButton ID="BtnModifySession" CssClass="btn" ToolTip="Modificar Sesión" runat="server" ImageUrl="~/Images/Edit.png" OnCommand="BtnModifySession_Click" CommandArgument='<%# Eval("idExperimento") %>' />
                                         <asp:ImageButton ID="BtnDeleteSession" CssClass="btn" ToolTip="Borrar Sesión" runat="server" ImageUrl="~/Images/Delete.png" OnCommand="BtnDeleteSession_Click" CommandArgument='<%# Eval("idExperimento") %>' />
                                         <asp:ImageButton ID="BtnUploadFile" CssClass="btn" runat="server" ToolTip="Subir Archivo" ImageUrl="~/Images/Subir.png" OnCommand="BtnUploadFile_Click" CommandArgument='<%# Eval("idExperimento") %>' />
                                         <asp:ImageButton ID="BtnDownloadFile" CssClass="btn" runat="server" ToolTip="Descargar Archivo" ImageUrl="~/Images/Descargar.png" OnCommand="BtnDownloadFile_Click" CommandArgument='<%# Eval("idExperimento") %>' />
                                         <asp:ImageButton ID="BtnModifiyFile" CssClass="btn" runat="server" ToolTip="Substituir Archivo" ImageUrl="~/Images/swap.png" Text="Substituir Archivos" OnCommand="BtnModifiyFile_Click" CommandArgument='<%# Eval("idExperimento") %>' />   
                                         <asp:ImageButton ID="BtnEliminateFile" CssClass="btn" runat="server" ToolTip="Eliminar Archivo" ImageUrl="~/Images/deletefile.png" Text="Eliminar Archivos" OnCommand="BtnEliminateFile_Click" CommandArgument='<%# Eval("idExperimento") %>' />                                            
                                         <asp:ImageButton ID="BtnExportUsers" CssClass="btn" runat="server" ToolTip="Exportar Usuarios de una sesión" ImageUrl="~/Images/sesionuser.png" Text="Exportar Usuarios" OnCommand="BtnExportUsers_Click" CommandArgument='<%# Eval("idExperimento") %>' />                                             
                                         <asp:ImageButton ID="BtnSendEmailToSession" CssClass="btn" runat="server" ToolTip="Enviar un email a la sesión" ImageUrl="~/Images/Email.png" OnClick="BtnSendEmailToSession_Click" />    
                                    </div>
                            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="gvSessions" runat="server"
                                    Width="100%"
                                    GridLines="None"
                                    AutoGenerateColumns="false"
                                    DataKeyNames="idSesion"
                                    CellPadding="1" CellSpacing="1" 
                                    >
                                     
                                    <Columns>
                                        <asp:templatefield HeaderText="">   
                                         <HeaderTemplate>
                                            <asp:checkbox ID="CbSelectAllSession" OnCheckedChanged="CbSelectAllSession_CheckedChanged"  AutoPostBack="true"
                                            CssClass="gridCB" runat="server"></asp:checkbox>
                                         </HeaderTemplate>
                                        <itemtemplate>
                                            <asp:checkbox ID="CbSelectSession" OnCheckedChanged="CbSelectSession_CheckedChanged"  AutoPostBack="true"
                                            CssClass="gridCB" runat="server"></asp:checkbox>
                                        </itemtemplate>
                                        </asp:templatefield>
                                        <asp:BoundField DataField="idSesion" HeaderText="ID" ReadOnly="true" SortExpression="idSesion" />
                                        <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" dataformatstring="{0:d}" HtmlEncode="false" ApplyFormatInEditMode="true" />
                                        <asp:BoundField DataField="horaInicio" HeaderText="Hora de inicio" SortExpression="horaInicio" ApplyFormatInEditMode="true" />
                                        <asp:BoundField DataField="horaFinal" HeaderText="Hora de fin" SortExpression="horaFina l" ApplyFormatInEditMode="true" />
                                        <asp:BoundField DataField="cupo" HeaderText="Cupo" SortExpression="cupo" />
                                        <asp:TemplateField HeaderText="Lleno">
                                            <ItemTemplate>
                                                <%# Eval("lleno") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                

                        </ItemTemplate>
                        </asp:TemplateField>
                   </Columns>

                <HeaderStyle BackColor="#0a3152" Font-Bold="True" ForeColor="White" />
            
               </asp:GridView>
                    </ContentTemplate>
            
                        </asp:UpdatePanel>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VisualizarExperimento 'N','N'"> 
               </asp:SqlDataSource>
    </div>
        <br />
        <br />
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
     <asp:Button ID="BtnCreate" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="BtnCreate_Click" />
     <asp:Button ID="BtnModificar" CssClass="btn btn-primary" runat="server" Text="Modificar" OnClick="BtnModificar_Click" />
     <asp:Button ID="BtnEliminar" CssClass="btn btn-primary" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" />
     </div>
        </div>
<div id="experimentModal" class="modal fade" role="dialog">
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
        <div class="form-group">
             <span class="col-sm-2" style="font-weight: bold">Nombre</span>
            <div class="col-sm-4">
                <asp:TextBox CssClass="form-control" ID="TextREnombre" placeholder="Experimento A" runat="server" Width="391px" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextREnombre"  ErrorMessage="Nombre es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
            
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nombre Público</span>
            <div class="col-sm-4">
                <asp:TextBox CssClass="form-control" ID="TxtREPublico" placeholder="Nombre Público" runat="server" Width="391px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator11" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtREPublico"  ErrorMessage="Nombre público es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator21" runat="server" ControlToValidate="TxtREPublico"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nota (para administrador)</span>
            <div class="col-sm-4">
            <asp:TextBox ID="TextRENote" runat="server" Height="100px" Width ="391px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator22" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRENote"  ErrorMessage="Nota es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Descripción (para usuario)</span>
            <div class="col-sm-4">
                <asp:TextBox ID="txtREDescription" runat="server" Height="100px"  TextMode="MultiLine" Width="391px"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator23" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="txtREDescription"  ErrorMessage="Descripción es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Lugar</span>
            <div class="col-sm-4">
                 <asp:TextBox CssClass="form-control" ID="TextRElugar" placeholder="TEC Cartago" runat="server" Width="391px" ></asp:TextBox>
                 <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator32" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRElugar"  ErrorMessage="Lugar es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        </div>
        <div class="row" runat="server" id="DivCompleted">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Completado</span>
            <div class="col-sm-4">
                <select class= "form-control" id="selectCompleted" runat="server">
                    <option></option>
                    <option>Si</option>
                    <option>No</option>
                </select>

            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Abierto</span>
            <div class="col-sm-4">
                <select class= "form-control" id="selectRAbierto" runat="server" name="selectEstudiante">
                    <option></option>
                    <option>Si</option>
                    <option>No</option>
                </select>

            </div>
        </div>
        </div>
       <div class="visible" runat="server" id="DivClase">
       <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Clase (Ej: Lab, Internet, Campo, etc)</span>
            <div class="col-sm-4">
                <asp:SqlDataSource ID="classesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VerClases"></asp:SqlDataSource>
                <asp:DropDownList CssClass="form-control" AutoPostBack="True" ID="DDLclase" runat="server" OnSelectedIndexChanged="ChangeDivNclase" Width="391px" DataSourceID="classesDS" DataTextField="nombre" DataValueField="idClase">
                </asp:DropDownList>
            </div>
        </div>
        </div>
        </div>
        <div class="visible" runat="server" id="DivTipo">
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Tipo</span>
            <div class="col-sm-4">
             <asp:SqlDataSource ID="typesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="EXEC SRSP_VerTiposExperimento"></asp:SqlDataSource>
     
            <asp:DropDownList class= "form-control" ID="DDLtipo" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ChangeDivNtipo" Width="391px" DataSourceID="typesDS" DataTextField="nombre" DataValueField="idTipo">
            </asp:DropDownList>
            </div>
        </div>
        </div>
        </div>
        <div class="row">
        </div>
       <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Fecha Inicio</span>
            <div class="col-sm-4">
                 <asp:TextBox type="date" CssClass="form-control" ID="TxtREFI" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="391px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
                 <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator25" ValidationGroup="reg" Display="Dynamic"
                 runat="server" ControlToValidate="TxtREFI" ErrorMessage="Fecha inicio es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Fecha Final</span>
               <div class="col-sm-4">
                   <asp:TextBox type="date" CssClass="form-control" ID="textREFF" placeholder="04/12/2011 12:00:00 PM" runat="server" Width="391px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
                   <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator15" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="textREFF"  ErrorMessage="Fecha final es requerida" ForeColor="Red"></asp:RequiredFieldValidator>

               </div>
        </div>
        </div>
        <div runat="server" id="divNClase">
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nueva Clase</span>
               <div class="col-sm-4">
                   <asp:TextBox CssClass="form-control" ID="TextREclase" placeholder="Abierto" runat="server" Width="391px" />
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator51" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="TextREclase"  ErrorMessage="Nueva Clase es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextREclase"
                    ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
               </div>
        </div>
        </div>
        </div>
        <div runat="server" id="divNtipo">
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nuevo Tipo</span>
               <div class="col-sm-4">
                   <asp:TextBox CssClass="form-control" ID="TextRETipo" placeholder="Negociación" runat="server" Width="391px" />
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator61" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="TextRETipo"  ErrorMessage="Nueva Tipo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextRETipo"
                    ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
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

<div id="sessionModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
          <asp:UpdatePanel runat="server">
              <ContentTemplate>
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="Modal_title_session" class="modal-title" runat="server">Sesión</h4>
      </div>
      <div class="modal-body">
      
               <div class="row">
                <div class="form-group">
                    <br/>
                     <span class="col-sm-2" style="font-weight: bold">Fecha</span>
                    <div class="col-sm-4">
                         <asp:TextBox type="date" CssClass="form-control" ID="TxtFechaSesion" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="391px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
                         <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="reg" Display="Dynamic"
                         runat="server" ControlToValidate="TxtREFI" ErrorMessage="Fecha es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                </div>
                </div>

                  <div class="row">
                    <div class="form-group">
                         <span class="col-sm-2" style="font-weight: bold">Hora de inicio</span>
                        <div class="col-sm-4">
                            <asp:TextBox CssClass="form-control" ID="TxtStartTime" runat="server" Width="391px" type="time"></asp:TextBox>
                            <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="reg" Display="Dynamic"
                            runat="server" ControlToValidate="TxtStartTime" ErrorMessage="Hora de inicio es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    </div>

                  <div class="row">
                    <div class="form-group">
                         <span class="col-sm-2" style="font-weight: bold">Hora de Fin</span>
                        <div class="col-sm-4">
                            <asp:TextBox CssClass="form-control" ID="TxtEndTime" runat="server" Width="391px" type="time"></asp:TextBox>
                            <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator3" ValidationGroup="reg" Display="Dynamic"
                            runat="server" ControlToValidate="TxtEndTime" ErrorMessage="Hora de inicio es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    </div>

                  <div class="row">
                    <div class="form-group">
                         <span class="col-sm-2" style="font-weight: bold">Cupo</span>
                        <div class="col-sm-4">
                            <asp:TextBox CssClass="form-control" ID="TxtCapacity" runat="server" Width="391px" type="number"></asp:TextBox>
                            <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator4" ValidationGroup="reg" Display="Dynamic"
                            runat="server" ControlToValidate="TxtCapacity" ErrorMessage="Hora de inicio es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <asp:Button ID="BtnRegisterSession" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Registrar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnRegisterSession_Click" />
          <asp:Button ID="BtnEditSession" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Editar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnEditSession_Click" />
      </div>
    </div>
        </div>
  </div>
                         </ContentTemplate>
          </asp:UpdatePanel>
</div>
</div>


<div id="fileModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
     <asp:UpdatePanel runat="server">
     <ContentTemplate>
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
   
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="modal_archive_title" class="modal-title" runat="server">Subir Archivo</h4>
         
      </div>
      <div class="modal-body">
 
    <div class="row" id="fileUpDiv" runat="server">
        <div class="form-group">
             <span class="col-sm-2" style="font-weight: bold">Subir Archivo</span>
            <div class="col-sm-4">
               <asp:FileUpload ID="FileUpload1" runat="server" />
               
            </div>
        </div>
        </div>
               

    <div class="row"  id="fileDownDiv" runat="server">
    <div class="form-group">
        <br/>
            <span class="col-sm-2" style="font-weight: bold">Seleccione el archivo</span>
        <div class="col-sm-4">
            <asp:DropDownList CssClass="form-control" AutoPostBack="True" ID="ddlFiles" runat="server"  Width="391px">
            </asp:DropDownList>
        </div>       
    </div>
    </div>
 
         
            
                  
      <div class="modal-footer">
        
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <asp:Button ID="BtnAddFileM" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Subir" Height="37px" Width="115px"  Visible="true" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnAddFileM_Click" />
        <asp:Button ID="BtnModifyFileM" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Substituir" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="true" OnClick="BtnModifyFileM_Click" />
        <asp:Button ID="BtnDeleteFileM" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Eliminar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="true" OnClick="BtnDeleteFileM_Click" />
        <asp:Button ID="BtnDownloadFileM" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Descargar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="true" OnClick="BtnDownloadFileM_Click" />
  

      </div>
    </div>
          
        </div>
         </ContentTemplate>
         <Triggers>
        <asp:PostBackTrigger ControlID = "btnAddFileM" />
        <asp:PostBackTrigger ControlID = "btnModifyFileM" />
        <asp:PostBackTrigger ControlID = "btnDeleteFileM" />
        <asp:PostBackTrigger ControlID = "btnDownloadFileM" />
        </Triggers>
          </asp:UpdatePanel> 
  </div>
</div>



<div id="csvModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
     <asp:UpdatePanel runat="server">
     <ContentTemplate>
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
   
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="H1" class="modal-title" runat="server">Confirmación</h4>
         
      </div>
      <div class="modal-body">
 
  
               

    <div class="row"  id="Div2" runat="server">
    <div class="form-group">
        <br/>
            
        <div class="col-sm-10">
            ¿Desea descargar los archivos? 
        </div>       
    </div>
    </div>
 
         
            
                  
      <div class="modal-footer">
        
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
       
        <asp:Button ID="BtnDownloadCsv" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Descargar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="true" OnClick="BtnDownloadCsv_Click" />
  

      </div>
    </div>
          
        </div>
         </ContentTemplate>
         <Triggers>
        
        <asp:PostBackTrigger ControlID = "BtnDownloadCsv" />
        </Triggers>
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
        <h4 id="H2" class="modal-title" runat="server">Enviar email a sesión</h4>
      </div>
      <div class="modal-body">
      
               <div class="row">
                    <div class="form-group">
                        <br/>
                        <span class="col-sm-2" style="font-weight: bold">Asunto</span>
                        <div class="col-sm-4">
                             <asp:TextBox TextMode="SingleLine" CssClass="form-control" ID="EmailSubject" runat="server" Width="391px"></asp:TextBox>
                        </div>
                    </div>
                </div>

          <div class="row">
                <div class="form-group">
                    <br/>
                    <span class="col-sm-2" style="font-weight: bold">Cuerpo</span>
                    <div class="col-sm-4">
                            <asp:TextBox TextMode="MultiLine" CssClass="form-control emailBody" ID="EmailBody" runat="server" Width="391px"></asp:TextBox>
                    </div>
                </div>
            </div>
          <hr />

      <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="btnSendEmail" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Enviar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="btnSendEmail_Click" />
      </div>
    </div>
        </div>
  </div>
                         </ContentTemplate>
          </asp:UpdatePanel>
</div>
</div>



<script type="text/javascript">
            $("[src*=plus]").live("click", function () {
                
                $(this).attr("src", "images/minus.png");
            });
            $("[src*=minus]").live("click", function () {
                $(this).attr("src", "images/plus.png");
               
            });
            $("#uploadTrigger").click(function () {
                $("#uploadFile").click();
            });
            function openModal() {
                $('#experimentModal').modal('show');
            }

            function openSessionModal() {
                $('#sessionModal').modal('show');
            }
            function openFileModal() {
                $('#fileModal').modal('show');
            }
            function openCsvModal() {
                $('#csvModal').modal('show');
    }
    function openEmailModal() {
        $('#emailModal').modal('show');
    }
</script>
    


</asp:Content>
