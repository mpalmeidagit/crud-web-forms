using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CamadaEntidades
{
    public class EntidadeRecibo
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public EntidadeServico EntidadeServico { get; set; }
        public EntidadeCliente EntidadeCliente { get; set; }

        public EntidadeRecibo()
        {

        }

        public EntidadeRecibo(int id, DateTime data, EntidadeServico entidadeServico, EntidadeCliente entidadeCliente)
        {
            this.Id = id;
            this.Data = data;
            this.EntidadeServico = entidadeServico;
            this.EntidadeCliente = entidadeCliente;

        }
    }
}
