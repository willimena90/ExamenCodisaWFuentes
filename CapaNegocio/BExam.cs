using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;
namespace CapaNegocio
{
    public class BExam
    {
        DExam clsDExam = new DExam();

        #region Mantenimiento de Area

        public DataTable _ObtenerAreas()
        {
            return clsDExam._ConsultarAreas();
        }

        public DataTable _ObtenerUltimoArea()
        {
            return clsDExam._ConsultarUltimoArea();
        }

        public DataTable _ObtenerAreaDdl()
        {
            return clsDExam._ConsultarAreaDdl();
        }

        public DataTable _ObtenerAreasPorID(int IdArea)
        {
            return clsDExam._ConsultarAreasPorID(IdArea);
        }

        public void _InsertarArea(string Nombre, string Descripcion)
        {
            clsDExam._InsertarArea(Nombre,Descripcion);
        }

        public void _ModificarArea(int IdArea, string Nombre, string Descripcion)
        {
            clsDExam._ModificarArea(IdArea, Nombre, Descripcion);
        }

        public void _EliminarArea(int IdArea)
        {
            clsDExam._EliminarArea(IdArea);
        }

        #endregion

        #region Mantenimiento de Jefes

        public DataTable _ObtenerJefeDdl()
        {
            return clsDExam._ConsultarJefeDdl();
        }

        #endregion

        #region Mantenimiento de Empleados

        public DataTable _ObtenerEmpleado()
        {
            return clsDExam._ConsultarEmpleado();
        }

        public DataTable _ObtenerUltimoEmpleado()
        {
            return clsDExam._ConsultarUltimoEmpleado();
        }

        public DataTable _ObtenerEmpleadoPorID(int IdEmpleado)
        {
            return clsDExam._ConsultarEmpleadoPorID(IdEmpleado);
        }

        public void _InsertarEmpleado(string NombreCompleto, string Cedula, string Correo, DateTime FechaNacimiento, DateTime FechaIngreso, int IdJefe, int IdArea)
        {
            clsDExam._InsertarEmpleado(NombreCompleto, Cedula, Correo, FechaNacimiento, FechaIngreso, IdJefe, IdArea);
        }

        public void _ModificarEmpleado(int IdEmpleado, string NombreCompleto, string Cedula, string Correo, DateTime FechaNacimiento, DateTime FechaIngreso,
                                       int IdJefe, int IdArea)
        {
            clsDExam._ModificarEmpleado(IdEmpleado, NombreCompleto, Cedula, Correo, FechaNacimiento, FechaIngreso, IdJefe, IdArea);
        }

        public void _EliminarEmpleado(int IdEmpleado)
        {
            clsDExam._EliminarEmpleado(IdEmpleado);
        }

        #endregion

        #region Mantenimiento de Area

        public DataTable _ObtenerUltimaHabilidad()
        {
            return clsDExam._ConsultarUltimaHabilidad();
        }

        public DataTable _ObtenerHabilidadPorEmpleado(int IdEmpleado)
        {
            return clsDExam._ConsultarHabilidadPorEmpleado(IdEmpleado);
        }

        public void _InsertarHabilidad(int IdEmpleado, string NombreHabilidad)
        {
            clsDExam._InsertarHabilidad(IdEmpleado, NombreHabilidad);
        }

        public void _EliminarHabilidad(int IdHabilidad)
        {
            clsDExam._EliminarHabilidad(IdHabilidad);
        }

        #endregion
    }
}
