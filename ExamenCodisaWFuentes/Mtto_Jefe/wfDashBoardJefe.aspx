<%@ Page Title="" Language="C#" MasterPageFile="~/PMExamCodisa.Master" AutoEventWireup="true" CodeBehind="wfDashBoardJefe.aspx.cs" Inherits="ExamenCodisaWFuentes.Mtto_Jefe.wfDashBoardJefe" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-1.9.1.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <style>
        .modal-body {
            height: 210px;
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
            $('#modalJefeI').modal({ show: true });
        }
    </script>

    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strGV = '<%= gvJefe.ClientID %>';
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
            <h3 class="panel-title">Dashboard de Jefes</h3>
        </div>
        <div class="panel-body">
            <asp:ImageButton ID="btnAddJefe" ImageUrl="~/images/Add.png" ToolTip="Agregar Nuevo Jefe" CssClass="myClass" runat="server" OnClick="btnAddJefe_Click" />
            <asp:ImageButton ID="btnRefresh" ImageUrl="~/images/Reload.gif" ToolTip="Actualizar Datos" CssClass="myClass" runat="server" OnClick="btnRefresh_Click" />
            <br />
            <br />
            <div style="height: 40px; margin-top: 4px">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="width: 1%">
                            <asp:Label ID="lblBusquedaJefe" runat="server" Text="Texto:" CssClass="_LabelBusqueda" Width="100%"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBuscaJefe" Width="100%" CssClass="_TextBusqueda" onkeyup="Search_Gridview(this, 'gvJefe')"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 1px;">
                <asp:Label ID="lblBusca" runat="server" Text="Introduzca un texto para filtrar los resultados de su búsqueda." CssClass="_LabelSearchI"> </asp:Label>
                <div style="overflow: scroll; height: 405px">
                    <asp:GridView ID="gvJefe" runat="server" AutoGenerateColumns="False" CellPadding="3"
                        GridLines="None" DataKeyNames="IdJefe" CssClass="GvMtto" PagerStyle-CssClass="PagerMtto"
                        RowStyle-CssClass="TrMttopar" AlternatingRowStyle-CssClass="TrMttoInpar" PagerStyle-HorizontalAlign="Center"
                        AllowPaging="False" PageSize="8" PagerSettings-PageButtonCount="5" EmptyDataRowStyle-CssClass="GvEmptyDataTempl">
                        <Columns>

                            <asp:TemplateField HeaderStyle-Width="10%" HeaderText="ID Jefe Nº">
                                <ItemTemplate>
                                    <asp:Label ID="lblIDJefeC" runat="server" Text='<%# "Jefe-"+Eval("IdJefe")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre Jefe" HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblNomJefeC" runat="server" Text='<%# Eval("NombreJefe")%>'></asp:Label>
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
                                    <asp:Button ID="btnUpdateJefe" runat="server" Text="Actualizar Datos" CssClass="btn btn-danger" OnClick="btnUpdateJefe_Click" />
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

    <div id="dvAgregarJefe" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalJefeI">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Agregar Jefe...</h5>
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
                                        <table style="width: 100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdJefeI" runat="server" Text="ID Jefe Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdJefeI" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomJefeI" runat="server" Text="Nombre Jefe" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomJefeI" runat="server" CssClass="form-control" placeholder="Nombre Jefe" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="BtnSaveJefeI" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="BtnSaveJefeI_Click" />
                                    <asp:Button ID="btnClose" runat="server" Text="Cerrar" CssClass="btn btn-secondary" OnClick="btnClose_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="dvModificarArea" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalJefeU">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Modificar Jefe...</h5>
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
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdJefeU" runat="server" Text="ID Jefe Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdJefeU" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomJefeU" runat="server" Text="Nombre Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomJefeU" runat="server" CssClass="form-control" placeholder="Nombre Jefe" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnSaveJefeU" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="btnSaveJefeU_Click" />
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
                    <div class="modal" tabindex="-1" role="dialog" id="modalJefeD">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Ver Detalle de Jefes...</h5>
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
                                                    <asp:Label ID="lblIdJefeD" runat="server" Text="ID Jefe Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdJefeD" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomJefeD" runat="server" Text="Nombre Jefe" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomJefeD" runat="server" Enabled="false" CssClass="form-control font-weight-bold" placeholder="Nombre Jefe" Width="100%"></asp:TextBox>
                                                                </div>
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
