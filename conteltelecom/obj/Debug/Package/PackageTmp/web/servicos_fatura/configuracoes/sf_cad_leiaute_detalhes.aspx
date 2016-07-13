<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_cad_leiaute_detalhes.aspx.vb" Inherits="conteltelecom.sf_cad_leiaute_detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGri_dsf_cad_leiaute" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSource_sf_cad_leiaute" GridLines="Both" GroupPanelPosition="Top">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_LEIAUTE" DataSourceID="SqlDataSource_sf_cad_leiaute"  HierarchyDefaultExpanded="true" EditMode="InPlace"  CommandItemDisplay="Bottom" ExpandCollapseColumn-Display = "false"   ExpandCollapseColumn-Visible = "false" >
           <CommandItemSettings  ShowAddNewRecordButton="false"  ShowRefreshButton="false" /> 
              <DetailTables>
                <telerik:GridTableView runat="server" CommandItemDisplay="Top" EditMode="InPlace" DataSourceID="SqlDataSourceFilhas" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataKeyNames="id_SF_LEIAUTE">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_SF_LEIAUTE" MasterKeyField="id_SF_LEIAUTE" />
                    </ParentTableRelation>
                    <CommandItemSettings  AddNewRecordImageUrl="../../../img/add.png"  ShowRefreshButton="false" AddNewRecordText="NOVA LINHA" /> 
                    <Columns>
                        <telerik:GridBoundColumn DataField="id_SF_ITENS_LEIAUTE" FilterControlAltText="Filter id_SF_ITENS_LEIAUTE column" HeaderText="ID" ReadOnly="True" UniqueName="id_SF_ITENS_LEIAUTE">
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn DataField="ordem_id_SF_LEIAUTE" DecimalDigits="0" FilterControlAltText="Filter ordem_id_SF_LEIAUTE column" HeaderText="ORDEM" UniqueName="ordem_id_SF_LEIAUTE">
                            <HeaderStyle Width="50px" />
                            <ItemStyle Width="50px" />
                        </telerik:GridNumericColumn>
                        <telerik:GridBoundColumn DataField="string_SF_ITENS_LEIAUTE" FilterControlAltText="Filter string_SF_ITENS_LEIAUTE column" HeaderText="TEXTO" UniqueName="string_SF_ITENS_LEIAUTE">
                            <HeaderStyle CssClass="col-xs-11" />
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn DecimalDigits="0" FilterControlAltText="Filter tamanho_SF_ITENS_LEIAUTE column" HeaderText="TAMANHO CAMPO" UniqueName="tamanho_SF_ITENS_LEIAUTE" DataField="tamanho_SF_ITENS_LEIAUTE">
                        </telerik:GridNumericColumn>
                        <telerik:GridDropDownColumn FilterControlAltText="Filter column4 column" UniqueName="id_SF_TIPO_LEITURA" DataField="id_SF_TIPO_LEITURA" DataSourceID="ObjectDataSourceSF_TIPO_LEITURA" HeaderText="TIPO LEITURA" ListTextField="desc_SF_TIPO_LEITURA" ListValueField="id_SF_TIPO_LEITURA">
                            <HeaderStyle CssClass="col-xs-1" />
                        </telerik:GridDropDownColumn>
                          <telerik:GridTemplateColumn>
                    <ItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>

<ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_LEIAUTE" DataType="System.Int32" FilterControlAltText="Filter id_SF_LEIAUTE column" HeaderText="ID" SortExpression="id_SF_LEIAUTE" UniqueName="id_SF_LEIAUTE" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_SF_LEIAUTE" FilterControlAltText="Filter desc_SF_LEIAUTE column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_LEIAUTE" UniqueName="desc_SF_LEIAUTE">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="st_SF_LEIAUTE" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_LEIAUTE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_LEIAUTE">
                </telerik:GridCheckBoxColumn>
            </Columns>
        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource_sf_cad_leiaute" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT desc_SF_LEIAUTE, st_SF_LEIAUTE, id_SF_LEIAUTE FROM SF_LEIAUTE WHERE (id_SF_LEIAUTE = @id_SF_LEIAUTE)" InsertCommand="Sp_Insert_sf_cad_leiaute" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="desc_SF_LEIAUTE" Type="String" />
            <asp:Parameter Name="st_SF_LEIAUTE" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_SF_LEIAUTE" QueryStringField="id_SF_LEIAUTE" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceFilhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_ITENS_LEIAUTE.id_SF_ITENS_LEIAUTE, SF_ITENS_LEIAUTE.string_SF_ITENS_LEIAUTE, SF_ITENS_LEIAUTE.ordem_id_SF_LEIAUTE, SF_ITENS_LEIAUTE.tamanho_SF_ITENS_LEIAUTE, SF_ITENS_LEIAUTE.id_SF_LEIAUTE, SF_ITENS_LEIAUTE.id_SF_TIPO_LEITURA, SF_TIPO_LEITURA.desc_SF_TIPO_LEITURA FROM SF_ITENS_LEIAUTE INNER JOIN SF_TIPO_LEITURA ON SF_ITENS_LEIAUTE.id_SF_TIPO_LEITURA = SF_TIPO_LEITURA.id_SF_TIPO_LEITURA WHERE (SF_ITENS_LEIAUTE.id_SF_LEIAUTE = @id_SF_LEIAUTE)" InsertCommand="INSERT INTO SF_ITENS_LEIAUTE(string_SF_ITENS_LEIAUTE, id_SF_LEIAUTE, ordem_id_SF_LEIAUTE, id_SF_TIPO_LEITURA, tamanho_SF_ITENS_LEIAUTE) VALUES (@string_SF_ITENS_LEIAUTE, @id_SF_LEIAUTE, @ordem_id_SF_LEIAUTE, @id_SF_TIPO_LEITURA, @tamanho_SF_ITENS_LEIAUTE)">
        <InsertParameters>
            <asp:Parameter Name="string_SF_ITENS_LEIAUTE" />
          <asp:QueryStringParameter Name="id_SF_LEIAUTE" QueryStringField="id_SF_LEIAUTE" />
            <asp:Parameter Name="ordem_id_SF_LEIAUTE" />
            <asp:Parameter Name="id_SF_TIPO_LEITURA" />
            <asp:Parameter Name="tamanho_SF_ITENS_LEIAUTE" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_SF_LEIAUTE" QueryStringField="id_SF_LEIAUTE" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceSF_TIPO_LEITURA" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_TIPO_LEITURATableAdapters.SF_TIPO_LEITURATableAdapter"></asp:ObjectDataSource>
</asp:Content>
