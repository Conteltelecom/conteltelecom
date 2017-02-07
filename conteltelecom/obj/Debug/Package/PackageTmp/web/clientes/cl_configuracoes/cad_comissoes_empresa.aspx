<%@ Page Title="CADASTRO DE COMISSÕES" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cad_comissoes_empresa.aspx.vb" Inherits="conteltelecom.cad_comissoes_empresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <asp:HiddenField ID="HiddenFieldFooter" runat="server" />
    <telerik:RadGrid ID="RadGridComissoesEmpressa" runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceComissaoEmpresa" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_CAD_COMISSOES_EMP" DataSourceID="SqlDataSourceComissaoEmpresa" ShowFooter="True">
            <Columns>
                <telerik:GridBoundColumn DataField="id_CL_CAD_COMISSOES_EMP" DataType="System.Int32" FilterControlAltText="Filter id_CL_CAD_COMISSOES_EMP column" HeaderText="ID" ReadOnly="True" SortExpression="id_CL_CAD_COMISSOES_EMP" UniqueName="id_CL_CAD_COMISSOES_EMP">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="id_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="NOME REPRESENTANTE" SortExpression="id_PS_PESSOA" UniqueName="id_PS_PESSOA">
                    <EditItemTemplate>
                        <asp:Label ID="Labelid_PS_PESSOA" runat="server" Visible="false" Text='<%#Bind("id_PS_PESSOA") %>'></asp:Label>
                         <asp:Label ID="id_PS_PESSOAEditLabel" runat="server" Text='<%# Eval("Nome_desc_PS_PESSOA") %>'></asp:Label>
                        <telerik:RadAutoCompleteBox  OnTextChanged="RadAutoCompleteBoxid_PS_PESSOA_TextChanged"  ID="RadAutoCompleteBoxid_PS_PESSOA" Width="95%" runat="server" Culture="pt-BR"  TextSettings-SelectionMode="Single"  DataSourceID="SqlDataSourcaBuscaRepresentante" DataTextField="Nome_desc_PS_PESSOA" DataValueField="id_PS_PESSOA" InputType="Text"></telerik:RadAutoCompleteBox>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_PS_PESSOALabel" runat="server" Text='<%# Eval("Nome_desc_PS_PESSOA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="perInicial_CL_CAD_COMISSOES_EMP" DataType="System.DateTime" FilterControlAltText="Filter perInicial_CL_CAD_COMISSOES_EMP column" HeaderText="INICIO COMISSÃO" SortExpression="perInicial_CL_CAD_COMISSOES_EMP" UniqueName="perInicial_CL_CAD_COMISSOES_EMP">
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="RadDatePicker_perInicial_CL_CAD_COMISSOES_EMP" runat="server" Culture="pt-BR" DbSelectedDate='<%# Bind("perInicial_CL_CAD_COMISSOES_EMP") %>'></telerik:RadDatePicker>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="perInicial_CL_CAD_COMISSOES_EMPLabel" runat="server"  Text='<%# Eval("perInicial_CL_CAD_COMISSOES_EMP", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="perFinal_CL_CAD_COMISSOES_EMP" DataType="System.DateTime" FilterControlAltText="Filter perFinal_CL_CAD_COMISSOES_EMP column" HeaderText="FINAL COMISSÃO" SortExpression="perFinal_CL_CAD_COMISSOES_EMP" UniqueName="perFinal_CL_CAD_COMISSOES_EMP">
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="RadDatePickerperFinal_CL_CAD_COMISSOES_EMP" runat="server" Culture="pt-BR"   DbSelectedDate='<%# Bind("perFinal_CL_CAD_COMISSOES_EMP") %>'></telerik:RadDatePicker>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="perFinal_CL_CAD_COMISSOES_EMPLabel" runat="server" Text='<%# Eval("perFinal_CL_CAD_COMISSOES_EMP", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="valor_CL_CAD_COMISSOES_EMP" Aggregate="Sum" FooterAggregateFormatString="TOTAL:{0}%"  DataType="System.Decimal" FilterControlAltText="Filter valor_CL_CAD_COMISSOES_EMP column" HeaderText="VALOR %" SortExpression="valor_CL_CAD_COMISSOES_EMP" UniqueName="valor_CL_CAD_COMISSOES_EMP">
                    <EditItemTemplate>
                          <asp:Label ID="LabelTOTAL_EM_USO" runat="server"  Visible="false" Text='<%# Eval("TOTAL_EM_USO") %>'></asp:Label>
                        <telerik:RadNumericTextBox ID="valor_CL_CAD_COMISSOES_EMPTextBox" runat="server"  DbValue='<%#Eval("valor_CL_CAD_COMISSOES_EMP") %>' Type="Number"  Culture="pt-BR" >
                            <NegativeStyle Resize="None" />
                            <NumberFormat DecimalDigits="2"/>
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelTOTAL" runat="server"  Visible="false" Text='<%# Eval("TOTAL_EM_USO") %>'></asp:Label>
                                              <asp:Label ID="valor_CL_CAD_COMISSOES_EMPLabel" runat="server" Text='<%# Eval("valor_CL_CAD_COMISSOES_EMP") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
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


    <asp:SqlDataSource ID="SqlDataSourceComissaoEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CL_CAD_COMISSOES_EMP] WHERE [id_CL_CAD_COMISSOES_EMP] = @id_CL_CAD_COMISSOES_EMP" InsertCommand="INSERT INTO CL_CAD_COMISSOES_EMP(perInicial_CL_CAD_COMISSOES_EMP, perFinal_CL_CAD_COMISSOES_EMP, id_ADM_TP_COMISSOES, id_PS_PESSOA, id_PS_PESSOA_inc, id_PS_PESSOA_alt, valor_CL_CAD_COMISSOES_EMP, codMatriz_PS_CLIENTES) VALUES (@perInicial_CL_CAD_COMISSOES_EMP, @perFinal_CL_CAD_COMISSOES_EMP, 1, @id_PS_PESSOA, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @valor_CL_CAD_COMISSOES_EMP, @codMatriz_PS_CLIENTES)" SelectCommand="SELECT CL_CAD_COMISSOES_EMP.perInicial_CL_CAD_COMISSOES_EMP, CL_CAD_COMISSOES_EMP.perFinal_CL_CAD_COMISSOES_EMP, CL_CAD_COMISSOES_EMP.id_PS_PESSOA, PS_PESSOA.desc_PS_PESSOA, CL_CAD_COMISSOES_EMP.valor_CL_CAD_COMISSOES_EMP, CL_CAD_COMISSOES_EMP.id_CL_CAD_COMISSOES_EMP, CAST(PS_PESSOA.id_PS_PESSOA AS VARCHAR(11)) + ' -  ' + PS_PESSOA.desc_PS_PESSOA AS Nome_desc_PS_PESSOA, (SELECT 100 - SUM(valor_CL_CAD_COMISSOES_EMP) AS TOTAL_EM_USO FROM CL_CAD_COMISSOES_EMP AS CL_CAD_COMISSOES_EMP_1 WHERE (codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)) AS TOTAL_EM_USO FROM CL_CAD_COMISSOES_EMP INNER JOIN PS_REPRESENTANTE ON CL_CAD_COMISSOES_EMP.id_PS_PESSOA = PS_REPRESENTANTE.id_PS_PESSOA INNER JOIN PS_PESSOA ON PS_REPRESENTANTE.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (CL_CAD_COMISSOES_EMP.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)" UpdateCommand="UPDATE CL_CAD_COMISSOES_EMP SET perInicial_CL_CAD_COMISSOES_EMP = @perInicial_CL_CAD_COMISSOES_EMP, perFinal_CL_CAD_COMISSOES_EMP = @perFinal_CL_CAD_COMISSOES_EMP, dtAlt_CL_CAD_COMISSOES_EMP = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, valor_CL_CAD_COMISSOES_EMP = @valor_CL_CAD_COMISSOES_EMP WHERE (id_CL_CAD_COMISSOES_EMP = @id_CL_CAD_COMISSOES_EMP)">
        <DeleteParameters>
            <asp:Parameter Name="id_CL_CAD_COMISSOES_EMP" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter  Name="perInicial_CL_CAD_COMISSOES_EMP" />
            <asp:Parameter  Name="perFinal_CL_CAD_COMISSOES_EMP" />
            <asp:Parameter Name="id_PS_PESSOA" Type="Int32" />
               <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
             <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
                     <asp:Parameter Name="valor_CL_CAD_COMISSOES_EMP" Type="Decimal" />
            <asp:QueryStringParameter QueryStringField="codMatriz_PS_CLIENTES" Name="codMatriz_PS_CLIENTES" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="perInicial_CL_CAD_COMISSOES_EMP" />
            <asp:Parameter DbType="Date" Name="perFinal_CL_CAD_COMISSOES_EMP" />
            <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="valor_CL_CAD_COMISSOES_EMP" Type="String" />
            <asp:Parameter Name="id_CL_CAD_COMISSOES_EMP" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourcaBuscaRepresentante" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT Nome_desc_PS_PESSOA, id_PS_PESSOA FROM ViewRadAutoCompleteBoxRepresentante"></asp:SqlDataSource>
       <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server"></telerik:RadWindowManager>
</asp:Content>
