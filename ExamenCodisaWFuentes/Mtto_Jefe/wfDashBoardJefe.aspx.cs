using CapaNegocio;
using System;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenCodisaWFuentes.Mtto_Jefe
{
    public partial class wfDashBoardJefe : System.Web.UI.Page
    {
        BExam clsBExam = new BExam();
        string Jefe = "Jefe-";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _PoblarDeDatosgvJefe();
                //_PopulatetxtUltimoIDJefe();
            }
        }

        public void _PoblarDeDatosgvJefe()
        {
            //gvJefe.DataSource = clsBExam._ObtenerJefes();
            //gvJefe.DataBind();
        }

        //protected DataTable _GetUltimoIDJefe()
        //{
        //    //var dt = clsBExam._ObtenerUltimoJefe();
        //    //return dt;
        //}

        //private void _PopulatetxtUltimoIDJefe()
        //{
        //    DataTable ultimoID = _GetUltimoIDJefe();
        //    string NewJefe = "";
        //    if (ultimoID.Rows.Count > 0)
        //        NewJefe = ultimoID.Rows[0]["IdJefe"].ToString();
        //    txtIdJefeI.Text = Jefe + NewJefe;
        //    txtIdJefeI.Style.Add("text-align", "right");
        //}

        private void _CleanControls()
        {
            txtNomJefeI.Text = "";
            txtNomJefeU.Text = "";
        }

        private void _CleanColors()
        {
            txtNomJefeI.BackColor = Color.White;
            txtNomJefeU.BackColor = Color.White;
        }

        protected void btnAddJefe_Click(object sender, ImageClickEventArgs e)
        {
            //_PopulatetxtUltimoIDJefe();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            _PoblarDeDatosgvJefe();
        }

        protected void BtnSaveJefeI_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalJefeI').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomJefeI.Text == "")
                {
                    dvRequeridoI.Visible = true;
                    dvSucessI.Visible = false;
                    dvErrorI.Visible = false;
                    txtNomJefeI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    //clsBExam._InsertarJefe(txtNomJefeI.Text);
                    dvSucessI.Visible = true;
                    dvRequeridoI.Visible = false;
                    dvErrorI.Visible = false;

                    _PoblarDeDatosgvJefe();
                    //_PopulatetxtUltimoIDJefe();
                    _CleanControls();
                    _CleanColors();
                }
            }
            catch (Exception ex)
            {
                dvErrorI.Visible = true;
                lblMessage.Text = "<strong>No se puede cuargar el Registro, Tiene una Excepción:</strong> " + ex.Message;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            dvSucessI.Visible = false;
            dvRequeridoI.Visible = false;
            dvErrorI.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalJefeI').modal('hide');", true);
        }

        protected void btnSaveJefeU_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalJefeU').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomJefeU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtNomJefeU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    int IdJefeInt = int.Parse(Regex.Replace(txtIdJefeU.Text, "[^0-9]", ""));

                    //clsBExam._ModificarJefe(IdJefeInt, txtNomJefeU.Text);
                    dvSucessU.Visible = true;
                    dvRequeridoU.Visible = false;
                    dvErrorU.Visible = false;

                    _PoblarDeDatosgvJefe();
                }
            }
            catch (Exception ex)
            {
                dvErrorU.Visible = true;
                lblMessage.Text = "<strong>No se puede cuargar el Registro, Tiene una Excepción:</strong> " + ex.Message;
            }
        }

        protected void btnCloseU_Click(object sender, EventArgs e)
        {
            dvSucessU.Visible = false;
            dvRequeridoU.Visible = false;
            dvErrorU.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalJefeU').modal('hide');", true);
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            //GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            //string IdJefe = ((Label)row.FindControl("lblIDJefeC")).Text;
            //int IdJefeInt = int.Parse(Regex.Replace(IdJefe, "[^0-9]", ""));
            //DataTable dtJefes = clsBExam._ObtenerJefePorID(IdJefeInt);

            //if (dtJefes.Rows.Count > 0)
            //{
            //    txtIdJefeD.Text = "Jefe-" + dtJefes.Rows[0]["IdJefe"].ToString();
            //    txtNomJefeD.Text = dtJefes.Rows[0]["NombreJefe"].ToString();

            //    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalJefeD').modal('show')", true);
            //    txtBuscaJefe.Text = "";
            //}
        }

        protected void btnUpdateJefe_Click(object sender, EventArgs e)
        {
            //GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            //string IdJefe = ((Label)row.FindControl("lblIDJefeC")).Text;
            //int IdJefeInt = int.Parse(Regex.Replace(IdJefe, "[^0-9]", ""));
            //DataTable dtJefes = clsBExam._ObtenerJefePorID(IdJefeInt);

            //if (dtJefes.Rows.Count > 0)
            //{
            //    txtIdJefeU.Text = "Jefe-" + dtJefes.Rows[0]["IdJefe"].ToString();
            //    txtNomJefeU.Text = dtJefes.Rows[0]["NombreJefe"].ToString();

            //    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalJefeU').modal('show')", true);
            //    txtBuscaJefe.Text = "";
            //}
        }
    }
}