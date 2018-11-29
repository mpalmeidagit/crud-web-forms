
// Variaveis global
var data;

// Salvar cliente
$("#btnSalvar").on("click", function (e) {
    e.preventDefault();
    var campoNome = $("#txtNome").val();
    var campoEmail = $("#txtEmail").val();
    var campoCPF = $("#txtCPF").val();
    var campoTelefone = $("#txtTelefone").val();
    var campoCEP = $("#txtCEP").val();
    var campoEstado = $("#txtEstado").val();
    var campoCidade = $("#txtCidade").val();
    var campoBairro = $("#txtBairro").val();
    var campoEndereco = $("#txtEndereco").val();

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
    else if (campoNome.length > 0 && campoEmail.length > 0 && campoCPF.length > 0 && campoTelefone.length > 0 && campoCEP.length > 0 && campoEstado.length > 0 && campoCidade.length > 0 && campoBairro.length > 0 && campoEndereco.length > 0) {
        var objeto = JSON.stringify({
            campoNome: campoNome,
            campoEmail: campoEmail,
            campoCPF: campoCPF,
            campoTelefone: campoTelefone,
            campoCEP: campoCEP,
            campoEstado: campoEstado,
            campoCidade: campoCidade,
            campoBairro: campoBairro,
            campoEndereco: campoEndereco
        });
        $.ajax({
            type: "POST",
            url: "/paginas/CadastrarCliente.aspx/SalvarCliente",
            data: objeto,
            contentType: "application/json; charset=utf-8",
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                swal({
                    type: 'error',
                    position: 'top',
                    title: 'Aviso',
                    text: r.Message,
                })
                return false;
            },
            success: function (data) {
                if (data.d) {
                    LimparCampos();
                    swal({
                        position: 'top',
                        type: 'success',
                        text: 'Registro cadastrado com sucesso!',
                        showConfirmButton: false,
                        timer: 2500
                    })
                }
            }
        });

    } else {
        swal({
            type: 'error',
            position: 'top',
            title: 'Aviso',
            text: 'Não foi possivel cadastar novo registro!',
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

