<%@ Page Title="PERMISSÕES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroPermissao.aspx.vb" Inherits="conteltelecom.CadastroPermissao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <div class="table-responsive">  
    <telerik:RadGrid ID="RadGridPermissao" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourcePermissao">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_PS_PERMISSAO" DataSourceID="SqlDataSourcePermissao">
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_PERMISSAO" DataType="System.Int32" FilterControlAltText="Filter id_PS_PERMISSAO column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_PERMISSAO" UniqueName="id_PS_PERMISSAO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="decs_PS_PERMISSAO" FilterControlAltText="Filter decs_PS_PERMISSAO column" HeaderText="DESCRIÇÃO" SortExpression="decs_PS_PERMISSAO" UniqueName="decs_PS_PERMISSAO">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="decs_PS_PERMISSAOTextBox" Width="95%" runat="server" Text='<%# Bind("decs_PS_PERMISSAO") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="decs_PS_PERMISSAOLabel" runat="server" Text='<%# Eval("decs_PS_PERMISSAO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-10" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="vlPermissao_PS_PERMISSAO" FilterControlAltText="Filter vlPermissao_PS_PERMISSAO column" HeaderText="VALOR" UniqueName="vlPermissao_PS_PERMISSAO">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox Width="95%"  NumberFormat-DecimalDigits="0"  ID="vlPermissao_PS_PERMISSAOTextBox" runat="server" Text='<%# Bind("vlPermissao_PS_PERMISSAO") %>'></telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vlPermissao_PS_PERMISSAOLabel" runat="server" Text='<%# Eval("vlPermissao_PS_PERMISSAO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="excluir_PS_PERMISSAO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter excluir_PS_PERMISSAO column" HeaderText="EXCLUIR" StringFalseValue="0" StringTrueValue="1" UniqueName="excluir_PS_PERMISSAO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="editar_PS_PERMISSAO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter editar_PS_PERMISSAO column" HeaderText="EDITAR" StringFalseValue="0" StringTrueValue="1" UniqueName="editar_PS_PERMISSAO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="inserir_PS_PERMISSAO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter inserir_PS_PERMISSAO column" HeaderText="INSERIR" StringFalseValue="0" StringTrueValue="1" UniqueName="inserir_PS_PERMISSAO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="st_PS_PERMISSAO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_PS_PERMISSAO column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_PS_PERMISSAO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <div class="table-responsive">  

    <asp:SqlDataSource ID="SqlDataSourcePermissao" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_PERMISSAO] WHERE [id_PS_PERMISSAO] = @id_PS_PERMISSAO" InsertCommand="INSERT INTO PS_PERMISSAO(decs_PS_PERMISSAO, st_PS_PERMISSAO, id_PS_PESSOA_alt, id_PS_PESSOA_inc, excluir_PS_PERMISSAO, inserir_PS_PERMISSAO, vlPermissao_PS_PERMISSAO, editar_PS_PERMISSAO) VALUES (@decs_PS_PERMISSAO, @st_PS_PERMISSAO, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @excluir_PS_PERMISSAO, @inserir_PS_PERMISSAO, @vlPermissao_PS_PERMISSAO, @editar_PS_PERMISSAO)" SelectCommand="SELECT id_PS_PERMISSAO, decs_PS_PERMISSAO, st_PS_PERMISSAO, excluir_PS_PERMISSAO, editar_PS_PERMISSAO, inserir_PS_PERMISSAO, vlPermissao_PS_PERMISSAO FROM PS_PERMISSAO" UpdateCommand="UPDATE PS_PERMISSAO SET decs_PS_PERMISSAO = @decs_PS_PERMISSAO, st_PS_PERMISSAO = @st_PS_PERMISSAO, dtAlt_PS_PERMISSAO = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, vlPermissao_PS_PERMISSAO = @vlPermissao_PS_PERMISSAO, inserir_PS_PERMISSAO = @inserir_PS_PERMISSAO, editar_PS_PERMISSAO = @editar_PS_PERMISSAO, excluir_PS_PERMISSAO = @excluir_PS_PERMISSAO WHERE (id_PS_PERMISSAO = @id_PS_PERMISSAO)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_PERMISSAO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="decs_PS_PERMISSAO" Type="String" />
            <asp:Parameter Name="st_PS_PERMISSAO"  />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="excluir_PS_PERMISSAO" />
            <asp:Parameter Name="inserir_PS_PERMISSAO" />
            <asp:Parameter Name="vlPermissao_PS_PERMISSAO" />
            <asp:Parameter Name="editar_PS_PERMISSAO" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="decs_PS_PERMISSAO" Type="String" />
            <asp:Parameter Name="st_PS_PERMISSAO" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="vlPermissao_PS_PERMISSAO" />
            <asp:Parameter Name="inserir_PS_PERMISSAO" />
            <asp:Parameter Name="editar_PS_PERMISSAO" />
            <asp:Parameter Name="excluir_PS_PERMISSAO" />
            <asp:Parameter Name="id_PS_PERMISSAO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
