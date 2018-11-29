using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CamadaEntidades;
using CamadaAcessoDados;

namespace CamadaNegocio
{
    public class ClienteNegocio
    {
        private static ClienteNegocio objCliente = null;

        public ClienteNegocio()
        {

        }

        public static ClienteNegocio getInstancia()
        {
            if (objCliente == null)
            {
                objCliente = new ClienteNegocio();
            }
            return objCliente;
        }

        public bool SalvarCliente(EntidadeCliente objCliente)
        {           
            try
            {
                return ClienteDAO.getInstancia().SalvarCliente(objCliente);
            }
            catch (Exception ex )
            {               
                throw ex;             
            }          
           
        }
    }
}
