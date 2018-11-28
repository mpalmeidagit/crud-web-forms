
// Salvar cliente
$("#btnSalvar").on("click", function (e) {
    e.preventDefault();
    var campoNome = $("#txtNome").val();
    var campoEmail = $("#txtEmail").val();
    var campoCPF = $("#txtCPF").val();
    var campoTelefone = $("#txtTelefone").val();
    var campoCEP = $("#txtCEP").val();  

    if (campoNome == "") {
        $('#txtNome').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'Campo nome é obrigatório',
        })
    } else if (campoEmail == "") {
        $('#txtEmail').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'Campo email é obrigatório',
        })
    }
    else if (!ValidarEmail(campoEmail)) {
        $('#txtEmail').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'E-mail informado é invalido',
        })
    }
    else if (campoCPF == "") {
        $('#txtCPF').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'Campo cpf é obrigatório',
        })
    }
    else if (campoTelefone == "") {
        $('#txtTelefone').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'Campo telefone é obrigatório',
        })
    }
    else if (campoCEP == "") {
        $('#txtCEP').focus();
        swal({
            type: 'info',
            position: 'top',
            title: 'Aviso',
            text: 'Campo cep é obrigatório',
        })
    }
   
    
});

// Limpar Campos
function LimparCampos() {
    var campoNome = $("#txtNome").val('');
    var campoEmail = $("#txtEmail").val('');
    var campoCPF = $("#txtCPF").val('');
    var campoTelefone = $("#txtTelefone").val('');
    var campoCEP = $("#txtCEP").val('');
    var campoEstado = $("#txtEstado").val('');
    var campoCidade = $("#txtCidade").val('');
    var campoBairro = $("#txtBairro").val('');
    var campoEndereco = $("#txtEndereco").val('');
}

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