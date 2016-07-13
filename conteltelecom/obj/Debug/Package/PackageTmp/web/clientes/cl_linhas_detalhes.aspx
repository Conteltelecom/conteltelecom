<%@ Page Title="DETALHES DE LINHAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_linhas_detalhes.aspx.vb" Inherits="conteltelecom.cl_linhas_detalhes" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    
    <telerik:RadGrid ID="RadGridLinhas"  AllowMultiRowEdit="True"  runat="server" AutoGenerateColumns="False" Culture="pt-BR"  DataSourceID="SqlDataSourceContatosLinhas"  Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView Name="Master" DataKeyNames="numLinha_LI_LINHAS"  DataSourceID="SqlDataSourceContatosLinhas"   HierarchyDefaultExpanded="true" EditMode="InPlace"  CommandItemDisplay="Bottom" ExpandCollapseColumn-Display = "false"   ExpandCollapseColumn-Visible = "false" >
            <CommandItemTemplate>
                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
            </CommandItemTemplate>
              <ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
           
            <DetailTables>
                <telerik:GridTableView runat="server" DataKeyNames="numLinha_LI_LINHAS" Name="DetailVlLinha" EditMode="InPlace" DataSourceID="SqlDataSourceContatosLinhas" > 
                    <Columns>
                        
                        <telerik:GridTemplateColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" UniqueName="numLinha_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadMaskedTextBox Width="100%"  ID="numLinha_LI_LINHASRadMaskedTextBox" runat="server" Mask="(##)####-#####" Text='<%# Bind("numLinha_LI_LINHAS") %>'>
                                </telerik:RadMaskedTextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="numLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("numLinha_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn DataField="id_LI_TIPOS" FilterControlAltText="Filter id_LI_TIPOS column" HeaderText="TIPO" UniqueName="id_LI_TIPOS">
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="id_LI_TIPOSRadComboBox" AppendDataBoundItems="false"  runat="server" DataSourceID="SqlDataSourceTipoLinha" DataTextField="desc_LI_TIPOS" DataValueField="id_LI_TIPOS" SelectedValue='<%# Bind("id_LI_TIPOS") %>' Width="100%">
                                </telerik:RadComboBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id_LI_TIPOSLabel" runat="server" Text='<%# Eval("desc_LI_TIPOS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="vlInicial_id_LI_TIPOS" FilterControlAltText="Filter vlInicial_id_LI_TIPOS column" HeaderText="VALOR INICIAL" UniqueName="vlInicial_id_LI_TIPOS">
                            <EditItemTemplate>

                                <telerik:RadNumericTextBox ID="vlInicial_id_LI_TIPOSRadNumericTextBox" runat="server" DbValue='<%# Bind("vlInicial_id_LI_TIPOS") %>' Width="100%" Type="Number">
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorvlInicial_id_LI_TIPOS" ControlToValidate="vlInicial_id_LI_TIPOSRadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="vlInicial_id_LI_TIPOSLabel" runat="server" Text='<%# Eval("vlInicial_id_LI_TIPOS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="vlIdeal_LI_LINHAS"  FilterControlAltText="Filter vlIdeal_LI_LINHAS column" HeaderText="VALOR IDEAL" UniqueName="vlIdeal_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="vlIdeal_LI_LINHASRadNumericTextBox" MaxValue="15" Width="100%" runat="server" DbValue='<%# Bind("vlIdeal_LI_LINHAS") %>' Type="Number">
                                </telerik:RadNumericTextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="vlIdeal_LI_LINHASLabel" runat="server" Text='<%# Eval("vlIdeal_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
                <telerik:GridTableView runat="server" DataKeyNames="numLinha_LI_LINHAS" DataSourceID="SqlDataSourceContatosLinhas" Name="DetailTableDta" EditMode="InPlace">
                    <Columns>
                        <telerik:GridTemplateColumn DataField="diaVenc_LI_LINHAS" FilterControlAltText="Filter diaVenc_LI_LINHAS column" HeaderText="DIA VENCIMENTO" UniqueName="diaVenc_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox Width ="100%" ID="diaVenc_LI_LINHASTextBox" MaxLength="2" runat="server" Text='<%# Bind("diaVenc_LI_LINHAS") %>' MaxValue="31" MinValue ="1">
                                    <NumberFormat DecimalDigits="0" />
                                </telerik:RadNumericTextBox>
                                                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="diaVenc_LI_LINHASLabel" runat="server" Text='<%# Eval("diaVenc_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="perIncial_LI_LINHAS" FilterControlAltText="Filter perIncial_LI_LINHAS column" HeaderText="PERÍODO INICIAL" UniqueName="perIncial_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadMaskedTextBox Width ="100%" ID="perIncial_LI_LINHASTextBox" Mask="<1..12>/<2000..2050>"   runat="server" Text='<%# Bind("perIncial_LI_LINHAS") %>'></telerik:RadMaskedTextBox>
                                           
                            
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="perIncial_LI_LINHASLabel" runat="server" Text='<%# Eval("perIncial_LI_LINHAS", "##/####") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="numF_LI_LINHAS" FilterControlAltText="Filter numF_LI_LINHAS column" HeaderText="Nº CANCELAMENTO F" UniqueName="numF_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="numF_LI_LINHASTextBox" runat="server" Text='<%# Bind("numF_LI_LINHAS") %>' Width="100%"></telerik:RadTextBox>
                                                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="numF_LI_LINHASLabel" runat="server" Text='<%# Eval("numF_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="nomeUnidade_LI_LINHAS" FilterControlAltText="Filter numF_LI_LINHAS column" HeaderText="UNIDADE" UniqueName="nomeUnidade_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="RadDropDownListUniidades" DataSourceID="ObjectDataSourceUnidadesClinetes" runat="server"  AppendDataBoundItems="true"  DataTextField="desc_CL_UNIDADES" DataValueField="desc_CL_UNIDADES" DropDownHeight="150px" SelectedValue='<%# Bind("nomeUnidade_LI_LINHAS") %>' Skin="Bootstrap"  ></telerik:RadDropDownList>

                                                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="nomeUnidade_LI_LINHASLabel" runat="server" Text='<%# Eval("nomeUnidade_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
                <telerik:GridTableView runat="server" DataKeyNames="numLinha_LI_LINHAS" DataSourceID="SqlDataSourceContatosLinhas" EditMode="InPlace" Name="ForaAnalise">
                    <Columns>
                        <telerik:GridCheckBoxColumn DataField="foraAnalise_LI_LINHAS" DataType="System.Boolean" FilterControlAltText="Filter foraAnalise_LI_LINHAS column" HeaderText="LINHA FORA DE ANÁLISE" StringFalseValue="0" StringTrueValue="1" UniqueName="foraAnalise_LI_LINHAS" DefaultInsertValue="1">
                            <HeaderStyle CssClass="col-lg-3" />
                        </telerik:GridCheckBoxColumn>
                         <telerik:GridCheckBoxColumn DataField="liCancelada_LI_LINHAS" DataType="System.Boolean" FilterControlAltText="Filter liCancelada_LI_LINHAS column" HeaderText="LINHA CANCELADA" StringFalseValue="0" StringTrueValue="1" UniqueName="liCancelada_LI_LINHAS" DefaultInsertValue="1">
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridCheckBoxColumn>
                    </Columns>
                </telerik:GridTableView>
                <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceContatosLinhas" Name="DetailTableUFcidade" Caption="ENDEREÇO DE INSTALAÇÃO DA LINHA" EditMode="InPlace" DataKeyNames="numLinha_LI_LINHAS">
                    <Columns>
                        <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF" UniqueName="cod_PS_UF">
                            <EditItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" >
                                    <ContentTemplate>
                                        <telerik:RadDropDownList  Width ="100%"  ID="RadDropDownListUf" runat="server" AppendDataBoundItems="true"  DataSourceID="SqlDataSourceUF"  OnSelectedIndexChanged="RadDropDownListUf_SelectedIndexChanged1" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" SelectedValue='<%# Eval("cod_PS_UF") %>' AutoPostBack="true" DefaultMessage=" " ></telerik:RadDropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                       
                                    
                                                           
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="id_PS_CIDADES" FilterControlAltText="Filter id_PS_CIDADES column" HeaderText="CIDADE" UniqueName="id_PS_CIDADES">
                            <EditItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="LabelDropCidades" runat="server" Text='<%# Eval("id_PS_CIDADES") %>' Visible="false"  ></asp:Label>
                                        <asp:Label ID="LabelDropCidadesNomes" runat="server" Text='<%# Eval("desc_PS_CIDADES") %>' Visible ="false" ></asp:Label>
                                                                      
                                        <telerik:RadDropDownList ID="RadDropDownListCidades"  CausesValidation = "False"  runat="server" DataSourceID="SqlDataSourceDropGrid"  Width ="100%" DataTextField="desc_PS_CIDADES"  DataValueField="id_PS_CIDADES"   ></telerik:RadDropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                        
                                   
                               
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id_PS_CIDADESLabel" runat="server" Text='<%# Eval("id_PS_CIDADES") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="bairro_LI_LINHAS" FilterControlAltText="Filter column2 column" HeaderText="BAIRRO" UniqueName="bairro_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="bairro_LI_LINHASTextBox" runat="server" Text='<%# Bind("bairro_LI_LINHAS") %>'  Width ="100%"></telerik:RadTextBox>
                                                           </EditItemTemplate>
                            <ItemTemplate>

                                <asp:Label ID="bairro_LI_LINHASLabel" runat="server" Text='<%# Eval("bairro_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="rua_LI_LINHAS" FilterControlAltText="Filter column3 column" HeaderText="RUA" UniqueName="rua_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadTextBox  ID="rua_LI_LINHASTextBox" runat="server" Text='<%# Bind("rua_LI_LINHAS") %>'  Width ="100%" ></telerik:RadTextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="rua_LI_LINHASLabel" runat="server" Text='<%# Eval("rua_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
                <telerik:GridTableView runat="server" DataKeyNames="numLinha_LI_LINHAS" DataSourceID="SqlDataSourceContatosLinhas" Name="DetailTableCep" EditMode="InPlace">
                    <Columns>
                        <telerik:GridTemplateColumn DataField="cep_LI_LINHAS" FilterControlAltText="Filter cep_LI_LINHAS column" HeaderText="CEP" UniqueName="cep_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadMaskedTextBox ID="cep_LI_LINHASRadMaskedTextBox" runat="server" Mask="#####-###"  Text='<%# Bind("cep_LI_LINHAS") %>' Width="100%">
                                </telerik:RadMaskedTextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="cep_LI_LINHASLabel" runat="server" Text='<%# Eval("cep_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="numEndereco_LI_LINHAS" FilterControlAltText="Filter numEndereco_LI_LINHAS column" HeaderText="NÚMERO" UniqueName="numEndereco_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="numEndereco_LI_LINHASRadNumericTextBox" runat="server" MaxLength="10"    Width ="100%" DbValue='<%# Bind("numEndereco_LI_LINHAS") %>' Type="Number">
                                    <NumberFormat DecimalDigits="0" GroupSeparator =""/>
                                </telerik:RadNumericTextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="numEndereco_LI_LINHASLabel" runat="server" Text='<%# Eval("numEndereco_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="complemeto_LI_LINHAS" FilterControlAltText="Filter complemeto_LI_LINHAS column" HeaderText="COMPLEMENTO" UniqueName="complemeto_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="complemeto_LI_LINHASTextBox" maxlenght="15" runat="server" Text='<%# Bind("complemeto_LI_LINHAS") %>'  Width ="100%" ></telerik:RadTextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="complemeto_LI_LINHASLabel" runat="server" Text='<%# Eval("complemeto_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-lg-6" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
                <telerik:GridTableView runat="server" DataKeyNames="numLinha_LI_LINHAS" DataSourceID="SqlDataSourceContatosLinhas" Name="DetailTableObservacoes" EditMode="InPlace">
                    <Columns>
                        <telerik:GridTemplateColumn DataField="obs_LI_LINHAS" FilterControlAltText="Filter obs_LI_LINHAS column" HeaderText="OBSERVAÇÕES" UniqueName="obs_LI_LINHAS">
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="obs_LI_LINHASTextBox" runat="server" Height="150px" Text='<%# Bind("obs_LI_LINHAS") %>' TextMode="MultiLine" Width="100%"></telerik:RadTextBox>
                                     </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="obs_LI_LINHASLabel" runat="server" Text='<%# Eval("obs_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-lg-12" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="CÓD LINHA" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                      <telerik:RadTextBox ID="codLinha_LI_LINHASTextBox" runat="server" Text='<%# Bind("codLinha_LI_LINHAS") %>' Width="95%"></telerik:RadTextBox>
                        <asp:Label ID="codLinha_LI_LINHASLabel1" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>' Visible ="false"  ></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcodLinha_LI_LINHAS" ControlToValidate="codLinha_LI_LINHASTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_OP_OPERADORAS" FilterControlAltText="Filter column column" HeaderText="OPERADORA" UniqueName="OPERADORA" ReadOnly="false" > 
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="id_OP_OPERADORASRadComboBox" AppendDataBoundItems="true"  Width="100%"  runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>'>
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="numContrato_LI_LINHAS" FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="Nº CONTRATO" UniqueName="numContrato_LI_LINHAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="numContrato_LI_LINHASTextBox" runat="server" Text='<%# Bind("numContrato_LI_LINHAS") %>' Width="100%"></telerik:RadTextBox>
                                            </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="numContrato_LI_LINHASLabel" runat="server" Text='<%# Eval("numContrato_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="SITUAÇÃO" StringFalseValue="0" StringTrueValue="1" UniqueName="st_LI_LINHAS" DataField="st_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-3" />
                                </telerik:GridCheckBoxColumn>
            </Columns>
            <CommandItemSettings ShowAddNewRecordButton="false" CancelChangesText="CANCELAR" SaveChangesText="SALVAR"  ShowRefreshButton="false" ShowCancelChangesButton="True" ShowSaveChangesButton="True"  />
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <br />
    
    <asp:SqlDataSource ID="SqlDataSourceOperadoras"  CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceContatosLinhas" CancelSelectOnNullParameter ="false" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridLinhas" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO LI_LINHAS(id_OP_OPERADORAS, id_PS_CLIENTES, id_LI_TIPOS, vlInicial_id_LI_TIPOS, numContrato_LI_LINHAS, codLinha_LI_LINHAS, numLinha_LI_LINHAS, vlIdeal_LI_LINHAS, diaVenc_LI_LINHAS, foraAnalise_LI_LINHAS, st_LI_LINHAS, liCancelada_LI_LINHAS, numF_LI_LINHAS, perIncial_LI_LINHAS, id_PS_CIDADES, bairro_LI_LINHAS, rua_LI_LINHAS, numEndereco_LI_LINHAS, complemeto_LI_LINHAS, obs_LI_LINHAS, cep_LI_LINHAS, nomeUnidade_LI_LINHAS) VALUES (@id_OP_OPERADORAS, @id_PS_CLIENTES, @id_LI_TIPOS, @vlInicial_id_LI_TIPOS, @numContrato_LI_LINHAS, @codLinha_LI_LINHAS, @numLinha_LI_LINHAS, @vlIdeal_LI_LINHAS, @diaVenc_LI_LINHAS, @foraAnalise_LI_LINHAS, @st_LI_LINHAS, @liCancelada_LI_LINHAS, @numF_LI_LINHAS, @perIncial_LI_LINHAS, @id_PS_CIDADES, @bairro_LI_LINHAS, @rua_LI_LINHAS, @numEndereco_LI_LINHAS, @complemeto_LI_LINHAS, @obs_LI_LINHAS, @cep_LI_LINHAS, @nomeUnidade_LI_LINHAS)" UpdateCommand="UPDATE LI_LINHAS SET id_PS_CLIENTES = @id_PS_CLIENTES, id_LI_TIPOS = @id_LI_TIPOS, vlInicial_id_LI_TIPOS = @vlInicial_id_LI_TIPOS, numContrato_LI_LINHAS = @numContrato_LI_LINHAS, numLinha_LI_LINHAS = @numLinha_LI_LINHAS, vlIdeal_LI_LINHAS = @vlIdeal_LI_LINHAS, diaVenc_LI_LINHAS = @diaVenc_LI_LINHAS, foraAnalise_LI_LINHAS = @foraAnalise_LI_LINHAS, st_LI_LINHAS = @st_LI_LINHAS, liCancelada_LI_LINHAS = @liCancelada_LI_LINHAS, numF_LI_LINHAS = @numF_LI_LINHAS, perIncial_LI_LINHAS = @perIncial_LI_LINHAS, id_PS_CIDADES = @id_PS_CIDADES, bairro_LI_LINHAS = @bairro_LI_LINHAS, rua_LI_LINHAS = @rua_LI_LINHAS, numEndereco_LI_LINHAS = @numEndereco_LI_LINHAS, complemeto_LI_LINHAS = @complemeto_LI_LINHAS, obs_LI_LINHAS = @obs_LI_LINHAS, cep_LI_LINHAS = @cep_LI_LINHAS, id_OP_OPERADORAS = @id_OP_OPERADORAS, codLinha_LI_LINHAS = @codLinha_LI_LINHAS, nomeUnidade_LI_LINHAS = @nomeUnidade_LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
        <InsertParameters>
            <asp:Parameter Name="id_OP_OPERADORAS" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="id_PS_CLIENTES" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="id_LI_TIPOS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="vlInicial_id_LI_TIPOS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="numContrato_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="codLinha_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="numLinha_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="vlIdeal_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="diaVenc_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="foraAnalise_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="st_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="liCancelada_LI_LINHAS" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="numF_LI_LINHAS" ConvertEmptyStringToNull="true"/>
            <asp:Parameter Name="perIncial_LI_LINHAS" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="id_PS_CIDADES" ConvertEmptyStringToNull="true"  />
            <asp:Parameter Name="bairro_LI_LINHAS" ConvertEmptyStringToNull="true"  />
            <asp:Parameter Name="rua_LI_LINHAS" ConvertEmptyStringToNull="true"  />
            <asp:Parameter Name="numEndereco_LI_LINHAS" ConvertEmptyStringToNull="true"   />
            <asp:Parameter Name="complemeto_LI_LINHAS" ConvertEmptyStringToNull="true"  />
            <asp:Parameter Name="obs_LI_LINHAS" ConvertEmptyStringToNull="true"  />
            <asp:Parameter Name="cep_LI_LINHAS" ConvertEmptyStringToNull="true"   />
            <asp:Parameter Name="nomeUnidade_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter  Name="id_PS_CLIENTES" QueryStringField="id_cliente" Type="Int32" />
           <asp:QueryStringParameter  Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32"  />
            <asp:Parameter DefaultValue="1" Name="EditMode" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="linhaVirtual_LI_LINHAS" Type="Int32" />
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_PS_CLIENTES" />
            <asp:Parameter Name="id_LI_TIPOS" />
            <asp:Parameter Name="vlInicial_id_LI_TIPOS"  />
            <asp:Parameter Name="numContrato_LI_LINHAS" />
            <asp:Parameter Name="numLinha_LI_LINHAS" />
            <asp:Parameter Name="vlIdeal_LI_LINHAS"/>
            <asp:Parameter Name="diaVenc_LI_LINHAS" />
            <asp:Parameter Name="foraAnalise_LI_LINHAS" />
            <asp:Parameter Name="st_LI_LINHAS" />
            <asp:Parameter Name="liCancelada_LI_LINHAS" />
            <asp:Parameter Name="numF_LI_LINHAS" />
            <asp:Parameter Name="perIncial_LI_LINHAS" />
            <asp:Parameter Name="id_PS_CIDADES" />
            <asp:Parameter Name="bairro_LI_LINHAS" />
            <asp:Parameter Name="rua_LI_LINHAS" />
            <asp:Parameter Name="numEndereco_LI_LINHAS" />
            <asp:Parameter Name="complemeto_LI_LINHAS" />
            <asp:Parameter Name="obs_LI_LINHAS" />
            <asp:Parameter Name="cep_LI_LINHAS" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="codLinha_LI_LINHAS" />
            <asp:Parameter Name="nomeUnidade_LI_LINHAS" />
            <asp:Parameter Name="id_LI_LINHAS" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTipoLinha" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoLinhas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
 <asp:SqlDataSource ID="SqlDataSourceUF" runat="server" CancelSelectOnNullParameter ="false"  ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDropGrid" runat="server"   ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>"   SelectCommand="DropDownCidade" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="cod_PS_UF" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:ObjectDataSource ID="ObjectDataSourceUnidadesClinetes" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownUnidadesClientesTableAdapters.CL_UNIDADESTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
