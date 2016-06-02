<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="li_cad_tipo_programacao.aspx.vb" Inherits="conteltelecom.li_cad_tipo_programacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
     <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridLICadProgramacao.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
         <asp:HiddenField ID="HiddenField1" runat="server" Value="false" />
     <telerik:RadGrid ID="RadGridLICadProgramacao" runat="server" AllowPaging="True" AutoGenerateColumns="False" Culture="pt-BR"  DataSourceID="SqlDataSourceCadProgramacao" GroupPanelPosition="Top" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" MasterTableView-EditMode ="InPlace"  >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        
        <MasterTableView DataKeyNames="id_LI_TIPO_PROGRAMACAO" DataSourceID="SqlDataSourceCadProgramacao" CommandItemDisplay="Top" NoMasterRecordsText="SEM REGISTROS" >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_TIPO_PROGRAMACAO" DataType="System.Int32" FilterControlAltText="Filter id_LI_TIPO_PROGRAMACAO column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_TIPO_PROGRAMACAO" UniqueName="id_LI_TIPO_PROGRAMACAO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_LI_TIPO_PROGRAMACAO" FilterControlAltText="Filter desc_LI_TIPO_PROGRAMACAO column" HeaderText="DESCRIÇÃO" SortExpression="desc_LI_TIPO_PROGRAMACAO" UniqueName="desc_LI_TIPO_PROGRAMACAO">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_LI_TIPO_PROGRAMACAOTextBox" runat="server" Text='<%# Bind("desc_LI_TIPO_PROGRAMACAO") %> ' Width="90%"></telerik:RadTextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatordesc_LI_TIPO_PROGRAMACAOTextBox" ControlToValidate="desc_LI_TIPO_PROGRAMACAOTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_LI_TIPO_PROGRAMACAOLabel" runat="server" Text='<%# Eval("desc_LI_TIPO_PROGRAMACAO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_LI_TIPO_PROGRAMACAO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_LI_TIPO_PROGRAMACAO column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_LI_TIPO_PROGRAMACAO">
                </telerik:GridCheckBoxColumn>
                 <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
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
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px">
     </telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSourceCadProgramacao" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM [LI_TIPO_PROGRAMACAO] WHERE [id_LI_TIPO_PROGRAMACAO] = @id_LI_TIPO_PROGRAMACAO" InsertCommand="INSERT INTO [LI_TIPO_PROGRAMACAO] ([desc_LI_TIPO_PROGRAMACAO], [st_LI_TIPO_PROGRAMACAO]) VALUES (@desc_LI_TIPO_PROGRAMACAO, @st_LI_TIPO_PROGRAMACAO)" SelectCommand="SELECT [id_LI_TIPO_PROGRAMACAO], [desc_LI_TIPO_PROGRAMACAO], [st_LI_TIPO_PROGRAMACAO] FROM [LI_TIPO_PROGRAMACAO]" UpdateCommand="UPDATE [LI_TIPO_PROGRAMACAO] SET [desc_LI_TIPO_PROGRAMACAO] = @desc_LI_TIPO_PROGRAMACAO, [st_LI_TIPO_PROGRAMACAO] = @st_LI_TIPO_PROGRAMACAO WHERE [id_LI_TIPO_PROGRAMACAO] = @id_LI_TIPO_PROGRAMACAO">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_TIPO_PROGRAMACAO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_LI_TIPO_PROGRAMACAO" Type="String" />
            <asp:Parameter Name="st_LI_TIPO_PROGRAMACAO" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_LI_TIPO_PROGRAMACAO" Type="String" />
            <asp:Parameter Name="st_LI_TIPO_PROGRAMACAO" Type="Byte" />
            <asp:Parameter Name="id_LI_TIPO_PROGRAMACAO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
