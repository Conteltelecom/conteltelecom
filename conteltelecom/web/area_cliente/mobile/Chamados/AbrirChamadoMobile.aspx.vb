Public Class AbrirChamadoMobile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Unnamed_ServerClick(sender As Object, e As EventArgs)
        Dim contato_CH_SUBCHAMADOS As String = ""
        Dim email_CH_SUBCHAMADOS As String = ""
        Dim telefone_CH_SUBCHAMADOS As String = ""
        SqlDataSourceTarefas.InsertParameters("idEmpresa_Pessoa").DefaultValue = Session("idEmpresa_PS_PESSOA")
        SqlDataSourceTarefas.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
        SqlDataSourceTarefas.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
        SqlDataSourceTarefas.InsertParameters("id_CH_TIPO_TAREFA").DefaultValue = RadDropDownListTarefa.SelectedValue
        SqlDataSourceTarefas.InsertParameters("id_PS_PERMISSAO").DefaultValue = Session("id_PS_PERMISSAO")
        SqlDataSourceTarefas.InsertParameters("assunto_CH_SUBCHAMADOS").DefaultValue = inputAssunto.Value
        SqlDataSourceTarefas.InsertParameters("abertoPor_id_PS_PESSOA").DefaultValue = Session("id_PS_PESSOA_USUARIO")
        SqlDataSourceTarefas.InsertParameters("texto_CH_HISTORICO").DefaultValue = textareaDescricao.Value
        Dim dvSql As DataView = CType(SqlDataSourceInfoUserLogado.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql IsNot Nothing Then
            For Each drvSql As DataRowView In dvSql
                If IsDBNull(drvSql("desc_PS_PESSOA")) = False Then
                    contato_CH_SUBCHAMADOS = drvSql("desc_PS_PESSOA")
                End If
                If IsDBNull(drvSql("email_PS_FISICA")) = False Then
                    contato_CH_SUBCHAMADOS = drvSql("email_PS_FISICA")
                End If
                If IsDBNull(drvSql("fone01_PS_FISICA")) = False Then
                    contato_CH_SUBCHAMADOS = drvSql("fone01_PS_FISICA")
                End If
            Next
        End If
        SqlDataSourceTarefas.InsertParameters("contato_CH_SUBCHAMADOS").DefaultValue = contato_CH_SUBCHAMADOS
        SqlDataSourceTarefas.InsertParameters("email_CH_SUBCHAMADOS").DefaultValue = email_CH_SUBCHAMADOS
        SqlDataSourceTarefas.InsertParameters("telefone_CH_SUBCHAMADOS").DefaultValue = telefone_CH_SUBCHAMADOS


        SqlDataSourceTarefas.Insert()
        DivAbrirChamados.Visible = False

        DivChamadoAbertoComSucesso.Visible = True
        LabelRetornoChamdo.Text = "<h2>Detalhes do chamado </h2><p>Assunto: " & inputAssunto.Value & "<p/><p>Descrição: " & textareaDescricao.Value & "<p/>"



    End Sub
End Class