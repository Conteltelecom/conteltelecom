<%@ Page Title="CADASTRO REPRESENTANTE TELEFONE" Language="vb" AutoEventWireup="false" MasterPageFile="~/web/Representantes/Representante.master" CodeBehind="CadatroRepresentanteTelefone.aspx.vb" Inherits="conteltelecom.CadatroRepresentanteTelefone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderRepresentanteHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRepresentanteBody" runat="server">

    <telerik:RadGrid ID="RadGridTelefone" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceTelefone" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_PS_TELEFONE" DataSourceID="SqlDataSourceTelefone">
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_TELEFONE" DataType="System.Int32" FilterControlAltText="Filter id_PS_TELEFONE column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_TELEFONE" UniqueName="id_PS_TELEFONE">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="id_ADM_TP_TELEFONE" DataType="System.Int32" FilterControlAltText="Filter id_ADM_TP_TELEFONE column" HeaderText="TIPO" SortExpression="id_ADM_TP_TELEFONE" UniqueName="id_ADM_TP_TELEFONE">
                    <EditItemTemplate>
                         <telerik:RadDropDownList ID="RadDropDownListid_ADM_TP_TELEFONE" Width="95%" SelectedValue='<%# Bind("id_ADM_TP_TELEFONE") %>' AppendDataBoundItems="false"  runat="server" DataSourceID="SqlDataSourceTipoTelefone" DataTextField="desc_ADM_TP_TELEFONE" DataValueField="id_ADM_TP_TELEFONE" DropDownHeight="150px" >
                        </telerik:RadDropDownList>
                  
                     
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_ADM_TP_TELEFONELabel" runat="server" Text='<%# Eval("desc_ADM_TP_TELEFONE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="num_PS_TELEFONE" FilterControlAltText="Filter num_PS_TELEFONE column" HeaderText="TELEFONE" SortExpression="num_PS_TELEFONE" UniqueName="num_PS_TELEFONE">
                    <EditItemTemplate>
                      
                        <telerik:RadMaskedTextBox ID="RadMaskedTextBoxnum_PS_TELEFONE"   Mask ="(##)#####-####" runat="server" LabelWidth="64px" Text='<%# Bind("num_PS_TELEFONE") %>' Width="95%"></telerik:RadMaskedTextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadMaskedTextBoxnum_PS_TELEFONE" ControlToValidate="RadMaskedTextBoxnum_PS_TELEFONE" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="num_PS_TELEFONELabel" runat="server"  Text='<%#Me.MacaraTelefone(Eval("num_PS_TELEFONE")) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>
               
                <telerik:GridCheckBoxColumn DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_PS_TELEFONE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_PS_TELEFONE" DataField="st_PS_TELEFONE">
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
    <asp:SqlDataSource ID="SqlDataSourceTelefone" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_TELEFONE] WHERE [id_PS_TELEFONE] = @id_PS_TELEFONE" InsertCommand="INSERT INTO PS_TELEFONE(num_PS_TELEFONE, id_PS_PESSOA_alt, id_PS_PESSOA_inc, id_ADM_TP_TELEFONE, codTabela, id_PS_PESSOA, st_PS_TELEFONE) VALUES (@num_PS_TELEFONE, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @id_ADM_TP_TELEFONE, 'PS_REPRESENTANTE', @id_PS_PESSOA, @st_PS_TELEFONE)" SelectCommand="SELECT PS_TELEFONE.id_PS_TELEFONE, PS_TELEFONE.num_PS_TELEFONE, PS_TELEFONE.id_ADM_TP_TELEFONE, PS_TELEFONE.st_PS_TELEFONE, PS_TELEFONE.codTabela, ADM_TP_TELEFONE.desc_ADM_TP_TELEFONE FROM PS_TELEFONE INNER JOIN ADM_TP_TELEFONE ON PS_TELEFONE.id_ADM_TP_TELEFONE = ADM_TP_TELEFONE.id_ADM_TP_TELEFONE WHERE (PS_TELEFONE.codTabela = 'PS_REPRESENTANTE') AND (PS_TELEFONE.id_PS_PESSOA = @id_PS_PESSOA)" UpdateCommand="UPDATE PS_TELEFONE SET num_PS_TELEFONE = @num_PS_TELEFONE, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, id_ADM_TP_TELEFONE = @id_ADM_TP_TELEFONE, st_PS_TELEFONE = @st_PS_TELEFONE WHERE (id_PS_TELEFONE = @id_PS_TELEFONE)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_TELEFONE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="num_PS_TELEFONE" Type="String" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO"  Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
            <asp:QueryStringParameter QueryStringField="id_PS_PESSOA" Name="id_PS_PESSOA" />
            <asp:Parameter Name="st_PS_TELEFONE" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="num_PS_TELEFONE" Type="String" />
       <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
            <asp:Parameter Name="st_PS_TELEFONE" />
            <asp:Parameter Name="id_PS_TELEFONE" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTipoTelefone" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_ADM_TP_TELEFONE, id_ADM_TP_TELEFONE FROM ADM_TP_TELEFONE WHERE (st_ADM_TP_TELEFONE = 1)"></asp:SqlDataSource>
</asp:Content>
