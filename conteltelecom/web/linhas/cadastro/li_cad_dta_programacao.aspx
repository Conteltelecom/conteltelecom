<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="li_cad_dta_programacao.aspx.vb" Inherits="conteltelecom.li_cad_dta_programacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridCadDtaProg.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
    <telerik:RadGrid ID="RadGridCadDtaProg" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadDtaProg" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCadDtaProg" CommandItemDisplay="none"   EditMode="InPlace" NoDetailRecordsText="" NoMasterRecordsText="" DataKeyNames="id_LI_LINHAS" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png"  AddNewRecordText="NOVO" ShowRefreshButton="false" />
            <Columns>
                <telerik:GridTemplateColumn DataField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" UniqueName="id_LI_LINHAS">
                    <EditItemTemplate>
                        <asp:Label ID="id_LI_LINHASLabelEdit" runat="server" Text='<%# Eval("id_LI_LINHAS") %>'></asp:Label>
                      
                        

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_LI_LINHASLabel" runat="server" Text='<%# Eval("id_LI_LINHAS") %>'></asp:Label>
                              <asp:Label ID="Labelid_LI_CAD_TIPO_PROGRAMACAO" Visible="false"  runat="server" Text='<%# Eval("id_LI_CAD_PROGRAMACAO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                    <EditItemTemplate>
                               <asp:Label ID="numLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("numLinha_LI_LINHAS") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="numLinha_LI_LINHASLabel" runat="server" Text='<%# Me.FTelefoneFormat(Eval("numLinha_LI_LINHAS")) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtMovel_LI_CAD_PROGRAMACAO" FilterControlAltText="Filter movel column" HeaderText="MÓVEL" SortExpression="dtMovel_LI_CAD_PROGRAMACAO" UniqueName="dtMovel_LI_CAD_PROGRAMACAO">
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="RadDatePickerMovel" runat="server" Skin="Bootstrap" Culture="pt-BR" DbSelectedDate='<%# Bind("dtMovel_LI_CAD_PROGRAMACAO") %>'>
                            <Calendar  runat="server"  Culture="pt-BR" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" runat="server" >
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="movelLabel" runat="server" Text='<%# Eval("dtMovel_LI_CAD_PROGRAMACAO", "{0:d}") %>' ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtLdn_LI_CAD_PROGRAMACAO" FilterControlAltText="Filter interurbano column" HeaderText="LDN" SortExpression="dtLdn_LI_CAD_PROGRAMACAO" UniqueName="dtLdn_LI_CAD_PROGRAMACAO" >
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="RadDatePickerLdn" runat="server" Skin="Bootstrap" Culture="pt-BR" DbSelectedDate='<%# Bind("dtLdn_LI_CAD_PROGRAMACAO") %>'>
                            <Calendar Culture="pt-BR" runat="server"  EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Bootstrap" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" runat="server" >
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="interurbanoLabel" runat="server"   Text='<%# Eval("dtLdn_LI_CAD_PROGRAMACAO", "{0:d}") %>' ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="obs_LI_CAD_PROGRAMACAO" FilterControlAltText="Filter observacoes column" HeaderText="OBSERVAÇÕES" SortExpression="obs_LI_CAD_PROGRAMACAO" UniqueName="obs_LI_CAD_PROGRAMACAO">
                    <EditItemTemplate>
                        <telerik:RadTextBox  ID="observacoesTextBox" runat="server" Height="70px"  Width="95%" TextMode="MultiLine" Text='<%#Bind("obs_LI_CAD_PROGRAMACAO") %>'  ></telerik:RadTextBox>
          
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="observacoesLabel" runat="server"  Text='<%#Eval("obs_LI_CAD_PROGRAMACAO") %>'  ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />


                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete"  Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName="Salvar"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>

                            <HeaderStyle Width="50px" />

                        </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                 <telerik:RadImageButton ID="RadImageButtonHistorico" runat="server" Width="32px" Height="32px" CommandName="historico" Text="" Image-Url="~/img/historico_32.png"></telerik:RadImageButton>
                                </ItemTemplate>
                    </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:ObjectDataSource ID="ObjectDataSourceTipoProgramacao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownTipoProgramacaoTableAdapters.LI_TIPO_PROGRAMACAOTableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCadDtaProg" runat="server" CancelSelectOnNullParameter="False"  ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS, LI_CAD_PROGRAMACAO.dtMovel_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.dtLdn_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.obs_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.id_LI_CAD_PROGRAMACAO FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES LEFT OUTER JOIN LI_CAD_PROGRAMACAO ON LI_LINHAS.id_LI_LINHAS = LI_CAD_PROGRAMACAO.id_LI_LINHAS AND LI_CAD_PROGRAMACAO.tpLancamento_LI_CAD_PROGRAMACAO = 0 WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.linhaVirtual_LI_LINHAS = 0) AND (LI_LINHAS.st_LI_LINHAS = 1)" DeleteCommand="DELETE FROM LI_CAD_PROGRAMACAO WHERE (id_LI_CAD_PROGRAMACAO = @id_LI_CAD_PROGRAMACAO)" InsertCommand="INSERT INTO LI_CAD_PROGRAMACAO(dtMovel_LI_CAD_PROGRAMACAO, dtLdn_LI_CAD_PROGRAMACAO, obs_LI_CAD_PROGRAMACAO, tpLancamento_LI_CAD_PROGRAMACAO, id_LI_LINHAS) VALUES (@dtMovel_LI_CAD_PROGRAMACAO, @dtLdn_LI_CAD_PROGRAMACAO, @obs_LI_CAD_PROGRAMACAO, 0, @id_LI_LINHAS)" UpdateCommand="UPDATE LI_CAD_PROGRAMACAO SET dtaProgramacao_LI_CAD_PROGRAMACAO = @dtaProgramacao_LI_CAD_PROGRAMACAO, dtaIni_LI_CAD_PROGRAMACAO = @dtaIni_LI_CAD_PROGRAMACAO, dtafim_LI_CAD_PROGRAMACAO = @dtafim_LI_CAD_PROGRAMACAO, id_SF_TIPO_USO_CATEGORIAS = @id_SF_TIPO_USO_CATEGORIAS, id_LI_TIPO_PROGRAMACAO = @id_LI_TIPO_PROGRAMACAO WHERE (id_LI_CAD_PROGRAMACAO = @id_LI_CAD_PROGRAMACAO)">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dtMovel_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="dtLdn_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="obs_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="id_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dtaProgramacao_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="dtaIni_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="dtafim_LI_CAD_PROGRAMACAO" />
            <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" />
            <asp:Parameter Name="id_LI_TIPO_PROGRAMACAO" />
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceTipoUso" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_TIPO_USO_CATTableAdapters.SF_TIPO_USO_CATEGORIASTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
            <asp:Parameter Name="Original_id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaOBS" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT id_LI_OBS_PROGRAMACAO, desc_LI_OBS_PROGRAMACAO, dtInc_LI_OBS_PROGRAMACAO, id_LI_CAD_PROGRAMACAO FROM LI_OBS_PROGRAMACAO WHERE (id_LI_CAD_PROGRAMACAO = @id_LI_CAD_PROGRAMACAO) ORDER BY dtInc_LI_OBS_PROGRAMACAO DESC" DeleteCommand="DELETE FROM [LI_OBS_PROGRAMACAO] WHERE [id_LI_OBS_PROGRAMACAO] = @id_LI_OBS_PROGRAMACAO" InsertCommand="INSERT INTO LI_OBS_PROGRAMACAO(desc_LI_OBS_PROGRAMACAO, id_LI_CAD_PROGRAMACAO, idMovel_LI_DTA_PROGRAMACAO, idInte_LI_DTA_PROGRAMACAO) VALUES (@desc_LI_OBS_PROGRAMACAO, @id_LI_CAD_PROGRAMACAO, 2,1)" UpdateCommand="UPDATE LI_OBS_PROGRAMACAO SET desc_LI_OBS_PROGRAMACAO = @desc_LI_OBS_PROGRAMACAO WHERE (id_LI_OBS_PROGRAMACAO = @id_LI_OBS_PROGRAMACAO)">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_OBS_PROGRAMACAO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_LI_OBS_PROGRAMACAO" Type="String" />
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_LI_OBS_PROGRAMACAO" Type="String" />
            <asp:Parameter Name="id_LI_OBS_PROGRAMACAO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceInsertData" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" InsertCommand="INSERT INTO LI_DTA_PROGRAMACAO(id_SF_TIPO_USO_CATEGORIAS, dta_LI_DTA_PROGRAMACAO, id_LI_CAD_PROGRAMACAO) VALUES (@id_SF_TIPO_USO_CATEGORIAS, @dta_LI_DTA_PROGRAMACAO, @id_LI_CAD_PROGRAMACAO)" SelectCommand="SELECT id_LI_DTA_PROGRAMACAO FROM LI_DTA_PROGRAMACAO WHERE (id_LI_DTA_PROGRAMACAO = 0)">
        <InsertParameters>
            <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" />
            <asp:Parameter Name="dta_LI_DTA_PROGRAMACAO" />
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </InsertParameters>
    </asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
</asp:Content>
