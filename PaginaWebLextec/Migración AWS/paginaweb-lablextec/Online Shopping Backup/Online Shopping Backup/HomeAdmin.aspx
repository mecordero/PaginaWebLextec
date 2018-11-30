<%@ Page Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="Online_Shopping_Backup.HomeaAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS/homeAdmin.css" />

    <div style="margin-top:5%"> 
    
    <h2>Administradores</h2>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div id="grid" class="col-xs-9 col-sm-9 col-md-12 col-lg-12"  style="margin-left:0%;margin-right:0%; width: 100%; height:400px; overflow: auto" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="email" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="400px" style="margin-bottom: 0% " Width="100%" CssClass="table table-hover" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
              
               <asp:templatefield HeaderText="" ControlStyle-Width="12">
                   <HeaderTemplate>
                       <asp:checkbox ID="CbSelectAll" CssClass="gridCB" runat="server" AutoPostBack="true" OnCheckedChanged="CbSelectAll_CheckedChanged" />
                       
                   </HeaderTemplate>
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" CssClass="gridCB" runat="server" AutoPostBack="true" OnCheckedChanged="CbSelect_CheckedChanged"></asp:checkbox>
                    </itemtemplate>
                   
                </asp:templatefield> 
               <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
               <asp:BoundField DataField="apellido1" HeaderText="Primer Apellido" SortExpression="apellido1" />
               <asp:BoundField DataField="apellido2" HeaderText="Segundo Apellido" SortExpression="apellido2" />
               <asp:BoundField DataField="genero" HeaderText="Sexo" SortExpression="genero" />
               <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" ReadOnly="true" />
               <asp:BoundField DataField="masterAdm" HeaderText="Master Admin" SortExpression="masterAdm" ReadOnly="true" />
               

           </Columns>
           <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
           <HeaderStyle BackColor="#0a3152" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
           <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
           <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
           <SortedAscendingHeaderStyle BackColor="#0000A9" />
           <SortedDescendingCellStyle BackColor="#CAC9C9" />
           <SortedDescendingHeaderStyle BackColor="#000065" />
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"  SelectCommand="SELECT * FROM Administrador">
           <DeleteParameters>
               <asp:Parameter Name="email" Type="String" />
               <asp:CookieParameter  Name="admin" CookieName="u_id" DefaultValue="" />
           </DeleteParameters>
        
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellido1" Type="String" />
                <asp:Parameter Name="apellido2" Type="String" />
                <asp:Parameter Name="genero" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:CookieParameter  Name="admin" CookieName="u_id" DefaultValue="" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    <div class="col-lg-12 col-xs-12">
      <br/>
      <asp:Button ID="btn_agregar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="BtnAgregar_Click" />
     <asp:Button ID="btn_modificar" CssClass="btn btn-primary" runat="server" Text="Modificar" OnClick="BtnEdit_Click" />
     <asp:Button ID="btn_eliminar" CssClass="btn btn-primary" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" />
     <asp:Button ID="btn_exportar" CssClass="btn btn-primary" runat="server" Text="Exportar" OnClick="BtnAgregar_Click" />
      <br/><br/>
     </div>
 </div>


     
    <!-- Modal -->

<div id="adminModal" class="modal fade" role="dialog" aria-hidden="true">
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
        <div class="col-sm-6 col-xs-16">
        <div class="col-sm-12 col-xs-12">
            <div class="form-group">
                <div class="row" style="margin-bottom: 5px;">
                 <span style="font-weight: bold">Nombre</span>
                 </div>
                <div class="row">
                    <asp:TextBox CssClass="form-control" ID="textRAnombre" placeholder="Juan" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="valName" ValidationGroup="reg" Display="Dynamic"
                    runat="server" ControlToValidate="textRAnombre"  ErrorMessage="Nombre es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator1" runat="server" ControlToValidate="textRAnombre"
                    ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
                </div>
            </div>
        </div>
       
         <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
             <span style="font-weight: bold">Primer Apellido</span>
             </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRAPApellido" placeholder="Soto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator1" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRAPApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtRAPApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>

        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
             <span style="font-weight: bold">Segundo Apellido</span>
            </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRASApellido" placeholder="Obando" runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator2" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TxtRASApellido"  ErrorMessage="Apellido es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtRASApellido"
                ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$" ErrorMessage="Caracter especial no permitido" Display="Dynamic" ForeColor="Red"  />
            </div>
        </div>
        </div>

        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
             <span style="font-weight: bold">Género</span>
            </div>
            <div class="row">
                <select class= "form-control" runat="server" id="SelectRAgenero" name="D1">
                    <option></option>
                    <option>F</option>
                    <option>M</option>
                </select>
            </div>
        </div>
        </div>
        
        
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
            <span style="font-weight: bold">Correo</span>
            </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TextRAemail" type="E-mail" placeholder="E-mail" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="RequiredFieldValidator6" ValidationGroup="reg" Display="Dynamic"
                runat="server" ControlToValidate="TextRAemail"  ErrorMessage="Correo es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="help-block with-errors" ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextRAemail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Formato no permitido" Display="Dynamic" ForeColor="Red"  />  
            </div>
        </div>
        </div>

        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div id="contra1" class="row" style="margin-bottom: 5px;">
                <span  style="font-weight: bold">Contraseña</span>
            </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRAContra" type="Password" placeholder="Contraseña" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="passwordReq1" Display="Dynamic"
                runat="server" ControlToValidate="TxtRAContra"  ErrorMessage="Contraseña es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                <!-- NO BORREN ESTE COMENTARIO XQ CASUALMENTE HACE QUE TODO SIRVA, alguien que me diga POR QUÉ!!!! --> 
                <!-- <asp:RequiredFieldValidator id="passwordReq" runat ="server" ControlToValidate ="TxtRAContra" ErrorMessage="Contraseña es requerida" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" /> >-->
            </div>
        </div>
        </div>
        <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
                <span  id="contra2" style="font-weight: bold">Repetir Contraseña</span>
            </div>
            <div class="row">
                <asp:TextBox CssClass="form-control" ID="TxtRRAContra" type="Password" placeholder="Repetir Contraseña" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator CausesValidation="true" Cssclass="help-block with-errors" SetFocusOnError="true" ID="confirmPasswordReq" Display="Dynamic"
                runat="server" ControlToValidate="TxtRRAContra"  ErrorMessage="Contraseña es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator id="comparePasswords" runat="server" ControlToCompare="TxtRAContra" ControlToValidate="TxtRRAContra" ErrorMessage="Sus contraseñas no coinciden" Display="Dynamic" ForeColor="Red" />
        
            </div>
        </div>
        </div> 
        <div class="visible" runat="server" id="DivClase">
       <div class="col-sm-12 col-xs-12">
        <div class="form-group">
            <div class="row" style="margin-bottom: 5px;">
             <span  style="font-weight: bold">Administrador Master</span>
            </div>
            <div class="row">
                <asp:DropDownList CssClass="form-control" AutoPostBack="True" ID="DDLclase" runat="server"  Width="391px">
                    
                  <asp:ListItem Value="False"> No </asp:ListItem>
                  <asp:ListItem Value="True"> Si </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        </div>
        </div>
     </div>
        </div>
       </ContentTemplate>
          </asp:UpdatePanel>
                  
    
     
    </div>
              <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
          <asp:Button ID="BtnRegister" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Registrar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" OnClick="BtnRegister_Click" />
        <asp:Button ID="BtnEdit" CssClass="btn btn-primary" color="#f7f5ee" runat="server" Text="Modificar" Height="37px" Width="115px" BackColor="#0A3152" BorderColor="#0A3152" ForeColor="White" Visible="false" OnClick="BtnModificar_Click" />
      </div>
        </div>
  </div>
</div>
    <script type="text/javascript">
    function openAdminModal() {
        $('#adminModal').modal('show');
    }
</script>

   

</asp:Content>

