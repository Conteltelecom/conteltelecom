<%@ Page Title="CADASTRO DE ACRÉSCIMOS E TARIFAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroAcrescTarifas.aspx.vb" Inherits="conteltelecom.CadastroAcrescTarifas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridAcrescTarifas" runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceAcrescTarifas" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_ACRESC_TARIFA" DataSourceID="SqlDataSourceAcrescTarifas" NoDetailRecordsText="Sem registros." NoMasterRecordsText="Sem registros.">
            <CommandItemSettings AddNewRecordText="Adicionar novo registro" CancelChangesText="Cancelar Alterações" RefreshText="Atualizar" SaveChangesText="Salvar Alterações" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_ACRESC_TARIFA" DataType="System.Int32" FilterControlAltText="Filter id_FI_ACRESC_TARIFA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_ACRESC_TARIFA" UniqueName="id_FI_ACRESC_TARIFA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_ACRESC_TARIFA" FilterControlAltText="Filter desc_FI_ACRESC_TARIFA column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_ACRESC_TARIFA" UniqueName="desc_FI_ACRESC_TARIFA">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_ACRESC_TARIFATextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_ACRESC_TARIFA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_ACRESC_TARIFALabel" runat="server" Text='<%# Eval("desc_FI_ACRESC_TARIFA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>


                <telerik:GridTemplateColumn DataField="tipo_FI_ACRESC_TARIFA" DataType="System.Byte" FilterControlAltText="Filter tipo_FI_ACRESC_TARIFA column" HeaderText="TIPO" SortExpression="tipo_FI_ACRESC_TARIFA" UniqueName="tipo_FI_ACRESC_TARIFA">
                    
                    <EditItemTemplate>

                        <telerik:RadButton ID="RadButtonAcresc" runat="server" ToggleType="Radio" ButtonType="ToggleButton" 
                            Text="Acréscimo" GroupName="StandardButton" AutoPostBack="False" Checked='false' style="position: relative;">
                        </telerik:RadButton>
                        <telerik:RadButton ID="RadButtonTarifa" runat="server" ToggleType="Radio" Checked="true"
                            Text="Tarifa" GroupName="StandardButton" ButtonType="ToggleButton" AutoPostBack="false">
                        </telerik:RadButton>

                    </EditItemTemplate>


               

                    <ItemTemplate>
                        <asp:Label ID="tipo_FI_ACRESC_TARIFALabel" runat="server" Text='<%# Eval("descricao_tipo") %>'></asp:Label>
                    </ItemTemplate>

                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>


                <telerik:GridCheckBoxColumn DataField="st_FI_ACRESC_TARIFA" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_FI_ACRESC_TARIFA column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_FI_ACRESC_TARIFA">
                </telerik:GridCheckBoxColumn>

                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceAcrescTarifas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_ACRESC_TARIFA] WHERE [id_FI_ACRESC_TARIFA] = @id_FI_ACRESC_TARIFA" InsertCommand="INSERT INTO FI_ACRESC_TARIFA(desc_FI_ACRESC_TARIFA, st_FI_ACRESC_TARIFA, tipo_FI_ACRESC_TARIFA, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_FI_ACRESC_TARIFA, @st_FI_ACRESC_TARIFA, @tipo_FI_ACRESC_TARIFA, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_ACRESC_TARIFA, desc_FI_ACRESC_TARIFA, st_FI_ACRESC_TARIFA, tipo_FI_ACRESC_TARIFA, CASE WHEN tipo_FI_ACRESC_TARIFA = 0 THEN 'Desconto' ELSE 'Acréscimo' END AS descricao_tipo FROM FI_ACRESC_TARIFA" UpdateCommand="UPDATE FI_ACRESC_TARIFA SET desc_FI_ACRESC_TARIFA = @desc_FI_ACRESC_TARIFA, st_FI_ACRESC_TARIFA = @st_FI_ACRESC_TARIFA, tipo_FI_ACRESC_TARIFA = @tipo_FI_ACRESC_TARIFA, dtAlt_FI_ACRESC_TARIFA = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_ACRESC_TARIFA = @id_FI_ACRESC_TARIFA)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_ACRESC_TARIFA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_ACRESC_TARIFA" Type="String" />
            <asp:Parameter Name="st_FI_ACRESC_TARIFA" Type="Byte" />
            <asp:Parameter Name="tipo_FI_ACRESC_TARIFA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_ACRESC_TARIFA" Type="String" />
            <asp:Parameter Name="st_FI_ACRESC_TARIFA" Type="Byte" />
            <asp:Parameter Name="tipo_FI_ACRESC_TARIFA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_ACRESC_TARIFA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
