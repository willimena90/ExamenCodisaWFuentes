<%@ Page Title="" Language="C#" MasterPageFile="~/PMExamCodisa.Master" AutoEventWireup="true" CodeBehind="wfTreeViewEmpleados.aspx.cs" Inherits="ExamenCodisaWFuentes.Mtto_Empleados.wfTreeViewEmpleados" EnableEventValidation="false" %>
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
            $('#modalHabilidadI').modal({ show: true });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Dashboard de Habilidades</h3>
        </div>
        <div class="panel-body">
            <asp:ImageButton ID="btnAddHabilidad" ImageUrl="~/images/Add.png" ToolTip="Agregar Nueva Habilidad" CssClass="myClass" runat="server" OnClick="btnAddHabilidad_Click" />
            <%--<asp:ImageButton ID="btnRefresh" ImageUrl="~/images/Reload.gif" ToolTip="Actualizar Datos" CssClass="myClass" runat="server" OnClick="btnRefresh_Click" />--%>
            <br />
            <br />
            <asp:TreeView ID="TreeView1" ShowExpandCollapse="true" ShowCheckBoxes="Root" ShowLines="true" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"></asp:TreeView>
        </div>

    </div>

    <div id="dvAgregarHabilidad" runat="server">
        <div class="row">
            <div class="col-lg-12" style="width: 100%; margin-top: -10px">
                <div runat="server">
                    <div class="modal" tabindex="-1" role="dialog" id="modalHabilidadI">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Agregar Habilidad...</h5>
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
                                                    <asp:Label ID="lblIdHabilidadI" runat="server" Text="ID Habilidad Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdHabilidadI" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td style="padding-top: 10px;" colspan="3">
                                                                <asp:Label ID="lblJefeI" runat="server" Text="Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlEmpleadoI" runat="server" CssClass="form-control" Width="100%" DataTextField="NombreCompleto"
                                                                    DataValueField="IdEmpleado">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblDescHabI" runat="server" Text="Digíte y Agregue las Habilidades" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <div style="margin-top: 5px">
                                                                    <asp:TextBox ID="txtDescHabI" runat="server" CssClass="form-control" placeholder="Descripción Habilidad" 
                                                                        OnTextChanged="txtDescHabI_TextChanged" Width="100%" AutoPostBack="true"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                </td>
                                                <td>
                                                    <div style="margin-top: 5px">
                                                        <asp:Label ID="lblListBI" runat="server" Text="Habilidades Agregadas" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                        <asp:ListBox ID="lstHabI" runat="server" Width="100%"></asp:ListBox>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="BtnSaveHabilidad" runat="server" Text="Guardar Registro" CssClass="btn btn-info" OnClick="BtnSaveHabilidad_Click" />
                                    <asp:Button ID="btnClose" runat="server" Text="Cerrar" CssClass="btn btn-secondary" OnClick="btnClose_Click" />
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
                                    <h5 class="modal-title">Ver Detalle de Habilidad...</h5>
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
                                                    <asp:Label ID="lblIdHabilidadD" runat="server" Text="ID Habilidad Nº:" CssClass="_NormalLabel"></asp:Label>
                                                    <asp:TextBox ID="txtIdHabilidadD" runat="server" Height="10%" Enabled="false" CssClass="_TextBusqueda text-center" Width="9%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="padding: 5px 0px 0px 0px;">
                                                    <table style="width: 100%; border-collapse: collapse;">
                                                        <tr>
                                                            <td style="padding-top: 10px;" colspan="3">
                                                                <asp:Label ID="lblEmpHD" runat="server" Text="Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlEmpHabD" runat="server" CssClass="form-control" Width="100%" DataTextField="NombreCompleto"
                                                                    DataValueField="IdEmpleado" Enabled="false">
                                                                </asp:DropDownList>
                                                            </td>
                                                
                                            
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                </td>
                                                <td>
                                                    <div style="margin-top: 5px">
                                                        <asp:Label ID="lblHabD" runat="server" Text="Habilidades de Empleado" Width="100%" CssClass="_NormalLabel"></asp:Label>
                                                        <asp:ListBox ID="lstHabD" runat="server" Width="100%"></asp:ListBox>
                                                    </div>
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
