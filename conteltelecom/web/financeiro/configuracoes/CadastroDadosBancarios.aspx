<%@ Page Title="CADASTRO DE DADOS BANCÁRIOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroDadosBancarios.aspx.vb" Inherits="conteltelecom.CadastroDadosBancarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridDadosBancarios" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceDadosBancarios" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth=""></Pdf>
        </ExportSettings>

        <MasterTableView DataKeyNames="id_FI_DADOS_BANCARIOS" DataSourceID="SqlDataSourceDadosBancarios">
            <Columns>

                <telerik:GridTemplateColumn DataField="dia_venc_FI_DADOS_BANCARIOS" HeaderText="DIA DE VENCIMENTO" SortExpression="dia_venc_FI_DADOS_BANCARIOS" UniqueName="dia_venc_FI_DADOS_BANCARIOS" DataType="System.Int32" FilterControlAltText="Filter dia_venc_FI_DADOS_BANCARIOS column">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" AppendDataBoundItems="false" runat="server" ID="dia_venc_FI_DADOS_BANCARIOSTextBox" Text='<%# Bind("dia_venc_FI_DADOS_BANCARIOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="dia_venc_FI_DADOS_BANCARIOSLabel" Text='<%# Eval("dia_venc_FI_DADOS_BANCARIOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn DataField="dias_prorrogacao_venc_FI_DADOS_BANCARIOS" HeaderText="DIAS DE PRORROGAÇÃO" SortExpression="dias_prorrogacao_venc_FI_DADOS_BANCARIOS" UniqueName="dias_prorrogacao_venc_FI_DADOS_BANCARIOS" DataType="System.Int32" FilterControlAltText="Filter dias_prorrogacao_venc_FI_DADOS_BANCARIOS column">
                    <EditItemTemplate>
                        <telerik:RadTextBox AppendDataBoundItems="false" Width="95%" runat="server" ID="dias_prorrogacao_venc_FI_DADOS_BANCARIOSTextBox" Text='<%# Bind("dias_prorrogacao_venc_FI_DADOS_BANCARIOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="dias_prorrogacao_venc_FI_DADOS_BANCARIOSLabel" Text='<%# Eval("dias_prorrogacao_venc_FI_DADOS_BANCARIOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn DataField="id_FI_BANCOS" HeaderText="BANCO" SortExpression="id_FI_BANCOS" UniqueName="id_FI_BANCOS" DataType="System.Int32" FilterControlAltText="Filter id_FI_BANCOS column">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="RadDropDownListBuscaBancos" runat="server" DataSourceID="SqlDataSourceBancos" DataTextField="desc_FI_BANCOS" DataValueField="id_FI_BANCOS" SelectedValue='<%# Eval("id_FI_BANCOS") %>' Skin="Bootstrap"></telerik:RadDropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="desc_FI_BANCOSLabel" Text='<%# Eval("desc_FI_BANCOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn DataField="agencia_FI_DADOS_BANCARIOS" HeaderText="AGÊNCIA" SortExpression="agencia_FI_DADOS_BANCARIOS" UniqueName="agencia_FI_DADOS_BANCARIOS" FilterControlAltText="Filter agencia_FI_DADOS_BANCARIOS column">
                    <EditItemTemplate>
                        <telerik:RadTextBox AppendDataBoundItems="false" Width="95%" runat="server" ID="agencia_FI_DADOS_BANCARIOSTextBox" Text='<%# Bind("agencia_FI_DADOS_BANCARIOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="agencia_FI_DADOS_BANCARIOSLabel" Text='<%# Eval("agencia_FI_DADOS_BANCARIOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>


                <telerik:GridTemplateColumn DataField="conta_FI_DADOS_BANCARIOS" HeaderText="CONTA" SortExpression="conta_FI_DADOS_BANCARIOS" UniqueName="conta_FI_DADOS_BANCARIOS" FilterControlAltText="Filter conta_FI_DADOS_BANCARIOS column">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" runat="server" ID="conta_FI_DADOS_BANCARIOSTextBox" Text='<%# Bind("conta_FI_DADOS_BANCARIOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="conta_FI_DADOS_BANCARIOSLabel" Text='<%# Eval("conta_FI_DADOS_BANCARIOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>


                <telerik:GridCheckBoxColumn DataField="st_FI_DADOS_BANCARIOS" StringTrueValue="1" StringFalseValue="0" DefaultInsertValue="1" HeaderText="ST" UniqueName="st_FI_DADOS_BANCARIOS" DataType="System.Int16" FilterControlAltText="Filter st_FI_DADOS_BANCARIOS column"></telerik:GridCheckBoxColumn>

                <telerik:GridEditCommandColumn></telerik:GridEditCommandColumn>

                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir"></telerik:GridButtonColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceDadosBancarios" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT FI_DADOS_BANCARIOS.id_FI_DADOS_BANCARIOS, FI_DADOS_BANCARIOS.id_PS_PESSOA, FI_DADOS_BANCARIOS.id_FI_BANCOS, FI_DADOS_BANCARIOS.dia_venc_FI_DADOS_BANCARIOS, FI_DADOS_BANCARIOS.dias_prorrogacao_venc_FI_DADOS_BANCARIOS, FI_DADOS_BANCARIOS.agencia_FI_DADOS_BANCARIOS, FI_DADOS_BANCARIOS.conta_FI_DADOS_BANCARIOS, FI_DADOS_BANCARIOS.st_FI_DADOS_BANCARIOS, FI_BANCOS.id_FI_BANCOS AS Expr1, FI_BANCOS.desc_FI_BANCOS FROM FI_DADOS_BANCARIOS INNER JOIN FI_BANCOS ON FI_DADOS_BANCARIOS.id_FI_BANCOS = FI_BANCOS.id_FI_BANCOS" DeleteCommand="DELETE FROM [FI_DADOS_BANCARIOS] WHERE [id_FI_DADOS_BANCARIOS] = @id_FI_DADOS_BANCARIOS" InsertCommand="INSERT INTO FI_DADOS_BANCARIOS(id_PS_PESSOA, id_FI_BANCOS, dia_venc_FI_DADOS_BANCARIOS, dias_prorrogacao_venc_FI_DADOS_BANCARIOS, agencia_FI_DADOS_BANCARIOS, conta_FI_DADOS_BANCARIOS, st_FI_DADOS_BANCARIOS, dtInc_FI_DADOS_BANCARIOS, dtAlt_FI_DADOS_BANCARIOS, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@id_PS_PESSOA, @id_FI_BANCOS, @dia_venc_FI_DADOS_BANCARIOS, @dias_prorrogacao_venc_FI_DADOS_BANCARIOS, @agencia_FI_DADOS_BANCARIOS, @conta_FI_DADOS_BANCARIOS, @st_FI_DADOS_BANCARIOS, GETDATE(), GETDATE(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" UpdateCommand="UPDATE FI_DADOS_BANCARIOS SET id_PS_PESSOA = @id_PS_PESSOA, id_FI_BANCOS = @id_FI_BANCOS, dia_venc_FI_DADOS_BANCARIOS = @dia_venc_FI_DADOS_BANCARIOS, dias_prorrogacao_venc_FI_DADOS_BANCARIOS = @dias_prorrogacao_venc_FI_DADOS_BANCARIOS, agencia_FI_DADOS_BANCARIOS = @agencia_FI_DADOS_BANCARIOS, conta_FI_DADOS_BANCARIOS = @conta_FI_DADOS_BANCARIOS, st_FI_DADOS_BANCARIOS = @st_FI_DADOS_BANCARIOS, dtAlt_FI_DADOS_BANCARIOS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_DADOS_BANCARIOS = @id_FI_DADOS_BANCARIOS)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
        </DeleteParameters>

        <InsertParameters>
            <asp:QueryStringParameter QueryStringField="codMatriz_PS_CLIENTES" Name="id_PS_PESSOA" Type="Int32"></asp:QueryStringParameter>
            <asp:Parameter Name="id_FI_BANCOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="dia_venc_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="dias_prorrogacao_venc_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="agencia_FI_DADOS_BANCARIOS" Type="String"></asp:Parameter>
            <asp:Parameter Name="conta_FI_DADOS_BANCARIOS" Type="String"></asp:Parameter>
            <asp:Parameter Name="st_FI_DADOS_BANCARIOS" Type="Byte"></asp:Parameter>
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>

        <UpdateParameters>
            <asp:QueryStringParameter QueryStringField="codMatriz_PS_CLIENTES" Name="id_PS_PESSOA" Type="Int32"></asp:QueryStringParameter>
            <asp:Parameter Name="id_FI_BANCOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="dia_venc_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="dias_prorrogacao_venc_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="agencia_FI_DADOS_BANCARIOS" Type="String"></asp:Parameter>
            <asp:Parameter Name="conta_FI_DADOS_BANCARIOS" Type="String"></asp:Parameter>
            <asp:Parameter Name="st_FI_DADOS_BANCARIOS" Type="Byte"></asp:Parameter>
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_DADOS_BANCARIOS" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceBancos" ConnectionString='<%$ ConnectionStrings:conteltelecom %>' SelectCommand="SELECT [desc_FI_BANCOS], [id_FI_BANCOS] FROM [FI_BANCOS] WHERE ([st_FI_BANCOS] = @st_FI_BANCOS) ORDER BY [desc_FI_BANCOS]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_BANCOS" ></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
