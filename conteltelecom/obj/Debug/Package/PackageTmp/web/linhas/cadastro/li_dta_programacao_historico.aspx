<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="li_dta_programacao_historico.aspx.vb" Inherits="conteltelecom.li_dta_programacao_historico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridHistorico.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
    <telerik:RadGrid ID="RadGridHistorico" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceHistorico" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_LI_LINHAS,id_LI_CAD_PROGRAMACAO" DataSourceID="SqlDataSourceHistorico" AllowAutomaticDeletes="True">
            <Columns>
                <telerik:GridTemplateColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                    <EditItemTemplate>
                        <asp:TextBox ID="id_LI_LINHASTextBox" runat="server" Text='<%# Bind("id_LI_LINHAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        
                               <asp:Label ID="Labelid_LI_CAD_PROGRAMACAO" runat="server" Text='<%# Eval("id_LI_CAD_PROGRAMACAO") %>' Visible="false" ></asp:Label>
                        <asp:Label ID="id_LI_LINHASLabel" runat="server" Text='<%# Eval("id_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtMovel_LI_CAD_PROGRAMACAO" DataFormatString="{0:d}" DataType="System.DateTime" FilterControlAltText="Filter dtMovel_LI_CAD_PROGRAMACAO column" HeaderText="DATA MÓVEL" SortExpression="dtMovel_LI_CAD_PROGRAMACAO" UniqueName="dtMovel_LI_CAD_PROGRAMACAO">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtLdn_LI_CAD_PROGRAMACAO" DataFormatString="{0:d}" DataType="System.DateTime" FilterControlAltText="Filter dtLdn_LI_CAD_PROGRAMACAO column" HeaderText="DATA LDN" SortExpression="dtLdn_LI_CAD_PROGRAMACAO" UniqueName="dtLdn_LI_CAD_PROGRAMACAO">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="obs_LI_CAD_PROGRAMACAO" FilterControlAltText="Filter obs_LI_CAD_PROGRAMACAO column" HeaderText="OBSERVAÇÕES" SortExpression="obs_LI_CAD_PROGRAMACAO" UniqueName="obs_LI_CAD_PROGRAMACAO">
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn>
                            <ItemTemplate>
                         <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete"  Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>

                            <HeaderStyle Width="50px" />

                        </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceHistorico" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS, LI_CAD_PROGRAMACAO.dtMovel_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.dtLdn_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.obs_LI_CAD_PROGRAMACAO, LI_CAD_PROGRAMACAO.id_LI_CAD_PROGRAMACAO FROM LI_CAD_PROGRAMACAO INNER JOIN LI_LINHAS ON LI_CAD_PROGRAMACAO.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS WHERE (LI_LINHAS.id_LI_LINHAS = @id_LI_LINHAS) ORDER BY LI_CAD_PROGRAMACAO.dtInc_LI_CAD_PROGRAMACAO" DeleteCommand="DELETE FROM LI_CAD_PROGRAMACAO WHERE (id_LI_CAD_PROGRAMACAO = @id_LI_CAD_PROGRAMACAO)">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_CAD_PROGRAMACAO" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>
     <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
</asp:Content>
