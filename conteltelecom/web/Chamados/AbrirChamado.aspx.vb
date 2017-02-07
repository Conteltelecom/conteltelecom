Imports Telerik.Web.UI

Public Class AbrirChamado
    Inherits System.Web.UI.Page
    Dim Dic_Variaveis As New Dictionary(Of String, String)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridChamados_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridChamados.ItemCommand


        If e.CommandName = "ATENDER" Then
            Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
            Dim id_CH_CHAMADOS As String = item("id_CH_CHAMADOS").Text
            Dim numSeq_CH_SUBCHAMADOS As String = item("numSeq_CH_SUBCHAMADOS").Text
            Dim HiddenFieldid_CH_STATUS As HiddenField = DirectCast(item.FindControl("HiddenFieldid_CH_STATUS"), HiddenField)
            Dim HiddenFieldid_CH_SETORES As HiddenField = DirectCast(item.FindControl("HiddenFieldid_CH_SETORES"), HiddenField)
            SqlDataSourceUpdateChamadosEmatendimento.UpdateParameters("id_CH_CHAMADOS").DefaultValue = id_CH_CHAMADOS
            SqlDataSourceUpdateChamadosEmatendimento.UpdateParameters("numSeq_CH_SUBCHAMADOS").DefaultValue = numSeq_CH_SUBCHAMADOS
            SqlDataSourceUpdateChamadosEmatendimento.UpdateParameters("emAtendimentoPor_id_PS_PESSOA").DefaultValue = Session("id_PS_PESSOA_USUARIO")
            SqlDataSourceUpdateChamadosEmatendimento.Update()

            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("id_CH_SUBCHAMADOS").DefaultValue = RadGridChamados.MasterTableView.Items(0).GetDataKeyValue("id_CH_SUBCHAMADOS").ToString()
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("id_CH_STATUS").DefaultValue = If(HiddenFieldid_CH_STATUS.Value = 1, 2, HiddenFieldid_CH_STATUS.Value)
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("id_CH_SETORES").DefaultValue = HiddenFieldid_CH_SETORES.Value
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("emAtendimentoPor_id_PS_PESSOA").DefaultValue = Session("id_PS_PESSOA_USUARIO")
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("texto_CH_HISTORICO").DefaultValue = "Chamado em atendimento por "
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
            SqlDataSourceUpdateChamadosEmatendimento.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
            SqlDataSourceUpdateChamadosEmatendimento.Insert()
            Dim ClassEmail As New ClassEnviaEmail
            Dim ClassMesnagensEmail As New MesnagensEmail
            Dim contatoChamado As String = ""
            Dim emailcontato As String = ""
            Dic_Variaveis.Clear()
            Dic_Variaveis.Add("id_CH_SUBCHAMADOS", RadGridChamados.MasterTableView.Items(0).GetDataKeyValue("id_CH_SUBCHAMADOS").ToString())
            Call ClassMesnagensEmail.BuscaValorVariaveis(Dic_Variaveis)
            ClassEmail.EnviaEmail("Chamado em atendimento", ClassMesnagensEmail.BuscaMensagem(Dic_Variaveis), Dic_Variaveis.Keys("email_CH_SUBCHAMADOS"))
            ClassEmail = Nothing
            ClassMesnagensEmail = Nothing
            HttpContext.Current.Response.Redirect("~/web/Chamados/ChamadosDetalhes.aspx?id_CH_CHAMADOS=" & id_CH_CHAMADOS & "&numSeq_CH_SUBCHAMADOS=" & numSeq_CH_SUBCHAMADOS)

        End If
        If e.CommandName = RadGrid.PerformInsertCommandName Then

            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim RadSearchBoxBuscaPessoa As RadSearchBox = DirectCast(eitem.FindControl("RadSearchBoxBuscaPessoa"), RadSearchBox)
            Dim RadTextBoxNomeContato As RadTextBox = DirectCast(eitem.FindControl("RadTextBoxNomeContato"), RadTextBox)
            Dim RadTextBoxEmail As RadTextBox = DirectCast(eitem.FindControl("RadTextBoxEmail"), RadTextBox)
            Dim RadMaskedTextBoxFone As RadMaskedTextBox = DirectCast(eitem.FindControl("RadMaskedTextBoxFone"), RadMaskedTextBox)
            Dim RadDropDownListSetor As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListSetor"), RadDropDownList)
            Dim RadDropDownListTarefas As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListTarefas"), RadDropDownList)
            Dim RadTextBoxAssunto As RadTextBox = DirectCast(eitem.FindControl("RadTextBoxAssunto"), RadTextBox)
            Dim RadEditorHistorico As RadEditor = DirectCast(eitem.FindControl("RadEditorHistorico"), RadEditor)
            Dim RadDropDownListAtendentes As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListAtendentes"), RadDropDownList)

            If RadSearchBoxBuscaPessoa.Text <> "" Then
                Dim idEmpresa_Pessoa As Integer = Mid(RadSearchBoxBuscaPessoa.Text, 1, RadSearchBoxBuscaPessoa.Text.IndexOf("-"))

                SqlDataSourceAbrirChamado.InsertParameters("id_CH_SETORES").ConvertEmptyStringToNull = True
                SqlDataSourceAbrirChamado.InsertParameters("emAtendimentoPor_id_PS_PESSOA").ConvertEmptyStringToNull = True
                SqlDataSourceAbrirChamado.InsertParameters("idEmpresa_Pessoa").DefaultValue = idEmpresa_Pessoa
                SqlDataSourceAbrirChamado.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceAbrirChamado.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceAbrirChamado.InsertParameters("id_CH_TIPO_TAREFA").DefaultValue = RadDropDownListTarefas.SelectedValue
                SqlDataSourceAbrirChamado.InsertParameters("id_PS_PERMISSAO").DefaultValue = Session("id_PS_PERMISSAO")
                SqlDataSourceAbrirChamado.InsertParameters("assunto_CH_SUBCHAMADOS").DefaultValue = RadTextBoxAssunto.Text
                SqlDataSourceAbrirChamado.InsertParameters("abertoPor_id_PS_PESSOA").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceAbrirChamado.InsertParameters("contato_CH_SUBCHAMADOS").DefaultValue = RadTextBoxNomeContato.Text
                SqlDataSourceAbrirChamado.InsertParameters("email_CH_SUBCHAMADOS").DefaultValue = RadTextBoxEmail.Text
                SqlDataSourceAbrirChamado.InsertParameters("telefone_CH_SUBCHAMADOS").DefaultValue = RadMaskedTextBoxFone.Text
                SqlDataSourceAbrirChamado.InsertParameters("texto_CH_HISTORICO").DefaultValue = RadEditorHistorico.Text
                SqlDataSourceAbrirChamado.InsertParameters("id_CH_STATUS").DefaultValue = 1
                SqlDataSourceAbrirChamado.InsertParameters("id_CH_SETORES").DefaultValue = RadDropDownListSetor.SelectedValue
                SqlDataSourceAbrirChamado.InsertParameters("emAtendimentoPor_id_PS_PESSOA").DefaultValue = RadDropDownListAtendentes.SelectedValue

                SqlDataSourceAbrirChamado.Insert()
                Dim ClassEmail As New ClassEnviaEmail
                Dim ClassMesnagensEmail As New MesnagensEmail
                Dic_Variaveis.Clear()
                '  Dic_Variaveis.Add()

                '   ClassEmail.EnviaEmail("Chamado Aberto com Sucesso", ClassMesnagensEmail.BuscaMensagem(), RadTextBoxEmail.Text)
                ClassEmail = Nothing
                ClassMesnagensEmail = Nothing
                RadGridChamados.DataBind()

            Else

            End If

        End If
        If e.CommandName = RadGrid.CancelCommandName Then
            RadGridChamados.Rebind()

        End If

    End Sub





    Private Sub RadGridChamados_PreRender(sender As Object, e As EventArgs) Handles RadGridChamados.PreRender


        If IsPostBack = False Then


            PersonalizarControles.SubRadGrid(RadGridChamados, 1)



        Else
            If RadGridChamados.MasterTableView.IsItemInserted = True Then
                PersonalizarControles.SubRadGrid(RadGridChamados, 1)

            End If
        End If
        '0 - MEUS CHAMADOS
        '1 - CHAMADOS EM ATENDIMENTO
        '2 - AGUARDANDO ATENDIMENTO
        '3 - TODOS
        Select Case RadMenuAtendimentos.SelectedItem.Index
            Case 0
                RadGridChamados.MasterTableView.GetColumn("TemplateColumnAtender").Visible = False
            Case 1
                RadGridChamados.MasterTableView.GetColumn("TemplateColumnAtender").Visible = False
            Case 2
                RadGridChamados.MasterTableView.GetColumn("TemplateColumnAtender").Visible = True
            Case 3
                RadGridChamados.MasterTableView.GetColumn("TemplateColumnAtender").Visible = True
        End Select
        RadGridChamados.Rebind()
    End Sub




    Sub ValidaMenuclicado()
        '0 - MEUS CHAMADOS
        '1 - CHAMADOS EM ATENDIMENTO
        '2 - AGUARDANDO ATENDIMENTO
        '3 - TODOS
        SqlDataSourceAbrirChamado.SelectParameters("tipoConsulta").DefaultValue = (RadMenuAtendimentos.SelectedItem.Index)




    End Sub

    Private Sub SqlDataSourceAbrirChamado_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSourceAbrirChamado.Selecting
        ValidaMenuclicado()


    End Sub

    Private Sub RadMenuAtendimentos_ItemClick(sender As Object, e As RadMenuEventArgs) Handles RadMenuAtendimentos.ItemClick
        RadGridChamados.MasterTableView.IsItemInserted = False
        RadGridChamados.MasterTableView.ClearEditItems()
        ValidaMenuclicado()

    End Sub

    Protected Sub RadDropDownListSetor_SelectedIndexChanged(sender As Object, e As DropDownListEventArgs)

        Dim combo As RadDropDownList = DirectCast(sender, RadDropDownList)
        Dim item As GridEditFormInsertItem = DirectCast(combo.NamingContainer, GridEditFormInsertItem)
        SqlDataSourceTarefas.SelectParameters("id_CH_SETORES").DefaultValue = e.Value
        Dim RadDropDownListTarefas As RadDropDownList = DirectCast(item.FindControl("RadDropDownListTarefas"), RadDropDownList)
        RadDropDownListTarefas.Items.Clear()
        RadDropDownListTarefas.DataBind()
        SqlDataSourceAtendentes.SelectParameters("id_CH_SETORES").DefaultValue = e.Value
        Dim RadDropDownListAtendentes As RadDropDownList = DirectCast(item.FindControl("RadDropDownListAtendentes"), RadDropDownList)
        RadDropDownListAtendentes.Items.Clear()
        RadDropDownListAtendentes.DataBind()



    End Sub



    Protected Sub RadSearchBoxBuscaPessoa_Search(sender As Object, e As SearchBoxEventArgs)
        Dim combo As CustomValidator = DirectCast(sender, CustomValidator)
        Dim item As GridEditFormInsertItem = DirectCast(combo.NamingContainer, GridEditFormInsertItem)
        Dim RadTextBox1 As RadTextBox = DirectCast(item.FindControl("RadTextBox1"), RadTextBox)
        RadTextBox1.Text = e.Value
    End Sub


End Class