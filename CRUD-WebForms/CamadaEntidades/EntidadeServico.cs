using System;

namespace CamadaEntidades
{
    public class EntidadeServico
    {
        public int Id { get; set; }
        public String Descricao { get; set; }
        public Decimal Valor { get; set; }

        public EntidadeServico()
        {

        }

        public EntidadeServico(int id, string descricao, decimal valor)
        {
            this.Id = id;
            this.Descricao = descricao;
            this.Valor = valor;
        }

    }
}
