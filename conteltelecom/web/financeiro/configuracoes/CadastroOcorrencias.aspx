<%@ Page Title="CADASTRO DE OCORRÊNCIAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroOcorrencias.aspx.vb" Inherits="conteltelecom.CadastroOcorrencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridConfiguraOcorrencias" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceOcorrencias">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_OCORRENCIAS" DataSourceID="SqlDataSourceOcorrencias">
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_OCORRENCIAS" DataType="System.Int32" FilterControlAltText="Filter id_FI_OCORRENCIAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_OCORRENCIAS" UniqueName="id_FI_OCORRENCIAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_OCORRENCIAS" FilterControlAltText="Filter desc_FI_OCORRENCIAS column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_OCORRENCIAS" UniqueName="desc_FI_OCORRENCIAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_OCORRENCIASTextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_OCORRENCIAS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_OCORRENCIASLabel" runat="server" Text='<%# Eval("desc_FI_OCORRENCIAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_FI_OCORRENCIAS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_FI_OCORRENCIAS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_FI_OCORRENCIAS">
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

    <asp:SqlDataSource ID="SqlDataSourceOcorrencias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_OCORRENCIAS] WHERE [id_FI_OCORRENCIAS] = @id_FI_OCORRENCIAS" InsertCommand="INSERT INTO FI_OCORRENCIAS(desc_FI_OCORRENCIAS, st_FI_OCORRENCIAS, dtInc_FI_OCORRENCIAS, dtAlt_FI_OCORRENCIAS, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_FI_OCORRENCIAS, @st_FI_OCORRENCIAS, GETDATE(), GETDATE(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_OCORRENCIAS, desc_FI_OCORRENCIAS, st_FI_OCORRENCIAS FROM FI_OCORRENCIAS" UpdateCommand="UPDATE FI_OCORRENCIAS SET desc_FI_OCORRENCIAS = @desc_FI_OCORRENCIAS, st_FI_OCORRENCIAS = @st_FI_OCORRENCIAS, dtAlt_FI_OCORRENCIAS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_OCORRENCIAS = @id_FI_OCORRENCIAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_OCORRENCIAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_OCORRENCIAS" Type="String" />
            <asp:Parameter Name="st_FI_OCORRENCIAS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_OCORRENCIAS" Type="String" />
            <asp:Parameter Name="st_FI_OCORRENCIAS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_OCORRENCIAS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
