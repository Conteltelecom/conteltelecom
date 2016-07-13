<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="bloqueio_faturas.aspx.vb" Inherits="conteltelecom.bloqueio_faturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="CÓD/NOME MATRIZ:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                <div class="col-xs-4">
                  
                </div>
                <div class="col-xs-6">
                    
                </div>
            </div>
               <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="MÊS:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListMes" runat="server" Width="95%">
                        <Items>
                            <telerik:DropDownListItem Text="JANEIRO" Value="1" />
                                                        <telerik:DropDownListItem Text="FEVEREIRO" Value="2" />
                                                        <telerik:DropDownListItem Text="MARÇO" Value="3" />
                                                        <telerik:DropDownListItem Text="ABRIL" Value="4" />
                                                        <telerik:DropDownListItem Text="MAIO" Value="5" />
                                                        <telerik:DropDownListItem Text="JUNHO" Value="6" />
                                                        <telerik:DropDownListItem Text="JULHO" Value="7" />
                                                        <telerik:DropDownListItem Text="AGOSTO" Value="8" />
                                                        <telerik:DropDownListItem Text="SETEMBRO" Value="9" />
                                                        <telerik:DropDownListItem Text="OUTUBRO" Value="10" />
                            <telerik:DropDownListItem Text="NOVEMBRO" Value="11" />
                            <telerik:DropDownListItem Text="DEZEMBRO" Value="12" />

                        </Items>
                    </telerik:RadDropDownList>
                    </div>
                  <asp:Label ID="Label4" runat="server" Text="ANO:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                     <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListAno" runat="server" Width="95%" >
                        <Items>
                            <telerik:DropDownListItem Text="2014" Value="2014" />
                             <telerik:DropDownListItem Text="2015" Value="2015" />
                             <telerik:DropDownListItem Text="2016" Value="2016" />
                             <telerik:DropDownListItem Text="2017" Value="2017" />
                             <telerik:DropDownListItem Text="2018" Value="2018" />
                             <telerik:DropDownListItem Text="2019" Value="2019" />
                             <telerik:DropDownListItem Text="2020" Value="2020" />

                        </Items>
                    </telerik:RadDropDownList>
                                           
                </div>
                 </div>
            <div class="form-group">
                             <asp:Label ID="Label3" runat="server" Text="TIPO RELÁTORIO:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>
                     <div class="col-xs-4">
                         <telerik:RadDropDownList ID="RadDropDownListTipoRel" runat="server">
                             <Items>
                                
                                 <telerik:DropDownListItem Text="CLIENTE" Value ="1" />
                                  <telerik:DropDownListItem Text="CONTEL" Value="2" />
                             </Items>
                         </telerik:RadDropDownList>

                         </div>
      <div class="col-xs-6">
                         </div>
                </div>
                  <div class="form-group">
                 <div class="col-xs-12" style="text-align: right; top: 0px; left: 0px;">
            
                     </div>
                      </div>
             
            
                
        </div>
     
           </fieldset>

    <telerik:RadGrid ID="RadGridBloquiosFatura" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaClientes" style="margin-bottom: 0px">


<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaClientes">
            <Columns>
                <telerik:GridTemplateColumn DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="codMatriz_PS_CLIENTES" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES">
                    <EditItemTemplate>
                        <asp:TextBox ID="codMatriz_PS_CLIENTESTextBox" runat="server" Text='<%# Bind("codMatriz_PS_CLIENTES") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codMatriz_PS_CLIENTESLabel" runat="server" Text='<%# Eval("codMatriz_PS_CLIENTES") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="razaosocial_PS_JURIDICA" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="razaosocial_PS_JURIDICATextBox" runat="server" Text='<%# Bind("razaosocial_PS_JURIDICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="razaosocial_PS_JURIDICALabel" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mes01" FilterControlAltText="Filter mes01 column" HeaderText="mes01" SortExpression="mes01" UniqueName="mes01">
                    <EditItemTemplate>
                        <asp:TextBox ID="mes01TextBox" runat="server" Text='<%# Bind("mes01") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mes01Label" runat="server" Text='<%# Eval("mes01") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mes02" FilterControlAltText="Filter mes02 column" HeaderText="mes02" SortExpression="mes02" UniqueName="mes02">
                    <EditItemTemplate>
                        <asp:TextBox ID="mes02TextBox" runat="server" Text='<%# Bind("mes02") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mes02Label" runat="server" Text='<%# Eval("mes02") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mes03" FilterControlAltText="Filter mes03 column" HeaderText="mes03" SortExpression="mes03" UniqueName="mes03">
                    <EditItemTemplate>
                        <asp:TextBox ID="mes03TextBox" runat="server" Text='<%# Bind("mes03") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mes03Label" runat="server" Text='<%# Eval("mes03") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="situacao" DataType="System.Int32" FilterControlAltText="Filter situacao column" HeaderText="situacao" SortExpression="situacao" UniqueName="situacao">
                    <EditItemTemplate>
                        <asp:TextBox ID="situacaoTextBox" runat="server" Text='<%# Bind("situacao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="situacaoLabel" runat="server" Text='<%# Eval("situacao") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>


    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaClientes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_CLIENTES.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, '' AS mes01, '' AS mes02, '' AS mes03, 0 AS situacao FROM PS_PESSOA INNER JOIN PS_CLIENTES ON PS_PESSOA.id_PS_PESSOA = PS_CLIENTES.codMatriz_PS_CLIENTES AND PS_PESSOA.id_PS_PESSOA = PS_CLIENTES.id_PS_PESSOA INNER JOIN PS_JURIDICA ON PS_CLIENTES.codMatriz_PS_CLIENTES = PS_JURIDICA.id_PS_PESSOA AND PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA WHERE (PS_PESSOA.st_PS_PESSOA = 1)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaValorMes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SUM(SF_SERVICOS_FATURA.vlTotalIncluido_SF_SERVICOS_FATURA) AS vlTotalIncluido_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, CAST(ADM_CAD_TIPO_BLOQUEIO.numSeq_ADM_CAD_TIPO_BLOQUEIO AS VARCHAR(11)) + ' -' + ADM_CAD_TIPO_BLOQUEIO.desc_ADM_CAD_TIPO_BLOQUEIO AS desc_ADM_CAD_TIPO_BLOQUEIO FROM SF_SERVICOS_FATURA LEFT OUTER JOIN ADM_CAD_TIPO_BLOQUEIO ON SF_SERVICOS_FATURA.id_ADM_CAD_TIPO_BLOQUEIO = ADM_CAD_TIPO_BLOQUEIO.id_ADM_CAD_TIPO_BLOQUEIO WHERE (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) GROUP BY SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, ADM_CAD_TIPO_BLOQUEIO.numSeq_ADM_CAD_TIPO_BLOQUEIO, ADM_CAD_TIPO_BLOQUEIO.desc_ADM_CAD_TIPO_BLOQUEIO">
        <SelectParameters>
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
