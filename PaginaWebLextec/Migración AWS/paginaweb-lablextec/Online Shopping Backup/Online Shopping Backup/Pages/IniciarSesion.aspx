<%@ Page Title="IniciarSesion" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Online_Shopping_Backup.IniciarSesion" %>



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
   

    <div class="col-lg-12 col-sm-12 col-xs-12" style="justify-content: center; align-items: center;">
  
    <div class="row col-lg-12 col-sm-12 col-xs-12">
        <div class="form-group ">
        <div class="col-sm-4 col-xs-12" ></div>
        <div class="col-lg-4" >
            <div class="form-group" >    
                    <br/>
                    <br/>
                    <br />
                    <h2 style="padding-top:0px;padding-bottom:20px;margin:0px;">Ingrese Correo Electrónico</h2>
                    <span class="col-sm-12 col-xs-12" style="font-weight: bold">Correo</span>
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btn_submit">
                    <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="justify-content: center; align-items: center;">
                    <br/>
                    <asp:TextBox CssClass="form-control" placeholder="usuario@correo.com" ID="txtEmailSubmit" runat="server" Width="309px"></asp:TextBox>
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator7" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="txtEmailSubmit"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtEmailSubmit"
                    ValidationExpression ="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />
                    </div>
                   
                    <div class="col-sm-12 col-xs-12"  style="justify-content: center; align-items: center;">
                       <br />
                       <asp:Button CssClass="btn btn-primary" color="#f7f5ee"  ID="btn_submit" runat="server" Text="Ingresar" BackColor="#0A3152" BorderColor="#F7F5EE" Width="150px" OnClick="LoginUser" />
                    </div>
                          </asp:Panel>
            </div>
           
           
        </div>
        </div>

        </div>
    
    </div>
   
    

   

</asp:Content>
