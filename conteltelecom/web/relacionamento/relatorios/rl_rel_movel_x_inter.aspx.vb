Imports Microsoft.Reporting.WebForms
Imports Telerik.Web.UI

Public Class rl_rel_movel_x_inter
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ClsBuscaMesAnoAtual As New conteltelecom.Validacoes
        If IsPostBack = False Then

            RadTextBoxMesAno.Text = ClsBuscaMesAnoAtual.BuscaMesAnoAtual
            Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadTextBoxMesAno.Text
            ReportViewerRelReducao.LocalReport.Refresh()



        End If
    End Sub


    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs)

        Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadTextBoxMesAno.TextWithLiterals

        ReportViewerRelReducao.LocalReport.Refresh()

    End Sub
End Class