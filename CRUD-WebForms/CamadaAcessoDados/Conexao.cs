using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CamadaAcessoDados
{
    public class Conexao
    {
        private static Conexao conexao = null;

        public Conexao()
        {

        }

        public static Conexao getInstancia()
        {
            if (conexao == null)
            {
                conexao = new Conexao();
            }
            return conexao;
        }

        public SqlConnection ConexaoBD()
        {
            SqlConnection conexao = new SqlConnection();
            conexao.ConnectionString = GetStringConexao();

            return conexao;
        }

        public String GetStringConexao()
        {
            return ConfigurationManager.ConnectionStrings["Conexao_default"].ConnectionString;
        }
    }
}
