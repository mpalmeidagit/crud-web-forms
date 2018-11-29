
// Variaveis global
var tabela, data;


function IniciarTabela() {
    tabela = $("#tbl_cliente").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        "aoColumns": [
           { "bSortable": false },
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });
    tabela.fnSetColumnVis(0, false);
}

function AdicionarLinhasNaTabela(data) {

    tabela.fnClearTable();

    for (var i = 0; i < data.length; i++) {
        tabela.fnAddData([
             data[i].Id,
             data[i].Nome,
             data[i].Email,
             data[i].CPF,
             data[i].Telefone,
             data[i].CEP,
             data[i].Estado,
             data[i].Cidade,
             data[i].Bairro,
             data[i].Endereco,
             '<button value="Atualizar" title="Atualizar" class="btn btn-primary btn_editar" data-target="#imodal" data-toggle="modal"><span class="glyphicon glyphicon-edit"></span></button>&nbsp;&nbsp;' +
             '<button value="Atualizar" title="Remover" class="btn btn-danger btn_remover"><span class="glyphicon glyphicon-trash"></span></button>'
        ]);

        tabela.fnSetColumnVis(0, false);
    }
}

IniciarTabela();



// Cancelar 
$("#btnCancelar").on("click", function (e) {
    e.preventDefault();
    LimparCampos();
    $("#txtNome").focus();
});

// Preencher campos através do CEP
$(function ($) {
    $("#txtCEP").change(function () {
        var cep_code = $(this).val();
        if (cep_code.length <= 0) return;
        $.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
        function (result) {
            if (result.status != 1) {
                alert(result.message || "Houve um erro desconhecido");
                return;
            }
            $("input#txtCEP").val(result.code);
            $("input#txtEstado").val(result.state);
            $("input#txtCidade").val(result.city);
            $("input#txtBairro").val(result.district);
            $("input#txtEndereco").val(result.address);
        });
    });
});

// Colocar mascaras no campos
$(document).ready(function () {
    $('#txtCPF').mask('000.000.000-00');
    $('#txtTelefone').mask('(00) 00000-0000');
    $('#txtCEP').mask('00000-000');
});

// Validar e-mail
function ValidarEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test($email);
}