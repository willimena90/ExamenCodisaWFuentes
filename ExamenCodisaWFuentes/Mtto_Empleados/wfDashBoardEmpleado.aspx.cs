using CapaNegocio;
using System;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace ExamenCodisaWFuentes.Mtto_Empleados
{
    public partial class wfDashBoardEmpleado : System.Web.UI.Page
    {
        BExam clsBExam = new BExam();
        string Empleado = "Emple-";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _PoblarDeDatosgvEmpleado();
                _PopulatetxtUltimoIDEmpleado();
                _PopulateDdlArea();
                _PopulateDdlJefe();
                _CargarFechas();

                int Edad = CalcYears(DateTime.ParseExact(txtFechNacI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechaEdaI.Text = Convert.ToString(Edad);

                int TiempoLaborar = CalcYears(DateTime.ParseExact(txtFechIngI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechInI.Text = Convert.ToString(TiempoLaborar);
            }
        }

        public void _PoblarDeDatosgvEmpleado()
        {
            gvEmpleado.DataSource = clsBExam._ObtenerEmpleado();
            gvEmpleado.DataBind();
        }

        protected DataTable _GetUltimoIDEmpleado()
        {
            var dt = clsBExam._ObtenerUltimoEmpleado();
            return dt;
        }

        private void _PopulatetxtUltimoIDEmpleado()
        {
            DataTable ultimoID = _GetUltimoIDEmpleado();
            string NewEmpleado = "";
            if (ultimoID.Rows.Count > 0)
                NewEmpleado = ultimoID.Rows[0]["IdEmpleado"].ToString();
            txtIdEmpleadoI.Text = Empleado + NewEmpleado;
            txtIdEmpleadoI.Style.Add("text-align", "right");
        }

        private void _PopulateDdlArea() 
        {
            ddlAreaI.DataSource = clsBExam._ObtenerAreaDdl();
            ddlAreaI.DataBind();        
        }

        private void _PopulateDdlJefe()
        {
            ddlJefeI.DataSource = clsBExam._ObtenerJefeDdl();
            ddlJefeI.DataBind();
        }

        private void _PopulateDdlAreaD()
        {
            ddlAreaD.DataSource = clsBExam._ObtenerAreaDdl();
            ddlAreaD.DataBind();
        }

        private void _PopulateDdlJefeD()
        {
            ddlJefeD.DataSource = clsBExam._ObtenerJefeDdl();
            ddlJefeD.DataBind();
        }

        private void _PopulateDdlAreaU()
        {
            ddlAreaU.DataSource = clsBExam._ObtenerAreaDdl();
            ddlAreaU.DataBind();
        }

        private void _PopulateDdlJefeU()
        {
            ddlJefeU.DataSource = clsBExam._ObtenerJefeDdl();
            ddlJefeU.DataBind();
        }

        private void _CleanControls()
        {
            txtNomEmplI.Text = "";
            txtCedulaI.Text = "";
            txtCorreoI.Text = "";
            txtFechNacI.Text = "";
            txtFechIngI.Text = "";

            txtNomEmplU.Text = "";
            txtCedulaU.Text = "";
            txtCorreoU.Text = "";
            txtFechNacU.Text = "";
            txtFechIngU.Text = "";

            _PopulateDdlJefe();
            _PopulateDdlArea();
            _PopulateDdlAreaU();
            _PopulateDdlJefeU();
        }

        private void _CleanColors()
        {
            txtNomEmplI.BackColor = Color.White;
            txtCedulaI.BackColor = Color.White;
            txtCorreoI.BackColor = Color.White;
            txtFechNacI.BackColor = Color.White;
            txtFechIngI.BackColor = Color.White;
            ddlJefeI.BackColor = Color.White;
            ddlAreaI.BackColor = Color.White;

            txtNomEmplU.BackColor = Color.White;
            txtCedulaU.BackColor = Color.White;
            txtCorreoU.BackColor = Color.White;
            txtFechNacU.BackColor = Color.White;
            txtFechIngU.BackColor = Color.White;
            ddlJefeU.BackColor = Color.White;
            ddlAreaU.BackColor = Color.White;
        }

        protected void btnAddEmpleado_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            _PoblarDeDatosgvEmpleado();
        }

        protected void BtnSaveEmpleI_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalEmpleadoI').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomEmplI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtNomEmplI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtCedulaI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtCedulaI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtCorreoI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtCorreoI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtFechNacI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtFechNacI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtFechIngI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtFechIngI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (ddlJefeI.SelectedIndex == 0)
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    ddlJefeI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (ddlAreaI.SelectedIndex == 0)
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    ddlAreaI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    string email = txtCorreoI.Text;
                    Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                    Match match = regex.Match(email);

                    if (match.Success)
                    {
                        clsBExam._InsertarEmpleado(txtNomEmplI.Text, txtCedulaI.Text, txtCorreoI.Text, Convert.ToDateTime(txtFechNacI.Text), Convert.ToDateTime(txtFechIngI.Text),
                                               ddlJefeI.SelectedIndex, ddlAreaI.SelectedIndex);

                        dvSucessI.Visible = true;
                        dvRequeridoI.Visible = false;
                        dvErrorI.Visible = false;
                        dvEmailFail.Visible = false;

                        _PoblarDeDatosgvEmpleado();
                        _PopulatetxtUltimoIDEmpleado();
                        _CleanControls();
                        _CleanColors();
                        _CargarFechas();

                        int Edad = CalcYears(DateTime.ParseExact(txtFechNacI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                        lblFechaEdaI.Text = Convert.ToString(Edad);

                        int TiempoLaborar = CalcYears(DateTime.ParseExact(txtFechIngI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                        lblFechInI.Text = Convert.ToString(TiempoLaborar);
                    }
                    else
                    {
                        dvEmailFail.Visible = true;
                        dvRequeridoI.Visible = false;
                    }                  
                }
            }
            catch (Exception ex)
            {
                dvErrorI.Visible = true;
                lblMessage.Text = "<strong>No se puede cuargar el Registro, Tiene una Excepción:</strong> " + ex.Message;
            }
        }

        protected void btnCloseI_Click(object sender, EventArgs e)
        {
            dvSucessI.Visible = false;
            dvRequeridoI.Visible = false;
            dvErrorI.Visible = false;
            dvEmailFail.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalEmpleadoI').modal('hide');", true);
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            _PopulateDdlAreaD();
            _PopulateDdlJefeD();

            GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            string IdEmpleado = ((Label)row.FindControl("lblIDEmpleC")).Text;
            int IdEmpleadoInt = int.Parse(Regex.Replace(IdEmpleado, "[^0-9]", ""));
            DataTable dtEmpleado = clsBExam._ObtenerEmpleadoPorID(IdEmpleadoInt);

            if (dtEmpleado.Rows.Count > 0)
            {
                txtIdEmpleadoD.Text = "Jefe-" + dtEmpleado.Rows[0]["IdEmpleado"].ToString();
                txtNomEmplD.Text = dtEmpleado.Rows[0]["NombreCompleto"].ToString();
                txtCedulaD.Text = dtEmpleado.Rows[0]["Cedula"].ToString();
                txtCorreoD.Text = dtEmpleado.Rows[0]["Correo"].ToString();
                txtFechNacD.Text = dtEmpleado.Rows[0]["FechaNacimiento"].ToString();
                txtFechIngD.Text = dtEmpleado.Rows[0]["FechaIngreso"].ToString();
                ddlJefeD.SelectedValue = dtEmpleado.Rows[0]["IdJefe"].ToString();
                ddlAreaD.SelectedValue = dtEmpleado.Rows[0]["IdArea"].ToString();

                int EdadReal = CalcYears(DateTime.ParseExact(txtFechNacD.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechaEdaD.Text = Convert.ToString(EdadReal);

                int EdadEmpresa = CalcYears(DateTime.ParseExact(txtFechIngD.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechInD.Text = Convert.ToString(EdadEmpresa);

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalEmpleadoD').modal('show')", true);
                txtBuscaEmpleado.Text = "";
            }
        }

        protected void btnUpdateEmpleado_Click(object sender, EventArgs e)
        {
            _PopulateDdlAreaU();
            _PopulateDdlJefeU();

            GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            string IdEmpleado = ((Label)row.FindControl("lblIDEmpleC")).Text;
            int IdEmpleadoInt = int.Parse(Regex.Replace(IdEmpleado, "[^0-9]", ""));
            DataTable dtEmpleado = clsBExam._ObtenerEmpleadoPorID(IdEmpleadoInt);

            if (dtEmpleado.Rows.Count > 0)
            {
                txtIdEmpleadoU.Text = "Jefe-" + dtEmpleado.Rows[0]["IdEmpleado"].ToString();
                txtNomEmplU.Text = dtEmpleado.Rows[0]["NombreCompleto"].ToString();
                txtCedulaU.Text = dtEmpleado.Rows[0]["Cedula"].ToString();
                txtCorreoU.Text = dtEmpleado.Rows[0]["Correo"].ToString();
                txtFechNacU.Text = dtEmpleado.Rows[0]["FechaNacimiento"].ToString();
                txtFechIngU.Text = dtEmpleado.Rows[0]["FechaIngreso"].ToString();
                ddlJefeU.SelectedValue = dtEmpleado.Rows[0]["IdJefe"].ToString();
                ddlAreaU.SelectedValue = dtEmpleado.Rows[0]["IdArea"].ToString();

                int EdadReal = CalcYears(DateTime.ParseExact(txtFechNacU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechaEdaU.Text = Convert.ToString(EdadReal);

                int EdadEmpresa = CalcYears(DateTime.ParseExact(txtFechIngU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                lblFechInU.Text = Convert.ToString(EdadEmpresa);

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalEmpleadoU').modal('show')", true);
                txtBuscaEmpleado.Text = "";
            }
        }

        protected void BtnSaveEmpleU_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalEmpleadoU').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomEmplU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtNomEmplU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtCedulaU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtCedulaU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtCorreoU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtCorreoU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtFechNacU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtFechNacU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtFechIngU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtFechIngU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (ddlJefeU.SelectedIndex == 0)
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    ddlJefeU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (ddlAreaU.SelectedIndex == 0)
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    ddlAreaU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    int IdEmpleadoInt = int.Parse(Regex.Replace(txtIdEmpleadoU.Text, "[^0-9]", ""));

                    string email = txtCorreoU.Text;
                    Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                    Match match = regex.Match(email);

                    if (match.Success)
                    {
                        clsBExam._ModificarEmpleado(IdEmpleadoInt, txtNomEmplU.Text, txtCedulaU.Text, txtCorreoU.Text, Convert.ToDateTime(txtFechNacU.Text), Convert.ToDateTime(txtFechIngU.Text),
                                              ddlJefeU.SelectedIndex, ddlAreaU.SelectedIndex);
                        dvSucessU.Visible = true;
                        dvRequeridoU.Visible = false;
                        dvErrorU.Visible = false;
                        dvEmailFailU.Visible = false;

                        _PoblarDeDatosgvEmpleado();
                        _CleanColors();

                        int EdadReal = CalcYears(DateTime.ParseExact(txtFechNacU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                        lblFechaEdaD.Text = Convert.ToString(EdadReal);

                        int EdadEmpresa = CalcYears(DateTime.ParseExact(txtFechIngU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                        lblFechInD.Text = Convert.ToString(EdadEmpresa);
                    }
                    else
                    {
                        dvEmailFailU.Visible = true;
                        dvRequeridoU.Visible = false;
                    }                       
                }
            }
            catch (Exception ex)
            {
                dvErrorU.Visible = true;
                lblMessageU.Text = "<strong>No se puede cuargar el Registro, Tiene una Excepción:</strong> " + ex.Message;
            }
        }

        protected void btnCloseU_Click(object sender, EventArgs e)
        {
            dvSucessU.Visible = false;
            dvRequeridoU.Visible = false;
            dvErrorU.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalEmpleadoU').modal('hide');", true);
        }

        protected void gvEmpleado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = gvEmpleado.Rows[index];
                int IdEmpleado = Convert.ToInt32(gvEmpleado.DataKeys[index].Value.ToString());
                string NombreEmpleado = ((Label)row.FindControl("lblNomEmplC")).Text;
                string Mensaje = "El Empleado con ID: " + IdEmpleado + " - " + NombreEmpleado + "... Ha sido Eliminado Exitosamente";

                if (IdEmpleado > 0)
                {
                    clsBExam._EliminarEmpleado(IdEmpleado);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Mensaje + "')", true);
                    _PoblarDeDatosgvEmpleado();
                }
            }
        }

        public static int CalcYears(DateTime fromDate)
        {
            int years = 0;
            DateTime toDate = DateTime.Now;
            while (toDate.AddYears(-1) >= fromDate)
            {
                years++;
                toDate = toDate.AddYears(-1);
            }
            return years;
        }

        protected void txtFechNacI_TextChanged(object sender, EventArgs e)
        {
            string message = "$('#modalEmpleadoI').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            int Edad = CalcYears(DateTime.ParseExact(txtFechNacI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            lblFechaEdaI.Text = Convert.ToString(Edad);
        }

        protected void txtFechIngI_TextChanged(object sender, EventArgs e)
        {
            string message = "$('#modalEmpleadoI').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            int TiempoLaborar = CalcYears(DateTime.ParseExact(txtFechIngI.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            lblFechInI.Text = Convert.ToString(TiempoLaborar);
        }

        protected void txtFechNacU_TextChanged(object sender, EventArgs e)
        {
            string message = "$('#modalEmpleadoU').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            int Edad = CalcYears(DateTime.ParseExact(txtFechNacU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            lblFechaEdaU.Text = Convert.ToString(Edad);

        }

        protected void txtFechIngU_TextChanged(object sender, EventArgs e)
        {
            string message = "$('#modalEmpleadoU').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            int Edad = CalcYears(DateTime.ParseExact(txtFechIngU.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            lblFechInU.Text = Convert.ToString(Edad);
        }

        public void _CargarFechas()
        {
            txtFechNacI.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtFechIngI.Text = DateTime.Now.ToString("dd/MM/yyyy");


        }
    }
}