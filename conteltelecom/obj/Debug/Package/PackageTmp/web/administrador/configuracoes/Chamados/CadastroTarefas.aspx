<%@ Page Title="TAREFAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroTarefas.aspx.vb" Inherits="conteltelecom.CadastroTarefas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridTarefas" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceTarefas">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CH_TIPO_TAREFA" DataSourceID="SqlDataSourceTarefas">
            <Columns>
                <telerik:GridBoundColumn DataField="id_CH_TIPO_TAREFA" DataType="System.Int32" FilterControlAltText="Filter id_CH_TIPO_TAREFA column" HeaderText="ID" ReadOnly="True" SortExpression="id_CH_TIPO_TAREFA" UniqueName="id_CH_TIPO_TAREFA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CH_TIPO_TAREFA" FilterControlAltText="Filter desc_CH_TIPO_TAREFA column" HeaderText="DESCRIÇÃO" SortExpression="desc_CH_TIPO_TAREFA" UniqueName="desc_CH_TIPO_TAREFA">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" ID="desc_CH_TIPO_TAREFATextBox" runat="server" Text='<%# Bind("desc_CH_TIPO_TAREFA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_TIPO_TAREFALabel" runat="server" Text='<%# Eval("desc_CH_TIPO_TAREFA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-8" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_CH_SETORES" DataType="System.Int32" FilterControlAltText="Filter id_CH_SETORES column" HeaderText="SETOR" SortExpression="id_CH_SETORES" UniqueName="id_CH_SETORES">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="id_CH_SETORESRadDropDownList" runat="server" DataSourceID="SqlDataSourceSetor" DataTextField="desc_CH_SETORES" DataValueField="id_CH_SETORES" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_SETORES") %>'></telerik:RadDropDownList>
                       
                       
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_SETORESLabel" runat="server" Text='<%# Eval("desc_CH_SETORES") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="tpSolucao_CH_TIPO_TAREFA" DataType="System.Int32" FilterControlAltText="Filter tpSolucao_CH_TIPO_TAREFA column" HeaderText="TEMPO SOLUÇÃO" SortExpression="tpSolucao_CH_TIPO_TAREFA" UniqueName="tpSolucao_CH_TIPO_TAREFA">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox  Width="95%" NumberFormat-DecimalDigits="0" ID="tpSolucao_CH_TIPO_TAREFATextBox" runat="server" Text='<%# Bind("tpSolucao_CH_TIPO_TAREFA") %>'></telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="tpSolucao_CH_TIPO_TAREFALabel" runat="server" Text='<%# Eval("tpSolucao_CH_TIPO_TAREFA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CH_TIPO_TAREFA" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CH_TIPO_TAREFA column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CH_TIPO_TAREFA">
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
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSourceTarefas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CH_TIPO_TAREFA] WHERE [id_CH_TIPO_TAREFA] = @id_CH_TIPO_TAREFA" InsertCommand="INSERT INTO CH_TIPO_TAREFA(desc_CH_TIPO_TAREFA, st_CH_TIPO_TAREFA, id_PS_PESSOA_alt, id_PS_PESSOA_inc, id_CH_SETORES, tpSolucao_CH_TIPO_TAREFA) VALUES (@desc_CH_TIPO_TAREFA, @st_CH_TIPO_TAREFA, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @id_CH_SETORES, @tpSolucao_CH_TIPO_TAREFA)" SelectCommand="SELECT CH_TIPO_TAREFA.id_CH_TIPO_TAREFA, CH_TIPO_TAREFA.desc_CH_TIPO_TAREFA, CH_TIPO_TAREFA.st_CH_TIPO_TAREFA, CH_TIPO_TAREFA.id_CH_SETORES, CH_TIPO_TAREFA.tpSolucao_CH_TIPO_TAREFA, CH_SETORES.desc_CH_SETORES FROM CH_TIPO_TAREFA INNER JOIN CH_SETORES ON CH_TIPO_TAREFA.id_CH_SETORES = CH_SETORES.id_CH_SETORES" UpdateCommand="UPDATE CH_TIPO_TAREFA SET desc_CH_TIPO_TAREFA = @desc_CH_TIPO_TAREFA, st_CH_TIPO_TAREFA = @st_CH_TIPO_TAREFA, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, id_CH_SETORES = @id_CH_SETORES, tpSolucao_CH_TIPO_TAREFA = @tpSolucao_CH_TIPO_TAREFA, dtAlt_CH_TIPO_TAREFA = GETDATE() WHERE (id_CH_TIPO_TAREFA = @id_CH_TIPO_TAREFA)">
        <DeleteParameters>
            <asp:Parameter Name="id_CH_TIPO_TAREFA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CH_TIPO_TAREFA" Type="String" />
            <asp:Parameter Name="st_CH_TIPO_TAREFA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
            <asp:Parameter Name="tpSolucao_CH_TIPO_TAREFA" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CH_TIPO_TAREFA" Type="String" />
            <asp:Parameter Name="st_CH_TIPO_TAREFA" Type="Byte" />
                     <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
            <asp:Parameter Name="tpSolucao_CH_TIPO_TAREFA" Type="Int32" />
            <asp:Parameter Name="id_CH_TIPO_TAREFA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceSetor" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_CH_SETORES, id_CH_SETORES FROM CH_SETORES WHERE (st_CH_SETORES = 1)"></asp:SqlDataSource>
</asp:Content>
