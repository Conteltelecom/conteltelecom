<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="anexos_solicitacao_fatura.aspx.vb" Inherits="conteltelecom.anexos_solicitacao_fatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridMostraFaturas.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("Delete", 0);
            }
        }
    </script>
    <telerik:RadGrid ID="RadGridMostraFaturas" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaAnexos" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings EnablePostBackOnRowClick="true" ></ClientSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaAnexos" DataKeyNames="id_ANEXOS_FATURAS,id_SF_LEITURA_FATURA">
            <DetailTables>
                <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceLInhas" Name="Linhas">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_SF_LEITURA_FATURA" MasterKeyField="id_SF_LEITURA_FATURA" />
                    </ParentTableRelation>
                    <Columns>
                        <telerik:GridBoundColumn DataField="id_SF_SOLICITACAO_FATURA_NOTA" FilterControlAltText="Filter id_SF_SOLICITACAO_FATURA_NOTA column" HeaderText="ID" UniqueName="id_SF_SOLICITACAO_FATURA_NOTA">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numFone" FilterControlAltText="Filter numFone column" HeaderText="CÓD/LINHA" UniqueName="numFone">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vlTotal_SF_SOLICITACAO_FATURA_NOTA" FilterControlAltText="Filter vlTotal_SF_SOLICITACAO_FATURA_NOTA column" HeaderText="VALOR" UniqueName="vlTotal_SF_SOLICITACAO_FATURA_NOTA">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridBoundColumn DataField="id_ANEXOS_FATURAS" DataType="System.Int32" FilterControlAltText="Filter id_ANEXOS_FATURAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_ANEXOS_FATURAS" UniqueName="id_ANEXOS_FATURAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numFone" FilterControlAltText="Filter desc_ANEXOS_FATURAS column" HeaderText="CÓD/NUM LINHA CHAVE" SortExpression="numFone" UniqueName="numFone">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numFatura_SF_LEITURA_FATURA" DataType="System.Decimal" FilterControlAltText="Filter numFatura_SF_LEITURA_FATURA column" HeaderText="Nº FATURA" SortExpression="numFatura_SF_LEITURA_FATURA" UniqueName="numFatura_SF_LEITURA_FATURA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesReferencia_SF_LEITURA_FATURA" FilterControlAltText="Filter mesReferencia_SF_LEITURA_FATURA column" HeaderText="MÊS REF" SortExpression="mesReferencia_SF_LEITURA_FATURA" UniqueName="mesReferencia_SF_LEITURA_FATURA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtVencimento_SF_LEITURA_FATURA" DataType="System.DateTime" DataFormatString="{0:d}"  FilterControlAltText="Filter dtVencimento_SF_LEITURA_FATURA column" HeaderText="DT VENC." SortExpression="dtVencimento_SF_LEITURA_FATURA" UniqueName="dtVencimento_SF_LEITURA_FATURA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vlTotal_SF_CAD_LEIAUTE" DataType="System.Decimal" FilterControlAltText="Filter vlTotal_SF_CAD_LEIAUTE column" HeaderText="VL TOTAL" SortExpression="vlTotal_SF_CAD_LEIAUTE" UniqueName="vlTotal_SF_CAD_LEIAUTE">
                </telerik:GridBoundColumn>
                
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenFieldid_SF_LEITURA_FATURA" Value='<%# Bind("id_SF_LEITURA_FATURA") %>' runat="server" />
                        <asp:HiddenField ID="HiddenFieldcaminho_ANEXOS_FATURAS" Value='<%# Bind("caminho_ANEXOS_FATURAS") %>' runat="server" />
                        <asp:HyperLink ID="VISUALIZAR" runat="server" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "0") %>'  Target="_blank" ImageUrl="~/img/pdf_Visualizar_32.png" ></asp:HyperLink>
                    </ItemTemplate>

                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                    <ItemTemplate>
                       
                        <asp:HyperLink ID="Baixar" runat="server" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "1") %>'  Target="_blank" ImageUrl="~/img/pdf_32.png" ></asp:HyperLink>
                    </ItemTemplate>
                
                </telerik:GridTemplateColumn>
                
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" ItemStyle-CssClass="rgEditForm" ConfirmText="ATENÇÃO O REGISTRO SERA EXCLUÍDO" ButtonType="ImageButton"    ButtonCssClass="rgEditForm" ImageUrl="~\img\delete_32.png"  CommandName="DeleteNovo" UniqueName="Delete" >
                    
<ItemStyle CssClass="rgEditForm"></ItemStyle>
                    
                </telerik:GridButtonColumn>
                
            </Columns>
            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column"  UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>


    <asp:SqlDataSource ID="SqlDataSourceBuscaAnexos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT ANEXOS_FATURAS.id_ANEXOS_FATURAS, ANEXOS_FATURAS.desc_ANEXOS_FATURAS, SF_LEITURA_FATURA.numFatura_SF_LEITURA_FATURA, SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA, SF_LEITURA_FATURA.id_OP_OPERADORAS, SF_LEITURA_FATURA.vlTotal_SF_CAD_LEIAUTE, OP_OPERADORAS.desc_OP_OPERADORAS, ANEXOS_FATURAS.caminho_ANEXOS_FATURAS, dbo.MascaraTelefone(SF_SOLICITACAO_FATURA_NOTA.numFoneAgrupador_SF_SOLICITACAO_FATURA_NOTA) AS numFone, SF_LEITURA_FATURA.id_SF_LEITURA_FATURA FROM ANEXOS_FATURAS INNER JOIN SF_LEITURA_FATURA ON ANEXOS_FATURAS.id_SF_LEITURA_FATURA = SF_LEITURA_FATURA.id_SF_LEITURA_FATURA INNER JOIN OP_OPERADORAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN SF_SOLICITACAO_FATURA_NOTA ON SF_LEITURA_FATURA.id_SF_LEITURA_FATURA = SF_SOLICITACAO_FATURA_NOTA.id_SF_LEITURA_FATURA" DeleteCommand="DELETE FROM SF_LEITURA_FATURA WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </DeleteParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceLInhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_SF_SOLICITACAO_FATURA_NOTA, dbo.MascaraTelefone(SF_SOLICITACAO_FATURA_NOTA.numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA) AS numFone, dtPeriodo_ini_SF_SOLICITACAO_FATURA_NOTA, dtPeriodo_Fim_SF_SOLICITACAO_FATURA_NOTA, cnpj_SF_SOLICITACAO_FATURA_NOTA, vlTotal_SF_SOLICITACAO_FATURA_NOTA, mesRef_SF_SOLICITACAO_FATURA_NOTA FROM SF_SOLICITACAO_FATURA_NOTA WHERE (id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA)">
        <SelectParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
