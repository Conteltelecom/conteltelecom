<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="if_input_fatura_manual_Detalhes.aspx.vb" Inherits="conteltelecom.if_input_fatura_manual_Detalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
     <script type="text/javascript">
        //Put your JavaScript code here.
  
      function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridServicosXFaturas.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
  <asp:UpdatePanel ID="UpdatePaneDetailTableServico" runat="server"><ContentTemplate >
                     
    <telerik:RadGrid ID="RadGridServicosXFaturas" runat="server" AutoGenerateColumns="False" MasterTableView-ExpandCollapseColumn-Display="false" MasterTableView-ExpandCollapseColumn-Visible="false" Culture="pt-BR" DataSourceID="SqlDataSourceLinhas" Skin="Bootstrap" style="margin-bottom: 0px">
       
        <ClientSettings AllowKeyboardNavigation="true">
            <KeyboardNavigationSettings AllowSubmitOnEnter="false" />
        </ClientSettings>
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhas" Name="Master" DataKeyNames="id_SF_SERVICOS_FATURA" HierarchyDefaultExpanded="true" AllowNaturalSort="False" CommandItemDisplay="None" AllowAutomaticUpdates="True" EditMode="InPlace" >

            <DetailTables>
              

                                                                
                <telerik:GridTableView runat="server" DataKeyNames="id_SF_VL_SERVICO,id_SF_SERVICOS_FATURA" EditMode="InPlace" Width="100%" DataSourceID="SqlDataSourcePlanosXServicos" Name="DetailTableServico" CommandItemDisplay="TOP" EnableGroupsExpandAll="true" NoDetailRecordsText="INFORME O SERVIÇO" NoMasterRecordsText="INFORME O SERVIÇO" ExpandCollapseColumn-Display="false" ExpandCollapseColumn-Visible="false" AllowAutomaticInserts="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" AllowNaturalSort="False">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_SF_SERVICOS_FATURA" MasterKeyField="id_SF_SERVICOS_FATURA" />
                    </ParentTableRelation>
                    <CommandItemSettings AddNewRecordImageUrl="../../img/add.png" AddNewRecordText="" ShowAddNewRecordButton="true" RefreshText="" ShowRefreshButton="False" CancelChangesText="" SaveChangesText="" ShowCancelChangesButton="false" ShowSaveChangesButton="false" />
                    <ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridDropDownColumn DataField="codNumLinha_SF_VL_SERVICO" DataSourceID="SqlDataSourceLinhasXCod" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" ListTextField="numLinha_LI_LINHAS" ListValueField="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS_SERVICO" EnableEmptyListItem="false" DefaultInsertValue="1">
                            <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" ></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                            <HeaderStyle CssClass="col-xs-2" />
                        
                        </telerik:GridDropDownColumn>

                        <telerik:GridTemplateColumn DataField="desc_SF_VL_SERVICO" FilterControlAltText="Filter desc_SF_VL_SERVICO column" HeaderText="PLANOS/SERVIÇO" UniqueName="desc_SF_VL_SERVICO">
                            <EditItemTemplate>

                                <telerik:RadTextBox ID="desc_SF_VL_SERVICOTextBox" runat="server" Text='<%# Bind("desc_SF_VL_SERVICO") %>' Width="95%"></telerik:RadTextBox>
                              
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatordesc_SF_VL_SERVICOTextBox" ControlToValidate="desc_SF_VL_SERVICOTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="desc_SF_VL_SERVICOLabel" runat="server" Text='<%# Eval("desc_SF_VL_SERVICO") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-4" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="qtDias_SF_VL_SERVICO" FilterControlAltText="Filter qtDias_SF_VL_SERVICO column" HeaderText="QT DIAS" UniqueName="qtDias_SF_VL_SERVICO" DefaultInsertValue="30">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="qtDias_SF_VL_SERVICORadNumericTextBox" NumberFormat-DecimalDigits="0" runat="server" DbValue='<%# Bind("qtDias_SF_VL_SERVICO") %>' Type="Number" Width="90%" MaxLength="2" MaxValue="31">
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatoeqtDias" ControlToValidate="qtDias_SF_VL_SERVICORadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="qtDias_SF_VL_SERVICOLabel" runat="server" Text='<%# Eval("qtDias_SF_VL_SERVICO") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="col-xs-2" />

                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="vl_SF_VL_SERVICO" FilterControlAltText="Filter vl_SF_VL_SERVICO column" HeaderText="VALOR R$" UniqueName="vl_SF_VL_SERVICO">

                            <EditItemTemplate>

                                <telerik:RadNumericTextBox ID="vl_SF_VL_SERVICORadNumericTextBox" runat="server" DbValue='<%# Bind("vl_SF_VL_SERVICO") %>' Type="Number" Width="90%">
                                </telerik:RadNumericTextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatovl_SF_VL_SERVICO" ControlToValidate="vl_SF_VL_SERVICORadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="vl_SF_VL_SERVICOLabel" runat="server" Text='<%# Eval("vl_SF_VL_SERVICO", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="col-xs-2" />

                        </telerik:GridTemplateColumn>
                       
                        <telerik:GridTemplateColumn DataField="vlDesconto_SF_VL_SERVICO" FilterControlAltText="Filter vlDesconto_SF_VL_SERVICO column" HeaderText="DESCONTO R$" UniqueName="vlDesconto_SF_VL_SERVICO">
                            <EditItemTemplate>
                                 <asp:Label id="negativo" runat="server" Text="-"></asp:Label>
                                <telerik:RadNumericTextBox ID="vlDesconto_SF_VL_SERVICORadNumericTextBox" runat="server" DbValue='<%# Bind("vlDesconto_SF_VL_SERVICO") %>' Type="Number" Width="90%" MinValue="0" >
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatovlDesconto_SF_VL_SERVIC" ControlToValidate="vlDesconto_SF_VL_SERVICORadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                 <asp:Label id="negativo" runat="server" Text="-"></asp:Label> <asp:Label ID="vlDesconto_SF_VL_SERVICOLabel" runat="server" Text='<%# Eval("vlDesconto_SF_VL_SERVICO", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle CssClass="col-xs-2" />

                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>

                            <HeaderStyle Width="50px" />

                        </telerik:GridTemplateColumn>
                    </Columns>


                </telerik:GridTableView>
              
                <telerik:GridTableView runat="server" EditMode="InPlace" Width="100%" DataSourceID="SqlDataSourceUso" Name="DetailTableUso" CommandItemDisplay="top" EnableGroupsExpandAll="true" NoDetailRecordsText="INFORME O USO" NoMasterRecordsText="INFORME O USO" FooterStyle-CssClass="DetailClassFoter" AllowNaturalSort="False" ShowFooter="True" ShowGroupFooter="false" AllowAutomaticDeletes="True" DataKeyNames="id_SF_VL_USO,id_SF_SERVICOS_FATURA">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_SF_SERVICOS_FATURA" MasterKeyField="id_SF_SERVICOS_FATURA" />
                    </ParentTableRelation>
                 <CommandItemSettings AddNewRecordImageUrl="../../img/add.png" AddNewRecordText="" ShowAddNewRecordButton="true" RefreshText="" ShowRefreshButton="False" CancelChangesText="" SaveChangesText="" ShowCancelChangesButton="false" ShowSaveChangesButton="false" />
                    <Columns>
                        <telerik:GridBoundColumn DataField="id_SF_VL_USO" FilterControlAltText="Filter id_SF_VL_USO column" HeaderText="CÓD" UniqueName="id_SF_VL_USO" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="codNumLinha_SF_VL_USO" FilterControlAltText="Filter numLinha_LI_LINHAS_USO column" HeaderText="CÓD/LINHAS" UniqueName="numLinha_LI_LINHAS_USO">
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="codNumLinha_SF_VL_USORadComboBox"  runat="server" DataSourceID="SqlDataSourceLinhasXCod"  DataTextField="numLinha_LI_LINHAS" DataValueField="id_LI_LINHAS" Width="95%" SelectedValue='<%# Bind("codNumLinha_SF_VL_USO") %>'>
                                </telerik:RadDropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorcodNumLinha" ControlToValidate="codNumLinha_SF_VL_USORadComboBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="codNumLinha_SF_VL_USOLabel" runat="server" Text='<%# Eval("codNumLinha_SF_VL_USO") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="id_SF_TIPO_USO" FilterControlAltText="Filter desc_SF_TIPO_USO column" HeaderText="TIPO DE USO" UniqueName="desc_SF_TIPO_USO">
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="id_SF_TIPO_USORadComboBox" runat="server" DataSourceID="SqlDataSourceTipoUso" DataTextField="desc_SF_TIPO_USO" DataValueField="id_SF_TIPO_USO" SelectedValue='<%# Bind("id_SF_TIPO_USO") %>' Width="95%">
                                </telerik:RadComboBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldid_SF_TIPO_USO" ControlToValidate="codNumLinha_SF_VL_USORadComboBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id_SF_TIPO_USOLabel" runat="server" Text='<%# Eval("desc_SF_TIPO_USO") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-4" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="id_OP_OPERADORAS" FilterControlAltText="Filter column column" HeaderText="OPERADORA" UniqueName="OPERADORAS">
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="id_OP_OPERADORASRadComboBox" runat="server" DataSourceID="SqlDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>' Width="95%">
                                </telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldidid_OP_OPERADORAO" ControlToValidate="id_OP_OPERADORASRadComboBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="vlUso_SF_VL_USO" FilterControlAltText="Filter vlUso_SF_VL_USO column" HeaderText="VL USO R$" UniqueName="vlUso_SF_VL_USO">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="vlUso_SF_VL_USORadNumericTextBox" runat="server" DbValue='<%# Bind("vlUso_SF_VL_USO") %>' Type="Number" Width="90%">
                                </telerik:RadNumericTextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatovlUso_SF_VL_USO" ControlToValidate="vlUso_SF_VL_USORadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="vlUso_SF_VL_USOLabel" runat="server" Text='<%# Eval("vlUso_SF_VL_USO") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="minutos_SF_VL_USO" FilterControlAltText="Filter minutos_SF_VL_USO column" HeaderText="MINUTOS" UniqueName="minutos_SF_VL_USO" DefaultInsertValue="0">
                            <EditItemTemplate>
                                <telerik:RadNumericTextBox ID="minutos_SF_VL_USORadNumericTextBox" MinValue="0" MaxValue="999999" MaxLength="6"  runat="server" DbValue='<%# Bind("minutos_SF_VL_USO") %>' Type="Number" Width="90%">
                                    <NumberFormat DecimalDigits="0" />
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldididminutos" ControlToValidate="minutos_SF_VL_USORadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="minutos_SF_VL_USOLabel" runat="server" Text='<%# Eval("minutos_SF_VL_USO") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandArgument="Uso" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>
                    </Columns>

              

<FooterStyle CssClass="DetailClassFoter"></FooterStyle>

              

                </telerik:GridTableView>

            </DetailTables>


            <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" />


            <ExpandCollapseColumn Display="False">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_SERVICOS_FATURA" FilterControlAltText="Filter id_SF_SERVICOS_FATURA column" HeaderText="CÓD" UniqueName="id_SF_SERVICOS_FATURA" Visible="False" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="id_LI_LINHAS" UniqueName="id_LI_LINHAS" Visible="False" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="MÊS/ANOS" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/Nº LINHA" UniqueName="codLinha_LI_LINHAS" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" UniqueName="desc_OP_OPERADORAS" DefaultInsertValue="OI" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME FANTASIA" UniqueName="desc_PS_PESSOA" DataField="desc_PS_PESSOA" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tipoConta" FilterControlAltText="Filter tipoConta column" HeaderText="TIPO CONTA" UniqueName="tipoConta" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="vltotalLinha_SF_SERVICOS_FATURA" FilterControlAltText="Filter vltotalLinha_SF_SERVICOS_FATURA column" HeaderText="VL TOTAL R$" UniqueName="vltotalLinha_SF_SERVICOS_FATURA">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox ID="vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox" runat="server" DbValue='<%# Bind("vltotalLinha_SF_SERVICOS_FATURA") %>' Type="Number">
                        </telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vltotalLinha_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("vltotalLinha_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
     <telerik:RadImageButton ID="RadImageButtonDuplicar" runat="server" Width="32px" Height="32px" CommandName="Duplicar" Text="" Image-Url="~/img/duplicar.png"  AutoPostBack="true" ></telerik:RadImageButton> 
   
    </ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandArgument="Master"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>

            </Columns>

            <EditFormSettings>
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
            </EditFormSettings>

        </MasterTableView>
    </telerik:RadGrid>
            </ContentTemplate></asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSourceLinhas" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_SERVICOS_FATURA.vltotalLinha_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, OP_OPERADORAS.desc_OP_OPERADORAS, OP_OPERADORAS.id_OP_OPERADORAS, CAST(PS_CLIENTES.codMatriz_PS_CLIENTES AS VARCHAR) + ' - ' + PS_JURIDICA.razaosocial_PS_JURIDICA AS razaosocial_PS_JURIDICA, PS_CLIENTES.codMatriz_PS_CLIENTES, CASE WHEN SF_SERVICOS_FATURA.contaRetificada_SF_SERVICOS_FATURA &gt; 0 THEN 'CONTA RETIFICADA' ELSE 'NORMAL' END AS tipoConta, SF_SERVICOS_FATURA.id_LI_LINHAS, SF_SERVICOS_FATURA.codLinha_LI_LINHAS FROM PS_JURIDICA INNER JOIN PS_CLIENTES ON PS_JURIDICA.id_PS_JURIDICA = PS_CLIENTES.id_PS_JURIDICA INNER JOIN SF_SERVICOS_FATURA INNER JOIN OP_OPERADORAS ON SF_SERVICOS_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS ON PS_CLIENTES.codMatriz_PS_CLIENTES = SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES AND PS_CLIENTES.id_PS_PESSOA = SF_SERVICOS_FATURA.id_PS_PESSOA WHERE (SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)" InsertCommand="INSERT INTO SF_SERVICOS_FATURA(mesAnoRefereincia_SF_SERVICOS_FATURA, id_LI_LINHAS) VALUES (@mesAnoRefereincia_SF_SERVICOS_FATURA, @id_LI_LINHAS)" UpdateCommand="UPDATE SF_SERVICOS_FATURA SET vltotalLinha_SF_SERVICOS_FATURA = @vltotalLinha_SF_SERVICOS_FATURA WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)">
        <InsertParameters>
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="id_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_SF_SERVICOS_FATURA" QueryStringField="id_SF_SERVICOS_FATURA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vltotalLinha_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePlanosXServicos" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DetailTableServico" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO SF_VL_SERVICO(desc_SF_VL_SERVICO, qtDias_SF_VL_SERVICO, vl_SF_VL_SERVICO, vlDesconto_SF_VL_SERVICO, id_SF_SERVICOS_FATURA, codNumLinha_SF_VL_SERVICO) VALUES (@desc_SF_VL_SERVICO, @qtDias_SF_VL_SERVICO, @vl_SF_VL_SERVICO, @vlDesconto_SF_VL_SERVICO, @id_SF_SERVICOS_FATURA, @codNumLinha_SF_VL_SERVICO)" DeleteCommand="DELETE FROM SF_VL_SERVICO WHERE (id_SF_VL_SERVICO = @id_SF_VL_SERVICO)" UpdateCommand="UPDATE SF_VL_SERVICO SET desc_SF_VL_SERVICO = @desc_SF_VL_SERVICO, qtDias_SF_VL_SERVICO = @qtDias_SF_VL_SERVICO, vl_SF_VL_SERVICO = @vl_SF_VL_SERVICO, vlDesconto_SF_VL_SERVICO = @vlDesconto_SF_VL_SERVICO, codNumLinha_SF_VL_SERVICO = @codNumLinha_SF_VL_SERVICO WHERE (id_SF_VL_SERVICO = @id_SF_VL_SERVICO)">
        <DeleteParameters>
            <asp:Parameter Name="id_sf_vl_servico" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_VL_SERVICO" />
            <asp:Parameter Name="qtDias_SF_VL_SERVICO" />
            <asp:Parameter Name="vl_SF_VL_SERVICO" />
            <asp:Parameter Name="vlDesconto_SF_VL_SERVICO"  />
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="codNumLinha_SF_VL_SERVICO" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_VL_SERVICO" />
            <asp:Parameter Name="qtDias_SF_VL_SERVICO" />
            <asp:Parameter Name="vl_SF_VL_SERVICO" />
            <asp:Parameter Name="vlDesconto_SF_VL_SERVICO" />
            <asp:Parameter Name="codNumLinha_SF_VL_SERVICO" />
            <asp:Parameter Name="id_SF_VL_SERVICO" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUso" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DetailTableUso" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO SF_VL_USO(id_SF_TIPO_USO, id_OP_OPERADORAS, vlUso_SF_VL_USO, minutos_SF_VL_USO, id_SF_SERVICOS_FATURA, codNumLinha_SF_VL_USO, linhaVirtual_LI_LINHAS) VALUES (@id_SF_TIPO_USO, @id_OP_OPERADORAS, @vlUso_SF_VL_USO, @minutos_SF_VL_USO, @id_SF_SERVICOS_FATURA, @codNumLinha_SF_VL_USO, @linhaVirtual_LI_LINHAS)" UpdateCommand="UPDATE SF_VL_USO SET vlUso_SF_VL_USO = @vlUso_SF_VL_USO, minutos_SF_VL_USO = @minutos_SF_VL_USO, id_OP_OPERADORAS = @id_OP_OPERADORAS, codNumLinha_SF_VL_USO = @codNumLinha_SF_VL_USO, linhaVirtual_LI_LINHAS = @linhaVirtual_LI_LINHAS, id_SF_TIPO_USO = @id_SF_TIPO_USO WHERE (id_SF_VL_USO = @id_SF_VL_USO)" DeleteCommand="DELETE FROM SF_VL_USO WHERE (id_SF_VL_USO = @id_SF_VL_USO)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_VL_USO" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_SF_TIPO_USO" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="vlUso_SF_VL_USO" />
            <asp:Parameter Name="minutos_SF_VL_USO" />
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="codNumLinha_SF_VL_USO" />
            <asp:Parameter Name="linhaVirtual_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vlUso_SF_VL_USO" />
            <asp:Parameter Name="minutos_SF_VL_USO" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="codNumLinha_SF_VL_USO" />
            <asp:Parameter Name="linhaVirtual_LI_LINHAS" />
            <asp:Parameter Name="id_SF_TIPO_USO" />
            <asp:Parameter Name="id_SF_VL_USO" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceTipoUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoUso" SelectCommandType="StoredProcedure"></asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>




    <asp:SqlDataSource ID="SqlDataSourceLinhasXCod" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownLinhasXCodLinha" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO SF_VL_SERVICO(id_SF_SERVICOS_FATURA, desc_SF_VL_SERVICO, qtDias_SF_VL_SERVICO, vl_SF_VL_SERVICO, vlDesconto_SF_VL_SERVICO, codNumLinha_SF_VL_SERVICO) VALUES (@id_SF_SERVICOS_FATURA, @desc_SF_VL_SERVICO, @qtDias_SF_VL_SERVICO, @vl_SF_VL_SERVICO, @vlDesconto_SF_VL_SERVICO, @codNumLinha_SF_VL_SERVICO)">
        <InsertParameters>
            <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="desc_SF_VL_SERVICO" />
            <asp:Parameter Name="qtDias_SF_VL_SERVICO" />
            <asp:Parameter Name="vl_SF_VL_SERVICO" />
            <asp:Parameter Name="vlDesconto_SF_VL_SERVICO" />
            <asp:Parameter Name="codNumLinha_SF_VL_SERVICO" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="codLinha_LI_LINHAS" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




      <asp:SqlDataSource ID="SqlDataSourceDuplicarSF_SERVICOS_FATURA" runat="server" CancelSelectOnNullParameter="false" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="Sp_InsertRetificacao" SelectCommand="SELECT SF_SERVICOS_FATURA.* FROM SF_SERVICOS_FATURA" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE SF_SERVICOS_FATURA SET vlRetificado_SF_SERVICOS_FATURA = (SELECT vltotalLinha_SF_SERVICOS_FATURA FROM SF_SERVICOS_FATURA AS SF_SERVICOS_FATURA_1 WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)) WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)">
          <InsertParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" Type="Int32" />
              <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
              <asp:Parameter Name="id_SF_VL_SERVICO" Type="Int32" />
              <asp:Parameter Name="TIPO" Type="Int32" DefaultValue="0" />
              <asp:Parameter Name="id_SF_VL_USO" Type="Int32" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
          </UpdateParameters>
      </asp:SqlDataSource>




      <asp:SqlDataSource ID="SqlDataSourceDuplicaruso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="Sp_InsertRetificacao" SelectCommand="SELECT id_SF_VL_USO FROM SF_VL_USO WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)" InsertCommandType="StoredProcedure">
          <InsertParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
              <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
              <asp:Parameter Name="id_SF_VL_SERVICO" Type="Int32" />
              <asp:Parameter Name="TIPO" Type="Int32" DefaultValue="2" />
              <asp:Parameter Name="id_SF_VL_USO"  />
          </InsertParameters>
          <SelectParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
          </SelectParameters>
      </asp:SqlDataSource>




      <asp:SqlDataSource ID="SqlDataSourceServico" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="Sp_InsertRetificacao" SelectCommand="SELECT id_SF_VL_SERVICO FROM SF_VL_SERVICO WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)" InsertCommandType="StoredProcedure">
          <InsertParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
              <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
              <asp:Parameter Name="id_SF_VL_SERVICO" />
              <asp:Parameter Name="TIPO" Type="Int32" DefaultValue="1" />
              <asp:Parameter Name="id_SF_VL_USO" Type="Int32" />
          </InsertParameters>
          <SelectParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
          </SelectParameters>
      </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDataSourceUpdateRetificacao" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_SERVICOS_FATURA.* FROM SF_SERVICOS_FATURA" UpdateCommand="UPDATE SF_SERVICOS_FATURA SET vlRetificado_SF_SERVICOS_FATURA = @vlRetificado_SF_SERVICOS_FATURA WHERE (mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (id_LI_LINHAS = @id_LI_LINHAS) AND (numSequencia_SF_SERVICOS_FATURA =1)">
               <UpdateParameters>
                   <asp:Parameter Name="vlRetificado_SF_SERVICOS_FATURA" />
                   <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
                   <asp:Parameter Name="id_LI_LINHAS" />
               </UpdateParameters>
    </asp:SqlDataSource>
           <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" CenterIfModal="true" >
           
     </telerik:RadWindowManager>

</asp:Content>
