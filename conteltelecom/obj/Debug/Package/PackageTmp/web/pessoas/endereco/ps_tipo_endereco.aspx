<%@ Page Title="TIPO DE ENDEREÇO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_tipo_endereco.aspx.vb" Inherits="conteltelecom.ps_tipo_endereco" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    
    <div class="table-responsive">  
    <telerik:RadGrid ID="RadGridCadTipoEndereco" runat="server" AutoGenerateColumns="False" Culture="pt-BR" RenderMode="Lightweight" DataSourceID="SqlDataSourcePS_tipo_endereco" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" >
        <GroupPanel Text="ARRASTE  A COLUNA PARA FILTAR"></GroupPanel>
        <GroupingSettings CollapseAllTooltip="DESAGRUPAR" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip=""></GroupingSettings>
        <ExportSettings ExportOnlyData="True" HideStructureColumns="True" IgnorePaging="True" OpenInNewWindow="True">
            <Pdf PageWidth="">
            </Pdf>
            <Excel Format="Xlsx" />
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataKeyNames="id_PS_TP_ENDERECO" DataSourceID="SqlDataSourcePS_tipo_endereco" EditMode="InPlace" EnableSplitHeaderText="False">
        
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_TP_ENDERECO" DataType="System.Int32" FilterControlAltText="Filter id_PS_TP_ENDERECO column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_TP_ENDERECO" UniqueName="id_PS_TP_ENDERECO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_PS_TP_ENDERECO" FilterControlAltText="Filter desc_PS_TP_ENDERECO column" HeaderText="DESCRIÇÃO" SortExpression="desc_PS_TP_ENDERECO" UniqueName="desc_PS_TP_ENDERECO">
                    <EditItemTemplate>
                        <asp:TextBox ID="desc_PS_TP_ENDERECOTextBox" runat="server" Text='<%# Bind("desc_PS_TP_ENDERECO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_TP_ENDERECOLabel" runat="server" Text='<%# Eval("desc_PS_TP_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_PS_TP_ENDERECO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_PS_TP_ENDERECO column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_PS_TP_ENDERECO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn ButtonType="ImageButton"
                     EditImageUrl="~\img\edit_32.png" 
                     CancelImageUrl="~\img\block_32.png"
                     InsertImageUrl="~\img\accept_32.png" 
                     UpdateImageUrl="~\img\accept_32.png">
                </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="ATENÇÃO!!!! CUIDADO VOCÊ ESTA EXCLUIDO UM REGISTRO" ConfirmTitle="EXCLUSÃO DE REGISTRO" Display="true" FilterControlAltText="Filter column column" HeaderText="EXCLUIR" ImageUrl="~\img\delete_32.png" ItemStyle-HorizontalAlign="Center" UniqueName="Delete">
                         <ItemStyle HorizontalAlign="Center" />
                     </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->




    <asp:SqlDataSource ID="SqlDataSourcePS_tipo_endereco" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_TP_ENDERECO] WHERE [id_PS_TP_ENDERECO] = @id_PS_TP_ENDERECO" InsertCommand="INSERT INTO PS_TP_ENDERECO(desc_PS_TP_ENDERECO, st_PS_TP_ENDERECO, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@desc_PS_TP_ENDERECO, @st_PS_TP_ENDERECO, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" SelectCommand="SELECT id_PS_TP_ENDERECO, desc_PS_TP_ENDERECO, st_PS_TP_ENDERECO FROM PS_TP_ENDERECO" UpdateCommand="UPDATE PS_TP_ENDERECO SET desc_PS_TP_ENDERECO = @desc_PS_TP_ENDERECO, st_PS_TP_ENDERECO = @st_PS_TP_ENDERECO, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_PS_TP_ENDERECO = GETDATE() WHERE (id_PS_TP_ENDERECO = @id_PS_TP_ENDERECO)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_TP_ENDERECO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_PS_TP_ENDERECO" Type="String" />
            <asp:Parameter Name="st_PS_TP_ENDERECO" Type="Byte" />
                       <asp:SessionParameter Name="id_PS_PESSOA_alt" Type="Int32" SessionField="id_PS_PESSOA_USUARIO" />
              <asp:SessionParameter Name="id_PS_PESSOA_inc" Type="Int32" SessionField="id_PS_PESSOA_USUARIO" />
              </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_TP_ENDERECO" Type="String" />
            <asp:Parameter Name="st_PS_TP_ENDERECO" Type="Byte" />
           <asp:SessionParameter Name="id_PS_PESSOA_alt" Type="Int32" SessionField="id_PS_PESSOA_USUARIO" />
            <asp:Parameter Name="id_PS_TP_ENDERECO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
