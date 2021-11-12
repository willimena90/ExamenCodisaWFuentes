using CapaNegocio;
using System;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Configuration;
using System.Collections.Generic;

namespace ExamenCodisaWFuentes.Mtto_Empleados
{
    public partial class wfTreeViewEmpleados : System.Web.UI.Page
    {
        BExam clsBExam = new BExam();
        string Habilidad = "Hab-";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTreeViewItems();
                _PopulatetxtUltimoIDHabilidad();
                _PopulateDdlEmpleado();
            }
        }

        private void _PopulateDdlEmpleado()
        {
            ddlEmpleadoI.DataSource = clsBExam._ObtenerJefeDdl();
            ddlEmpleadoI.DataBind();
        }

        private void _PopulateDdlEmpleadoD()
        {
            ddlEmpHabD.DataSource = clsBExam._ObtenerJefeDdl();
            ddlEmpHabD.DataBind();
        }

        protected DataTable _GetUltimoIDHabilidad()
        {
            var dt = clsBExam._ObtenerUltimaHabilidad();
            return dt;
        }

        private void _PopulatetxtUltimoIDHabilidad()
        {
            DataTable ultimoID = _GetUltimoIDHabilidad();
            string NewHabilidad = "";
            if (ultimoID.Rows.Count > 0)
                NewHabilidad = ultimoID.Rows[0]["IdHabilidad"].ToString();
            txtIdHabilidadI.Text = Habilidad + NewHabilidad;
            txtIdHabilidadI.Style.Add("text-align", "right");
        }

        private void GetTreeViewItems()
        {
            var dt = clsBExam._ObtenerEmpleado();

            DataSet ds = new DataSet();
            ds.Tables.Add(dt);

            ds.Relations.Add("ChildRows", ds.Tables[0].Columns["IdEmpleado"], ds.Tables[0].Columns["IdJefe"]);

            foreach (DataRow level1DataRow in ds.Tables[0].Rows)
            {
                TreeNode parentTreeNode = new TreeNode();
                parentTreeNode.Text = level1DataRow["NombreCompleto"].ToString();
                parentTreeNode.Value = level1DataRow["IdEmpleado"].ToString();

                DataRow[] childRows = level1DataRow.GetChildRows("ChildRows");

                foreach (DataRow level2DataRow in childRows)
                {
                    TreeNode childTreeNode = new TreeNode();
                    childTreeNode.Text = level2DataRow["NombreCompleto"].ToString();
                    childTreeNode.Value = level2DataRow["IdEmpleado"].ToString();
                    parentTreeNode.ChildNodes.Add(childTreeNode);
                }
                TreeView1.Nodes.Add(parentTreeNode);
            }
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            _PopulateDdlEmpleadoD();

            string message = "$('#modalAreaD').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            TreeNode ValueNode = new TreeNode();
            int Cliente = 0;
            ValueNode.Text = TreeView1.SelectedValue.ToString();
            Cliente = Convert.ToInt32(ValueNode.Text);

            DataTable dtHabilidades = new DataTable();
            dtHabilidades = clsBExam._ObtenerHabilidadPorEmpleado(Cliente);

            txtIdHabilidadD.Text = dtHabilidades.Rows[0]["IdHabilidad"].ToString();
            ddlEmpHabD.SelectedValue = dtHabilidades.Rows[0]["IdEmpleado"].ToString();
            
            for (int i = 0; i < dtHabilidades.Rows.Count; i++)
            {
                lstHabD.Items.Add(dtHabilidades.Rows[i][11].ToString());
            }
        }

        protected void btnAddHabilidad_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        private void _CleanControls()
        {
            txtDescHabI.Text = "";
            _PopulateDdlEmpleado();
        }

        private void _CleanColors()
        {
            txtDescHabI.BackColor = Color.White;
            ddlEmpleadoI.BackColor = Color.White;
        }

        protected void BtnSaveHabilidad_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "$('#modalHabilidadI').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

                if (ddlEmpleadoI.SelectedIndex == 0)
                {
                    dvRequerido.Visible = true;
                    dvSucess.Visible = false;
                    dvError.Visible = false;
                    ddlEmpleadoI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else if (lstHabI.Items.Count == 0)
                {
                    dvRequerido.Visible = true;
                    dvSucess.Visible = false;
                    dvError.Visible = false;
                    lstHabI.BackColor = (Color)new ColorConverter().ConvertFromString("#ffe0e6");
                }
                else
                {                    
                    for (int i = 0; i < lstHabI.Items.Count; i++)
                    {
                        ListItem item = new ListItem();
                        item.Text = lstHabI.Items[i].Text;

                        clsBExam._InsertarHabilidad(ddlEmpleadoI.SelectedIndex, item.Text);
                    }                   

                    dvSucess.Visible = true;
                    dvRequerido.Visible = false;
                    dvError.Visible = false;
                    lstHabI.Items.Clear();
                    lstHabI.BackColor = Color.White;

                    _PopulatetxtUltimoIDHabilidad();
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            dvSucess.Visible = false;
            dvRequerido.Visible = false;
            dvError.Visible = false;
            _CleanControls();
            _CleanColors();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#modalHabilidadI').modal('hide');", true);
        }

        protected void txtDescHabI_TextChanged(object sender, EventArgs e)
        {
            string message = "$('#modalHabilidadI').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openModal", message, true);

            string Mensaje = "La Habilidad: " + txtDescHabI.Text + "... Ya Existe en la Lista de Habilidades.";

            ListItem litem = new ListItem(txtDescHabI.Text);

            if ((lstHabI.Items.Contains(litem) == true))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Mensaje + "')", true);
            }
            else
            {
                lstHabI.Items.Add(txtDescHabI.Text);
                txtDescHabI.Text = "";
            }            
        }
    }
}