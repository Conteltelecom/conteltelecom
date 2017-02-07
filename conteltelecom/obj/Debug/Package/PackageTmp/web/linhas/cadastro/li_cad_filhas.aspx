<%@ Page Title="CADASTRO DE AGRUPAMENTO DE LINHAS FILHAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="li_cad_filhas.aspx.vb" Inherits="conteltelecom.li_cad_filhas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .RadListBox .rlbCheck
        {
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <br />
    <br />
    <telerik:RadFormDecorator ID="RadFormDecoratorfieldset" DecoratedControls="Fieldset" Skin="Bootstrap" runat="server" />
   
    <telerik:RadGrid ID="RadGridLinhasFilhas" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasFilhas" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        
        <MasterTableView Caption="<span style='font-style:italic; color:Red;'>TEXT</span>" DataKeyNames="id_LI_LINHAS,id_LI_CAD_LINHA_FILHAS" DataSourceID="SqlDataSourceLinhasFilhas" AllowAutomaticDeletes="True">
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_CAD_LINHA_FILHAS" FilterControlAltText="Filter id_LI_CAD_LINHA_FILHAS column" HeaderText="ID" UniqueName="id_LI_CAD_LINHA_FILHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID LINHA" ReadOnly="True" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-11" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                <FormTemplate>
                      <table class="rgMasterTable" style="padding-left:10px;padding-right:10px; width:100%">
                      <tbody>
        <tr class="rgEditRow">
            <td>
                <asp:CheckBoxList ID="CheckBoxListLinhas"  runat="server" Width="100%" RepeatColumns="6" RepeatLayout="Table"  DataSourceID="SqlDataSourceLinhasDisponiveis" DataTextField="codLinha_LI_LINHAS" DataValueField="id_LI_LINHAS"></asp:CheckBoxList>
                </td>
            </tr>    
                 </tbody>     
                      </table>
                     <table class="rgMasterTable" style="padding-left:10px;padding-right:10px; width:100%">
        <tfoot>
            <tr class="rgCommandRow">
                <td class="rgCommandCell">
                      <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
                      <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                </td>
            </tr>
        </tfoot>
          </table>   
                </FormTemplate>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
          
    
   
    <asp:SqlDataSource ID="SqlDataSourceLinhasFilhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, dbo.MascaraTelefone(LI_LINHAS.numLinha_LI_LINHAS) AS codLinha_LI_LINHAS, LI_CAD_LINHA_FILHAS.id_LI_CAD_LINHA_FILHAS FROM LI_CAD_LINHA_FILHAS INNER JOIN LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES ON LI_CAD_LINHA_FILHAS.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS INNER JOIN LI_CAD_LINHA_CHAVE ON LI_CAD_LINHA_FILHAS.id_LI_CAD_LINHA_CHAVE = LI_CAD_LINHA_CHAVE.id_LI_CAD_LINHA_CHAVE WHERE (LI_LINHAS.liCancelada_LI_LINHAS = 0) AND (LI_LINHAS.st_LI_LINHAS = 1) AND (LI_CAD_LINHA_CHAVE.id_LI_CAD_LINHA_CHAVE = @id_LI_CAD_LINHA_CHAVE) AND (LI_LINHAS.id_LI_LINHAS NOT IN (SELECT LI_CAD_LINHA_CHAVE_1.id_LI_LINHAS FROM LI_CAD_LINHA_CHAVE AS LI_CAD_LINHA_CHAVE_1 INNER JOIN LI_LINHAS AS LI_LINHAS_1 ON LI_CAD_LINHA_CHAVE_1.id_LI_LINHAS = LI_LINHAS_1.id_LI_LINHAS INNER JOIN PS_CLIENTES AS PS_CLIENTES_1 ON LI_LINHAS_1.id_PS_CLIENTES = PS_CLIENTES_1.id_PS_CLIENTES WHERE (PS_CLIENTES_1.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS_1.liCancelada_LI_LINHAS = 0) AND (LI_LINHAS_1.st_LI_LINHAS = 1)))" DeleteCommand="DELETE FROM LI_CAD_LINHA_FILHAS WHERE (id_LI_CAD_LINHA_FILHAS = @ID_LI_CAD_LINHA_FILHAS)" InsertCommand="INSERT INTO LI_CAD_LINHA_FILHAS(id_LI_LINHAS, id_LI_CAD_LINHA_CHAVE, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@id_LI_LINHAS, @id_LI_CAD_LINHA_CHAVE, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)">
        <DeleteParameters>
            <asp:Parameter Name="ID_LI_CAD_LINHA_FILHAS" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
            <asp:Parameter Name="id_LI_CAD_LINHA_CHAVE" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_PS_PESSOA_inc" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_CAD_LINHA_CHAVE" QueryStringField="id_LI_CAD_LINHA_CHAVE" />
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLinhasDisponiveis" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, dbo.MascaraTelefone(LI_LINHAS.numLinha_LI_LINHAS) AS codLinha_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.id_LI_LINHAS NOT IN (SELECT id_LI_LINHAS FROM LI_CAD_LINHA_FILHAS AS LI_CAD_LINHA_FILHAS_1)) AND (LI_LINHAS.st_LI_LINHAS = 1) AND (LI_LINHAS.liCancelada_LI_LINHAS = 0) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.linhaVirtual_LI_LINHAS = 0) AND (LI_LINHAS.liCancelada_LI_LINHAS = 0) AND (LI_LINHAS.st_LI_LINHAS = 1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
