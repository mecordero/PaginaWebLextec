<%@ Page Title="Registro Experimento" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="ActualizarMensaje.aspx.cs" Inherits="Online_Shopping_Backup.ActualizarMensajes" %>

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
        div.container {
            margin-left:200px;
        
        }
        .auto-style3 {
            margin-bottom: 15px;
            text-align: justify;
        }
        .auto-style4 {
            margin-left:130px;
            text-align: center;
            width: 756px;
        }
        .auto-style5 {
            margin-left:130px;
            text-align: justify;
            width: 752px;
        }
    .auto-style6 {
        display: block;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    }
    </style>  

    <div class="container">
    <br>
    <div class="row">
        </div>
        <div class="row">
        </div>
       <div class="visible" runat="server" id="DivClase">
       <div class="row">
        <div class="form-group">
            <div class="auto-style5">
            <br>
             <span class="col-sm-2" style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Experimento</span>&nbsp;<br />
                <br />
                <br />
                &nbsp;&nbsp;
            <br />
            </div>
            <div class="col-sm-4">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList CssClass="auto-style6" AutoPostBack="True" ID="DDLclase" runat="server" Width="284px">
                </asp:DropDownList>
            </div>
        </div>
        </div>
        </div>
        <div class="row">
        </div>
        <div class="row">
        <div class="auto-style3">
            <div class="auto-style4">
            <br>
             <span class="col-sm-2" style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nuevo Mensaje</span><br />
                <br />
                <br />
&nbsp;</div>
               <div class="col-sm-4">
                   <asp:Textbox CssClass="auto-style6" ID="textREFF" runat="server" Width="510px" Height="134px" TextMode="MultiLine" ></asp:Textbox>

               </div>
        </div>
        </div>
        <div class="oculto" runat="server" id="divNClase">
        <div class="row">
        <div class="form-group">
            <br>
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
            <br>
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
      <br>
        <br />
        <br />
        <br />
        <br />
        <br />
      <div class="row">
          <div class="col-sm-8">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnRE" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Modificar" Height="37px" Width="168px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" style="margin-left: 0px" OnClick="ingresarExp" OnClientClick="return alert('Mensaje Modificado');"/>
              &nbsp;&nbsp;&nbsp;
          </div>
      </div>
      <br>
    </div>
   
</asp:Content>
