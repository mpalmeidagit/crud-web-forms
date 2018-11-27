using System;

namespace CamadaEntidades
{
    public class EntidadeCliente
    {
        public int Id { get; set; }
        public String Nome { get; set; }
        public String Email { get; set; }
        public String CPF { get; set; }
        public String Telefone { get; set; }
        public String CEP { get; set; }
        public String Estado { get; set; }
        public String Cidade { get; set; }
        public String Bairro { get; set; }
        public String Endereco { get; set; }

        public EntidadeCliente()
        {

        }

        public EntidadeCliente(int Id, string nome, string email, string cpf, string telefone, string cep, string estado, string cidade, string bairro, string endereco)
        {
            this.Id = Id;
            this.Nome = nome;
            this.Email = email;
            this.CPF = cpf;
            this.Telefone = telefone;
            this.CEP = cep;
            this.Estado = estado;
            this.Cidade = cidade;
            this.Bairro = bairro;
            this.Endereco = endereco;

        }

    }
}
