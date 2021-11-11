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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTreeViewItems();
            }
        }



        private void GetTreeViewItems()
        {
            var dt = clsBExam._ObtenerEmpleado();

            DataSet ds = new DataSet();
            ds.Tables.Add(dt);

            //ds.Relations.Add("ChildRows", ds.Tables[0].Columns["IdEmpleado"], ds.Tables[0].Columns["IdJefe"]);

            foreach (DataRow level1DataRow in ds.Tables[0].Rows)
            {
                //if (string.IsNullOrEmpty(level1DataRow["IdJefe"].ToString()))
                //{
                    TreeNode parentTreeNode = new TreeNode();
                    parentTreeNode.Text = level1DataRow["NombreCompleto"].ToString();
                    parentTreeNode.Value = level1DataRow["IdJefe"].ToString();
                    GetChildRows(level1DataRow, parentTreeNode);
                    TreeView1.Nodes.Add(parentTreeNode);
                //}
            }
        }

        private void GetChildRows(DataRow dataRow, TreeNode treeNode)
        {
            DataRow[] childRows = dataRow.GetChildRows("ChildRows");
            foreach (DataRow row in childRows)
            {
                TreeNode childTreeNode = new TreeNode();
                childTreeNode.Text = row["NombreCompleto"].ToString();
                childTreeNode.Value = row["IdEmpleado"].ToString();
                treeNode.ChildNodes.Add(childTreeNode);

                if (Convert.ToBoolean(row.GetChildRows("ChildRows").Length))
                {
                    GetChildRows(row, childTreeNode);
                }
            }
        }
    }
}