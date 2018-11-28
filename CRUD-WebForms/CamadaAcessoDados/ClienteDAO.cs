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

        public EntidadeCliente SalvarCliente(EntidadeCliente objCliente)
        {
            SqlConnection conexao = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            EntidadeCliente objClientes = null;

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
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objCliente = new EntidadeCliente()
                    {                        
                        Nome = dr["nome"].ToString(),
                        CPF = dr["cpf"].ToString(),
                        Telefone = dr["telefone"].ToString(),
                        CEP = dr["cep"].ToString(),
                        Estado = dr["estado"].ToString(),
                        Cidade = dr["cidade"].ToString(),
                        Bairro = dr["bairro"].ToString(),
                        Endereco = dr["endereco"].ToString()
                    };
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexao.Close();
            }
            
            return objClientes;
        }
    }
}
