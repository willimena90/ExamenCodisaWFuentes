<%@ Page Title="" Language="C#" MasterPageFile="~/PMExamCodisa.Master" AutoEventWireup="true" CodeBehind="wfDashBoardArea.aspx.cs" Inherits="ExamenCodisaWFuentes.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-1.9.1.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <style>
        .modal-body {
            height: 30%;
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
            $('#modalArea').modal({ show: true });
        }
    </script>

    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strGV = '<%= gvAreas.ClientID %>';
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
            <h3 class="panel-title">Dashboard de Areas</h3>
        </div>
        <div class="panel-body">
            <asp:ImageButton ID="btnAddArea" ImageUrl="~/images/Add.png" ToolTip="Agregar Nueva Area" CssClass="myClass" OnClick="btnAddArea_Click" runat="server" />
            <asp:ImageButton ID="btnRefresh" ImageUrl="~/images/Reload.gif" ToolTip="Actualizar Datos" CssClass="myClass" OnClick="btnRefresh_Click" runat="server" />
            <br />
            <br />
            <div style="height: 40px; margin-top: 4px">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="width: 1%">
                            <asp:Label ID="lblBusquedaArea" runat="server" Text="Texto:" CssClass="_LabelBusqueda" Width="100%"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBuscaArea" Width="100%" CssClass="_TextBusqueda" onkeyup="Search_Gridview(this, 'gvAreas')"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 1px;">
                <asp:Label ID="lblBusca" runat="server" Text="Introduzca un texto para filtrar los resultados de su búsqueda." CssClass="_LabelSearchI"> </asp:Label>
                <div style="overflow: scroll; height: 405px">
                    <asp:GridView ID="gvAreas" runat="server" AutoGenerateColumns="False" CellPadding="3"
                        GridLines="None" DataKeyNames="IdArea" CssClass="GvMtto" PagerStyle-CssClass="PagerMtto"
                        RowStyle-CssClass="TrMttopar" AlternatingRowStyle-CssClass="TrMttoInpar" PagerStyle-HorizontalAlign="Center"
                        AllowPaging="False" PageSize="8" PagerSettings-PageButtonCount="5" EmptyDataRowStyle-CssClass="GvEmptyDataTempl" OnRowCommand="gvAreas_RowCommand">
                        <Columns>

                            <asp:TemplateField HeaderStyle-Width="10%" HeaderText="ID Area Nº">
                                <ItemTemplate>
                                    <asp:Label ID="lblIDAreaC" runat="server" Text='<%# "Area-"+Eval("IdArea")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre Area" HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblNomAreaC" runat="server" Text='<%# Eval("Nombre")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Width="60%" HeaderText="Descripción Area">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescAreaC" runat="server" Text='<%# Eval("Descripcion")%>'></asp:Label>
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
                                    <asp:Button ID="btnUpdateArea" runat="server" Text="Actualizar Datos" CssClass="btn btn-danger" OnClick="btnUpdateArea_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:Button ID="btnEliminarArea" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="Eliminar" 
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

    <div id="dvAgregarArea" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalArea">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Agregar Area...</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <div class="container">
                                        <div class="alert alert-success" role="alert" style="margin-top: 1%" runat="server" id="dvSucess" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Registro Almacenado Satisfactoriamente.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvRequerido" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>Información:</strong>&nbsp;&nbsp; Campo vacíos Son Requeridos.
                                        </div>

                                        <div class="alert alert-danger" role="alert" style="margin-top: 1%" runat="server" id="dvError" visible="false">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                        </div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <asp:Label ID="lblIdAreaI" runat="server" Text="ID Area Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdAreaI" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomAreaI" runat="server" Text="Nombre Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomAreaI" runat="server" CssClass="form-control" placeholder="Nombre Area" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblDescAreaI" runat="server" Text="Descripción Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtDescArea" runat="server" CssClass="form-control" placeholder="Descripción Area" Width="100%"></asp:TextBox>
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
                                    <asp:Button ID="BtnSaveArea" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="BtnSaveArea_Click" />
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
                    <div class="modal" tabindex="-1" role="dialog" id="modalAreaU">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Modificar Area...</h5>
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
                                                    <asp:Label ID="lblIdAreaU" runat="server" Text="ID Area Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdAreaU" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomAreaU" runat="server" Text="Nombre Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomAreaU" runat="server" CssClass="form-control" placeholder="Nombre Area" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblDescU" runat="server" Text="Descripción Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtDescAreaU" runat="server" CssClass="form-control" placeholder="Descripción Area" Width="100%"></asp:TextBox>
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
                                    <asp:Button ID="btnSaveAreaU" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="btnSaveAreaU_Click" />
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
                    <div class="modal" tabindex="-1" role="dialog" id="modalAreaD">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Ver Detalle de Area...</h5>
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
                                                    <asp:Label ID="lblIdAreaD" runat="server" Text="ID Area Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdAreaD" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNomAreaD" runat="server" Text="Nombre Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtNomAreaD" runat="server" Enabled="false" CssClass="form-control font-weight-bold" placeholder="Nombre Area" Width="100%"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblDescD" runat="server" Text="Descripción Area" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtDescD" runat="server" Enabled="false" CssClass="form-control font-weight-bold" placeholder="Descripción Area" Width="100%"></asp:TextBox>
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
