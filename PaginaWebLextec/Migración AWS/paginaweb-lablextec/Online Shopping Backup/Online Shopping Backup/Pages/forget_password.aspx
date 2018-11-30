<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="forget_password.aspx.cs" Inherits="Online_Shopping_Backup.Pages.forget_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row"">
        
            <div class="col-lg-3">
            </div>

      
        <div class="col-lg-4" >

            <div class="form-group">
                    <h2 style="padding-top:0px;padding-bottom:20px;margin:0px">Recuperación de contraseña </h2>
                    <span style="font-weight: bold">Correo</span>
                    <asp:TextBox CssClass="form-control"  ID="txt_username" runat="server"></asp:TextBox>
                    Correo Requerido</div>
            <div class="form-group">
&nbsp;</div>
            <asp:Button CssClass="btn btn-primary" ID="btn_submit" runat="server" Text="Recuperar contraseña" OnClick="btn_submit_Click" />
        </div>
        <div class="col-lg-5">

        </div>
    </div>
        </div>
</asp:Content>
