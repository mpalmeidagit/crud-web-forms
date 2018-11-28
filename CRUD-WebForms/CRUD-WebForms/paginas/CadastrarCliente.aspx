<%@ Page Title="::.. Cadastrar Cliente ..::" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CadastrarCliente.aspx.cs" Inherits="CRUD_WebForms.paginas.CadastrarCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
     <div class="col-md-12">
        <div class="well">
            <h1 class="panel-title">Cadastrar Cliente</h1>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="text">Nome</label>
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email">E-mail</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="text">CPF</label>
            <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="text">Telefone</label>
            <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

    </div>

    <div class="col-md-6">
        <div class="col-md-12 sem_padding_left_right">
            <div class="col-md-6 sem_padding_left">
                <div class="form-group">
                    <label for="text">CEP</label>
                    <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 sem_padding_right">
                <div class="form-group">
                    <label for="text">Estado</label>
                    <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="text">Cidade</label>
            <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="text">Bairro</label>
            <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="text">Endereço</label>
            <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

     <div class="col-md-12">
        <div class="well well-sm">
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-success btn-lg" />&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-lg" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../js/cadastro/cliente.js"></script>
</asp:Content>
