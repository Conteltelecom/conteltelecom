<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="AbrirChamadoMobile.aspx.vb" Inherits="conteltelecom.AbrirChamadoMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
    
    <div class="form" id="DivAbrirChamados" runat="server" >
        <h2 class="page_title" runat="server">NOVO CHAMADO</h2>
        <label>Problema:</label>
        <telerik:RadDropDownList Width="100%" ID="RadDropDownListTarefa" runat="server" DataSourceID="SqlDataSourceTarefas" DataTextField="desc_CH_TIPO_TAREFA" DataValueField="id_CH_TIPO_TAREFA" DropDownHeight="150px" Skin="Bootstrap"></telerik:RadDropDownList>
        <asp:SqlDataSource ID="SqlDataSourceTarefas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_TIPO_TAREFA, desc_CH_TIPO_TAREFA FROM CH_TIPO_TAREFA" InsertCommand="Sp_Insert_AbreChamado" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="idEmpresa_Pessoa" Type="Int32" />
                <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
                <asp:Parameter Name="id_PS_PESSOA_inc" Type="Int32" />
                <asp:Parameter Name="id_CH_TIPO_TAREFA" Type="Int32" />
                <asp:Parameter Name="id_PS_PERMISSAO" Type="Int32" />
                <asp:Parameter Name="assunto_CH_SUBCHAMADOS" Type="String" />
                <asp:Parameter Name="abertoPor_id_PS_PESSOA" Type="Int32" />
                <asp:Parameter Name="contato_CH_SUBCHAMADOS" Type="String" />
                <asp:Parameter Name="email_CH_SUBCHAMADOS" Type="String" />
                <asp:Parameter Name="telefone_CH_SUBCHAMADOS" Type="String" />
                <asp:Parameter Name="texto_CH_HISTORICO" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <label>Assunto:</label>
        <input id="inputAssunto" runat="server"  type="text" name="Assunto"  value="" class="form_input txt requiredField email" />
        <label>Descrição:</label>
        <textarea name="comments" runat="server" cols="1" rows="1" id="textareaDescricao" style="height: 200px" class="form_textarea txtarea requiredField" ></textarea>
        <input type="hidden" name="submitted" id="submitted" value="true" />
        <input id="inputSalvar" name="submit" runat="server" onserverclick="Unnamed_ServerClick" type="button"  class="form_submit orange orange_borderbottom" value="SALVAR" />
    </div>
    <div class="form" id="DivChamadoAbertoComSucesso" visible="false" runat="server" >

        <h2>
            Chamado aberto com sucesso.
        </h2>
        
        <blockquote>Obrigado por abrir o chamado em nossa plataforma mobile.
            Nossa equipe de consultores estará solucionado seu problema o mais breve possível.<span class="quote_author"></span>

        </blockquote>
           <asp:Label ID="LabelRetornoChamdo" runat="server" Text=""></asp:Label>
     
        <a href="~/web/area_cliente/mobile/Chamados/Chamados.aspx" runat="server" > 
        <input id="Button2" name="submit" runat="server"  type="button"   class="form_submit orange orange_borderbottom" value="VOLTAR" />
     </a>
        
          </div>
        
    <asp:SqlDataSource ID="SqlDataSourceInfoUserLogado" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_PESSOA.desc_PS_PESSOA, PS_FISICA.fone01_PS_FISICA, PS_FISICA.email_PS_FISICA, PS_PESSOA.id_PS_PESSOA FROM PS_PESSOA INNER JOIN PS_FISICA ON PS_PESSOA.id_PS_PESSOA = PS_FISICA.id_PS_PESSOA WHERE (PS_PESSOA.id_PS_PESSOA = @id_PS_PESSOA)">
        <SelectParameters>
            <asp:SessionParameter Name="id_PS_PESSOA" SessionField="id_PS_PESSOA_USUARIO" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
