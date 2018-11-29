<%@ Page Title="::.. Consultar Cliente ..::" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ConsultarCliente.aspx.cs" Inherits="CRUD_WebForms.paginas.ConsultarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">

    <div class="col-md-12">
        <div class="well">
            <h1 class="panel-title">Consultar Cliente</h1>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-body table-responsive">
                <table id="tbl_cliente" class="table table-bordered table-hover">
                    <thead>
                        <tr class="active">
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>CPF</th>
                            <th>Telefone</th>
                            <th>CEP</th>
                            <th>Estado</th>
                            <th>Cidade</th>
                            <th>Endereço</th>
                            <th>Editar/Remover</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="modal fade" data-backdrop="static" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Atualizar Registro</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <div class="col-md-6 margin_left">
                                <div class="box box-primary">
                                    <div class="box-body">
                                         <div class="form-group">
                                            <label>CPF</label>
                                            <asp:TextBox ID="txtCPFEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Nome</label>
                                            <asp:TextBox ID="txtNomeEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Sobrenome</label>
                                            <asp:TextBox ID="txtSobreNomeEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Idade</label>
                                            <asp:TextBox ID="txtIdadeEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="box box-primary">
                                    <div class="box-body">                                       
                                        <div class="form-group">
                                            <label>Sexo</label>
                                            <asp:DropDownList ID="ddlSexoEditar" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Telefone</label>
                                            <asp:TextBox ID="txtTelefoneEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Endereço</label>
                                            <asp:TextBox ID="textEnderecoEditar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn_atualizar">Atualizar</button>
                    </div>
                </div>
            </div>

        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../js/cadastro/cliente.js"></script>
</asp:Content>
