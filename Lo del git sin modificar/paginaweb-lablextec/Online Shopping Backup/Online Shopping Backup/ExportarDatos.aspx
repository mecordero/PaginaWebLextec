<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="ExportarDatos.aspx.cs" Inherits="Online_Shopping_Backup.ExportarDatos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .center {
            margin: 0;
            position: absolute;
            top: 50%;
            left: 30%;
            width: 60%;
        }
    </style>


    <div class="center">
        <div class="row">
            <div class="col-sm-10">
                <asp:Button ID="ButtonExpAll" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Exportar Todo" Height="37px" Width="160px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="exportAllDatas"/>
                <asp:Button ID="ButtonExpuser" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Exportar Usuarios" Height="37px" Width="160px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="exportarUsuarios"/>
                <asp:Button ID="ButtonExpExp" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Exportar Experimentos" Height="37px" Width="160px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="exportarExperimentos"/>
            </div>
        </div>
    </div>




</asp:Content>
