<%@ Page Title="CADASTRO DE PESSOAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_pessoas.aspx.vb" Inherits="conteltelecom.ps_pessoas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
     <fieldset class="fieldsetForms">
                        <legend>FILTROS</legend>
         <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                    <asp:Label ID="LabelNome" runat="server" CssClass="col-lg-2 control-label" Text="CÓD INI:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxCodIni" Width="100%" runat="server" CssClass="form-control" />
                                  </div>
                                  <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Text="CÓD FIM:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxCodFim" Width="100%" runat="server" CssClass="form-control" />
                                  </div>
                                </div>
                                <div class="col-lg-12 form-group">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxDesc" Width="100%" runat="server" CssClass="form-control" />
                                  </div>
                                </div>
                                <div class="col-lg-12 form-group">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Text="CPF:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxCpf" Width="100%" runat="server" CssClass="form-control" />
                                  </div>
                                </div>
                      <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>                
                  
                    
</div>
             
         </div>




         </fieldset>
    <br />
  
    <hr />
      <br />
    <telerik:RadGrid ID="RadGridPessoaFisica" runat="server"   MasterTableView-EditMode="EditForms" Skin="Bootstrap" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourcePs_PessoaFisica" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" >

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
             <ExportSettings>
                 <Pdf PageWidth="">
                 </Pdf>
         </ExportSettings>
             <ClientSettings>
             <Selecting AllowRowSelect="True" />
            <ClientEvents OnPopUpShowing="popUpShowing" />
                 <Scrolling AllowScroll="True"  />
        </ClientSettings>
         <MasterTableView DataSourceID="SqlDataSourcePs_PessoaFisica"    Width="100%" CommandItemDisplay="Top" AllowSorting="True"  >
             <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
                              <Columns>
                                  <telerik:GridTemplateColumn DataField="id_PS_PESSOA" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="CÓD" UniqueName="id_PS_PESSOA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="id_PS_PESSOATextBox" runat="server" Text='<%# Bind("id_PS_PESSOA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="id_PS_PESSOALabel" runat="server" Text='<%# Eval("id_PS_PESSOA") %>'></asp:Label>
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-lg-1" />
                                      <ItemStyle CssClass="col-lg-1" />
                                  </telerik:GridTemplateColumn>
                                  <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME" UniqueName="desc_PS_PESSOA">
                                      <HeaderStyle CssClass="col-lg-5" />
                                      <ItemStyle CssClass="col-lg-5" />
                                  </telerik:GridBoundColumn>
                                  <telerik:GridTemplateColumn DataField="cpf_PS_FISICA" FilterControlAltText="Filter cpf_PS_FISICA column" HeaderText="CPF" UniqueName="cpf_PS_FISICA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="cpf_PS_FISICATextBox" runat="server" Text='<%# Bind("cpf_PS_FISICA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="cpf_PS_FISICALabel" runat="server" Text='<%#Me.CpfFormat(Eval("cpf_PS_FISICA")) %>'></asp:Label>
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-lg-2" />
                                      <ItemStyle CssClass="col-lg-2" />
                                  </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn DataField="fone01_PS_FISICA" FilterControlAltText="Filter fone01_PS_FISICA column" HeaderText="TELEFONE" UniqueName="fone01_PS_FISICA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="fone01_PS_FISICATextBox" runat="server" Text='<%# Bind("fone01_PS_FISICA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="fone01_PS_FISICALabel" runat="server" Text='<%#Me.FormataFone(Eval("fone01_PS_FISICA")) %>'></asp:Label>
                                      </ItemTemplate>
                                  </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn FilterControlAltText="Filter SITUACAO column" HeaderText="SITUAÇÃO" UniqueName="ST">
                                      <ItemTemplate>
                                          <asp:CheckBox ID="CheckBoxSt" runat="server" Checked='<%# Bind("st_PS_PESSOA") %>' />
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-lg-1" HorizontalAlign="Center" />
                                      <ItemStyle CssClass="col-lg-1" HorizontalAlign="Center" />
                                  </telerik:GridTemplateColumn>
                      <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" HeaderText="DETALHES" UniqueName="DETALHES">
                        
                          <ItemTemplate>
                              <telerik:RadButton ID="RadButtonDetalhes" runat="server" Text="DETALHES" CommandName="Pesquisar">
                                              <Icon PrimaryIconUrl ="../../img/search_page.png" />
                                          </telerik:RadButton>
                          </ItemTemplate>
                          <HeaderStyle CssClass="col-lg-1" />
                          <ItemStyle CssClass="col-lg-1" />
                        </telerik:GridTemplateColumn>

             </Columns>
           
         
           <EditFormSettings    EditColumn-ButtonType="ImageButton"  EditFormType="Template" FormStyle-CssClass="col-lg-12">
                 <EditColumn ButtonType="ImageButton" >
             </EditColumn>

<FormStyle CssClass="col-lg-12"></FormStyle>
          
                </EditFormSettings>
             
             <PagerStyle Position="Top" />
             
         </MasterTableView>
   
     </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourcePs_PessoaFisica" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPessoaFisica" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="codIni" Type="Int32" />
            <asp:Parameter Name="codFim" Type="Int32" />
            <asp:Parameter Name="Desc" Type="String" />
            <asp:Parameter Name="UF" Type="String" />
            <asp:Parameter Name="id_PS_CIDADES" Type="Int32" />
            <asp:Parameter Name="cpf_PS_FISICA" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
