﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="if_input_fatura_manual.aspx.vb" Inherits="conteltelecom.if_input_fatura_manual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
     <fieldset> 
      <legend>FILTRO</legend> 
                   <div class="form-horizontal">
  <div class="form-group">
      <telerik:RadLabel ID="RadLabelImportacaoManual" Text="CÓD/Nº LINHA:"  CssClass ="col-sm-2 control-label" Font-Bold="true"  runat="server" Skin="Bootstrap"></telerik:RadLabel>
      <div class="col-sm-4">

  <telerik:RadTextBox ID="RadTextBoxcodLinha_LI_LINHAS"   runat="server" Skin="Bootstrap"  Width="100%" ></telerik:RadTextBox>
          </div>
      
      <div class="col-sm-6">
       

          </div>
      </div>
                       <div class="form-group">
      <telerik:RadLabel ID="RadLabel2" Text="MÊS/ANO"  CssClass ="col-sm-2 control-label" Font-Bold="true"  runat="server" Skin="Bootstrap"></telerik:RadLabel>
      <div class="col-sm-4">
          <telerik:RadMaskedTextBox ID="RadMaskedTextBoxMesAno_ins"  Mask="<1..12>/<2000..2050>"  Width="100%"  runat="server"></telerik:RadMaskedTextBox>
          <asp:CustomValidator ID="CustomValidator1" runat="server"  ErrorMessage="CustomValidator"></asp:CustomValidator>
          
            </div>
       <div class="col-sm-6">
 
          </div>

      </div>
                        <div class="form-group">
                            <div class="col-sm-12" style="text-align:right;">
                                 <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton> 
         <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR" OnClick="RadButtonLimpar_Click">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                                </div>
                            </div>
              </div>
                </fieldset>
    <hr />
    <br />
    <asp:UpdatePanel ID="UpdatePanelGridFauturas" runat="server" UpdateMode="Conditional" >
        <ContentTemplate>
            <telerik:RadGrid ID="RadGridFaturas" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhas" GroupPanelPosition="Top" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhas" DataKeyNames="id_SF_SERVICOS_FATURA" EditMode="InPlace" CommandItemDisplay="Top" AllowAutomaticDeletes="True" NoMasterRecordsText="SEM REGISTROS"   >
          <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR"  />
            <Columns>
                <telerik:GridTemplateColumn DataField="id_SF_SERVICOS_FATURA" DataType="System.Int32" FilterControlAltText="Filter id_SF_SERVICOS_FATURA column" HeaderText="ID" SortExpression="id_SF_SERVICOS_FATURA" UniqueName="id_SF_SERVICOS_FATURA" ReadOnly="True">
                    <EditItemTemplate>
                        <asp:TextBox ID="id_SF_SERVICOS_FATURATextBox" runat="server" Text='<%# Bind("id_SF_SERVICOS_FATURA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("id_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                        <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxCodLInhas"  Width="95%" runat="server"  MaxResultCount="10"  TextSettings-SelectionMode = "Single" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasXOperadoras" DataTextField="Linha" DataValueField="id_LI_LINHAS" OnTextChanged="RadAutoCompleteBoxCodLInhas_TextChanged" InputType="Text" MinFilterLength="3" ></telerik:RadAutoCompleteBox>
                                          
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS"  FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS" DefaultInsertValue="OI">
                    <EditItemTemplate>
                         <asp:Label ID="desc_OP_OPERADORASLabelEdit" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                                      </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <EditItemTemplate>
                         <asp:Label ID="razaosocial_PS_JURIDICALabelEdit" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'> </asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="razaosocial_PS_JURIDICALabel" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'> </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="MÊS/ANO" SortExpression="mesAnoRefereincia_SF_SERVICOS_FATURA" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA">
                    <EditItemTemplate>
                       <telerik:RadMaskedTextBox ID="RadMaskedTextBoxmesAno"  Mask="<1..12>/<2000..2050>"  Width="95%" OnTextChanged="RadMaskedTextBoxmesAno_TextChanged"  runat="server" Text='<%#Bind("mesAnoRefereincia_SF_SERVICOS_FATURA") %>'></telerik:RadMaskedTextBox>
                    <asp:RequiredFieldValidator ID="RequiRadMaskedTextBoxmesAno" ControlToValidate="RadMaskedTextBoxmesAno" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                        
                         </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mesAnoRefereincia_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("mesAnoRefereincia_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="tpConta" FilterControlAltText="Filter tpConta column" HeaderText="TP CONTA" ReadOnly="True" UniqueName="tpConta">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="vltotalLinha_SF_SERVICOS_FATURA" FilterControlAltText="Filter vltotalLinha_SF_SERVICOS_FATURA column" HeaderText="VL TOTAL R$" UniqueName="vltotalLinha_SF_SERVICOS_FATURA">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox ID="vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox" runat="server" Width="90%" DbValue='<%#Eval("vltotalLinha_SF_SERVICOS_FATURA") %>' Type="Number">
                        </telerik:RadNumericTextBox>
                         <asp:RequiredFieldValidator ID="RequivltotalLinha" ControlToValidate="vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vltotalLinha_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("vltotalLinha_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings> 
        </MasterTableView>
     </telerik:RadGrid>
        </ContentTemplate>

    </asp:UpdatePanel>
    
      <asp:SqlDataSource ID="SqlDataSourceLinhas" CancelSelectOnNullParameter="False"   runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadLabelImportacaoManual" InsertCommand="Sp_Insert_SF_SERVICOS_FATURA" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM SF_SERVICOS_FATURA WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)">
          <DeleteParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" />
              <asp:Parameter Name="id_LI_LINHAS" Type="Int32" />
              <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
              <asp:Parameter Name="vltotalLinha_SF_SERVICOS_FATURA" Type="Decimal"  />
              <asp:Parameter Name="id_PS_PESSOA"  Type="Int32" />
              <asp:Parameter Name="id_PS_CIDADES" Type="Int32"/>
              <asp:Parameter Name="id_LI_TIPOS"  Type="Int32" />
              <asp:Parameter Name="codMatriz_PS_CLIENTES" Type="Int32" />
              <asp:Parameter Name="id_OP_OPERADORAS" Type="Int32" />
            
              <asp:Parameter Name="vlInicial_id_LI_TIPOS"  Type="Decimal"  />
              <asp:Parameter Name="perIncial_LI_LINHAS" Type="String" />
              <asp:Parameter Name="foraAnalise_LI_LINHAS" Type="Int32" />
            
              <asp:Parameter Name="vl_contrato" Type="Decimal" />
              <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" Type="Int32" />
            
              <asp:Parameter Name="nomeUnidade_LI_LINHAS" Type="String" />
              <asp:Parameter Name="codLinha_LI_LINHAS" Type="String" />
            
          </InsertParameters>
          <SelectParameters>
              <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" />
              <asp:Parameter DefaultValue="" Name="codLinha_LI_LINHAS" Type="String" />
          </SelectParameters>
     </asp:SqlDataSource>
    
     <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
    
     <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceLinhasXOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.codLinha_LI_LINHAS + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS Linha, LI_LINHAS.id_LI_LINHAS FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS WHERE (LI_LINHAS.st_LI_LINHAS = 1)"></asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceUltimoServico" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_VL_SERVICO.id_SF_SERVICOS_FATURA, SF_VL_SERVICO.desc_SF_VL_SERVICO, SF_VL_SERVICO.vl_SF_VL_SERVICO, SF_VL_SERVICO.vlDesconto_SF_VL_SERVICO, SF_VL_SERVICO.codNumLinha_SF_VL_SERVICO, SF_SERVICOS_FATURA.id_LI_LINHAS, SF_VL_SERVICO.qtDias_SF_VL_SERVICO FROM SF_VL_SERVICO INNER JOIN SF_SERVICOS_FATURA ON SF_VL_SERVICO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA WHERE (SF_SERVICOS_FATURA.id_LI_LINHAS = @id_LI_LINHAS) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA = 0) ORDER BY SF_VL_SERVICO.id_SF_SERVICOS_FATURA DESC" InsertCommand="INSERT INTO SF_VL_SERVICO(id_SF_SERVICOS_FATURA, desc_SF_VL_SERVICO, qtDias_SF_VL_SERVICO, vl_SF_VL_SERVICO, vlDesconto_SF_VL_SERVICO, codNumLinha_SF_VL_SERVICO) VALUES (@id_SF_SERVICOS_FATURA, @desc_SF_VL_SERVICO, @qtDias_SF_VL_SERVICO, @vl_SF_VL_SERVICO, @vlDesconto_SF_VL_SERVICO, @codNumLinha_SF_VL_SERVICO)">
         <InsertParameters>
             <asp:Parameter Name="id_SF_SERVICOS_FATURA" Type="Int32" />
             <asp:Parameter Name="desc_SF_VL_SERVICO" />
             <asp:Parameter Name="qtDias_SF_VL_SERVICO" Type="Int16" />
             <asp:Parameter Name="vl_SF_VL_SERVICO"  Type="Double" />
             <asp:Parameter Name="vlDesconto_SF_VL_SERVICO" Type="Double"  />
             <asp:Parameter Name="codNumLinha_SF_VL_SERVICO" />
         </InsertParameters>
         <SelectParameters>
             <asp:Parameter Name="id_LI_LINHAS" />
             <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
         </SelectParameters>
     </asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO SF_VL_USO(id_SF_TIPO_USO, id_OP_OPERADORAS, vlUso_SF_VL_USO, minutos_SF_VL_USO, id_SF_SERVICOS_FATURA, codNumLinha_SF_VL_USO) VALUES (@id_SF_TIPO_USO, @id_OP_OPERADORAS, @vlUso_SF_VL_USO, @minutos_SF_VL_USO, @id_SF_SERVICOS_FATURA, @codNumLinha_SF_VL_USO)" SelectCommand="SELECT SF_VL_USO.id_SF_TIPO_USO, SF_VL_USO.id_OP_OPERADORAS, SF_VL_USO.vlUso_SF_VL_USO, SF_VL_USO.minutos_SF_VL_USO, SF_VL_USO.codNumLinha_SF_VL_USO FROM SF_VL_USO INNER JOIN SF_SERVICOS_FATURA ON SF_VL_USO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA WHERE (SF_SERVICOS_FATURA.id_LI_LINHAS = @id_LI_LINHAS) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA = 1)">
         <InsertParameters>
             <asp:Parameter Name="id_SF_TIPO_USO" />
             <asp:Parameter Name="id_OP_OPERADORAS" />
             <asp:Parameter Name="vlUso_SF_VL_USO" Type="Decimal"  />
             <asp:Parameter Name="minutos_SF_VL_USO" />
             <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
             <asp:Parameter Name="codNumLinha_SF_VL_USO" />
         </InsertParameters>
         <SelectParameters>
             <asp:Parameter Name="id_LI_LINHAS" />
             <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
         </SelectParameters>
     </asp:SqlDataSource>
    

    
</asp:Content>
