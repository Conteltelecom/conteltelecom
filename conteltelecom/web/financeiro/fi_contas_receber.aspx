<%@ Page Title="CONTAS A RECEBER" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="fi_contas_receber.aspx.vb" Inherits="conteltelecom.fi_contas_receber" %>

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
                        <telerik:RadDropDownList ID="RadDropDownListCategoria" Width="95%" DefaultMessage=" " runat="server" DataTextField="desc_FI_CATEGORIA" DataValueField="id_FI_CATEGORIA" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceBuscaCategoria"></telerik:RadDropDownList>
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
                        <telerik:RadDropDownList ID="RadDropDownListBancos" Width="95%" DefaultMessage=" " runat="server" DataTextField="desc_FI_BANCOS" DataValueField="id_FI_BANCOS" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceBuscaBancos"></telerik:RadDropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceBuscaBancos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT * FROM [FI_BANCOS] WHERE ([st_FI_BANCOS] = @st_FI_BANCOS) ORDER BY [desc_FI_BANCOS]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="st_FI_BANCOS" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <asp:Label ID="Label4" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="OCORRÊNCIA:"></asp:Label>
                    <div class="col-lg-4">
                        <telerik:RadDropDownList ID="RadDropDownListOcorrencias" Width="95%" DefaultMessage=" " runat="server" DataTextField="desc_FI_OCORRENCIAS" DataValueField="id_FI_OCORRENCIAS" Skin="Bootstrap" AutoPostBack="True" DataSourceID="SqlDataSourceOcorrencias"></telerik:RadDropDownList>
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
                        <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                            <Icon PrimaryIconUrl="../../img/search.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR">
                            <Icon PrimaryIconUrl="../../img/Limpar.png" />
                        </telerik:RadButton>
                    </div>
                </div>

            </div>
            <!-- fim form-horizontal -->

        </div><!-- fim panel-body -->
        </div><!-- fim panel panel-default -->

    </fieldset>
    <hr />
    <br />




    <telerik:RadGrid ID="RadGridContasAReceber" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceContasAReceber">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_CONTA" DataSourceID="SqlDataSourceContasAReceber" NoDetailRecordsText="Sem registros para exibir." NoMasterRecordsText="Sem registros para exibir.">
            <CommandItemSettings AddNewRecordText="Novo registro" CancelChangesText="Cancelar Alterações" RefreshText="Atualizar" SaveChangesText="Salvar Alterações" />
            <Columns>

                <telerik:GridBoundColumn DataField="id_FI_CONTA" DataType="System.Int64" FilterControlAltText="Filter id_FI_CONTA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_CONTA" UniqueName="id_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="cliente_fornecedor_FI_CONTA" FilterControlAltText="Filter cliente_fornecedor_FI_CONTA column" HeaderText="CLIENTE" SortExpression="cliente_fornecedor_FI_CONTA" UniqueName="cliente_fornecedor_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="numero_no_banco_FI_CONTA" FilterControlAltText="Filter numero_no_banco_FI_CONTA column" HeaderText="Nº NO BANCO" SortExpression="numero_no_banco_FI_CONTA" UniqueName="numero_no_banco_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="numero_documento_FI_CONTA" FilterControlAltText="Filter numero_documento_FI_CONTA column" HeaderText="Nº DOC." SortExpression="numero_documento_FI_CONTA" UniqueName="numero_documento_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="vencimento_FI_CONTA" DataType="System.DateTime" FilterControlAltText="Filter vencimento_FI_CONTA column" HeaderText="VENCIMENTO" SortExpression="vencimento_FI_CONTA" UniqueName="vencimento_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="valor_FI_CONTA" DataType="System.Double" FilterControlAltText="Filter valor_FI_CONTA column" HeaderText="VALOR" SortExpression="valor_FI_CONTA" UniqueName="valor_FI_CONTA">
                </telerik:GridBoundColumn>

                <telerik:GridCheckBoxColumn DataField="id_FI_STATUS_CONTA" DataType="System.Int16" FilterControlAltText="Filter column column" HeaderText="STATUS" UniqueName="column">
                </telerik:GridCheckBoxColumn>

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
        </MasterTableView>
    </telerik:RadGrid>





    <asp:SqlDataSource ID="SqlDataSourceContasAReceber" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_CONTA] WHERE [id_FI_CONTA] = @id_FI_CONTA" InsertCommand="INSERT INTO [FI_CONTA] ([tipo_FI_CONTA], [cliente_fornecedor_FI_CONTA], [historico_FI_CONTA], [numero_no_banco_FI_CONTA], [numero_documento_FI_CONTA], [vencimento_FI_CONTA], [vencimento_original_FI_CONTA], [data_emissao_FI_CONTA], [valor_FI_CONTA], [id_FI_SUBCATEGORIA], [id_FI_BANCOS], [id_FI_OCORRENCIAS], [id_FI_STATUS_CONTA], [dia_vencimento_FI_CONTA], [exibe_caixa_FI_CONTA], [id_FI_ACRESC_TARIFA], [valor_acresc_tarifa_FI_CONTA], [dtInc_FI_CONTA], [data_baixa_FI_CONTA], [id_FI_BANCOS_destino], [valor_pago_FI_CONTA], [dtAlt_FI_CONTA], [id_PS_PESSOA_inc], [id_PS_PESSOA_alt]) VALUES (@tipo_FI_CONTA, @cliente_fornecedor_FI_CONTA, @historico_FI_CONTA, @numero_no_banco_FI_CONTA, @numero_documento_FI_CONTA, @vencimento_FI_CONTA, @vencimento_original_FI_CONTA, @data_emissao_FI_CONTA, @valor_FI_CONTA, @id_FI_SUBCATEGORIA, @id_FI_BANCOS, @id_FI_OCORRENCIAS, @id_FI_STATUS_CONTA, @dia_vencimento_FI_CONTA, @exibe_caixa_FI_CONTA, @id_FI_ACRESC_TARIFA, @valor_acresc_tarifa_FI_CONTA, @dtInc_FI_CONTA, @data_baixa_FI_CONTA, @id_FI_BANCOS_destino, @valor_pago_FI_CONTA, @dtAlt_FI_CONTA, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_CONTA, cliente_fornecedor_FI_CONTA, vencimento_FI_CONTA, valor_FI_CONTA, id_FI_STATUS_CONTA, numero_no_banco_FI_CONTA, numero_documento_FI_CONTA FROM FI_CONTA" UpdateCommand="UPDATE FI_CONTA SET tipo_FI_CONTA = @tipo_FI_CONTA, cliente_fornecedor_FI_CONTA = @cliente_fornecedor_FI_CONTA, historico_FI_CONTA = @historico_FI_CONTA, numero_no_banco_FI_CONTA = @numero_no_banco_FI_CONTA, numero_documento_FI_CONTA = @numero_documento_FI_CONTA, vencimento_FI_CONTA = @vencimento_FI_CONTA, vencimento_original_FI_CONTA = @vencimento_original_FI_CONTA, data_emissao_FI_CONTA = @data_emissao_FI_CONTA, valor_FI_CONTA = @valor_FI_CONTA, id_FI_SUBCATEGORIA = @id_FI_SUBCATEGORIA, id_FI_BANCOS = @id_FI_BANCOS, id_FI_OCORRENCIAS = @id_FI_OCORRENCIAS, id_FI_STATUS_CONTA = @id_FI_STATUS_CONTA, dia_vencimento_FI_CONTA = @dia_vencimento_FI_CONTA, exibe_caixa_FI_CONTA = @exibe_caixa_FI_CONTA, id_FI_ACRESC_TARIFA = @id_FI_ACRESC_TARIFA, valor_acresc_tarifa_FI_CONTA = @valor_acresc_tarifa_FI_CONTA, dtInc_FI_CONTA = @dtInc_FI_CONTA, data_baixa_FI_CONTA = @data_baixa_FI_CONTA, id_FI_BANCOS_destino = @id_FI_BANCOS_destino, valor_pago_FI_CONTA = @valor_pago_FI_CONTA, dtAlt_FI_CONTA = @dtAlt_FI_CONTA, id_PS_PESSOA_inc = @id_PS_PESSOA_inc, id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_CONTA = @id_FI_CONTA)">
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
            <asp:Parameter Name="dtInc_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="data_baixa_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="id_FI_BANCOS_destino" Type="Int32" />
            <asp:Parameter Name="valor_pago_FI_CONTA" Type="Double" />
            <asp:Parameter Name="dtAlt_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="dtInc_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="data_baixa_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="id_FI_BANCOS_destino" Type="Int32" />
            <asp:Parameter Name="valor_pago_FI_CONTA" Type="Double" />
            <asp:Parameter Name="dtAlt_FI_CONTA" Type="DateTime" />
            <asp:Parameter Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_CONTA" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
