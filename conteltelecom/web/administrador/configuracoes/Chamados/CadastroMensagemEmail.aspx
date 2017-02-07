<%@ Page Title="MENSAGEM DE EMAIL" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroMensagemEmail.aspx.vb" Inherits="conteltelecom.CadastroMensagemEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridMensagemEmail" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceMensagemEmail">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>

        <MasterTableView DataKeyNames="id_CH_MENSAGENS" DataSourceID="SqlDataSourceMensagemEmail">
            <Columns>
                <telerik:GridBoundColumn DataField="id_CH_MENSAGENS" DataType="System.Int32" FilterControlAltText="Filter id_CH_MENSAGENS column" HeaderText="ID" ReadOnly="True" SortExpression="id_CH_MENSAGENS" UniqueName="id_CH_MENSAGENS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="titulo_CH_MENSAGENS" FilterControlAltText="Filter titulo_CH_MENSAGENS column" HeaderText="TÍTULO" SortExpression="titulo_CH_MENSAGENS" UniqueName="titulo_CH_MENSAGENS">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" ID="titulo_CH_MENSAGENSTextBox" runat="server" Text='<%# Bind("titulo_CH_MENSAGENS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="titulo_CH_MENSAGENSLabel" runat="server" Text='<%# Eval("titulo_CH_MENSAGENS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_CH_MENSAGENS" FilterControlAltText="Filter desc_CH_MENSAGENS column" HeaderText="DESCRIÇÃO" SortExpression="desc_CH_MENSAGENS" UniqueName="desc_CH_MENSAGENS">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" Height="350px" TextMode="MultiLine" ID="desc_CH_MENSAGENSTextBox" runat="server" Text='<%# Bind("desc_CH_MENSAGENS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_MENSAGENSLabel" runat="server" Text='<%# Eval("desc_CH_MENSAGENS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CH_MENSAGENS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CH_MENSAGENS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CH_MENSAGENS">
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

    <asp:SqlDataSource ID="SqlDataSourceMensagemEmail" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CH_MENSAGENS] WHERE [id_CH_MENSAGENS] = @id_CH_MENSAGENS" InsertCommand="INSERT INTO CH_MENSAGENS(desc_CH_MENSAGENS, st_CH_MENSAGENS, dtInc_CH_MENSAGENS, dtAlt_CH_MENSAGENS, id_PS_PESSOA_alt, id_PS_PESSOA_inc, titulo_CH_MENSAGENS) VALUES (@desc_CH_MENSAGENS, @st_CH_MENSAGENS, GETDATE(), GETDATE(), @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @titulo_CH_MENSAGENS)" SelectCommand="SELECT id_CH_MENSAGENS, desc_CH_MENSAGENS, st_CH_MENSAGENS, titulo_CH_MENSAGENS FROM CH_MENSAGENS" UpdateCommand="UPDATE CH_MENSAGENS SET desc_CH_MENSAGENS = @desc_CH_MENSAGENS, st_CH_MENSAGENS = @st_CH_MENSAGENS, dtAlt_CH_MENSAGENS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, titulo_CH_MENSAGENS = @titulo_CH_MENSAGENS WHERE (id_CH_MENSAGENS = @id_CH_MENSAGENS)">
        <DeleteParameters>
            <asp:Parameter Name="id_CH_MENSAGENS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CH_MENSAGENS" Type="String" />
            <asp:Parameter Name="st_CH_MENSAGENS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="titulo_CH_MENSAGENS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CH_MENSAGENS" Type="String" />
            <asp:Parameter Name="st_CH_MENSAGENS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="titulo_CH_MENSAGENS" Type="String" />
            <asp:Parameter Name="id_CH_MENSAGENS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
