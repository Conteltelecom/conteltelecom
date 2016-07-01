<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master"  CodeBehind="ps_uf.aspx.vb" Inherits="conteltelecom.ps_uf"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <div class="form-horizontal"  style="min-width:640px;">
  <fieldset>
    <legend>FILTROS</legend>
    <div class="form-group">
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
            <telerik:RadGrid ID="RadGridUF" runat="server" MasterTableView-EditMode="PopUp"    Culture="pt-BR" GroupPanelPosition="Top" Skin="Bootstrap" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" DataSourceID="SqlDataSourcePs_UF">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
           <ExportSettings>
               <Pdf PageWidth="">
               </Pdf>
           </ExportSettings>
           <ClientSettings>
               <Selecting AllowRowSelect="True" />
               <Resizing AllowResizeToFit="true" />
               <ClientEvents OnPopUpShowing="popUpShowing" />
           </ClientSettings>
           <MasterTableView AllowAutomaticUpdates="true" AllowAutomaticInserts="true" CommandItemDisplay="Top" DataSourceID="SqlDataSourcePs_UF"    >
               
              <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
            
               <Columns>
                   <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter column column" HeaderText="UF" UniqueName="cod_PS_UF">
                       <EditItemTemplate>
                           <asp:Label ID="LabelCodUf" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </EditItemTemplate>
                       <InsertItemTemplate>
                           <asp:TextBox ID="TextBoxCodUF" runat="server" MaxLength="2" Text='<%# Bind("cod_PS_UF") %>'></asp:TextBox>
                       </InsertItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridBoundColumn FilterControlAltText="Filter column1 column" HeaderText="DESCRIÇÃO" UniqueName="desc_PS_UF" DataField="desc_PS_UF">
                       <HeaderStyle CssClass="col-lg-9" />
                   </telerik:GridBoundColumn>
                   <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="SITUAÇÃO" UniqueName="ST">
                       <EditItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Checked='<%# Bind("st_PS_UF") %>' />
                       </EditItemTemplate>
                       <InsertItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server"  Checked="true"/>
                       </InsertItemTemplate>
                       <ItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Enabled ="false" Checked ='<%# Bind("st_PS_UF") %>' />
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" />
                       <ItemStyle HorizontalAlign="Center" />
                   </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Groupable="False" HeaderText="DETALHES" UniqueName="DETALHES">
                        <EditItemTemplate>
                            <asp:Button runat="server" CommandName="Update" Text="Update" />
                            &nbsp;<asp:Button runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <telerik:RadButton ID="RadButtonDetalhes" runat="server" CommandName="detalhes" Skin="Bootstrap" Text="DETALHES">
                           <Icon PrimaryIconUrl="../../img/search_page.png" />
                                 </telerik:RadButton>
                        </ItemTemplate>
                        <HeaderStyle CssClass="col-lg-1" />
                   </telerik:GridTemplateColumn>
               </Columns>
            
             <EditFormSettings EditColumn-ButtonType="ImageButton" PopUpSettings-Modal="true" PopUpSettings-ShowCaptionInEditForm="true" >
                 
<EditColumn ButtonType="ImageButton"></EditColumn>

<PopUpSettings Modal="True"></PopUpSettings>
                 
             </EditFormSettings>
           </MasterTableView>
    </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSourcePs_UF" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPs_UF" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_UF(desc_PS_UF, cod_PS_UF, cod_PS_PAIS, st_PS_UF) VALUES (@desc_PS_UF, @cod_PS_UF, 1, @st_PS_UF)">
                <InsertParameters>
                    <asp:Parameter Name="desc_PS_UF" />
                    <asp:Parameter Name="cod_PS_UF" />
                    <asp:Parameter Name="st_PS_UF" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="cod_PS_UF" Type="String" />
                    <asp:Parameter Name="Desc" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
               
       <br />
    
</asp:Content>
