<%@ Page Title="CONTAS A PAGAR" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="fi_contas_pagar.aspx.vb" Inherits="conteltelecom.fi_contas_pagar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">


    <fieldset>

        <div class="panel panel-default">
            <div class="panel-body">

                <legend>FILTRO</legend>

                <div class="form-horizontal">
                    <br />


                    <div class="form-group">
                        <asp:Label ID="Label1" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="PERÍODO INICIAL:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDatePicker Width="95%" ID="RadDatePickerPeriodoInicial" runat="server"></telerik:RadDatePicker>
                        </div>
                        <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="PERÍODO FINAL:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDatePicker Width="95%" ID="RadDatePickerPeriodoFinal" runat="server"></telerik:RadDatePicker>
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label ID="LabelNumeroDoc" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="NÚMERO DOC.:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadTextBox ID="TextBoxNumeroDoc" Width="95%" runat="server"></telerik:RadTextBox>
                        </div>
                        <asp:Label ID="LabelValor" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="VALOR:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadTextBox ID="TextBoxValor" Width="95%" runat="server"></telerik:RadTextBox>
                        </div>
                    </div>



                    <div class="form-group">
                        <asp:Label ID="LabelStatus" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="STATUS:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDropDownList ID="RadDropDownListStatus" Width="95%" DefaultMessage=" " runat="server" DataSourceID="SqlDataSourceBuscaStatus" DataTextField="desc_FI_STATUS_CONTA" DataValueField="id_FI_STATUS_CONTA" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBuscaStatus" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT * FROM [FI_STATUS_CONTA] ORDER BY [desc_FI_STATUS_CONTA]"></asp:SqlDataSource>
                        </div>
                        <asp:Label ID="LabelCategoria" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="CATEGORIA:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDropDownList ID="RadDropDownListCategoria" Width="95%" DefaultMessage=" " runat="server"  DataTextField="desc_FI_CATEGORIA" DataValueField="id_FI_CATEGORIA" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceBuscaCategoria"></telerik:RadDropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBuscaCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [desc_FI_CATEGORIA], [id_FI_CATEGORIA] FROM [FI_CATEGORIA] WHERE ([st_FI_CATEGORIA] = @st_FI_CATEGORIA) ORDER BY [desc_FI_CATEGORIA]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="st_FI_CATEGORIA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label ID="LabelBanco" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="BANCO:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDropDownList ID="RadDropDownListBancos" Width="95%" DefaultMessage=" " runat="server"  DataTextField="desc_FI_BANCOS" DataValueField="id_FI_BANCOS" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceBuscaBancos"></telerik:RadDropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBuscaBancos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT * FROM [FI_BANCOS] WHERE ([st_FI_BANCOS] = @st_FI_BANCOS) ORDER BY [desc_FI_BANCOS]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="st_FI_BANCOS" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <asp:Label ID="Label4" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="OCORRÊNCIA:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDropDownList ID="RadDropDownListOcorrencias" Width="95%" DefaultMessage=" " runat="server"  DataTextField="desc_FI_OCORRENCIAS" DataValueField="id_FI_OCORRENCIAS" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceOcorrencias"></telerik:RadDropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceOcorrencias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_FI_OCORRENCIAS], [desc_FI_OCORRENCIAS] FROM [FI_OCORRENCIAS] WHERE ([st_FI_OCORRENCIAS] = @st_FI_OCORRENCIAS) ORDER BY [desc_FI_OCORRENCIAS]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="st_FI_OCORRENCIAS" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>

                    


                    <div class="col-lg-12" style="text-align: right">
                        <hr />
                        <div>
                            <telerik:RadButton ID="RadButtonPesquisar" OnClick="RadButtonPesquisar_Click" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                                <Icon PrimaryIconUrl="../../img/search.png" />
                            </telerik:RadButton>
                            <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR">
                                <Icon PrimaryIconUrl="../../img/Limpar.png" />
                            </telerik:RadButton>
                        </div>
                    </div>

                </div><!-- fim form-horizontal -->

            </div><!-- fim panel-body -->
        </div><!-- fim panel panel-default -->

    </fieldset>
    <hr />
    <br />









    <telerik:RadGrid ID="RadGridContasAPagar" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceContasAPagar" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>

        <MasterTableView DataKeyNames="id_FI_CONTA" DataSourceID="SqlDataSourceContasAPagar" CommandItemDisplay="Top">
            <Columns>
                
                <telerik:GridBoundColumn DataField="id_FI_CONTA" DataType="System.Int64" FilterControlAltText="Filter id_FI_CONTA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_CONTA" UniqueName="id_FI_CONTA">
                    <ItemStyle Width="95%" />
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="cliente_fornecedor_FI_CONTA" FilterControlAltText="Filter cliente_fornecedor_FI_CONTA column" HeaderText="FORNECEDOR" SortExpression="cliente_fornecedor_FI_CONTA" UniqueName="cliente_fornecedor_FI_CONTA">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="numero_documento_FI_CONTA" FilterControlAltText="Filter numero_documento_FI_CONTA column" HeaderText="Nº DOC." SortExpression="numero_documento_FI_CONTA" UniqueName="numero_documento_FI_CONTA">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="vencimento_FI_CONTA" DataType="System.DateTime" FilterControlAltText="Filter vencimento_FI_CONTA column" HeaderText="VENCIMENTO" SortExpression="vencimento_FI_CONTA" UniqueName="vencimento_FI_CONTA">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="valor_FI_CONTA" DataType="System.Double" FilterControlAltText="Filter valor_FI_CONTA column" HeaderText="VALOR" SortExpression="valor_FI_CONTA" UniqueName="valor_FI_CONTA">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="id_FI_STATUS_CONTA" DataType="System.Int32" FilterControlAltText="Filter id_FI_STATUS_CONTA column" HeaderText="STATUS" SortExpression="id_FI_STATUS_CONTA" UniqueName="id_FI_STATUS_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" UniqueName="DETALHES" HeaderText="DETALHES">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <telerik:RadButton ID="RadButtonDetalhes" runat="server" Text="DETALHES" CommandName="Pesquisar">
                            <Icon PrimaryIconUrl="../../img/search_page.png" />
                        </telerik:RadButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>

            </Columns>



            <%-- cadastro de conta a pagar --%>
            <EditFormSettings>
                <FormTemplate>
                    <fieldset class="form-group" style="border: 1px solid #ccc; padding: 10px;">
                        <table class="rgMasterTable" style="width: 100%">
                            <colgroup>
                                <col />
                                <col />
                                <col />
                                <col />
                            </colgroup>

                            <thead>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="FORNECEDOR:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Nº DOCUMENTO:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="DT VENCIMENTO:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label9" runat="server" Font-Bold="true" Text="DT VENC. ORIGINAL:"></asp:Label>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <telerik:RadDropDownList ID="RadDropDownListFornecedores" Width="95%" runat="server" DataSourceID="SqlDataSourceFornecedores" DataTextField="desc_FI_DESTINATARIO" DataValueField="id_FI_DESTINATARIO" Skin="Bootstrap" SelectedValue='<%# Bind("id_FI_DESTINATARIO") %>'></telerik:RadDropDownList>
                                    </td>
                                    <td class="col-xs-3">
                                       <telerik:RadTextBox ID="RadTextBoxNumeroDoc" Width="95%" runat="server"></telerik:RadTextBox>
                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadDatePicker Width="95%" ID="RadDatePickerDataVencimento" runat="server"></telerik:RadDatePicker>
                                    </td>
                                    <td class="col-xs-3">
                                       <telerik:RadDatePicker Width="95%" ID="RadDatePickerDataVencimentoOriginal" runat="server"></telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </tbody>

                             <thead>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label6" runat="server" Font-Bold="true" Text="DATA EMISSÃO:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label7" runat="server" Font-Bold="true" Text="VALOR DA CONTA:"></asp:Label>

                                    </th>
                                    <th>
                                        <asp:Label ID="Label8" runat="server" Font-Bold="true" Text="BANCO:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label10" runat="server" Font-Bold="true" Text="OCORRÊNCIA:"></asp:Label>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <telerik:RadDatePicker Width="95%" ID="RadDatePickerDataEmissao" runat="server"></telerik:RadDatePicker>
                                    </td>
                                    <td class="col-xs-3">
                                       <telerik:RadTextBox Width="95%" ID="RadTextBoxValor" runat="server"></telerik:RadTextBox>
                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadDropDownList Width="95%" ID="RadDropDownListBancos" runat="server" DataSourceID="SqlDataSourceBuscaBancos" DataTextField="desc_FI_BANCOS" DataValueField="id_FI_BANCOS" Skin="Bootstrap"></telerik:RadDropDownList>
                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadDropDownList Width="95%" ID="RadDropDownListOcorrencias" runat="server" DataSourceID="SqlDataSourceBuscaOcorrencias" DataTextField="desc_FI_OCORRENCIAS" DataValueField="id_FI_OCORRENCIAS" Skin="Bootstrap"></telerik:RadDropDownList>
                                    </td>
                                </tr>
                            </tbody>


                            <thead>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label11" runat="server" Font-Bold="true" Text="DIA DE VENCIMENTO:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label12" runat="server" Font-Bold="true" Text="CATEGORIA:"></asp:Label>

                                    </th>
                                    <th>
                                        <asp:Label ID="Label13" runat="server" Font-Bold="true" Text="SUBCATEGORIA:"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="HISTÓRICO:"></asp:Label>
                                    </th>
                                </tr>
                            </thead>


                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <telerik:RadNumericTextBox ID="RadNumericTextBoxDiaVencimento" runat="server" Culture="pt-BR" DbValueFactor="1" MaxValue="31" MinValue="1" Skin="Bootstrap" Width="260px"></telerik:RadNumericTextBox>
                                    </td>
                                    <td class="col-xs-3">
                                       <telerik:RadDropDownList Width="95%" ID="RadDropDownListCategorias" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="desc_FI_CATEGORIA" DataValueField="id_FI_CATEGORIA" Skin="Bootstrap"></telerik:RadDropDownList>
                                    </td>
                                    <td class="col-xs-3">
                                       <telerik:RadDropDownList Width="95%" ID="RadDropDownList1" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="desc_FI_CATEGORIA" DataValueField="id_FI_CATEGORIA" Skin="Bootstrap"></telerik:RadDropDownList> 
                                    </td>
                                    <td>
                                        <asp:TextBox TextMode="MultiLine" ID="TextBoxHistorico" runat="server" Width="95%" CssClass="form-control" Height="90px" />
                                    </td>
                                </tr>
                            </tbody>

                            <tfoot style="width: 100%">
                                <tr class="rgRow">
                                    <td class="rgEditForm">
                                        <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Skin="" CssClass="gEditForm [type='image']" Width="32px" Height="32px" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'>
                                        </telerik:RadImageButton>
                                        <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                                    </td>
                                    <td class="rgCommandCell"></td>
                                    <td class="rgCommandCell"></td>
                                    <td class="rgCommandCell"></td>
                                </tr>
                            </tfoot>
                        </table>

                    </fieldset>
                </FormTemplate>
            </EditFormSettings>

        </MasterTableView>
    </telerik:RadGrid>




    <%-- mensagem de erro do try catch --%>
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>


    <%-- SqlDataSource dos select(combobox) do formulario de cadastro de conta a pagar --%>

    <asp:SqlDataSource ID="SqlDataSourceFornecedores" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_FI_DESTINATARIO], [desc_FI_DESTINATARIO] FROM [FI_DESTINATARIO] WHERE ([st_FI_DESTINATARIO] = @st_FI_DESTINATARIO) ORDER BY [desc_FI_DESTINATARIO]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_DESTINATARIO" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_FI_BANCOS], [desc_FI_BANCOS] FROM [FI_BANCOS] WHERE ([st_FI_BANCOS] = @st_FI_BANCOS) ORDER BY [desc_FI_BANCOS]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_BANCOS" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceBuscaOcorrencias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_FI_OCORRENCIAS], [desc_FI_OCORRENCIAS] FROM [FI_OCORRENCIAS] WHERE ([st_FI_OCORRENCIAS] = @st_FI_OCORRENCIAS) ORDER BY [desc_FI_OCORRENCIAS]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_OCORRENCIAS" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [desc_FI_CATEGORIA], [id_FI_CATEGORIA] FROM [FI_CATEGORIA] WHERE ([st_FI_CATEGORIA] = @st_FI_CATEGORIA) ORDER BY [desc_FI_CATEGORIA]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_CATEGORIA" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceContasAPagar" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_CONTA] WHERE [id_FI_CONTA] = @id_FI_CONTA" InsertCommand="INSERT INTO [FI_CONTA] ([tipo_FI_CONTA], [cliente_fornecedor_FI_CONTA], [historico_FI_CONTA], [numero_no_banco_FI_CONTA], [numero_documento_FI_CONTA], [vencimento_FI_CONTA], [vencimento_original_FI_CONTA], [data_emissao_FI_CONTA], [valor_FI_CONTA], [id_FI_SUBCATEGORIA], [id_FI_BANCOS], [id_FI_OCORRENCIAS], [id_FI_STATUS_CONTA], [dia_vencimento_FI_CONTA], [exibe_caixa_FI_CONTA], [id_FI_ACRESC_TARIFA], [valor_acresc_tarifa_FI_CONTA], [data_lancamento_FI_CONTA], [data_baixa_FI_CONTA], [id_FI_BANCOS_destino], [valor_pago_FI_CONTA]) VALUES (@tipo_FI_CONTA, @cliente_fornecedor_FI_CONTA, @historico_FI_CONTA, @numero_no_banco_FI_CONTA, @numero_documento_FI_CONTA, @vencimento_FI_CONTA, @vencimento_original_FI_CONTA, @data_emissao_FI_CONTA, @valor_FI_CONTA, @id_FI_SUBCATEGORIA, @id_FI_BANCOS, @id_FI_OCORRENCIAS, @id_FI_STATUS_CONTA, @dia_vencimento_FI_CONTA, @exibe_caixa_FI_CONTA, @id_FI_ACRESC_TARIFA, @valor_acresc_tarifa_FI_CONTA, @data_lancamento_FI_CONTA, @data_baixa_FI_CONTA, @id_FI_BANCOS_destino, @valor_pago_FI_CONTA)" SelectCommand="SELECT FI_CONTA.id_FI_CONTA, FI_CONTA.historico_FI_CONTA, FI_CONTA.numero_documento_FI_CONTA, FI_CONTA.vencimento_FI_CONTA, FI_CONTA.valor_FI_CONTA, FI_CONTA.id_FI_STATUS_CONTA, FI_DESTINATARIO.id_FI_DESTINATARIO, FI_DESTINATARIO.desc_FI_DESTINATARIO FROM FI_CONTA INNER JOIN FI_DESTINATARIO ON FI_CONTA.id_FI_DESTINATARIO = FI_DESTINATARIO.id_FI_DESTINATARIO WHERE (1 = 1)" UpdateCommand="UPDATE FI_CONTA SET tipo_FI_CONTA = @tipo_FI_CONTA, cliente_fornecedor_FI_CONTA = @cliente_fornecedor_FI_CONTA, historico_FI_CONTA = @historico_FI_CONTA, numero_no_banco_FI_CONTA = @numero_no_banco_FI_CONTA, numero_documento_FI_CONTA = @numero_documento_FI_CONTA, vencimento_FI_CONTA = @vencimento_FI_CONTA, vencimento_original_FI_CONTA = @vencimento_original_FI_CONTA, data_emissao_FI_CONTA = @data_emissao_FI_CONTA, valor_FI_CONTA = @valor_FI_CONTA, id_FI_SUBCATEGORIA = @id_FI_SUBCATEGORIA, id_FI_BANCOS = @id_FI_BANCOS, id_FI_OCORRENCIAS = @id_FI_OCORRENCIAS, id_FI_STATUS_CONTA = @id_FI_STATUS_CONTA, dia_vencimento_FI_CONTA = @dia_vencimento_FI_CONTA, exibe_caixa_FI_CONTA = @exibe_caixa_FI_CONTA, id_FI_ACRESC_TARIFA = @id_FI_ACRESC_TARIFA, valor_acresc_tarifa_FI_CONTA = @valor_acresc_tarifa_FI_CONTA, data_lancamento_FI_CONTA = @data_lancamento_FI_CONTA, data_baixa_FI_CONTA = @data_baixa_FI_CONTA, id_FI_BANCOS_destino = @id_FI_BANCOS_destino, valor_pago_FI_CONTA = @valor_pago_FI_CONTA WHERE (id_FI_CONTA = @id_FI_CONTA)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_CONTA" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tipo_FI_CONTA" Type="Byte" />
            <asp:Parameter Name="cliente_fornecedor_FI_CONTA" Type="String" />
            <asp:Parameter Name="historico_FI_CONTA" Type="String" />
            <asp:Parameter Name="numero_no_banco_FI_CONTA" Type="String" />
            <asp:Parameter Name="numero_documento_FI_CONTA" Type="String" />
            <asp:Parameter DbType="Date" Name="vencimento_FI_CONTA" />
            <asp:Parameter DbType="Date" Name="vencimento_original_FI_CONTA" />
            <asp:Parameter DbType="Date" Name="data_emissao_FI_CONTA" />
            <asp:Parameter Name="valor_FI_CONTA" Type="Double" />
            <asp:Parameter Name="id_FI_SUBCATEGORIA" Type="Int32" />
            <asp:Parameter Name="id_FI_BANCOS" Type="Int32" />
            <asp:Parameter Name="id_FI_OCORRENCIAS" Type="Int32" />
            <asp:Parameter Name="id_FI_STATUS_CONTA" Type="Int32" />
            <asp:Parameter Name="dia_vencimento_FI_CONTA" Type="Int32" />
            <asp:Parameter Name="exibe_caixa_FI_CONTA" Type="Byte" />
            <asp:Parameter Name="id_FI_ACRESC_TARIFA" Type="Int32" />
            <asp:Parameter Name="valor_acresc_tarifa_FI_CONTA" Type="Double" />
            <asp:Parameter Name="data_lancamento_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="data_baixa_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="id_FI_BANCOS_destino" Type="Int32" />
            <asp:Parameter Name="valor_pago_FI_CONTA" Type="Double" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="tipo_FI_CONTA" />
            <asp:Parameter Name="cliente_fornecedor_FI_CONTA" />
            <asp:Parameter Name="historico_FI_CONTA" />
            <asp:Parameter Name="numero_no_banco_FI_CONTA" />
            <asp:Parameter Name="numero_documento_FI_CONTA" />
            <asp:Parameter Name="vencimento_FI_CONTA" />
            <asp:Parameter Name="vencimento_original_FI_CONTA" />
            <asp:Parameter Name="data_emissao_FI_CONTA" />
            <asp:Parameter Name="valor_FI_CONTA" />
            <asp:Parameter Name="id_FI_SUBCATEGORIA" />
            <asp:Parameter Name="id_FI_BANCOS" />
            <asp:Parameter Name="id_FI_OCORRENCIAS" />
            <asp:Parameter Name="id_FI_STATUS_CONTA" />
            <asp:Parameter Name="dia_vencimento_FI_CONTA" />
            <asp:Parameter Name="exibe_caixa_FI_CONTA" />
            <asp:Parameter Name="id_FI_ACRESC_TARIFA" />
            <asp:Parameter Name="valor_acresc_tarifa_FI_CONTA" />
            <asp:Parameter Name="data_lancamento_FI_CONTA" />
            <asp:Parameter Name="data_baixa_FI_CONTA" />
            <asp:Parameter Name="id_FI_BANCOS_destino" />
            <asp:Parameter Name="valor_pago_FI_CONTA" />
            <asp:Parameter Name="id_FI_CONTA" />
        </UpdateParameters>
        
    </asp:SqlDataSource>

</asp:Content>