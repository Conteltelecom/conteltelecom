<%@ Page Title="FATURAS DE CLIENTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="anexos_solicitacao_fatura.aspx.vb" Inherits="conteltelecom.anexos_solicitacao_fatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">


    <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
            var grid = $find("<%= RadGridMostraFaturas.ClientID %>");
            if (arg) {

                grid.get_masterTableView().fireCommand("Delete", 0);
            }
        }
    </script>


    <style>
        .RadGrid_Bootstrap .rgRow [type="text"], .RadGrid_Bootstrap .rgAltRow [type="text"], .RadGrid_Bootstrap .rgEditForm [type="text"] {
            border: 0px !important;
        }
    </style>




    <%-- filtro --%>
    <fieldset>
        <div class="panel panel-default">
            <div class="panel-body">
                
                <legend>FILTRO</legend>
                <div class="form-horizontal">
                    <br />

                    <div class="form-group">
                        <asp:Label ID="Label1" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="MÊS DE REFERÊNCIA:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDatePicker Width="95%" ID="RadDatePickerPeriodoInicial" runat="server">
                                <DateInput ID="DateInput1" DateFormat="MMMM yyyy" Width="95%" runat="server" Enabled="true">
                                </DateInput>
                            </telerik:RadDatePicker>
                        </div>
                        <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="CÓD/LINHA:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxCodLinha" runat="server" DataSourceID="SqlDataSourceLinhasBusca" CssClass=""  MaxResultCount="10" MinFilterLength="2" TextSettings-SelectionMode="Single" InputType="Text" DataValueField="codLinha_LI_LINHAS" DataTextField="codLinha_LI_LINHAS" Width="95%" AutoPostBack="true"></telerik:RadAutoCompleteBox>
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align: right">
                        <hr />
                        <div>
                            <telerik:RadButton ID="RadButtonPesquisar" OnClick="RadButtonPesquisar_Click" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                                <Icon PrimaryIconUrl="../../../img/search.png" />
                            </telerik:RadButton>
                            <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR">
                                <Icon PrimaryIconUrl="../../../img/Limpar.png" />
                            </telerik:RadButton>
                        </div>
                    </div>

                </div><!-- fim form-horizontal -->
            </div><!-- fim panel-body -->
        </div><!-- fim panel panel-default -->
    </fieldset>
    <hr />
    <br />


    <telerik:RadGrid ID="RadGridMostraFaturas" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaAnexos" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings EnablePostBackOnRowClick="true"></ClientSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView Name="Master" DataSourceID="SqlDataSourceBuscaAnexos" DataKeyNames="id_ANEXOS_FATURAS,id_SF_LEITURA_FATURA">
            <DetailTables>
                <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceLInhas" Name="Linhas" DataKeyNames="id_SF_SOLICITACAO_FATURA_NOTA">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_SF_LEITURA_FATURA" MasterKeyField="id_SF_LEITURA_FATURA" />
                    </ParentTableRelation>
                    <Columns>
                        <telerik:GridBoundColumn DataField="id_SF_SOLICITACAO_FATURA_NOTA" FilterControlAltText="Filter id_SF_SOLICITACAO_FATURA_NOTA column" HeaderText="ID" UniqueName="id_SF_SOLICITACAO_FATURA_NOTA">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA" FilterControlAltText="Filter numFone column" HeaderText="CÓD/LINHA" UniqueName="numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA">
                            <HeaderStyle CssClass="col-xs-10" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vlTotal_SF_SOLICITACAO_FATURA_NOTA" FilterControlAltText="Filter vlTotal_SF_SOLICITACAO_FATURA_NOTA column" HeaderText="VALOR" UniqueName="vlTotal_SF_SOLICITACAO_FATURA_NOTA">
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridBoundColumn>
                        <telerik:GridEditCommandColumn>
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                        </EditColumn>
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
                                                <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="NOTA FISCAL:"></asp:Label>
                                            </th>
                                            <th>
                                                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="CONTRATO AGRUPADO:"></asp:Label>

                                            </th>
                                            <th>
                                                <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="TELEFONE AGRUPADO:"></asp:Label>
                                            </th>
                                            <th>
                                                <asp:Label ID="Label9" runat="server" Font-Bold="true" Text="TIPO PESSOA:"></asp:Label>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="rgEditRow">
                                            <td class="col-xs-3">
                                                <telerik:RadMaskedTextBox ID="RadMaskedTextBoxnumNotaFiscal_SF_SOLICITACAO_FATURA_NOTA" Mask="###.###.###" Skin="Bootstrap" Text='<%# Bind("numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA") %>' runat="server" Width="95%"></telerik:RadMaskedTextBox>

                                            </td>

                                            <td class="col-xs-3">
                                                <asp:Label ID="LabelcotAgrupado_SF_LEITURA_FATURA" runat="server" Visible="false" Text='<%# Bind("cotAgrupado_SF_SOLICITACAO_FATURA_NOTA") %>'></asp:Label>
                                                <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxContratoAgrupado" OnTextChanged="RadAutoCompleteBoxContratoAgrupado_TextChanged" MaxResultCount="10" MinFilterLength="2" TextSettings-SelectionMode="Single" InputType="Text" DataValueField="id_LI_LINHAS" Width="95%" AutoPostBack="true" DataSourceID="SqlDataSourceBuscaContratoAuto" DataTextField="numContrato_LI_LINHAS" runat="server" Culture="pt-BR" Localization-ShowAllResults="Mostrar Todos"></telerik:RadAutoCompleteBox>


                                            </td>
                                            <td class="col-xs-3">

                                                <asp:Label ID="LabelFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA" runat="server" Text='<%# Bind("numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA") %>'></asp:Label>

                                            </td>
                                            <td class="col-xs-3">
                                                <telerik:RadComboBox ID="RadComboBoxTipoPessoa" AutoPostBack="true" OnSelectedIndexChanged="RadComboBoxTipoPessoa_SelectedIndexChanged" DataSourceID="SqlDataSourceBuscaTipoPessoa" DataTextField="desc_PS_TIPO_PESSOA" DataValueField="cod_PS_TIPO_PESSOA" runat="server" Width="95%"></telerik:RadComboBox>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <thead>

                                        <tr>
                                            <th>
                                                <asp:Label ID="Label10" runat="server" Font-Bold="true" Text="CPF/CNPJ:"></asp:Label>
                                            </th>
                                            <th>
                                                <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="VALOR CÓD/LINHA:"></asp:Label>
                                            </th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="rgEditRow">
                                            <td class="col-xs-3">
                                                <asp:Label ID="Labelcnpj_SF_SOLICITACAO_FATURA_NOTA" runat="server" Font-Bold="true" Text='<%# Bind("cnpj_SF_SOLICITACAO_FATURA_NOTA") %>'></asp:Label>


                                            </td>
                                            <td class="col-xs-3">
                                                <telerik:RadNumericTextBox NumberFormat-DecimalDigits="2" DbValue='<%# Bind("vlTotal_SF_SOLICITACAO_FATURA_NOTA") %>' ID="RadNumericTextBoxvlTotal_SF_SOLICITACAO_FATURA_NOTA" runat="server" Width="95%"></telerik:RadNumericTextBox>
                                            </td>
                                            <td class="col-xs-3"></td>
                                            <td class="col-xs-3"></td>
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
                                </table>

                            </fieldset>
                        </FormTemplate>
                    </EditFormSettings>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridBoundColumn DataField="id_ANEXOS_FATURAS" DataType="System.Int32" FilterControlAltText="Filter id_ANEXOS_FATURAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_ANEXOS_FATURAS" UniqueName="id_ANEXOS_FATURAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                    <ItemStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mesReferencia_SF_LEITURA_FATURA" FilterControlAltText="Filter mesReferencia_SF_LEITURA_FATURA column" HeaderText="MÊS REF" SortExpression="mesReferencia_SF_LEITURA_FATURA" UniqueName="mesReferencia_SF_LEITURA_FATURA">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mesReferencia_SF_LEITURA_FATURALabel" runat="server" Text='<%# Eval("mesReferencia_SF_LEITURA_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                    <ItemStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtVencimento_SF_LEITURA_FATURA" DataType="System.DateTime" FilterControlAltText="Filter dtVencimento_SF_LEITURA_FATURA column" HeaderText="DT VENC." SortExpression="dtVencimento_SF_LEITURA_FATURA" UniqueName="dtVencimento_SF_LEITURA_FATURA">
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="dtVencimento_SF_LEITURA_FATURALabel" runat="server" Text='<%# Eval("dtVencimento_SF_LEITURA_FATURA", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                    <ItemStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="vlTotal_SF_CAD_LEIAUTE" DataType="System.Decimal" FilterControlAltText="Filter vlTotal_SF_CAD_LEIAUTE column" HeaderText="VL TOTAL" SortExpression="vlTotal_SF_CAD_LEIAUTE" UniqueName="vlTotal_SF_CAD_LEIAUTE" ReadOnly="True">
                    <EditItemTemplate>

                        <telerik:RadNumericTextBox ID="vlTotal_SF_CAD_LEIAUTETextBox" runat="server" Text='<%# Bind("vlTotal_SF_CAD_LEIAUTE") %>' NumberFormat-DecimalDigits="2" Width="95%"></telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vlTotal_SF_CAD_LEIAUTELabel" runat="server" Text='<%# Eval("vlTotal_SF_CAD_LEIAUTE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                    <ItemStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                    <ItemTemplate>
                        <asp:Label ID="HiddenFieldid_SF_LEITURA_FATURA" Visible="false" Text='<%# Bind("id_SF_LEITURA_FATURA") %>' runat="server" />
                        <asp:Label ID="HiddenFieldcaminho_ANEXOS_FATURAS" Visible="false" Text='<%# Bind("caminho_ANEXOS_FATURAS") %>' runat="server" />
                        <asp:HyperLink ID="VISUALIZAR" runat="server" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "0") %>' Target="_blank" ImageUrl="~/img/pdf_Visualizar_32.png"></asp:HyperLink>
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>


                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                    <ItemTemplate>
                        <asp:HyperLink ID="Baixar" runat="server" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "1") %>' Target="_blank" ImageUrl="~/img/pdf_32.png"></asp:HyperLink>
                    </ItemTemplate>

                </telerik:GridTemplateColumn>

                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" ItemStyle-CssClass="rgEditForm" ConfirmText="ATENÇÃO O REGISTRO SERA EXCLUÍDO" ButtonType="ImageButton" ButtonCssClass="rgEditForm" ImageUrl="~\img\delete_32.png" CommandName="DeleteNovo" UniqueName="Delete">

                    <ItemStyle CssClass="rgEditForm"></ItemStyle>

                </telerik:GridButtonColumn>

            </Columns>
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
                                        <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="CONTRATO AGRUPADOR:"></asp:Label>

                                    </th>
                                    <th>
                                        <asp:Label ID="Label7" runat="server" Font-Bold="true" Text="OPERADORA"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="TELEFONE AGRUPADOR:"></asp:Label>
                                    </th>

                                    <th>
                                        <asp:Label ID="Label6" runat="server" Font-Bold="true" Text="MÊS REFERÊNCIA:"></asp:Label>

                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <asp:Label ID="LabelcotAgrupador_SF_LEITURA_FATURA" runat="server" Visible="false" Text='<%# Eval("cotAgrupador_SF_LEITURA_FATURA") %>'></asp:Label>
                                        <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxContratoAgrupador" CssClass="" OnTextChanged="RadAutoCompleteBoxContratoAgrupador_TextChanged" MaxResultCount="10" MinFilterLength="2" TextSettings-SelectionMode="Single" InputType="Text" DataValueField="id_LI_LINHAS" Width="95%" AutoPostBack="true" DataSourceID="SqlDataSourceBuscaContratoAuto" DataTextField="numContrato_LI_LINHAS" runat="server" Culture="pt-BR"></telerik:RadAutoCompleteBox>
                                    </td>
                                    <td class="col-xs-3">
                                        <asp:Label ID="LabelIdOperadora" runat="server" Visible="false" Text='<%# Bind("id_OP_OPERADORAS") %>'></asp:Label>
                                        <asp:Label ID="LabelOperadora" runat="server" Text='<%# Bind("desc_OP_OPERADORAS") %>'></asp:Label>

                                    </td>
                                    <td class="col-xs-3">
                                        <asp:Label ID="LabelnumFoneAgrupador_SF_LEITURA_FATURA" runat="server" Text='<%# Bind("numFoneAgrupador_SF_LEITURA_FATURA") %>'></asp:Label>

                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadMaskedTextBox ID="RadTextBoxMesAno" Mask="<1..12>/<2000..2050>" Width="95%" runat="server" Skin="Bootstrap" LabelWidth="40%" Text='<%# Bind("mesReferencia_SF_LEITURA_FATURA") %>'></telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                            </tbody>
                            <thead>

                                <tr>
                                    <th>

                                        <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="NÚMERO DA FATURA:"></asp:Label>
                                    </th>
                                    <th>

                                        <asp:Label ID="Label8" runat="server" Font-Bold="true" Text="VENCIMENTO"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label12" runat="server" Font-Bold="true" Text="PERÍODO INICIAL"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label13" runat="server" Font-Bold="true" Text="PERÍODO FINAL"></asp:Label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <telerik:RadMaskedTextBox ID="RadNumericTextBoxNumFatura" runat="server" Culture="pt-BR" Text='<%# Bind("numFatura_SF_LEITURA_FATURA") %>' Mask="########################" Width="95%"></telerik:RadMaskedTextBox>

                                    </td>
                                    <td class="col-xs-3">
                                        <asp:Label ID="id_ANEXOS_FATURAS" runat="server" Visible="false" Text='<%#Eval("id_ANEXOS_FATURAS") %>'></asp:Label>
                                        <asp:Label ID="Labelid_SF_LEITURA_FATURA" runat="server" Visible="false" Text='<%#Eval("id_SF_LEITURA_FATURA") %>'></asp:Label>
                                        <asp:Label ID="Labelcaminho_ANEXOS_FATURAS" runat="server" Visible="false" Text='<%#Eval("caminho_ANEXOS_FATURAS") %>'></asp:Label>
                                        <telerik:RadDatePicker ID="RadDatePickerdtVencimento_SF_LEITURA_FATURA" Width="95%" runat="server" Culture="pt-BR" DbSelectedDate='<%# Bind("dtVencimento_SF_LEITURA_FATURA") %>' MinDate="1970-01-01"></telerik:RadDatePicker>

                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadDatePicker ID="RadDatePickerIni" DbSelectedDate='<%#Bind("dtPeriodo_ini_SF_LEITURA_FATURA") %>' runat="server" Width="95%"></telerik:RadDatePicker>
                                    </td>
                                    <td class="col-xs-3">
                                        <telerik:RadDatePicker ID="RadDatePickerFim" DbSelectedDate='<%#Bind("dtPeriodo_Fim_SF_LEITURA_FATURA") %>' runat="server" Width="95%"></telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </tbody>
                            <thead>

                                <tr>
                                    <th>
                                        <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="ANEXOS"></asp:Label>
                                    </th>
                                    <th></th>
                                    <th></th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3">
                                        <telerik:RadAsyncUpload MultipleFileSelection="Disabled" InputSize="2" ID="RadAsyncUploadAnexos" AllowedFileExtensions=".pdf" MaxFileInputsCount="1" Width="95%" Localization-Select="..." runat="server"></telerik:RadAsyncUpload>
                                    </td>
                                    <td class="col-xs-3"></td>
                                    <td class="col-xs-3"></td>
                                    <td class="col-xs-3"></td>
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
                        </table>

                    </fieldset>
                </FormTemplate>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>



    <%-- mensagem de erro do try catch --%>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>



    <asp:SqlDataSource ID="SqlDataSourceBuscaAnexos" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT ANEXOS_FATURAS.id_ANEXOS_FATURAS, ANEXOS_FATURAS.desc_ANEXOS_FATURAS, SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA, SF_LEITURA_FATURA.id_OP_OPERADORAS, SF_LEITURA_FATURA.vlTotal_SF_CAD_LEIAUTE, OP_OPERADORAS.desc_OP_OPERADORAS, ANEXOS_FATURAS.caminho_ANEXOS_FATURAS, SF_LEITURA_FATURA.id_SF_LEITURA_FATURA, SF_LEITURA_FATURA.numFatura_SF_LEITURA_FATURA, SF_LEITURA_FATURA.numFoneAgrupador_SF_LEITURA_FATURA, SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtPeriodo_ini_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtPeriodo_Fim_SF_LEITURA_FATURA FROM ANEXOS_FATURAS INNER JOIN SF_LEITURA_FATURA ON ANEXOS_FATURAS.id_SF_LEITURA_FATURA = SF_LEITURA_FATURA.id_SF_LEITURA_FATURA INNER JOIN OP_OPERADORAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN LI_LINHAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = LI_LINHAS.id_OP_OPERADORAS AND dbo.MascaraSomenteNumeros(SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA) = dbo.MascaraSomenteNumeros(LI_LINHAS.numContrato_LI_LINHAS) INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA = @mesReferencia_SF_LEITURA_FATURA)" DeleteCommand="DELETE FROM SF_LEITURA_FATURA WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)" InsertCommand="INSERT INTO ANEXOS_FATURAS(desc_ANEXOS_FATURAS, caminho_ANEXOS_FATURAS, id_SF_LEITURA_FATURA, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@desc_ANEXOS_FATURAS, @caminho_ANEXOS_FATURAS, @id_SF_LEITURA_FATURA, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" UpdateCommand="UPDATE SF_LEITURA_FATURA SET numFatura_SF_LEITURA_FATURA = @numFatura_SF_LEITURA_FATURA, mesReferencia_SF_LEITURA_FATURA = @mesReferencia_SF_LEITURA_FATURA, dtVencimento_SF_LEITURA_FATURA = @dtVencimento_SF_LEITURA_FATURA, dtAlt_SF_LEITURA_FATURA = GETDATE(), dtPeriodo_ini_SF_LEITURA_FATURA = @dtPeriodo_ini_SF_LEITURA_FATURA, dtPeriodo_Fim_SF_LEITURA_FATURA = @dtPeriodo_Fim_SF_LEITURA_FATURA, id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_ANEXOS_FATURAS" />
            <asp:Parameter Name="caminho_ANEXOS_FATURAS" />
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
                <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
                    <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="mesReferencia_SF_LEITURA_FATURA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="numFatura_SF_LEITURA_FATURA" />
            <asp:Parameter Name="mesReferencia_SF_LEITURA_FATURA" />
            <asp:Parameter Name="dtVencimento_SF_LEITURA_FATURA" />
            <asp:Parameter Name="dtPeriodo_ini_SF_LEITURA_FATURA" />
            <asp:Parameter Name="dtPeriodo_Fim_SF_LEITURA_FATURA" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceLInhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_SF_SOLICITACAO_FATURA_NOTA, dbo.MascaraTelefone(numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA) AS numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA, cnpj_SF_SOLICITACAO_FATURA_NOTA, vlTotal_SF_SOLICITACAO_FATURA_NOTA, numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA, numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA AS Expr1, cotAgrupado_SF_SOLICITACAO_FATURA_NOTA FROM SF_SOLICITACAO_FATURA_NOTA WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)" InsertCommand="INSERT INTO SF_SOLICITACAO_FATURA_NOTA(id_SF_LEITURA_FATURA, numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA, numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA, cotAgrupado_SF_SOLICITACAO_FATURA_NOTA, cnpj_SF_SOLICITACAO_FATURA_NOTA, vlTotal_SF_SOLICITACAO_FATURA_NOTA, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@id_SF_LEITURA_FATURA, @numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA, @numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA, @cotAgrupado_SF_SOLICITACAO_FATURA_NOTA, @cnpj_SF_SOLICITACAO_FATURA_NOTA, @vlTotal_SF_SOLICITACAO_FATURA_NOTA, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" UpdateCommand="UPDATE SF_SOLICITACAO_FATURA_NOTA SET numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA = @numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA, vlTotal_SF_SOLICITACAO_FATURA_NOTA = @vlTotal_SF_SOLICITACAO_FATURA_NOTA, dtAlt_SF_SOLICITACAO_FATURA_NOTA = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_SF_SOLICITACAO_FATURA_NOTA = @id_SF_SOLICITACAO_FATURA_NOTA)" DeleteCommand="DELETE FROM SF_SOLICITACAO_FATURA_NOTA WHERE (id_SF_SOLICITACAO_FATURA_NOTA = @id_SF_SOLICITACAO_FATURA_NOTA)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_SOLICITACAO_FATURA_NOTA" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
            <asp:Parameter Name="numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA" />
            <asp:Parameter Name="numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA" />
            <asp:Parameter Name="cotAgrupado_SF_SOLICITACAO_FATURA_NOTA" />
            <asp:Parameter Name="cnpj_SF_SOLICITACAO_FATURA_NOTA" />
            <asp:Parameter Name="vlTotal_SF_SOLICITACAO_FATURA_NOTA" />
                <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
                      <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA" />
            <asp:Parameter Name="vlTotal_SF_SOLICITACAO_FATURA_NOTA" />
                        <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_SF_SOLICITACAO_FATURA_NOTA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server"></telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_OP_OPERADORAS, desc_OP_OPERADORAS FROM View_DropDownCadOperadoras" DeleteCommand="DELETE FROM ANEXOS_FATURAS WHERE (id_ANEXOS_FATURAS = @id_ANEXOS_FATURAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_ANEXOS_FATURAS" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaTipoPessoa" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_PS_TIPO_PESSOA, cod_PS_TIPO_PESSOA FROM View_DropDownCadPessoasFisica_ou_Jur ORDER BY desc_PS_TIPO_PESSOA DESC"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceBuscaContrato" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_JURIDICA.CNPJ_PS_JURIDICA, dbo.MascaraSomenteNumeros(LI_LINHAS.codLinha_LI_LINHAS) AS codLinha_LI_LINHAS, LI_LINHAS.id_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA WHERE (LI_LINHAS.id_LI_LINHAS = @id_LI_LINHAS)">
    <SelectParameters>
        <asp:Parameter Name="id_LI_LINHAS" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaContratoAuto" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.numContrato_LI_LINHAS, LI_LINHAS.id_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.st_LI_LINHAS = 1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaItensatura" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT mesReferencia_SF_LEITURA_FATURA, dtVencimento_SF_LEITURA_FATURA, dtPeriodo_ini_SF_LEITURA_FATURA, dtPeriodo_Fim_SF_LEITURA_FATURA, id_SF_LEITURA_FATURA FROM SF_LEITURA_FATURA WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)">
        <SelectParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaOperadora_Cod" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.codLinha_LI_LINHAS, OP_OPERADORAS.id_OP_OPERADORAS FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS WHERE (LI_LINHAS.id_LI_LINHAS = @id_LI_LINHAS)">
        <SelectParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource runat="server" ID="SqlDataSourceLinhasBusca" ConnectionString='<%$ ConnectionStrings:conteltelecom %>' SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.st_LI_LINHAS = 1)"></asp:SqlDataSource>

</asp:Content>

