<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Shopping_Backup.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
    <div  class="col-xs-9 col-sm-9 col-md-12 col-lg-12"  style='margin-right:30%;margin-left:30%;position:center;text-align:center;align-content:center'>


      

        <div class="col-lg-4 col-md-4 col-xs-9 col-sm-9"  style="margin-bottom:5%">


            <h3 style="margin-bottom:15%">Login Administrador</h3>
            <div>


            </div>
            <div class="form-group">

                <span style="font-weight: bold">Correo</span>


                <asp:TextBox CssClass="form-control" ID="txtusername" placeholder="Usuario" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="El usuario es requerido"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <span style="font-weight: bold">Contraseña</span>
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btn_submit0">
         
               
                <asp:TextBox ID="txtpassword" placeholder="Contraseña" CssClass="form-control" runat="server" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="La contraseña es requerida para el login"></asp:RequiredFieldValidator>

                   
            <%-- Height="38px" Width="105px"--%>
        <div  >
        <asp:Button ID="btn_submit0" CssClass="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="btn_admin_Click" />

       
            
        </div>            
     
    </asp:Panel>
                 </div>
        </div>


    </div>



</asp:Content>
