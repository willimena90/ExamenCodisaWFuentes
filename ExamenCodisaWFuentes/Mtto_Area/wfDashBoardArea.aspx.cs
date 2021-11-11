using System;
using CapaNegocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Drawing;

namespace ExamenCodisaWFuentes
{
    public partial class Index : System.Web.UI.Page
    {
        BExam clsBExam = new BExam();
        string Area = "Area-";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _PoblarDeDatosgvAreas();
                _PopulatetxtUltimoIDArea();
            }
        }

        public void _PoblarDeDatosgvAreas()
        {
            gvAreas.DataSource = clsBExam._ObtenerAreas();
            gvAreas.DataBind();
        }

        protected void btnAddArea_Click(object sender, ImageClickEventArgs e)
        {
            //_PopulatetxtUltimoIDArea();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            _PoblarDeDatosgvAreas();
        }

        protected DataTable _GetUltimoIDArea()
        {
            var dt = clsBExam._ObtenerUltimoArea();
            return dt;
        }

        private void _PopulatetxtUltimoIDArea()
        {
            DataTable ultimoID = _GetUltimoIDArea();
            string NewArea = "";
            if (ultimoID.Rows.Count > 0)
                NewArea = ultimoID.Rows[0]["IdArea"].ToString();
            txtIdAreaI.Text = Area + NewArea;
            txtIdAreaI.Style.Add("text-align", "right");
        }

        protected void BtnSaveArea_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalArea').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomAreaI.Text == "")
                {
                    dvRequerido.Visible = true;
                    dvSucess.Visible = false;
                    dvError.Visible = false;
                    txtNomAreaI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtDescArea.Text == "")
                {
                    dvRequerido.Visible = true;
                    dvSucess.Visible = false;
                    dvError.Visible = false;
                    txtDescArea.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    clsBExam._InsertarArea(txtNomAreaI.Text, txtDescArea.Text);
                    dvSucess.Visible = true;
                    dvRequerido.Visible = false;
                    dvError.Visible = false;

                    _PoblarDeDatosgvAreas();
                    _PopulatetxtUltimoIDArea();
                    _CleanControls();
                    _CleanColors();
                }
            }
            catch (Exception ex)
            {
                dvError.Visible = true;
                lblMessage.Text = "<strong>No se puede cuargar el Registro, Tiene una Excepción:</strong> " + ex.Message;
            }
        }

        private void _CleanControls()
        {            
            txtNomAreaI.Text = "";
            txtDescArea.Text = "";
            txtNomAreaU.Text = "";
            txtDescAreaU.Text = "";
        }

        private void _CleanColors()
        {
            txtIdAreaI.BackColor = Color.White;
            txtNomAreaI.BackColor = Color.White;
            txtDescArea.BackColor = Color.White;
            txtNomAreaU.BackColor = Color.White;
            txtDescAreaU.BackColor = Color.White;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            dvSucess.Visible = false;
            dvRequerido.Visible = false;
            dvError.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalArea').modal('hide');", true);
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            string IdArea = ((Label)row.FindControl("lblIDAreaC")).Text;
            int IdAreaInt = int.Parse(Regex.Replace(IdArea, "[^0-9]", ""));
            DataTable dtAreas = clsBExam._ObtenerAreasPorID(IdAreaInt);

            if (dtAreas.Rows.Count > 0)
            {
                txtIdAreaD.Text = "Area-" + dtAreas.Rows[0]["IdArea"].ToString();
                txtNomAreaD.Text = dtAreas.Rows[0]["Nombre"].ToString();
                txtDescD.Text = dtAreas.Rows[0]["Descripcion"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalAreaD').modal('show')", true);
                txtBuscaArea.Text = "";
            }
        }

        protected void btnUpdateArea_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).Parent.Parent;

            string IdAreaStr = ((Label)row.FindControl("lblIDAreaC")).Text;
            int IdAreaInt = int.Parse(Regex.Replace(IdAreaStr, "[^0-9]", ""));
            DataTable dtAreas = clsBExam._ObtenerAreasPorID(IdAreaInt);

            if (dtAreas.Rows.Count > 0)
            {
                txtIdAreaU.Text = "Area-" + dtAreas.Rows[0]["IdArea"].ToString();
                txtNomAreaU.Text = dtAreas.Rows[0]["Nombre"].ToString();
                txtDescAreaU.Text = dtAreas.Rows[0]["Descripcion"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalAreaU').modal('show')", true);
                txtBuscaArea.Text = "";
            }
        }

        protected void btnSaveAreaU_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalAreaU').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (txtNomAreaU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtNomAreaU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (txtDescAreaU.Text == "")
                {
                    dvRequeridoU.Visible = true;
                    dvSucessU.Visible = false;
                    dvErrorU.Visible = false;
                    txtDescAreaU.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {
                    int IdAreaInt = int.Parse(Regex.Replace(txtIdAreaU.Text, "[^0-9]", ""));

                    clsBExam._ModificarArea(IdAreaInt, txtNomAreaU.Text, txtDescAreaU.Text);
                    dvSucessU.Visible = true;
                    dvRequeridoU.Visible = false;
                    dvErrorU.Visible = false;

                    _PoblarDeDatosgvAreas();
                    _CleanColors();
                }
            }
            catch (Exception ex)
            {
                dvError.Visible = true;
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
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalAreaU').modal('hide');", true);
        }

        protected void gvAreas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = gvAreas.Rows[index];
                int IdArea = Convert.ToInt32(gvAreas.DataKeys[index].Value.ToString());
                string NombreArea = ((Label)row.FindControl("lblNomAreaC")).Text;
                string Mensaje = "El Area con ID: " + IdArea + " - " + NombreArea + "... Ha sido Eliminado Exitosamente";

                if (IdArea > 0)
                {
                    clsBExam._EliminarArea(IdArea);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Mensaje + "')", true);
                    _PoblarDeDatosgvAreas();
                }                
            }
        }
    }
}