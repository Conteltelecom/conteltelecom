<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="ConsultaChamados.aspx.vb" Inherits="conteltelecom.ConsultaChamados" %>
<% @ Register TagPrefix = "controle" TagName = "list_view_vazia"   Src = "~/web/area_cliente/mobile/ascx/WebUserControlListview.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
     <blockquote style=" border-top:0px !important" >
    <h2 class="page_title">CONSULTA CHAMADO</h2>
                </blockquote> 
    <telerik:RadListView ID="RadListViewChamdos" runat="server" DataSourceID="SqlDataSourceChamados" Skin="Bootstrap" DataKeyNames="id_CH_SUBCHAMADOS">
        <LayoutTemplate>
            <div>
                <table cellspacing="0" style="width:100%">
                    <thead>
                        <tr class="rlvHeader">
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                </table>
            </div>
</LayoutTemplate>
        <ItemTemplate>  <asp:LinkButton ID="LinkButtonDia" OnClick="LinkButtonDia_Click" runat="server">
                       <div class="service_box">

                          

                               <div class="services_icon"> 
                                   
 
                                   <div style="display:block max-width:70% margin:auto">
                                         

                                         <span class="day"><asp:Label ID="Label3" runat="server" Text='<%# Eval("DiaAbertura") %>' ></asp:Label></span>
                                         

                                         <span class="month"><asp:Label ID="Label4" runat="server" Text='<%# Eval("MesAbertura") %>' ></asp:Label></span>                                            
                                           <asp:Label ID="Labelid_CH_SUBCHAMADOS" Visible="false" runat="server" Text='<%# Eval("id_CH_SUBCHAMADOS") %>' ></asp:Label>         
                                
 
                                            
                                                    
                               </div>
                                   

                                   </div>
                                    

                                 
                                         <div class="service_content">
                                                                                     
                                              <h4>NÚMERO: <asp:Label ID="LabelId_CH_CHAMADOS" runat="server" Text='<%# Eval("id_CH_CHAMADOS") %>' ></asp:Label>/<asp:Label ID="LabelnumSeq_CH_SUBCHAMADOS" runat="server" Text='<%# Eval("numSeq_CH_SUBCHAMADOS") %>' ></asp:Label> </h4>
                                              <h6>ASSUNTO: <asp:Label ID="Labelassunto_CH_SUBCHAMADOS" runat="server" Text='<%# Eval("assunto_CH_SUBCHAMADOS") %>' ></asp:Label> </h6>
                                              <h6>PROBLEMA: <asp:Label ID="Labeldesc_CH_TIPO_TAREFA" runat="server" Text='<%# Eval("desc_CH_TIPO_TAREFA") %>'></asp:Label> </h6>
                                      </div>
                                        </div>
                    
            </asp:LinkButton>
        </ItemTemplate>
        <AlternatingItemTemplate>
              <asp:LinkButton ID="LinkButtonDia" OnClick="LinkButtonDia_Click" runat="server">
           <div class="service_box">
                          

                               <div class="services_icon"> 
                                   
 
                                   <div style="display:block max-width:70% margin:auto">
                                         

                                         <span class="day"><asp:Label ID="Label3" runat="server" Text='<%# Eval("DiaAbertura") %>' ></asp:Label></span>
                                         

                                         <span class="month"><asp:Label ID="Label4" runat="server" Text='<%# Eval("MesAbertura") %>' ></asp:Label></span>                                            
                                                    <asp:Label ID="Labelid_CH_SUBCHAMADOS" Visible="false" runat="server" Text='<%# Eval("id_CH_SUBCHAMADOS") %>' ></asp:Label>         
                                
 
                                            
                                                    
                               </div>
                                   

                                   </div>
                                    

                                 
                                         <div class="service_content">
                                                                                     
                                              <h4>NÚMERO: <asp:Label ID="LabelId_CH_CHAMADOS" runat="server" Text='<%# Eval("id_CH_CHAMADOS") %>' ></asp:Label>/<asp:Label ID="LabelnumSeq_CH_SUBCHAMADOS" runat="server" Text='<%# Eval("numSeq_CH_SUBCHAMADOS") %>' ></asp:Label> </h4>
                                              <h6>ASSUNTO: <asp:Label ID="Labelassunto_CH_SUBCHAMADOS" runat="server" Text='<%# Eval("assunto_CH_SUBCHAMADOS") %>' ></asp:Label> </h6>
                                              <h6>PROBLEMA: <asp:Label ID="Labeldesc_CH_TIPO_TAREFA" runat="server" Text='<%# Eval("desc_CH_TIPO_TAREFA") %>'></asp:Label> </h6>
                                      </div>
                                        </div>
             </asp:LinkButton>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd" Text=" " ToolTip="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
        <EmptyDataTemplate>
            <controle:list_view_vazia runat="server"  ID="ListVazia" ></controle:list_view_vazia>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr class="rlvISel">
            </tr>
        </SelectedItemTemplate>
    </telerik:RadListView>

    

        <telerik:RadListView ID="RadListViewDetalhes" Visible="False"  runat="server" DataSourceID="SqlDataSourceDetalhes" Skin="Bootstrap" DataKeyNames="id_CH_SUBCHAMADOS">
        <LayoutTemplate>
            <div>
                <table cellspacing="0" style="width:100%">
                    <thead>
                       
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                        <tr>
                           <td>
                               
                               <div class="form" id="DivAbrirChamados" runat="server" >
                                   <label>Descrição:</label>
        <textarea name="comments" runat="server" cols="1" rows="1" id="textareaDescricao" style="height: 100px" class="form_textarea txtarea requiredField" ></textarea>
        <input type="hidden" name="submitted" id="submitted" value="true" />
        <input id="inputSalvar" name="submit" runat="server" type="button" onserverclick="inputSalvar_ServerClick"  class="form_submit orange orange_borderbottom" value="SALVAR" />
                           </div>
                           </td>
                        </tr>
                    </tbody>
                    
                </table>
            </div>
</LayoutTemplate>
        <ItemTemplate>
            
                            <div class="client_row"  style="border-bottom:1px #ddd solid" > 
                            
                                         <div class="service_content">
                                               <ul class="listing">    
                                                     <li>  
                                         <h6><b>STATUS:</b><asp:Label ID="LabelStatus" runat="server" Text='<%# Eval("desc_CH_TIPO_TAREFA") %>'></asp:Label></h6>
                                       <h6><b>ALTERAÇÃO REALIZADA POR:</b><asp:Label ID="LabelPessoa" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>'></asp:Label></h6><h6> <b>NA DATA:</b> <asp:Label ID="LabeldtaHora" runat="server" Text='<%# Eval("dtAbertura_CH_SUBCHAMADOS") %>'></asp:Label>  </h6>
                                            <h6><b>DESCRIÇÃO:</b><asp:Label ID="Label2" runat="server" Text='<%# Eval("texto_CH_HISTORICO") %>'></asp:Label></h6>
                                            </li>
                                        </ul> 
                                              </div>
                                        </div>
                       </div>
         
        </ItemTemplate>
        <AlternatingItemTemplate>
               <div class="client_row" style="border-bottom:1px #ddd solid" > 
                            
                                         <div class="service_content">
                                                                                     
                                              <ul class="listing">
                                        <li><h6><b>STATUS:</b><asp:Label ID="LabelStatus" runat="server" Text='<%# Eval("desc_CH_TIPO_TAREFA") %>'></asp:Label><br /></h6>
                                        <h6><b>ALTERAÇÃO REALIZADA POR:</b><asp:Label ID="LabelPessoa" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>'></asp:Label></h6><h6> <b>NA DATA:</b> <asp:Label ID="LabeldtaHora" runat="server" Text='<%# Eval("dtAbertura_CH_SUBCHAMADOS") %>'></asp:Label>  </h6>
                                            <h6><b>DESCRIÇÃO:</b><asp:Label ID="Label2" runat="server" Text='<%# Eval("texto_CH_HISTORICO") %>'></asp:Label></h6>
                                            </li>
                                        </ul> 
                                      </div>
                                        </div>
                       </div>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd" Text=" " ToolTip="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
        <EmptyDataTemplate>
           <controle:list_view_vazia runat="server"  ID="ListVazia" ></controle:list_view_vazia>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr class="rlvISel">
            </tr>
        </SelectedItemTemplate>
    </telerik:RadListView>
    <asp:SqlDataSource ID="SqlDataSourceChamados" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CH_HISTORICO.texto_CH_HISTORICO, CH_SUBCHAMADOS.assunto_CH_SUBCHAMADOS, CH_SUBCHAMADOS.id_CH_CHAMADOS, CH_SUBCHAMADOS.numSeq_CH_SUBCHAMADOS, CH_TIPO_TAREFA.desc_CH_TIPO_TAREFA, dbo.BuscaNomeMes(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) AS MesAbertura, DATEPART(day, CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) AS DiaAbertura, CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA, CH_SUBCHAMADOS.id_CH_SUBCHAMADOS FROM CH_CHAMADOS INNER JOIN CH_SUBCHAMADOS ON CH_CHAMADOS.id_CH_CHAMADOS = CH_SUBCHAMADOS.id_CH_CHAMADOS INNER JOIN CH_HISTORICO ON CH_SUBCHAMADOS.id_CH_SUBCHAMADOS = CH_HISTORICO.id_CH_SUBCHAMADOS INNER JOIN CH_TIPO_TAREFA ON CH_SUBCHAMADOS.id_CH_TIPO_TAREFA = CH_TIPO_TAREFA.id_CH_TIPO_TAREFA WHERE (CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA = @abertoPor_id_PS_PESSOA) AND (CH_SUBCHAMADOS.st_CH_SUBCHAMADOS = @st_CH_SUBCHAMADOS) AND (YEAR(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) = @AnoAtual) AND (MONTH(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) = @MesAtual)">
        <SelectParameters>
               <asp:SessionParameter  Name="abertoPor_id_PS_PESSOA" SessionField="id_PS_PESSOA_USUARIO" />
               <asp:QueryStringParameter Name="st_CH_SUBCHAMADOS" QueryStringField="st_CH_SUBCHAMADOS" />
               <asp:QueryStringParameter Name="AnoAtual" QueryStringField="AnoAtual" />
               <asp:QueryStringParameter Name="MesAtual" QueryStringField="MesAtual" />
        </SelectParameters>
     </asp:SqlDataSource>
    
      
    <asp:SqlDataSource ID="SqlDataSourceDetalhes" runat="server"  ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CH_HISTORICO.texto_CH_HISTORICO, CH_SUBCHAMADOS.assunto_CH_SUBCHAMADOS, CH_SUBCHAMADOS.id_CH_CHAMADOS, CH_SUBCHAMADOS.numSeq_CH_SUBCHAMADOS, CH_TIPO_TAREFA.desc_CH_TIPO_TAREFA, dbo.BuscaNomeMes(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) AS MesAbertura, DATEPART(day, CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) AS DiaAbertura, PS_PESSOA.desc_PS_PESSOA, CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA, CH_SUBCHAMADOS.id_CH_SUBCHAMADOS, CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS FROM CH_CHAMADOS INNER JOIN CH_SUBCHAMADOS ON CH_CHAMADOS.id_CH_CHAMADOS = CH_SUBCHAMADOS.id_CH_CHAMADOS INNER JOIN CH_HISTORICO ON CH_SUBCHAMADOS.id_CH_SUBCHAMADOS = CH_HISTORICO.id_CH_SUBCHAMADOS INNER JOIN CH_TIPO_TAREFA ON CH_SUBCHAMADOS.id_CH_TIPO_TAREFA = CH_TIPO_TAREFA.id_CH_TIPO_TAREFA INNER JOIN PS_PESSOA ON CH_HISTORICO.id_PS_PESSOA_inc = PS_PESSOA.id_PS_PESSOA WHERE (CH_SUBCHAMADOS.id_CH_CHAMADOS = @id_CH_CHAMADOS) AND (CH_SUBCHAMADOS.numSeq_CH_SUBCHAMADOS = @numSeq_CH_SUBCHAMADOS) AND (CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA = @abertoPor_id_PS_PESSOA)" InsertCommand="INSERT INTO CH_HISTORICO(id_CH_SUBCHAMADOS, texto_CH_HISTORICO, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@id_CH_SUBCHAMADOS, @texto_CH_HISTORICO, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)">
        <InsertParameters>
            <asp:Parameter Name="id_CH_SUBCHAMADOS" />
            <asp:Parameter Name="texto_CH_HISTORICO" />
            <asp:SessionParameter Name="id_PS_PESSOA_alt" SessionField="id_PS_PESSOA_USUARIO" />
            <asp:SessionParameter Name="id_PS_PESSOA_inc"  SessionField="id_PS_PESSOA_USUARIO" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_CH_CHAMADOS" />
            <asp:Parameter Name="numSeq_CH_SUBCHAMADOS" />
           <asp:SessionParameter DefaultValue="" Name="abertoPor_id_PS_PESSOA" SessionField="id_PS_PESSOA_USUARIO" />
        </SelectParameters>
     </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldid_CH_SUBCHAMADOS" runat="server" />
</asp:Content>
