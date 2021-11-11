<%@ Page Title="" Language="C#" MasterPageFile="~/PMExamCodisa.Master" AutoEventWireup="true" CodeBehind="wfDashBoardEmpleado.aspx.cs" Inherits="ExamenCodisaWFuentes.Mtto_Empleados.wfDashBoardEmpleado" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-1.9.1.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <style>
        .modal-body {
            height: 20%;
            overflow-y: auto;
        }
        .modal-content{
            margin-left: -70px;
        }
        .modal-backdrop {
            background-color: white;
        }
    </style>
    <script>
        function openModal() {
            $('#modalEmpleadoI').modal({ show: true });
        }
    </script>

    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strGV = '<%= gvEmpleado.ClientID %>';
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById(strGV);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Dashboard de Empleados</h3>
        </div>
        <div class="panel-body">
            <asp:ImageButton ID="btnAddEmpleado" ImageUrl="~/images/Add.png" ToolTip="Agregar Nuevo Empleado" CssClass="myClass" runat="server" OnClick="btnAddEmpleado_Click" />
            <asp:ImageButton ID="btnRefresh" ImageUrl="~/images/Reload.gif" ToolTip="Actualizar Datos" CssClass="myClass" runat="server" OnClick="btnRefresh_Click" />
            <br />
            <br />
            <div style="height: 40px; margin-top: 4px">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="width: 1%">
                            <asp:Label ID="lblBusquedaEmpleado" runat="server" Text="Texto:" CssClass="_LabelBusqueda" Width="100%"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBuscaEmpleado" Width="100%" CssClass="_TextBusqueda" onkeyup="Search_Gridview(this, 'gvEmpleado')"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 1px;">
                <asp:Label ID="lblBusca" runat="server" Text="Introduzca un texto para filtrar los resultados de su búsqueda." CssClass="_LabelSearchI"> </asp:Label>
                <div style="overflow: scroll; height: 405px">
                    <asp:GridView ID="gvEmpleado" runat="server" AutoGenerateColumns="False" CellPadding="3"
                        GridLines="None" DataKeyNames="IdEmpleado" CssClass="GvMtto" PagerStyle-CssClass="PagerMtto"
                        RowStyle-CssClass="TrMttopar" AlternatingRowStyle-CssClass="TrMttoInpar" PagerStyle-HorizontalAlign="Center"
                        AllowPaging="False" PageSize="8" PagerSettings-PageButtonCount="5" EmptyDataRowStyle-CssClass="GvEmptyDataTempl" OnRowCommand="gvEmpleado_RowCommand">
                        <Columns>

                            <asp:TemplateField HeaderStyle-Width="10%" HeaderText="ID Empleado" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblIDEmpleC" runat="server" Text='<%# "Emple-" + Eval("IdEmpleado")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre" HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblNomEmplC" runat="server" Text='<%# Eval("NombreCompleto")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Area" HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblNomAreaC" runat="server" Text='<%# Eval("Nombre")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Descripción Area" HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescAreaC" runat="server" Text='<%# Eval("Descripcion")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="Cedula" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblCedulC" runat="server" Text='<%# Eval("Cedula")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="Correo" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblCorreoC" runat="server" Text='<%# Eval("Correo")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="Fecha Nacimiento" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblFechNacC" runat="server" Text='<%# Eval("FechaNacimiento")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="Fecha Ingreso" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblFechIngC" runat="server" Text='<%# Eval("FechaIngreso")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="ID Jefe" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblIdJefeC" runat="server" Text='<%# Eval("IdJefe")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="ID Area" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblIdAreaC" runat="server" Text='<%# Eval("IdArea")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>                            

                            <asp:TemplateField HeaderText="Ver Detalle">
                                <ItemTemplate>
                                    <asp:Button ID="btnVerDetalle" runat="server" Text="Ver Detalle" CssClass="btn btn-danger" OnClick="btnVerDetalle_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:Button ID="btnUpdateEmpleado" runat="server" Text="Actualizar Datos" CssClass="btn btn-danger" OnClick="btnUpdateEmpleado_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:Button ID="btnEliminarEmple" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="Eliminar" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EmptyDataTemplate>
                            <div class="DvGvEmptyDataTempl">
                                No se encontraron resultados...
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <div id="dvAgregarEmpleado" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%;">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalEmpleadoI">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Agregar Empleado...</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="container">
                                        <div class="alert alert-success" role="alert" style="margin-top: 1%" runat="server" id="dvSucessI" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Registro Almacenado Satisfactoriamente.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvRequeridoI" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Campo vacíos Son Requeridos.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvErrorI" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvEmailFail" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Formato de Email Incorrecto...
                                        </div>
                                        <table style="width: 100%; margin-top: 2%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdEmpleadoI" runat="server" Text="ID Empleado Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdEmpleadoI" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda" Width="9%" ></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomEmplI" runat="server" Text="Nombre Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomEmplI" runat="server" CssClass="form-control" placeholder="Nombre Empleado" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCedulaI" runat="server" Text="Cedula" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCedulaI" runat="server" CssClass="form-control" placeholder="Cedula" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCorreoI" runat="server" Text="Correo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCorreoI" runat="server" CssClass="form-control" placeholder="Correo" Width="100%" ></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechaNacI" runat="server" Text="Fecha Nacimiento" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechNacI" runat="server" CssClass="form-control" placeholder="Fecha Nacimiento" Width="100%" 
                                                                    OnTextChanged="txtFechNacI_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechIngI" runat="server" Text="Fecha Ingreso" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechIngI" runat="server" CssClass="form-control" placeholder="Fecha Ingreso" Width="100%" 
                                                                    OnTextChanged="txtFechIngI_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblAreaI" runat="server" Text="Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlAreaI" runat="server" CssClass="form-control"  Width="100%" DataTextField="Nombre"
                                                                    DataValueField="IdArea"></asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;" colspan="3">
                                                                <asp:Label ID="lblJefeI" runat="server" Text="Jefe a Cargo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlJefeI" runat="server" CssClass="form-control" Width="100%" DataTextField="NombreCompleto"
                                                                    DataValueField="IdEmpleado">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblEdadI" runat="server" Text="Edad" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechaEdaI" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                            <td style="padding-top: 10px;" colspan="2">
                                                                <asp:Label ID="lblIngI" runat="server" Text="Años en la Empresa" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechInI" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="BtnSaveEmpleI" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="BtnSaveEmpleI_Click" />
                                    <asp:Button ID="btnCloseI" runat="server" Text="Cerrar" CssClass="btn btn-secondary" OnClick="btnCloseI_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="dvModificarEmpleado" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalEmpleadoU">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Modificar Empleado...</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="container">
                                        <div class="alert alert-success" role="alert" style="margin-top: 1%" runat="server" id="dvSucessU" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Registro Almacenado Satisfactoriamente.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvRequeridoU" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Campo vacíos Son Requeridos.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvErrorU" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <asp:Label ID="lblMessageU" runat="server" Text=""></asp:Label>
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvEmailFailU" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Formato de Email Incorrecto...
                                        </div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdEmpleadoU" runat="server" Text="ID Empleado Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdEmpleadoU" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomEmplU" runat="server" Text="Nombre Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomEmplU" runat="server" CssClass="form-control" placeholder="Nombre Empleado" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCedulaU" runat="server" Text="Cedula" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCedulaU" runat="server" CssClass="form-control" placeholder="Cedula" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCorreoU" runat="server" Text="Correo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCorreoU" runat="server" CssClass="form-control" placeholder="Correo" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechaNacU" runat="server" Text="Fecha Nacimiento" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechNacU" runat="server" CssClass="form-control" placeholder="Fecha Nacimiento" Width="100%" 
                                                                    OnTextChanged="txtFechNacU_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechIngU" runat="server" Text="Fecha Ingreso" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechIngU" runat="server" CssClass="form-control" placeholder="Fecha Ingreso" Width="100%" 
                                                                    OnTextChanged="txtFechIngU_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblAreaU" runat="server" Text="Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlAreaU" runat="server" CssClass="form-control"  Width="100%" DataTextField="Nombre"
                                                                    DataValueField="IdArea"></asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;" colspan="3">
                                                                <asp:Label ID="lblJefeU" runat="server" Text="Jefe a Cargo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlJefeU" runat="server" CssClass="form-control" Width="100%" DataTextField="NombreCompleto"
                                                                    DataValueField="IdEmpleado">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblEdadU" runat="server" Text="Edad" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechaEdaU" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                            <td style="padding-top: 10px;" colspan="2">
                                                                <asp:Label ID="lblIngU" runat="server" Text="Años en la Empresa" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechInU" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="BtnSaveEmpleU" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="BtnSaveEmpleU_Click" />
                                    <asp:Button ID="btnCloseU" runat="server" Text="Cerrar" CssClass="btn btn-secondary" OnClick="btnCloseU_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="dvVerDetalle" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalEmpleadoD">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Consultar Empleado...</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="container">
                                        <table style="width: 100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdEmpleadoD" runat="server" Text="ID Empleado Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdEmpleadoD" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomEmplD" runat="server" Text="Nombre Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomEmplD" runat="server" CssClass="form-control" placeholder="Nombre Empleado" Width="100%" Enabled="false"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCedulaD" runat="server" Text="Cedula" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCedulaD" runat="server" CssClass="form-control" placeholder="Cedula" Width="100%" Enabled="false"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblCorreoD" runat="server" Text="Correo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtCorreoD" runat="server" CssClass="form-control" placeholder="Correo" Width="100%" Enabled="false"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechaNacD" runat="server" Text="Fecha Nacimiento" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechNacD" runat="server" CssClass="form-control" placeholder="Fecha Nacimiento" Width="100%" Enabled="false"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblFechIngD" runat="server" Text="Fecha Ingreso" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:TextBox ID="txtFechIngD" runat="server" CssClass="form-control" placeholder="Fecha Ingreso" Width="100%" Enabled="false"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblAreaD" runat="server" Text="Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlAreaD" runat="server" CssClass="form-control" Width="100%" Enabled="false" DataValueField="IdArea"
                                                                    DataTextField="Nombre">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;" colspan="3">
                                                                <asp:Label ID="lblJefeD" runat="server" Text="Jefe a Cargo" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlJefeD" runat="server" CssClass="form-control" Width="100%" Enabled="false" DataValueField="IdEmpleado" 
                                                                    DataTextField="NombreCompleto">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 10px;">
                                                                <asp:Label ID="lblEdadD" runat="server" Text="Edad" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechaEdaD" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                            <td style="padding-top: 10px;" colspan="2">
                                                                <asp:Label ID="lblIngD" runat="server" Text="Años en la Empresa" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:Label ID="lblFechInD" runat="server" CssClass="form-control" Width="100%"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
