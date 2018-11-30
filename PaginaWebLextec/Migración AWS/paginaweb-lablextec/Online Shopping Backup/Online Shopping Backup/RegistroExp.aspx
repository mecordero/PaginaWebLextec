<%@ Page Title="Registro Experimento" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="RegistroExp.aspx.cs" Inherits="Online_Shopping_Backup.RegistroExp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <style>
            .oculto{
                display: none;
                z-index: 2;
            }
            .visible{
                display: block;
                z-index: 2;
            }
    </style>  







    <div class="container">
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
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Cupo</span>
            <div class="col-sm-4">
             <asp:TextBox CssClass="form-control" ID="TextCupo" placeholder="10" runat="server" Width="391px" ></asp:TextBox>
             <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator41" ValidationGroup="reg" Display="Dynamic"
              runat="server" ControlToValidate="TextCupo"  ErrorMessage="Cupo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextCupo"
             ValidationExpression="[0-9]+" ErrorMessage="Solo digitos" Display="Dynamic" ForeColor="Red"  /> 
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
                <asp:DropDownList CssClass="form-control" AutoPostBack="True" ID="DDLclase" runat="server" OnSelectedIndexChanged="changeDivNclase" Width="391px">
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
            <asp:DropDownList class= "form-control" ID="DDLtipo" AutoPostBack="True" runat="server" OnSelectedIndexChanged="changeDivNtipo" Width="391px">
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
                 <asp:TextBox CssClass="form-control" ID="TxtREFI" placeholder="04/12/2011 12:00:00 AM" runat="server" Width="391px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
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
                   <asp:TextBox CssClass="form-control" ID="textREFF" placeholder="04/12/2011 12:00:00 PM" runat="server" Width="391px" ToolTip="Tipo DateTime SQLServer Ejemplo: 04/12/2011 12:00:00 PM" ></asp:TextBox>
                   <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator15" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="textREFF"  ErrorMessage="Fecha final es requerida" ForeColor="Red"></asp:RequiredFieldValidator>

               </div>
        </div>
        </div>
        <div class="oculto" runat="server" id="divNClase">
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nueva Clase</span>
               <div class="col-sm-4">
                   <asp:TextBox CssClass="form-control" ID="TextREclase" placeholder="Abierto" runat="server" Width="391px" ></asp:TextBox>
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator51" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="TextREclase"  ErrorMessage="Nueva Clase es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextREclase"
                    ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
               </div>
        </div>
        </div>
        </div>
        <div class="oculto" runat="server" id="divNtipo">
        <div class="row">
        <div class="form-group">
            <br/>
             <span class="col-sm-2" style="font-weight: bold">Nueva Tipo</span>
               <div class="col-sm-4">
                   <asp:TextBox CssClass="form-control" ID="TextRETipo" placeholder="Negociación" runat="server" Width="391px" ></asp:TextBox>
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator61" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="TextRETipo"  ErrorMessage="Nueva Tipo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextRETipo"
                    ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
               </div>
        </div>
        </div>
        </div>
      <br/>
      <div class="row">
          <div class="col-sm-8">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnRE" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Agregar Experimento" Height="37px" Width="168px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" style="margin-left: 0px" OnClick="ingresarExp" OnClientClick="return alert('Registrando Experimento');"/>
              &nbsp;&nbsp;&nbsp;
          </div>
      </div>
      <br/>
    </div>
   
</asp:Content>
