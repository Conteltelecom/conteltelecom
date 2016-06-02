<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_linhas_virtuais_detalhes.aspx.vb" Inherits="conteltelecom.cl_linhas_virtuais_detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
      
    <telerik:RadGrid ID="RadGridLinhasVirtuais" AllowMultiRowEdit="True"  runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="ObjectDataSourceLinhas01" GroupPanelPosition="Top" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView  DataSourceID="ObjectDataSourceLinhas01"  Name="Master" HierarchyDefaultExpanded="true" CommandItemDisplay="Bottom" EditMode="InPlace"   ShowHeadersWhenNoRecords="true" NoMasterRecordsText="SEM REGISTROS" DataKeyNames="id_LI_LINHAS" ExpandCollapseColumn-Display = "false"   ExpandCollapseColumn-Visible = "false" AllowAutomaticUpdates="True"  >
            <CommandItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
            </CommandItemTemplate> 
             <ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
            <DetailTables>
                 <telerik:GridTableView runat="server" DataKeyNames="id_LI_LINHAS" Name="LINHAS02" DataSourceID="ObjectDataSourceLinha02" AllowAutomaticUpdates="True" EditMode="InPlace" >
                     <Columns>
                         <telerik:GridTemplateColumn DataField="vlInicial_id_LI_TIPOS" FilterControlAltText="Filter vlInicial_id_LI_TIPOS column" HeaderText="VL INICIAL" UniqueName="vlInicial_id_LI_TIPOS">
                           <EditItemTemplate>
                               <telerik:RadNumericTextBox ID="RadNumericTextBoxvlInicial_id_LI_TIPOS" runat="server"  Width="100%"  DbValue ='<%# Bind("vlInicial_id_LI_TIPOS") %>' ></telerik:RadNumericTextBox>
                           </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="LabelvlInicial_id_LI_TIPOS" runat="server" Text='<%#Eval("vlInicial_id_LI_TIPOS") %>'></asp:Label>
                          </ItemTemplate>

                             <HeaderStyle CssClass="col-xs-3" />

                         </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="vlIdeal_LI_LINHAS" FilterControlAltText="Filter vlIdeal_LI_LINHAS column" HeaderText="VL IDEAL" UniqueName="vlIdeal_LI_LINHAS">
                         <EditItemTemplate>
                               <telerik:RadNumericTextBox ID="RadNumericTextBoxvlIdeal_LI_LINHAS" runat="server"  DbValue ='<%# Bind("vlIdeal_LI_LINHAS") %>' Width="100%" ></telerik:RadNumericTextBox>
                           </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="LabelvlIdeal_LI_LINHAS" runat="server" Text='<%#Eval("vlIdeal_LI_LINHAS") %>'></asp:Label>
                          </ItemTemplate>
                             <HeaderStyle CssClass="col-xs-3" />
                         </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="perIncial_LI_LINHAS" FilterControlAltText="Filter perIncial_LI_LINHAS column" HeaderText="MÊS/ANO" UniqueName="perIncial_LI_LINHAS">
                       <EditItemTemplate>
                                <telerik:RadMaskedTextBox Width ="100%" ID="perIncial_LI_LINHASTextBox" Mask="<1..12>/<2000..2050>"   runat="server" Text='<%# Bind("perIncial_LI_LINHAS") %>'></telerik:RadMaskedTextBox>
                                                                       
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="perIncial_LI_LINHASLabel" runat="server" Text='<%# Eval("perIncial_LI_LINHAS", "##/####") %>'></asp:Label>
                            </ItemTemplate>
                               <HeaderStyle CssClass="col-xs-3" />
                               </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="diaVenc_LI_LINHAS" FilterControlAltText="Filter diaVenc_LI_LINHAS column" HeaderText="DIA VENCIMENTO" UniqueName="diaVenc_LI_LINHAS">
                        <EditItemTemplate>
                                <telerik:RadNumericTextBox Width ="100%" ID="diaVenc_LI_LINHASTextBox" MaxLength="2"  runat="server" Text='<%# Bind("diaVenc_LI_LINHAS") %>' MaxValue="31" MinValue ="1" DecimalDigits = "0" ></telerik:RadNumericTextBox>
                                                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="diaVenc_LI_LINHASLabel" runat="server" Text='<%# Eval("diaVenc_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                              </telerik:GridTemplateColumn>
                     </Columns>
                 </telerik:GridTableView>
                 <telerik:GridTableView runat="server" Name="LINHAS03" DataKeyNames="id_LI_LINHAS" DataSourceID="ObjectDataSourceLinhas03" AllowAutomaticUpdates="True" EditMode ="InPlace" >
                     <Columns>
                         <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="numF_LI_LINHAS" DataField="numF_LI_LINHAS" HeaderText="Nº F">

                             <EditItemTemplate>
                                <telerik:RadTextBox ID="numF_LI_LINHASTextBox" runat="server" Text='<%# Bind("numF_LI_LINHAS") %>' Width="100%"></telerik:RadTextBox>
                                                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="numF_LI_LINHASLabel" runat="server" Text='<%# Eval("numF_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-3" />
                         </telerik:GridTemplateColumn>
                         <telerik:GridCheckBoxColumn DataField="foraAnalise_LI_LINHAS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter foraAnalise_LI_LINHAS column" HeaderText="FORA DA ANALISE" StringFalseValue="0" StringTrueValue="1" UniqueName="foraAnalise_LI_LINHAS">
                             <HeaderStyle CssClass="col-xs-3" />
                         </telerik:GridCheckBoxColumn>
                         <telerik:GridCheckBoxColumn DataField="liCancelada_LI_LINHAS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter liCancelada_LI_LINHAS column" HeaderText="LINHA CANCELADA" StringFalseValue="0" StringTrueValue="1" UniqueName="liCancelada_LI_LINHAS">
                             <HeaderStyle CssClass="col-xs-3" />
                         </telerik:GridCheckBoxColumn>
                         <telerik:GridCheckBoxColumn DataField="st_LI_LINHAS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_LI_LINHAS column" HeaderText="SITUAÇÃO" StringFalseValue="0" StringTrueValue="1" UniqueName="st_LI_LINHAS">
                             <HeaderStyle CssClass="col-xs-3" />
                         </telerik:GridCheckBoxColumn>
                     </Columns>
                 </telerik:GridTableView>
             </DetailTables>
             <CommandItemSettings  AddNewRecordText="NOVO" CancelChangesText="CANCELAR"  AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR"  SaveChangesText="SALVAR"  />
            <Columns>
               
                <telerik:GridTemplateColumn DataField="numContrato_LI_LINHAS"   FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="Nº CONTRATO" SortExpression="numContrato_LI_LINHAS" UniqueName="numContrato_LI_LINHAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="numContrato_LI_LINHASTextBox" Width="100%" runat="server" Text='<%# Bind("numContrato_LI_LINHAS") %>'></telerik:RadTextBox>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="numContrato_LI_LINHASLabel" runat="server" Text='<%# Eval("numContrato_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS" ReadOnly="True">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="codLinha_LI_LINHASTextBox" Width="100%"  runat="server" Text='<%# Bind("codLinha_LI_LINHAS") %>'></telerik:RadTextBox>
               
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS" DefaultInsertValue="OI" ReadOnly="True">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="RadComboBoxoOperadoras" runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>'></telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_LI_TIPOS" FilterControlAltText="Filter desc_LI_TIPOS column" HeaderText="TIPO" SortExpression="desc_LI_TIPOS" UniqueName="desc_LI_TIPOS" Visible="False">
                    <EditItemTemplate>
                      <telerik:RadComboBox ID="RadComboBoxTipos" Width="100%"  runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceTipoLinhas" DataTextField="desc_LI_TIPOS" DataValueField="id_LI_TIPOS" SelectedValue='<%# Bind("id_LI_TIPOS") %>'></telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_LI_TIPOSLabel" runat="server" Text='<%# Eval("desc_LI_TIPOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
            </Columns>       
                 </MasterTableView>

    </telerik:RadGrid>
    <asp:ObjectDataSource ID="ObjectDataSourceLinhas03" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetLinhas01TableAdapters.LI_LINHAS03TableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32" />
        </SelectParameters>

    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceLinha02" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetLinhas01TableAdapters.LI_LINHAS02TableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_LI_LINHAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vlInicial_id_LI_TIPOS" Type="Decimal" />
            <asp:Parameter Name="vlIdeal_LI_LINHAS" Type="Decimal" />
            <asp:Parameter Name="diaVenc_LI_LINHAS" Type="Byte" />
            <asp:Parameter Name="perIncial_LI_LINHAS" Type="String" />
            <asp:Parameter Name="id_PS_CLIENTES" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceLinhas01" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetLinhas01TableAdapters.LI_LINHAS01TableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSourceLinhasCliente" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridLinhas" SelectCommandType="StoredProcedure" InsertCommand="RadGridLinhasVirtuais_Insert" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE LI_LINHAS SET id_PS_CLIENTES = @id_PS_CLIENTES, id_LI_TIPOS = @id_LI_TIPOS, vlInicial_id_LI_TIPOS = @vlInicial_id_LI_TIPOS, numContrato_LI_LINHAS = @numContrato_LI_LINHAS, numLinha_LI_LINHAS = @numLinha_LI_LINHAS, vlIdeal_LI_LINHAS = @vlIdeal_LI_LINHAS, diaVenc_LI_LINHAS = @diaVenc_LI_LINHAS, foraAnalise_LI_LINHAS = @foraAnalise_LI_LINHAS, st_LI_LINHAS = @st_LI_LINHAS, liCancelada_LI_LINHAS = @liCancelada_LI_LINHAS, numF_LI_LINHAS = @numF_LI_LINHAS, perIncial_LI_LINHAS = @perIncial_LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
    <InsertParameters>
       <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
         <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
        <asp:Parameter Name="id_OP_OPERADORAS" DefaultValue="1" />
        <asp:Parameter Name="id_LI_TIPOS" />
        <asp:Parameter Name="numContrato_LI_LINHAS" />
        <asp:Parameter Name="codLinha_LI_LINHAS" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
        <asp:QueryStringParameter DefaultValue="" Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="EditMode" Type="Int32" />
        <asp:Parameter DefaultValue="1" Name="linhaVirtual_LI_LINHAS" Type="Int32" />
        <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
          <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
        <asp:Parameter Name="id_LI_TIPOS" />
        <asp:Parameter Name="vlInicial_id_LI_TIPOS" />
        <asp:Parameter Name="numContrato_LI_LINHAS" />
        <asp:Parameter Name="numLinha_LI_LINHAS" />
        <asp:Parameter Name="vlIdeal_LI_LINHAS" />
        <asp:Parameter Name="diaVenc_LI_LINHAS" />
        <asp:Parameter Name="foraAnalise_LI_LINHAS" />
        <asp:Parameter Name="st_LI_LINHAS" />
        <asp:Parameter Name="liCancelada_LI_LINHAS" />
        <asp:Parameter Name="numF_LI_LINHAS" />
        <asp:Parameter Name="perIncial_LI_LINHAS" />
       <asp:QueryStringParameter DefaultValue="" Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSourceTipoLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoLinhas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
      </asp:Content>
