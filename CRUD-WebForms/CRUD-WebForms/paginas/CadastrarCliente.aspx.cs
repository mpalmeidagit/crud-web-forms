using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CamadaEntidades;
using CamadaNegocio;

namespace CRUD_WebForms.paginas
{
    public partial class CadastrarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static EntidadeCliente SalvarCliente(String campoNome, String campoEmail, String campoCPF, String campoTelefone, String campoCEP, String campoEstado, String campoCidade, String campoBairro, String campoEndereco)
        {

            try
            {
                EntidadeCliente objCliente = new EntidadeCliente()
                {
                    Nome = campoNome,
                    Email = campoEmail,
                    CPF = campoCPF,
                    Telefone = campoTelefone,
                    CEP = campoCEP,
                    Estado = campoEstado,
                    Cidade = campoCidade,
                    Bairro = campoBairro,
                    Endereco = campoEndereco
                };
                return ClienteNegocio.getInstancia().SalvarCliente(objCliente);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}