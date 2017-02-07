Imports Telerik.Web.UI

Public Class ConsultaChamados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButtonDia_Click(sender As Object, e As EventArgs)
        Dim item = TryCast(DirectCast(sender, Control).NamingContainer, RadListViewDataItem)
        Dim LabelnumSeq_CH_SUBCHAMADOS As New Label
        Dim LabelNumChamado As New Label
        Dim Labelid_CH_SUBCHAMADOS As New Label
        If item IsNot Nothing Then
            LabelnumSeq_CH_SUBCHAMADOS = DirectCast(item.FindControl("LabelnumSeq_CH_SUBCHAMADOS"), Label)
            LabelNumChamado = DirectCast(item.FindControl("LabelId_CH_CHAMADOS"), Label)
            Labelid_CH_SUBCHAMADOS = DirectCast(item.FindControl("Labelid_CH_SUBCHAMADOS"), Label)
            SqlDataSourceDetalhes.SelectParameters("id_CH_CHAMADOS").DefaultValue = LabelNumChamado.Text
            SqlDataSourceDetalhes.SelectParameters("numSeq_CH_SUBCHAMADOS").DefaultValue = LabelnumSeq_CH_SUBCHAMADOS.Text
            HiddenFieldid_CH_SUBCHAMADOS.Value = Labelid_CH_SUBCHAMADOS.Text

        End If


        RadListViewDetalhes.DataBind()
        RadListViewChamdos.Visible = False
        RadListViewDetalhes.Visible = True



    End Sub

    Protected Sub inputSalvar_ServerClick(sender As Object, e As EventArgs)

        Dim texto_CH_HISTORICO As New HtmlTextArea
        Dim id_CH_SUBCHAMADOS As New Label
        If RadListViewDetalhes IsNot Nothing Then
            texto_CH_HISTORICO = DirectCast(RadListViewDetalhes.FindControl("textareaDescricao"), HtmlTextArea)
            ' id_CH_SUBCHAMADOS = DirectCast(RadListViewDetalhes.FindControl("Labelid_CH_SUBCHAMADOS"), Label)
            SqlDataSourceDetalhes.InsertParameters("texto_CH_HISTORICO").DefaultValue = texto_CH_HISTORICO.Value
            SqlDataSourceDetalhes.InsertParameters("id_CH_SUBCHAMADOS").DefaultValue = HiddenFieldid_CH_SUBCHAMADOS.Value
            SqlDataSourceDetalhes.Insert()
            texto_CH_HISTORICO.Value = String.Empty

            RadListViewDetalhes.DataBind()

        End If
    End Sub

    Private Sub RadListViewDetalhes_PreRender(sender As Object, e As EventArgs) Handles RadListViewDetalhes.PreRender

    End Sub
End Class