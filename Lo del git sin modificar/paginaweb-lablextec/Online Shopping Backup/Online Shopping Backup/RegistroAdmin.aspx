<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="RegistroAdmin.aspx.cs" Inherits="Online_Shopping_Backup.RegistroAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

   
  <div class="container">
    <br>
    <div class="row">
        <div class="form-group">
             <span class="col-sm-2" style="font-weight: bold">Nombre</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="textRAnombre" placeholder="Juan" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="textRAnombre"  ErrorMessage="Nombre es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator1" runat="server" ControlToValidate="textRAnombre"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            
             <span class="col-sm-2" style="font-weight: bold">Primer Apellido</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="TxtRAPApellido" placeholder="Soto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRAPApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtRAPApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br>
             <span class="col-sm-2" style="font-weight: bold">Segundo Apellido</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="TxtRASApellido" placeholder="Obando" runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRASApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtRASApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br>
             <span class="col-sm-2" style="font-weight: bold">Género</span>
            <div class="col-sm-3">
                <select class= "form-control" runat="server" id="SelectRAgenero" name="D1">
                    <option></option>
                    <option>F</option>
                    <option>M</option>
                </select>
            </div>
        </div>
        </div>
    
        <div class="row">
        <div class="form-group">
            <br>
            <span class="col-sm-2" style="font-weight: bold">Correo</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="TextRAemail" type="E-mail" placeholder="E-mail" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator6" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRAemail"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextRAemail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />  
            </div>
        </div>
        </div>
         <div class="row">
        <div class="form-group">
            <br>
             <span class="col-sm-2" style="font-weight: bold">Contraseña</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="TxtRAContra" type="Password" placeholder="Contraseña" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator id="passwordReq"
                 runat ="server"
                 ControlToValidate ="TxtRAContra"
                 ErrorMessage="Contraseña es requerida"
                 SetFocusOnError="True" Display="Dynamic"
                 ForeColor="Red" />
                 </div>
        </div>
        </div>
        <div class="row">
        <div class="form-group">
            <br>
             <span class="col-sm-2" style="font-weight: bold">Repetir Contraseña</span>
            <div class="col-sm-3">
                <asp:TextBox CssClass="form-control" ID="TxtRRAContra" type="Password" placeholder="Repetir Contraseña" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator id="confirmPasswordReq"
              runat="server" 
              ControlToValidate="TxtRAContra"
              ErrorMessage="Contraseña es requerida"
              SetFocusOnError="True" 
              Display="Dynamic"
              ForeColor="Red" />
          <asp:CompareValidator id="comparePasswords" 
              runat="server"
              ControlToCompare="TxtRAContra"
              ControlToValidate="TxtRRAContra"
              ErrorMessage="Sus contraseñas no conside"
              Display="Dynamic"
              ForeColor="Red" />
        
            </div>
        </div>
        </div>
         <div class="visible" runat="server" id="DivClase">
       <div class="row">
        <div class="form-group">
            <br>
             <span class="col-sm-2" style="font-weight: bold">Administrador Master</span>
            <div class="col-sm-4">
                <asp:DropDownList CssClass="form-control" AutoPostBack="True" ID="DDLclase" runat="server"  Width="391px">
                    
                  <asp:ListItem Value="False"> No </asp:ListItem>
                  <asp:ListItem Value="True"> Si </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        </div>
        </div>
      <br>
      <div class="row">
          <div class="col-sm-8">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
          <asp:Button ID="btnRU" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Registar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="registrarAdministrador" OnClientClick="return alert('Registrando Administrador');"  />
          </div>
      </div>
      
      <br>
    </div>
 
   
    

   

</asp:Content>
