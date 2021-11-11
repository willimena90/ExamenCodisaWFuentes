using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CapaDatos
{
    public class clsConexion
    {
        //Variables conexion a BD
        public string strSQL;
        public int IdProceso;
        public SqlConnection SqlCn;
        public new SqlCommand SqlCm;
        public SqlDataReader SqlDr;
        public DataTable Sqldt;

        private string Connect()
        {
            string cn = ConfigurationManager.ConnectionStrings["ExamenCodisaWFuentes"].ConnectionString;

            try
            {
                SqlCn = new SqlConnection(cn);
                SqlCn.Open();
                return "1";
            }
            catch (Exception)
            {
                SqlCn.Close();
                return "0";
            }
        }

        public DataTable _GetDataTable(string ssql)
        {
            DataTable SQL_DT = new DataTable();
            SqlDataAdapter SQL_DA = new SqlDataAdapter();
            try
            {
                if (Connect() == "1")
                {
                    SqlCm = new SqlCommand(ssql, SqlCn);
                    SqlCm.CommandTimeout = 999999;
                    SQL_DA.SelectCommand = SqlCm;
                    SQL_DA.Fill(SQL_DT);
                }
            }
            catch (Exception)
            {
            }
            SqlCn.Close();
            return SQL_DT;
        }

        public string _ExecuteSQL(string ssql)
        {
            try
            {
                if (Connect() == "1")
                {
                    SqlCm = new SqlCommand(ssql, SqlCn);
                    SqlCm.CommandType = CommandType.Text;
                    SqlCm.CommandTimeout = 50000000;
                    SqlCm.ExecuteNonQuery();
                    SqlCn.Close();
                    return "1";
                }
                else
                    return "0";
            }
            catch (Exception generatedExceptionName)
            {
                return "0";
            }
        }
    }
}
