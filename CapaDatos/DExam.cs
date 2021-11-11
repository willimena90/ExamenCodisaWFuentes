using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace CapaDatos
{
    public class DExam
    {
        clsConexion SqlData = new clsConexion();

        #region Mantenimiento de Area

        public DataTable _ConsultarAreas()
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaArea ");
            return dt;
        }

        public DataTable _ConsultarUltimoArea()
        {
            DataTable dt = SqlData._GetDataTable("SELECT COUNT(IdArea) + 1 IdArea FROM Area");
            return dt;
        }

        public DataTable _ConsultarAreaDdl()
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaAreaDdl ");
            return dt;
        }

        public DataTable _ConsultarAreasPorID(int IdArea)
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaAreaPorID " + IdArea);
            return dt;
        }

        public void _InsertarArea(string Nombre, string Descripcion)
        {
            SqlData._ExecuteSQL("sp_InsertaArea '" + Nombre + "','" + Descripcion + "'");
        }

        public void _ModificarArea(int IdArea, string Nombre, string Descripcion)
        {
            SqlData._ExecuteSQL("sp_ModificarArea " + IdArea + ",'" + Nombre + "','" + Descripcion + "'");
        }

        public void _EliminarArea(int IdArea)
        {
            SqlData._ExecuteSQL("sp_EliminarArea " + IdArea + "");
        }

        #endregion

        #region Mantenimiento de Jefes

        public DataTable _ConsultarJefeDdl()
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaJefeDdl ");
            return dt;
        }

        #endregion

        #region Mantenimiento de Empleado

        public DataTable _ConsultarEmpleado()
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaEmpleado ");
            return dt;
        }

        public DataTable _ConsultarUltimoEmpleado()
        {
            DataTable dt = SqlData._GetDataTable("SELECT COUNT(IdEmpleado) + 1 IdEmpleado FROM Empleado");
            return dt;
        }

        public DataTable _ConsultarEmpleadoPorID(int IdEmpleado)
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaEmpleadoPorID " + IdEmpleado);
            return dt;
        }

        public void _InsertarEmpleado(string NombreCompleto, string Cedula, string Correo, DateTime FechaNacimiento, DateTime FechaIngreso, int IdJefe, int IdArea)
        {
            SqlData._ExecuteSQL("sp_InsertaEmpleado '" + NombreCompleto + "','" + Cedula + "','" + Correo + "','" + FechaNacimiento.ToString("yyyy-MM-dd") + "','" +
                                FechaIngreso.ToString("yyyy-MM-dd") + "'," + IdJefe + "," + IdArea + "");
        }

        public void _ModificarEmpleado(int IdEmpleado, string NombreCompleto, string Cedula, string Correo, DateTime FechaNacimiento, DateTime FechaIngreso, 
                                       int IdJefe, int IdArea)
        {
            SqlData._ExecuteSQL("sp_ModificarEmpleado " + IdEmpleado + ",'" + NombreCompleto + "','" + Cedula + "','" + Correo + "','" + FechaNacimiento.ToString("yyyy-MM-dd") + "','" +
                                FechaIngreso.ToString("yyyy-MM-dd") + "'," + IdJefe + "," + IdArea + "");
        }

        public void _EliminarEmpleado(int IdEmpleado)
        {
            SqlData._ExecuteSQL("sp_EliminarEmpleado " + IdEmpleado + "");
        }

        #endregion

        #region Mantenimiento de Habilidades

        public DataTable _ConsultarUltimaHabilidad()
        {
            DataTable dt = SqlData._GetDataTable("SELECT COUNT(IdHabilidad) + 1 IdHabilidad FROM Empleado_Habilidad");
            return dt;
        }

        public DataTable _ConsultarHabilidadPorEmpleado(int IdEmpleado)
        {
            DataTable dt = SqlData._GetDataTable("sp_ConsultaHabilidadPorEmpleado " + IdEmpleado + "");
            return dt;
        }

        public void _InsertarHabilidad(int IdEmpleado, string NombreHabilidad)
        {
            SqlData._ExecuteSQL("sp_InsertarHabilidad " + IdEmpleado + ",'" + NombreHabilidad + "'");
        }

        public void _EliminarHabilidad(int IdHabilidad)
        {
            SqlData._ExecuteSQL("sp_EliminarArea " + IdHabilidad + "");
        }

        #endregion
    }
}
