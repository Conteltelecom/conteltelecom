<%@ Page Title="CADASTRO DE UF" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master"  CodeBehind="ps_uf.aspx.vb" Inherits="conteltelecom.ps_uf"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
         <div class="form-inline">
  <fieldset>
    <legend>FILTROS</legend>
    <div class="col-lg-12  form-group">
                    <asp:Label ID="Label2" CssClass="col-lg-2 control-label" Font-Bold="true"  runat="server" Text="DESCRIÇÃO:" ></asp:Label>
            <div class="col-lg-10">
        <asp:TextBox ID="TextBoxDescricao" CssClass="form-control" runat="server"  ></asp:TextBox><br />
      </div>
    <asp:Label ID="Label3" CssClass="col-lg-2 control-label" Font-Bold="true" runat="server" Text="UF:" ></asp:Label>
    
      <div class="col-lg-10">
        <asp:TextBox ID="TextBoxDesc" CssClass="form-control" MaxLength="2" runat="server"  ></asp:TextBox>
          <br />
      </div>
 <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR" ValidationGroup="pesquisa">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                </div> 
      </div>  
    </fieldset>
</div>
    
    <br />
    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadGrid ID="RadGridUF" runat="server"   Culture="pt-BR" GroupPanelPosition="Top" Skin="Bootstrap" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" DataSourceID="SqlDataSourcePs_UF">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
           <ExportSettings>
               <Pdf PageWidth="">
               </Pdf>
           </ExportSettings>
       
           <MasterTableView AllowAutomaticUpdates="true" AllowAutomaticInserts="true" CommandItemDisplay="Top" DataSourceID="SqlDataSourcePs_UF"  EditMode="InPlace"    >
               
              <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
            
               <Columns>
                   <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter column column" HeaderText="UF" UniqueName="cod_PS_UF">
                       <EditItemTemplate>
                           <asp:Label ID="LabelCodUf" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </EditItemTemplate>
                       <InsertItemTemplate>
                           <telerik:RadTextBox ID="TextBoxCodUF" runat="server" Width="30px" MaxLength="2" Text='<%# Bind("cod_PS_UF") %>'></telerik:RadTextBox>
 
                       </InsertItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle Width="5px" />
                     
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn DataField="desc_PS_UF" FilterControlAltText="Filter column1 column" HeaderText="DESCRIÇÃO" UniqueName="desc_PS_UF">
                       <EditItemTemplate>
                           <telerik:RadTextBox ID="desc_PS_UFTextBox" Width ="100%" runat="server" Text='<%# Bind("desc_PS_UF") %>'></telerik:RadTextBox>

                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="desc_PS_UFLabel" runat="server" Text='<%# Eval("desc_PS_UF") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-xs-10" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="ST" UniqueName="ST">
                       <EditItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Checked='<%# Bind("st_PS_UF") %>' />
                       </EditItemTemplate>
                       <InsertItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server"  Checked="true"/>
                       </InsertItemTemplate>
                       <ItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Enabled ="false" Checked ='<%# Bind("st_PS_UF") %>' />
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" Width="5px" HorizontalAlign="Center" />
                       <ItemStyle HorizontalAlign="Center" Width="5px" />
                   </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
               </Columns>
            
             <EditFormSettings EditColumn-ButtonType="ImageButton" PopUpSettings-Modal="true" PopUpSettings-ShowCaptionInEditForm="true" >
                 
<EditColumn ButtonType="ImageButton"></EditColumn>

<PopUpSettings Modal="True"></PopUpSettings>
                 
             </EditFormSettings>
           </MasterTableView>
    </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSourcePs_UF" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPs_UF" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_UF(desc_PS_UF, cod_PS_UF, cod_PS_PAIS, st_PS_UF) VALUES (@desc_PS_UF, @cod_PS_UF, 1, @st_PS_UF)" UpdateCommand="UPDATE PS_UF SET desc_PS_UF = @desc_PS_UF, st_PS_UF = @st_PS_UF WHERE (cod_PS_UF = @cod_PS_UF)">
                <InsertParameters>
                    <asp:Parameter Name="desc_PS_UF" />
                    <asp:Parameter Name="cod_PS_UF" />
                    <asp:Parameter Name="st_PS_UF" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="cod_PS_UF" Type="String" />
                    <asp:Parameter Name="Desc" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="desc_PS_UF" />
                    <asp:Parameter Name="st_PS_UF" />
                    <asp:Parameter Name="cod_PS_UF" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
               
       <br />
    
</asp:Content>
