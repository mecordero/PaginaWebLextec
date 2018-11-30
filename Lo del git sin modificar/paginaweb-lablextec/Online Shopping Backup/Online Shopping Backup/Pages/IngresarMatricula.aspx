<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="IngresarMatricula.aspx.cs" Inherits="Online_Shopping_Backup.Pages.IngresarMatricula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <script type = "text/javascript">
        function Confirm() 
        {
            if (confirm("Usuario no registrado o deshabilitado \n ¿Desea Registrarse?")) {
                window.open("/Pages/Registro.aspx");
            } 
        }
    </script>

    <div class="container">
    
        
            <div class="col-lg-3">
            </div>

      
        <div class="col-lg-4" >

            <div class="from-group">
            </div>
            <div class="form-group">
                    <h2 style="padding-top:0px;padding-bottom:20px;margin:0px; width: 414px;">Ingrese Correo Electrónico  </h2>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox CssClass="form-control" placeholder="Juan@gmail.com" ID="txtEmail" runat="server" Width="309px"></asp:TextBox>
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="txtEmail"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression ="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-primary" color="#f7f5ee"  ID="btn_submit" runat="server" Text="Ingresar" OnClick="Ingresar" BackColor="#0A3152" BorderColor="#F7F5EE" Width="150px" />
        </div>

    </div>
</asp:Content>
