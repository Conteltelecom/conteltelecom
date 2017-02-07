<%@ Page Title="CHAMADOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ChamadosDetalhes.aspx.vb" Inherits="conteltelecom.ChamadosDetalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <script type="text/javascript" >

        function textBoxLoad(sender, args) {
            sender.focus();
        }
    </script>
    <telerik:RadGrid ID="RadGridInsert" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceNovo" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceNovo" DataKeyNames="id_CH_HISTORICO">
            <Columns>
                <telerik:GridTemplateColumn DataField="texto_CH_HISTORICO" FilterControlAltText="Filter texto_CH_HISTORICO column" HeaderText="texto_CH_HISTORICO" SortExpression="texto_CH_HISTORICO" UniqueName="texto_CH_HISTORICO">
                    <EditItemTemplate>
                        <asp:TextBox ID="texto_CH_HISTORICOTextBox" runat="server" Text='<%# Bind("texto_CH_HISTORICO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>STATUS:<asp:Label ID="desc_CH_STATUSLabel" runat="server" Text='<%# Eval("desc_CH_STATUS") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>ALTERAÇÃO REALIZADA POR:<asp:Label ID="Label24" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>'></asp:Label> NA DATA:<asp:Label ID="LabeldtaHora" runat="server" Text='<%# Eval("dtAbertura_CH_SUBCHAMADOS") %>'></asp:Label>
                                </td>
                                                            </tr>
                            <tr>
                                <td>
                                    DESCRIÇÃO:<asp:Label ID="Label2" runat="server" Text='<%# Eval("texto_CH_HISTORICO") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </ItemTemplate>
                    <HeaderTemplate>
                        <table class="rgMasterTable" style="width: 100%">
                            <colgroup>
                                <col />
                                <col />
                                <col />
                                <col />
                            </colgroup>
                            <thead>

                                <tr>
                                    <th colspan="4">
                                        <asp:HiddenField ID="HiddenFieldId_CH_SUBCHAMADOS" runat="server" />
                                        <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="NOME DO CLIENTE"></asp:Label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-12" colspan="4">
                                        <asp:Label ID="LabelNomeEmpresa" runat="server" Font-Bold="true" Text="ggg"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                            <thead>
                                                               <tr>
                                    <th colspan="2">
                                        <asp:Label ID="Label6" runat="server" Font-Bold="true" Text="CONTATO"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label8" runat="server" Font-Bold="true" Text="E-MAIL"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label9" runat="server" Font-Bold="true" Text="TELEFONE"></asp:Label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-6" colspan="2">
                                        <asp:Label ID="Labelcontato_CH_SUBCHAMADOS" runat="server" Text='<%# DataBinder.Eval(Container, "Dataitem.contato_CH_SUBCHAMADOS") %>'></asp:Label>
                                                                            </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="email_CH_SUBCHAMADOSLabel" runat="server" Text='<%#Eval("email_CH_SUBCHAMADOS") %>'></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="telefone_CH_SUBCHAMADOSLabel" runat="server" Text='<%#Eval("telefone_CH_SUBCHAMADOS") %>'></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                            <thead>
                                                               <tr>
                                    <th colspan="1">
                                        <asp:Label ID="Label13" runat="server" Font-Bold="true" Text="DATA ABERTURA"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="PRAZO"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label12" runat="server" Font-Bold="true" Text="TEMPO SOLUÇÃO"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label15" runat="server" Font-Bold="true" Text="FECHADO EM "></asp:Label>
                                    </th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr class="rgEditRow">

                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="dtAbertura_CH_SUBCHAMADOSLabel" runat="server" Text="01/05/2016 05:00:50"></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="PrazoLabel" runat="server" Text="5 DIAS"></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="TempoSolucaoLabel" runat="server" Text="2 HORAS"></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="dtFim_CH_SUBCHAMADOSLabel" runat="server" Text="01/06/2016 05:00:50"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>

                            <thead>

                                <tr>
                                    <th colspan="1">
                                        <asp:Label ID="Label20" runat="server" Font-Bold="true" Text="PRIORIDADE"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label22" runat="server" Font-Bold="true" Text="STATUS"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="SETOR RESPONSÁVEL"></asp:Label>

                                    </th>

                                    <th colspan="1">
                                        <asp:Label ID="LabelNomeTarefa" runat="server" Font-Bold="true" Text="NOME DA TAREFA"></asp:Label>
                                    </th>


                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="id_CH_PRIORIDADELabel" runat="server" Text="ALTA"></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="id_CH_STATUSLabel" runat="server" Text="EM ATENDIMENTO"></asp:Label>
                                    </td>
                                    <td class="col-xs-3" colspan="1">

                                        <asp:Label ID="id_CH_SETORESLabel" runat="server" Text="EM ATENDIMENTO"></asp:Label>


                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <asp:Label ID="id_CH_TIPO_TAREFALabel" runat="server" Text="EM ATENDIMENTO"></asp:Label>

                                    </td>
                                </tr>
                            </tbody>
                            <thead>

                                <tr>
                                    <th colspan="4">
                                        <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="ASSUNTO"></asp:Label>
                                    </th>



                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-12" colspan="4">
                                        <asp:Label ID="assunto_CH_SUBCHAMADOSLabel" runat="server" Text="ALTA"></asp:Label>
                                    </td>

                                </tr>
                            </tbody>
                        </table>


                    </HeaderTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <EditFormSettings>
                <FormTemplate>
                    <fieldset class="form-group" style="border: 1px solid #ccc; padding: 10px;">
                        <table style="width: 100%" >
                            <colgroup>
                                <col />
                                <col />
                                <col />
                                <col />
                            </colgroup>
                                    
                            <thead>

                                <tr>
                                    <th colspan="4">
                                        <asp:Label ID="LabelTexto" runat="server" Font-Bold="true" Text="TEXTO"></asp:Label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-12" colspan="4">
                                        <telerik:RadEditor ID="RadEditorHistorico" Width="99%" runat="server" EditModes="Design" ClientEvents-OnLoad="textBoxLoad" >
                                            <Tools>
                                                <telerik:EditorToolGroup>
                                                    <telerik:EditorTool Name="Cut" />
                                                    <telerik:EditorTool Name="Copy" />
                                                    <telerik:EditorTool Name="Paste" />
                                                    <telerik:EditorTool Name="FontName" />
                                                    <telerik:EditorTool Name="ConvertToLower" />
                                                    <telerik:EditorTool Name="ConvertToUpper" />
                                                    <telerik:EditorTool Name="Bold" />
                                                    <telerik:EditorTool Name="Italic" />
                                                    <telerik:EditorTool Name="Underline" />
                                                    <telerik:EditorTool Name="ForeColor" />
                                                    <telerik:EditorTool Name="BackColor" />
                                                

                                                </telerik:EditorToolGroup>
                                            </Tools>
                                        </telerik:RadEditor>
                                    </td>
                                </tr>
                            </tbody>

                            <thead>

                                <tr>
                                    <th colspan="1">
                                        <asp:Label ID="Label7" runat="server" Font-Bold="true" Text="SETOR RESPONSÁVEL"></asp:Label>
                                    </th>
                                    <th colspan="1">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="ENCAMINHRA O CHAMADO PARA"></asp:Label>

                                    </th>

                                    <th colspan="1">
                                        <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="STATUS"></asp:Label>
                                    </th>
                                     <th colspan="1">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="true" Text="ANEXO"></asp:Label>
                                    </th>


                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rgEditRow">
                                    <td class="col-xs-3" colspan="1">

                                        <telerik:RadDropDownList Width="95%" ID="RadDropDownListSetor" AutoPostBack="true"  AppendDataBoundItems="true"   OnSelectedIndexChanged="RadDropDownListSetor_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSourceSetores" DataTextField="desc_CH_SETORES" DataValueField="id_CH_SETORES" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_SETORES") %>'></telerik:RadDropDownList>
                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <telerik:RadDropDownList ID="RadDropDownListAtendentes" Width="95%" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceListaAtendentesSetor" DataTextField="desc_PS_PESSOA" DataValueField="id_PS_PESSOA" DropDownHeight="150px"></telerik:RadDropDownList>

                                       

                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        
                                        <telerik:RadDropDownList ID="RadDropDownListStatus" Width="95%" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceStatusChamado" DataTextField="desc_CH_STATUS" DataValueField="id_CH_STATUS" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_STATUS") %>'></telerik:RadDropDownList>

                                        

                                    </td>
                                    <td class="col-xs-3" colspan="1">
                                        <telerik:RadAsyncUpload MultipleFileSelection="Disabled" InputSize="2" ID="RadAsyncUploadAnexos" AllowedFileExtensions=".pdf" MaxFileInputsCount="1" Width="95%" Localization-Select="..." runat="server"></telerik:RadAsyncUpload>


                                    </td>
                                </tr>
                            </tbody>



                            <tfoot style="width: 100%">
                                <tr class="rgRow">
                                    <td class="rgEditForm">
                                                                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Skin="" CssClass="gEditForm [type='image']" Width="32px" Height="32px" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'>
                                        </telerik:RadImageButton>
                                        <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                                    </td>
                                    <td class="rgCommandCell"></td>
                                    <td class="rgCommandCell"></td>
                                    <td class="rgCommandCell"></td>
                                </tr>
                            </tfoot>
                        </table>

                    </fieldset>
                </FormTemplate>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceNovo" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CH_HISTORICO.texto_CH_HISTORICO, CH_HISTORICO.id_CH_HISTORICO, CH_HISTORICO.id_CH_SUBCHAMADOS, CH_STATUS.desc_CH_STATUS, CH_HISTORICO.dtAlt_CH_HISTORICO, CH_SUBCHAMADOS.emAtendimentoPor_id_PS_PESSOA, CH_TIPO_TAREFA.id_CH_SETORES, CH_TIPO_TAREFA.id_CH_TIPO_TAREFA, PS_PESSOA_1.desc_PS_PESSOA AS NomeEmpresa, CH_SUBCHAMADOS.email_CH_SUBCHAMADOS, CH_SUBCHAMADOS.contato_CH_SUBCHAMADOS, CH_SUBCHAMADOS.telefone_CH_SUBCHAMADOS, CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS, CH_SUBCHAMADOS.dtFim_CH_SUBCHAMADOS, CH_SUBCHAMADOS.assunto_CH_SUBCHAMADOS, CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA, CH_TIPO_TAREFA.id_CH_PRIORIDADE, CH_PRIORIDADE.desc_CH_PRIORIDADE, CH_SUBCHAMADOS.dtPrazoTarefa_CH_SUBCHAMADOS, CH_SETORES.desc_CH_SETORES, CH_TIPO_TAREFA.desc_CH_TIPO_TAREFA, CH_STATUS.id_CH_STATUS, CH_HISTORICO.id_PS_PESSOA_inc, PS_PESSOA.desc_PS_PESSOA FROM CH_HISTORICO INNER JOIN CH_STATUS ON CH_HISTORICO.id_CH_STATUS = CH_STATUS.id_CH_STATUS INNER JOIN CH_SUBCHAMADOS ON CH_HISTORICO.id_CH_SUBCHAMADOS = CH_SUBCHAMADOS.id_CH_SUBCHAMADOS INNER JOIN CH_TIPO_TAREFA ON CH_SUBCHAMADOS.id_CH_TIPO_TAREFA = CH_TIPO_TAREFA.id_CH_TIPO_TAREFA INNER JOIN CH_CHAMADOS ON CH_SUBCHAMADOS.id_CH_CHAMADOS = CH_CHAMADOS.id_CH_CHAMADOS INNER JOIN PS_PESSOA AS PS_PESSOA_1 ON CH_CHAMADOS.idEmpresa_Pessoa = PS_PESSOA_1.id_PS_PESSOA INNER JOIN CH_PRIORIDADE ON CH_TIPO_TAREFA.id_CH_PRIORIDADE = CH_PRIORIDADE.id_CH_PRIORIDADE INNER JOIN CH_SETORES ON CH_TIPO_TAREFA.id_CH_SETORES = CH_SETORES.id_CH_SETORES INNER JOIN PS_PESSOA ON CH_HISTORICO.id_PS_PESSOA_inc = PS_PESSOA.id_PS_PESSOA WHERE (CH_SUBCHAMADOS.id_CH_CHAMADOS = @id_CH_CHAMADOS) AND (CH_SUBCHAMADOS.numSeq_CH_SUBCHAMADOS = @numSeq_CH_SUBCHAMADOS) ORDER BY CH_HISTORICO.id_PS_PESSOA_inc DESC" InsertCommand="INSERT INTO CH_HISTORICO(texto_CH_HISTORICO, id_CH_SUBCHAMADOS, id_PS_PESSOA_alt, id_CH_STATUS, id_CH_SETORES, emAtendimentoPor_id_PS_PESSOA, id_PS_PESSOA_inc) VALUES (@texto_CH_HISTORICO, @id_CH_SUBCHAMADOS, @id_PS_PESSOA_alt, @id_CH_STATUS, @id_CH_SETORES, @emAtendimentoPor_id_PS_PESSOA, @id_PS_PESSOA_inc)">
        <InsertParameters>
            <asp:Parameter Name="texto_CH_HISTORICO" />
            <asp:Parameter Name="id_CH_SUBCHAMADOS" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_CH_STATUS" />
            <asp:Parameter Name="id_CH_SETORES" />
            <asp:Parameter Name="emAtendimentoPor_id_PS_PESSOA" />
            <asp:Parameter Name="id_PS_PESSOA_inc" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_CH_CHAMADOS" QueryStringField="id_CH_CHAMADOS" />
            <asp:QueryStringParameter Name="numSeq_CH_SUBCHAMADOS" QueryStringField="numSeq_CH_SUBCHAMADOS" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSetores" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_SETORES, desc_CH_SETORES FROM View_DropDown_CH_SETORES"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTarefas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_TIPO_TAREFA, desc_CH_TIPO_TAREFA FROM View_DropDown_CH_TIPO_TAREFAS"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceListaAtendentesSetor" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_PS_PESSOA, id_PS_PESSOA FROM View_DropDown_ListaAtentetes_Setor WHERE (id_CH_SETORES = @id_CH_SETORES)">
                                            <SelectParameters>
                                                <asp:Parameter Name="id_CH_SETORES" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceStatusChamado" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_STATUS, desc_CH_STATUS FROM View_DropDown_CH_STATUS"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
