<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ConsultaCliente.master" CodeBehind="li_cad_dta_programacao.aspx.vb" Inherits="conteltelecom.li_cad_dta_programacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBodyConsultaCliente" runat="server">
    <telerik:RadGrid ID="RadGridCadDtaProg" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadDtaProg" GroupPanelPosition="Top" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCadDtaProg">
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_CAD_PROGRAMACAO" DataType="System.Int32" FilterControlAltText="Filter id_LI_CAD_PROGRAMACAO column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_CAD_PROGRAMACAO" UniqueName="id_LI_CAD_PROGRAMACAO">
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn FilterControlAltText="Filter column column" UniqueName="id_LI_TIPO_PROGRAMACAO" DataField="id_LI_TIPO_PROGRAMACAO" DataSourceID="ObjectDataSourceTipoProgramacao" HeaderText="TIPO PROGRAMAÇÃO" ListTextField="desc_LI_TIPO_PROGRAMACAO" ListValueField="id_LI_TIPO_PROGRAMACAO">
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn FilterControlAltText="Filter desc_SF_TIPO_USO_CATEGORIAS column" HeaderText="USO" ListTextField="desc_SF_TIPO_USO_CATEGORIAS" UniqueName="desc_SF_TIPO_USO_CATEGORIAS">
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="desc_SF_TIPO_USO_CATEGORIAS" FilterControlAltText="Filter desc_SF_TIPO_USO_CATEGORIAS column" HeaderText="desc_SF_TIPO_USO_CATEGORIAS" SortExpression="desc_SF_TIPO_USO_CATEGORIAS" UniqueName="desc_SF_TIPO_USO_CATEGORIAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtaProgramacao_LI_CAD_PROGRAMACAO" DataType="System.DateTime" FilterControlAltText="Filter dtaProgramacao_LI_CAD_PROGRAMACAO column" HeaderText="dtaProgramacao_LI_CAD_PROGRAMACAO" SortExpression="dtaProgramacao_LI_CAD_PROGRAMACAO" UniqueName="dtaProgramacao_LI_CAD_PROGRAMACAO">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtaIni_LI_CAD_PROGRAMACAO" DataType="System.DateTime" FilterControlAltText="Filter dtaIni_LI_CAD_PROGRAMACAO column" HeaderText="dtaIni_LI_CAD_PROGRAMACAO" SortExpression="dtaIni_LI_CAD_PROGRAMACAO" UniqueName="dtaIni_LI_CAD_PROGRAMACAO">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtafim_LI_CAD_PROGRAMACAO" DataType="System.DateTime" FilterControlAltText="Filter dtafim_LI_CAD_PROGRAMACAO column" HeaderText="dtafim_LI_CAD_PROGRAMACAO" SortExpression="dtafim_LI_CAD_PROGRAMACAO" UniqueName="dtafim_LI_CAD_PROGRAMACAO">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid><asp:ObjectDataSource ID="ObjectDataSourceTipoProgramacao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownTipoProgramacaoTableAdapters.LI_TIPO_PROGRAMACAOTableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCadDtaProg" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_TIPO_PROGRAMACAO.desc_LI_TIPO_PROGRAMACAO, LI_TIPO_PROGRAMACAO.id_LI_TIPO_PROGRAMACAO, SF_TIPO_USO_CATEGORIAS.desc_SF_TIPO_USO_CATEGORIAS, LI_CAD_PROGRAMACAO.dtaProgramacao_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.dtaIni_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.dtafim_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.id_LI_CAD_PROGRAMACAO, SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS FROM LI_CAD_PROGRAMACAO INNER JOIN LI_TIPO_PROGRAMACAO ON LI_CAD_PROGRAMACAO.id_LI_TIPO_PROGRAMACAO = LI_TIPO_PROGRAMACAO.id_LI_TIPO_PROGRAMACAO INNER JOIN SF_TIPO_USO_CATEGORIAS ON LI_CAD_PROGRAMACAO.id_SF_TIPO_USO_CATEGORIAS = SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS"></asp:SqlDataSource>
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
</asp:Content>
