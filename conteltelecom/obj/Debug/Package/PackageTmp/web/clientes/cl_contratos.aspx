<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_contratos.aspx.vb" Inherits="conteltelecom.cl_contratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
  
       <telerik:RadWindowManager ID = "RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
    <telerik:RadGrid ID="RadGridContratos" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceContratos" Skin="Bootstrap" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_CAD_CONTRATOS" DataSourceID="SqlDataSourceContratos" EditMode="InPlace" Name="normal"  CommandItemDisplay ="Top" >
            <DetailTables>
                <telerik:GridTableView runat="server"  DataSourceID="SqlDataSourceAnexos" Name="Anexos" CommandItemDisplay="Top" EditMode="InPlace" DataKeyNames="id_ANEXOS" AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowAutomaticDeletes="True" >
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_CL_CAD_CONTRATOS" MasterKeyField="id_CL_CAD_CONTRATOS" />
                    </ParentTableRelation>
                    <CommandItemSettings AddNewRecordImageUrl="../../img/add.png"  AddNewRecordText="NOVO ANEXO" ShowRefreshButton="false" />
                    <Columns>
                        <telerik:GridBoundColumn DataField="id_ANEXOS" FilterControlAltText="Filter id_ANEXOS column" HeaderText="ID" UniqueName="id_ANEXOS" ReadOnly="true" >
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="nome_ANEXOS" FilterControlAltText="Filter nome_ANEXOS column" HeaderText="NOME ANEXO" UniqueName="nome_ANEXOS">
                            <EditItemTemplate>
                                <telerik:RadAsyncUpload ID="RadUploadAnexosContrato" runat="server" MaxFileInputsCount="1" >
                                    <Localization Select="..." />
                                </telerik:RadAsyncUpload>
                                                            
         
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="nome_ANEXOSLabel" runat="server" Text='<%# Eval("nome_ANEXOS") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-12" />
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>

                                <asp:HyperLink ID="HyperLink1" runat="server"  ImageUrl="~/img/downloading_32.png"  NavigateUrl='<%# String.Format("~/download_page.aspx?id={0}", Eval("id_ANEXOS")) %>'  Target="_blank" ></asp:HyperLink>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandArgument='<%# Eval("id_ANEXOS") %>' CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK"  runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <CommandItemSettings AddNewRecordImageUrl="../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton ="false" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_CL_CAD_CONTRATOS" FilterControlAltText="Filter id_CL_CAD_CONTRATOS column" HeaderText="ID" UniqueName="id_CL_CAD_CONTRATOS" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataSourceID="ObjectDataSourceBuscaContratos"  FilterControlAltText="Filter id_CL_TIPOS_CONTRATOS column" HeaderText="TIPO DE CONTRATO" ListTextField="desc_CL_TIPOS_CONTRATOS" ListValueField="id_CL_TIPOS_CONTRATOS" UniqueName="id_CL_TIPOS_CONTRATOS" DataField="id_CL_TIPOS_CONTRATOS" >
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridDropDownColumn>
                <telerik:GridTemplateColumn DataField="vl_contrato" FilterControlAltText="Filter vl_contrato column" HeaderText="VALOR" UniqueName="vl_contrato">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox ID="vl_contratoRadNumericTextBox" runat="server" DbValue='<%# Bind("vl_contrato") %>' Type="Number">
                        </telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vl_contratoLabel" runat="server" Text='<%# Eval("vl_contrato", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridDateTimeColumn DataField="dt_inici_CL_TIPOS_CONTRATOS" DataType="System.DateTime"  DataFormatString="{0:d}" DefaultInsertValue="01/01/2016" FilterControlAltText="Filter dt_inici_CL_TIPOS_CONTRATOS column" HeaderText="DT INICIAL" UniqueName="dt_inici_CL_TIPOS_CONTRATOS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridDateTimeColumn>
                <telerik:GridDateTimeColumn DataField="dt_fim_CL_TIPOS_CONTRATOS" DataType="System.DateTime" DataFormatString="{0:d}" DefaultInsertValue="01/01/2016" FilterControlAltText="Filter dt_fim_CL_TIPOS_CONTRATOS column" HeaderText="DATA FIM" UniqueName="dt_fim_CL_TIPOS_CONTRATOS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridDateTimeColumn>
                <telerik:GridCheckBoxColumn DataField="st_CL_TIPOS_CONTRATOS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CL_TIPOS_CONTRATOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CL_TIPOS_CONTRATOS">
                </telerik:GridCheckBoxColumn>
                 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar"  runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
  </ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceContratos" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT CL_CAD_CONTRATOS.st_CL_TIPOS_CONTRATOS, CL_CAD_CONTRATOS.vl_contrato, CL_CAD_CONTRATOS.dt_fim_CL_TIPOS_CONTRATOS, CL_CAD_CONTRATOS.dt_inici_CL_TIPOS_CONTRATOS, CL_TIPOS_CONTRATOS.desc_CL_TIPOS_CONTRATOS, CL_TIPOS_CONTRATOS.id_CL_TIPOS_CONTRATOS, CL_CAD_CONTRATOS.id_CL_CAD_CONTRATOS FROM CL_CAD_CONTRATOS INNER JOIN CL_TIPOS_CONTRATOS ON CL_CAD_CONTRATOS.id_CL_TIPOS_CONTRATOS = CL_TIPOS_CONTRATOS.id_CL_TIPOS_CONTRATOS WHERE (CL_CAD_CONTRATOS.id_PS_CLIENTES = @id_PS_CLIENTES)" InsertCommand="INSERT INTO CL_CAD_CONTRATOS(id_PS_CLIENTES, id_CL_TIPOS_CONTRATOS, dt_inici_CL_TIPOS_CONTRATOS, dt_fim_CL_TIPOS_CONTRATOS, vl_contrato, st_CL_TIPOS_CONTRATOS) VALUES (@id_PS_CLIENTES, @id_CL_TIPOS_CONTRATOS, @dt_inici_CL_TIPOS_CONTRATOS, @dt_fim_CL_TIPOS_CONTRATOS, @vl_contrato, @st_CL_TIPOS_CONTRATOS)" DeleteCommand="DELETE FROM CL_CAD_CONTRATOS WHERE (id_CL_CAD_CONTRATOS = @id_CL_CAD_CONTRATOS)" UpdateCommand="UPDATE CL_CAD_CONTRATOS SET id_CL_TIPOS_CONTRATOS = @id_CL_TIPOS_CONTRATOS, dt_inici_CL_TIPOS_CONTRATOS = @dt_inici_CL_TIPOS_CONTRATOS, dt_fim_CL_TIPOS_CONTRATOS = @dt_fim_CL_TIPOS_CONTRATOS, vl_contrato = @vl_contrato, st_CL_TIPOS_CONTRATOS = @st_CL_TIPOS_CONTRATOS WHERE (id_CL_CAD_CONTRATOS = @id_CL_CAD_CONTRATOS)">
    <DeleteParameters>
        <asp:Parameter Name="id_CL_CAD_CONTRATOS" />
    </DeleteParameters>
    <InsertParameters>
       <asp:QueryStringParameter  Name ="id_PS_CLIENTES" QueryStringField ="id_pessoas" />
        <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="dt_inici_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="dt_fim_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="vl_contrato" />
        <asp:Parameter Name="st_CL_TIPOS_CONTRATOS" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="id_PS_CLIENTES" QueryStringField="id_pessoas" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="dt_inici_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="dt_fim_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="vl_contrato" />
        <asp:Parameter Name="st_CL_TIPOS_CONTRATOS" />
        <asp:Parameter Name="id_CL_CAD_CONTRATOS" />
    </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:ObjectDataSource ID="ObjectDataSourceBuscaContratos" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.BuscaContratosTableAdapters.CL_TIPOS_CONTRATOSTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_CL_TIPOS_CONTRATOS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CL_TIPOS_CONTRATOS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CL_TIPOS_CONTRATOS" Type="String" />
            <asp:Parameter Name="Original_id_CL_TIPOS_CONTRATOS" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAnexos" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_ANEXOS, nome_ANEXOS FROM ANEXOS WHERE (categoria_ANEXO = 1) AND (identificador_ANEXOS = @identificador_ANEXOS)" DeleteCommand="DELETE FROM ANEXOS WHERE (id_ANEXOS = @id_ANEXOS)">
        <DeleteParameters>
            <asp:Parameter Name="id_ANEXOS" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="identificador_ANEXOS" QueryStringField="id_pessoas" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
