using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CamadaEntidades;
using System.Data.SqlClient;
using System.Data;

namespace CamadaAcessoDados
{
    public class ClienteDAO
    {
        private static ClienteDAO objCliente = null;
        public ClienteDAO()
        {

        }

        public static ClienteDAO getInstancia()
        {
            if (objCliente == null)
            {
                objCliente = new ClienteDAO();
            }
            return objCliente;
        }

        public bool SalvarCliente(EntidadeCliente objCliente)
        {
            SqlConnection conexao = null;
            SqlCommand cmd = null;
            bool resposta = false;

            try
            {
                conexao = Conexao.getInstancia().ConexaoBD();
                cmd = new SqlCommand("STP_CADASTRAR_CLIENTE", conexao);
                cmd.Parameters.AddWithValue("@prmNome", objCliente.Nome);
                cmd.Parameters.AddWithValue("@prmEmail", objCliente.Email);
                cmd.Parameters.AddWithValue("@prmCPF", objCliente.CPF);
                cmd.Parameters.AddWithValue("@prmTelefone", objCliente.Telefone);
                cmd.Parameters.AddWithValue("@prmCEP", objCliente.CEP);
                cmd.Parameters.AddWithValue("@prmEstado", objCliente.Estado);
                cmd.Parameters.AddWithValue("@prmCidade", objCliente.Cidade);
                cmd.Parameters.AddWithValue("@prmBairro", objCliente.Bairro);
                cmd.Parameters.AddWithValue("@prmEndereco", objCliente.Endereco);
                cmd.CommandType = CommandType.StoredProcedure;

                conexao.Open();

                int dados = cmd.ExecuteNonQuery();
                if (dados > 0) resposta = true;

            }
            catch (Exception ex)
            {
                resposta = false;
                throw ex;
            }
            finally
            {
                conexao.Close();
            }
            
            return resposta;
        }
    }
}
