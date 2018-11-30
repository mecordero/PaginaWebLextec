<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MatriculaExperimento.aspx.cs" Inherits="Online_Shopping_Backup.MatriculaExperimento" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#dialog-message" ).dialog({
        modal: true,
        width: 620,
        maxHeight: 350,
        buttons: {
        Aceptar: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  });
  
  $(function () {
      $("button").click(function () {
          console.log("click");
          $(this).hide();
          $("#dialog").dialog('open');
      });
  });
  </script>


<div class="row">
 <asp:Button  ID="open" CssClass="btn btn-primary" runat="server" Text="Instrucciones"  Width="150px" />
 <%-- <asp:Button  ID="Button3" runat="server" Text="Salir"  Width="150px" OnClick="Button3_Click" /> --%>


</div>

<div id="dialog-message" title="Instrucciones">
    <span><img src="../Images/Instrucciones.png"/></span>
</div>
 <br/>
<div class="col-sm-12 col-xs-12" >
     <br/>
     <br/>
     <br/>
<asp:GridView ID="GridViewMatricular" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Nombre" HeaderText="Experimento" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Sesion" HeaderText="Sesion" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Fecha" HeaderText="Fecha" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
         <asp:BoundField DataField="Hora Inicio" HeaderText="Hora Inicio" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
         <asp:BoundField DataField="Hora Final" HeaderText="Hora Final" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
         <asp:BoundField DataField="Cupo" HeaderText="Cupo" ItemStyle-Width="150" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton  ID="BtnMatricular" runat="server" CssClass="btn" OnCommand="btn_Matricular"  CommandArgument='<%# Eval("Sesion") %>' ImageUrl="~/Images/simple2.png"/>
                </ItemTemplate>
            </asp:TemplateField>
    </Columns>
</asp:GridView>
     <br/>
     <br/>
     <br/>
</div> 
    

</asp:Content>
