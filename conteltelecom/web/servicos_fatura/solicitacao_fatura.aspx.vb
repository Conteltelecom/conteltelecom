Public Class solicitacao_fatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            Dim ClsBuscaMesAnoAtual As New conteltelecom.Validacoes
            RadTextBoxMesAno.Text = ClsBuscaMesAnoAtual.BuscaMesAnoAtual
            SqlDataSourceBuscaFaturasAbertas.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = RadTextBoxMesAno.TextWithLiterals
        End If
    End Sub

    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click
        SqlDataSourceBuscaFaturasAbertas.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = RadTextBoxMesAno.TextWithLiterals
        RadGridSolicitacaoFaturas.DataBind()
    End Sub
End Class